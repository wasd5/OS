#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <unistd.h>
#include <signal.h>
#include <pthread.h>
#include <sys/time.h>
#include "my402list.h"
#include "cs402.h"
// time measured in this system
struct timeval default_time;
int terminated = 0;   // plus control c handling
int is_tfile = 0;
char tsfile[50] = "tsfile";            //(print this line only if -t is specified)
int tokens = 0;
int dropped_tokens = 0;
int packets = 0;
int dropped_packets = 0;
int num_bucket_token = 0;
FILE* fp = NULL;

double cur_sys_time_struct();
void convert_to_sys_time(char* sys_time, int unix_time);

int num_to_arrive = 20;
double lambda = 1;            //(print this line only if -t is not specified)
double mu = 0.35;             //(print this line only if -t is not specified)
double r = 1.5;
double B = 10;
double P = 3;                //(print this line only if -t is not specified)

double percentage_dropped_token = 0;
double percentage_dropped_packet = 0;
double total_inter_arrival_time = 0;
int is_arrival_thread = 1; // marks thread ending
int is_token_thread = 1; // marks thread ending
sigset_t sgst;

typedef struct packet {
    int id;
    double arrival_time;
    double enter_q1;
    double leave_q1;
    double enter_q2;
    double leave_q2;
    double enter_server;
    double leave_server;
    double service_time;
    double inter_arrival_time;
    double num_token_required;
} packet;

My402List* q1;
My402List* q2;
pthread_t packet_thread, token_thread, s1_thread, s2_thread, control_c_signal_handler_thread;
pthread_cond_t cv = PTHREAD_COND_INITIALIZER;
pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;


/* names TBC */
double time_in_q1 = 0; // packet
double time_in_q2 = 0;
double total_service_time = 0;
double total_time_in_system = 0;
double stat_pkt_s1_ave = 0;
double stat_pkt_s2_ave = 0;
double stat_system_time_sqrt_ave = 0;
double stat_system_time_ave = 0;
double prev_arrival_time = 0;

int num_pkt_served = 0;

void* packet_arrival_func() {
    for (int i = 1; i <= num_to_arrive; i++) {
        pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, 0);
        pthread_mutex_lock(&mutex);
        if (terminated) {
            pthread_mutex_unlock(&mutex);
            return 0;
        }
        pthread_mutex_unlock(&mutex);
        packet* pk = (packet*)malloc(sizeof(packet));
        pk->id = i;
        // read from file or const
        if(is_tfile) {
        	char buf[1024];
        	memset(buf, '\0', sizeof(buf));
            if(fgets(buf, 1024, fp) != NULL) {
                double inter_arrival_time = 0, tokens_needed = 0, service_time = 0;
                // delimits using '\n' and '\t'
                if (sscanf(buf, "%lf %lf %lf", &inter_arrival_time, &tokens_needed, &service_time) != 3) {
                    printf("File line input format error!\n");
                    exit(1);
                }
                pk->num_token_required = tokens_needed;
                pk->inter_arrival_time = 1000*inter_arrival_time;    
                pk->service_time = 1000*service_time;
            }   
        }
        else {
            pk->num_token_required = P; // fixed tokens per packet
            pk->inter_arrival_time = round(1000000.0 / lambda);
            pk->service_time = round(1000000.0 / mu);
        }
        packets++;
        pthread_mutex_lock(&mutex);
        if (terminated) {
            free(pk);
            pthread_mutex_unlock(&mutex);
            return 0;
        }/*
        char buf[20];
        memset(buf, '\0', sizeof(buf));*/
        //printf("=====================================DEBUG   cur_sys_time_struct  %lf\n", cur_sys_time_struct());
        //printf("=====================================DEBUG   prev_arrival_time  %lf\n", prev_arrival_time);
        //printf("=====================================DEBUG   inter_arrival_time  %lf\n", pk->inter_arrival_time);
        double actual_time = round((prev_arrival_time + pk->inter_arrival_time - cur_sys_time_struct()) / 1000) * 1000;
        pthread_mutex_unlock(&mutex);
        pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, 0);
        if(actual_time >= 1000.0) {
            usleep(actual_time);
        }
        //printf("=====================================DEBUG      actual_time %lf\n", actual_time);
        pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, 0);
        pthread_mutex_lock(&mutex);
        if(terminated) {
            free(pk);
            pthread_mutex_unlock(&mutex);
            return 0;
        }
        pk->arrival_time = cur_sys_time_struct();
        char buf[20];
        memset(buf, '\0', sizeof(buf));
        convert_to_sys_time(buf, pk->arrival_time);
        //printf("=====================================DEBUG      %s\n", buf);
        if(pk->num_token_required <= B) {
            printf("%sms: p%d arrives, needs %d tokens, inter-arrival time = %.3fms\n", buf, i, (int)pk->num_token_required, (pk->arrival_time - prev_arrival_time) / 1000.0);
            My402ListAppend(q1, pk);
            pk->enter_q1 = cur_sys_time_struct();
            convert_to_sys_time(buf, pk->enter_q1);
            printf("%sms: p%d enters Q1\n", buf, i);
        }
        else { // too big packet, drop it
            dropped_packets++;
            printf("%sms: p%d arrives, needs %.6g tokens, inter-arrival time = %.3fms, dropped\n",
            	buf, i, pk->num_token_required, (pk->arrival_time - prev_arrival_time) / 1000.0);
        }
        prev_arrival_time = pk->arrival_time;
        pk->inter_arrival_time = pk->arrival_time - prev_arrival_time;
        total_inter_arrival_time += pk->inter_arrival_time;
        if (My402ListLength(q1) == 1) {  // ?
            My402ListElem* list_element = My402ListFirst(q1);
            packet* pkt = (packet*)(list_element->obj);
            if(pkt->num_token_required <= num_bucket_token) {
                num_bucket_token -= pkt->num_token_required;
                pkt->leave_q1 = cur_sys_time_struct();
                char buf[20];
                memset(buf, '\0', sizeof(buf));
                convert_to_sys_time(buf, pkt->leave_q1);
                printf("%sms: p%d leaves Q1, time in Q1 = %.3fms, token bucket now has %d token\n", buf, pkt->id, (pkt->leave_q1 - pkt->enter_q1) / 1000.0, num_bucket_token);
                My402ListUnlink(q1, list_element);
                My402ListAppend(q2, pkt);
                pkt->enter_q2 = cur_sys_time_struct();
                convert_to_sys_time(buf, pkt->enter_q2);
                printf("%sms: p%d enters Q2\n", buf, pkt->id);
                pthread_cond_broadcast(&cv);
            }
        }
        pthread_mutex_unlock(&mutex);
    }
    pthread_mutex_lock(&mutex);
    if (terminated) {
        pthread_mutex_unlock(&mutex);
        return 0;
    }
    is_arrival_thread = 0;
    pthread_mutex_unlock(&mutex);
    return 0;
}

void* token_arrival_func() {
    double last_arrival_time = 0;
    int flag = 1;
    while (flag) {
        pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, 0);
        pthread_mutex_lock(&mutex);
        if (terminated) {
            pthread_mutex_unlock(&mutex);
            return (void*)0;
        }
        double actual_time = round((last_arrival_time + round(1000000.0 / r) - cur_sys_time_struct()) / 1000.0) * 1000;
        pthread_mutex_unlock(&mutex);
        pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, 0);
        if(actual_time >= 1000.0) {
            usleep(actual_time);
        }
        pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, 0);
        pthread_mutex_lock(&mutex);
        if (terminated) {
            pthread_mutex_unlock(&mutex);
            return 0;
        }
        if(My402ListEmpty(q1) && !is_arrival_thread) {
            flag = 0;
        }
        else {
            tokens++;
            double token_arrival_time = cur_sys_time_struct();
            char buf[20];
        	memset(buf, '\0', sizeof(buf));
            convert_to_sys_time(buf, token_arrival_time);
            if(num_bucket_token < B) {
                num_bucket_token++;
                printf("%sms: token t%d arrives, token bucket now has %d tokens\n", buf, tokens, num_bucket_token);
            }
            else { // drop token
                dropped_tokens++;
                printf("%sms: token t%d arrives, dropped\n", buf, tokens);
            }
            last_arrival_time = token_arrival_time;
            if(!My402ListEmpty(q1)) {
            	My402ListElem* list_element = My402ListFirst(q1);
                packet* pk = (packet*)(list_element->obj);
                if(pk->num_token_required <= num_bucket_token) {
                    num_bucket_token -= pk->num_token_required;
                    pk->leave_q1 = cur_sys_time_struct();
                    convert_to_sys_time(buf, pk->leave_q1);
                    printf("%sms: p%d leaves Q1, time in Q1 = %.3fms, token bucket now has %d token\n", buf, pk->id, (pk->leave_q1 - pk->enter_q1) / 1000.0, (int)num_bucket_token);
                    My402ListUnlink(q1, list_element);
                    My402ListAppend(q2, pk);
                    pk->enter_q2 = cur_sys_time_struct();
                    convert_to_sys_time(buf, pk->enter_q2);
                    printf("%sms: p%d enters Q2\n", buf, pk->id);
                }
            }
        }
        pthread_cond_broadcast(&cv);
        pthread_mutex_unlock(&mutex);
    }
    pthread_mutex_lock(&mutex);
    if (terminated) {
        pthread_mutex_unlock(&mutex);
        return 0;
    }
    is_token_thread = 0;
    pthread_cond_broadcast(&cv);
    pthread_mutex_unlock(&mutex);
    return 0;
}

void* server_func(void* arg) {
    int sid = (int)arg; 
    double serve_time = 0;
    int flag = 1;
    while(flag) {
        pthread_mutex_lock(&mutex);
        if((My402ListEmpty(q2) && !is_token_thread) || terminated){
            flag = 0;
        }
        else {
            while(My402ListEmpty(q2) && is_token_thread) {
                pthread_cond_wait(&cv, &mutex);
            }
            if(My402ListEmpty(q2)) {
                pthread_mutex_unlock(&mutex);
                continue;
            }
            My402ListElem* list_element = My402ListFirst(q2);
            packet* pk = (packet*)(list_element->obj);
            pk->leave_q2 = cur_sys_time_struct();
            My402ListUnlink(q2, list_element);
            char buf[20];
            memset(buf, '\0', sizeof(buf));
            convert_to_sys_time(buf, pk->leave_q2);
            printf("%sms: p%d leaves Q2, time in Q2 = %.3fms\n", buf, pk->id, (pk->leave_q2 - pk->enter_q2) / 1000.0);
            pk->enter_server = cur_sys_time_struct();
            convert_to_sys_time(buf, pk->enter_server);
            printf("%sms: p%d begins service at S%d, requesting %.6gms of service\n", buf, pk->id, sid, pk->service_time / 1000.0);
            pthread_mutex_unlock(&mutex);
            usleep(pk->service_time);
            pthread_mutex_lock(&mutex);
            pk->leave_server = cur_sys_time_struct();
            serve_time += pk->leave_server - pk->enter_server;
            convert_to_sys_time(buf, pk->leave_server);
            printf("%sms: p%d departs from S%d, service time = %.3fms, time in system = %.3fms\n", buf, pk->id, sid, (pk->leave_server - pk->enter_server) / 1000.0, (pk->leave_server - pk->arrival_time) / 1000.0);
            total_service_time += pk->leave_server - pk->enter_server;
            total_time_in_system += pk->leave_server - pk->arrival_time;
            time_in_q1 += pk->leave_q1 - pk->enter_q1;
            time_in_q2 += pk->leave_q2 - pk->enter_q2;
            stat_system_time_sqrt_ave = (num_pkt_served * stat_system_time_sqrt_ave + (pk->leave_server - pk->arrival_time)*(pk->leave_server - pk->arrival_time)) / (num_pkt_served + 1);
            stat_system_time_ave = (num_pkt_served * stat_system_time_ave + (pk->leave_server - pk->arrival_time)) / (num_pkt_served + 1);
            num_pkt_served++;
            free(pk);
        }
        pthread_mutex_unlock(&mutex);
    }
    //printf("==================================DEBUG   SID\n");
    if(sid == 1) {
        stat_pkt_s1_ave = serve_time;
    }
    else if(sid == 2) {
        stat_pkt_s2_ave = serve_time;
    }
    return 0;
}

void* control_c_signal_handler_func() {
    int signal;
    while (1) {
        sigwait(&sgst, &signal);
        pthread_mutex_lock(&mutex);
        printf("SIGINT signal caught, no new packets or tokens allowed\n");
        pthread_cancel(token_thread);
        pthread_cancel(packet_thread);
        is_token_thread = 0;
        is_arrival_thread = 0;
        terminated = 1;
        pthread_cond_broadcast(&cv);
        char buf[20];
        memset(buf, '\0', sizeof(buf));
        // deal with q1
        while(!My402ListEmpty(q1)) {
            My402ListElem* list_element = My402ListFirst(q1);
            packet* pk = (packet*)(list_element->obj);
            convert_to_sys_time(buf, cur_sys_time_struct());
            printf("%sms: p%d removed from Q1\n", buf, pk->id);
            My402ListUnlink(q1, list_element);
            free(pk);
        }
        // deal with q2
        while(!My402ListEmpty(q2)) {
            My402ListElem* list_element = My402ListFirst(q2);
            packet* pk = (packet*)(list_element->obj);
            memset(buf, '\0', sizeof(buf)),
            convert_to_sys_time(buf, cur_sys_time_struct());
            printf("%sms: p%d removed from Q2\n", buf, pk->id);
            My402ListUnlink(q2, list_element);
            free(pk);
        }
        pthread_mutex_unlock(&mutex);
    }
    return (0);
}

int main(int argc, char* argv[]) {
    for(int i = 1; i < argc; i += 2) {
        if(strcmp(argv[i], "-t") == 0) {
            if(i + 1 >= argc) {
            	printf("input format error\n");
                exit(1);
            }
            is_tfile = 1;
            if((fp = fopen(argv[i+1], "r")) == NULL) {
            	printf("Open file error\n");
            	exit(1);
            }
            strcpy(tsfile, argv[i+1]);
            char buf[1026];
            memset(buf, '\0', sizeof(buf));
            if(fgets(buf, 1026, fp) != NULL) {
                if(atoi(buf) == 0 || atoi(buf) == -1) {
                    printf("invalid first line in tfile\n");
                    exit(1);
                }
                num_to_arrive = atoi(buf);
            }
        }
        else if(strcmp(argv[i], "-r") == 0) {
            if(i + 1 >= argc) {
            	printf("input format error\n");
                exit(1);
            }
            if (sscanf(argv[i+1], "%lf", &r) != 1) {
                printf("invalid r value\n");
                exit(1);
            }
            if(r <= 0) {
            	printf("invalid r value\n");
                exit(1);
            }
        }
        else if(strcmp(argv[i], "-B") == 0) {
            if(i + 1 >= argc) {
            	printf("input format error\n");
                exit(1);
            }
            if (sscanf(argv[i+1], "%lf", &B) != 1) {
                printf("invalid B value\n");
                exit(1);
            }
            if(B <= 0) {
            	printf("invalid B value\n");
                exit(1);
            }
        }
        // if -t is specified, ignore  -lambda, -mu, -P, and -n (but not -r ot -B)
        else {
        	if(is_tfile) {
        		continue;
        	}
            if (strcmp(argv[i], "-lambda") == 0) {
                if(i + 1 >= argc) {
	            	printf("input format error\n");
	                exit(1);
	            }
                if (sscanf(argv[i+1], "%lf", &lambda) != 1) {
                    printf("invalid lambda value\n");
                    exit(1);
                }
                if(lambda < 0) {
                	printf("invalid lambda value\n");
                    exit(1);
                }
                if (lambda < 0.1) {
                    lambda = 0.1;
                }
            }
            else if(strcmp(argv[i], "-mu") == 0) {
                if(i + 1 >= argc) {
	            	printf("input format error\n");
	                exit(1);
	            }
                if(sscanf(argv[i+1], "%lf", &mu) != 1) {
                    printf("invalid mu value\n");
                    exit(1);
                }
                if(mu < 0) {
                	printf("invalid mu value\n");
                    exit(1);
                }
                if (mu < 0.1) {
                    mu = 0.1;
                }
            }
            else if (strcmp(argv[i], "-P") == 0) {
                if(i + 1 >= argc) {
	            	printf("input format error\n");
	                exit(1);
	            }
                if (sscanf(argv[i+1], "%lf", &P) != 1) {
                    printf("invalid P value\n");
                    exit(1);
                }
                if(P <= 0) {
                	printf("invalid P value\n");
                    exit(1);
                }
            }
            else if (strcmp(argv[i], "-n") == 0) {
                if(i + 1 >= argc) {
	            	printf("input format error\n");
	                exit(1);
	            }
	            //printf("DEBUG================================  pt");
                if (sscanf(argv[i+1], "%d", &num_to_arrive) != 1) {
                    printf("invalid num_to_arrive value\n");
                    exit(1);
                }
                if(num_to_arrive < 0 || (int)num_to_arrive > 2147483647) {
                	printf("invalid num_to_arrive value\n");
                    exit(1);
                }
            }
        }
    }
    q1 = (My402List*)malloc(sizeof(My402List));
    q2 = (My402List*)malloc(sizeof(My402List));
    //printf("=============================DEBUG 1\n");
    My402ListInit(q1);
    //printf("=============================DEBUG 2\n");
	My402ListInit(q2);
	sigemptyset(&sgst);
    sigaddset(&sgst, SIGINT);
    sigprocmask(SIG_BLOCK, &sgst, 0);
    pthread_create(&control_c_signal_handler_thread, 0, control_c_signal_handler_func, 0);
    printf("Emulation Parameters:\n");
    printf("    number to arrive = %.d\n", num_to_arrive);
    if(!is_tfile) {
        printf("    lambda = %.6g\n", lambda);
        printf("    mu = %.6g\n", mu);
    }
    printf("    r = %.6g\n", r);
    printf("    B = %.6g\n", B);
    if(!is_tfile) {
        printf("    P = %.6g\n", P);
    }
    if(is_tfile) {
        printf("    tsfile = %s\n", tsfile);
    }
    pthread_mutex_lock(&mutex);
    gettimeofday(&default_time, 0);
    pthread_mutex_unlock(&mutex);
    printf("%sms: emulation begins\n", "00000000.000");
    pthread_create(&packet_thread, 0, packet_arrival_func, 0);
    pthread_create(&token_thread, 0, token_arrival_func, 0);
    pthread_create(&control_c_signal_handler_thread, 0, control_c_signal_handler_func, 0);
    int sid = 1;
    pthread_create(&s1_thread, 0, server_func, (void*)sid);
    sid = 2;
    pthread_create(&s2_thread, 0, server_func, (void*)sid);
    pthread_join(packet_thread, 0);
    pthread_join(token_thread, 0);
    pthread_join(s1_thread, 0);
    pthread_join(s2_thread, 0);
    char buf[20];
    memset(buf, '\0', sizeof(buf));
    convert_to_sys_time(buf, cur_sys_time_struct());
    double tfinish = cur_sys_time_struct();
    printf("%sms: emulation ends\n\n", buf);
    printf("Statistics:\n\n");
    //double stat_pk_itarrtime_ave = 0;
	//double stat_pk_svctime_ave = 0;
	// double stat_q1_avepk = 0;
	// double stat_s1_avepk = 0;
	// double stat_q2_avepk = 0;
	// double stat_s2_avepk = 0;
    percentage_dropped_token = tokens == 0 ? 0 : (double)dropped_tokens / (double)tokens;
    percentage_dropped_packet = packets == 0 ? 0 : (double)dropped_packets / (double)packets;
    // stat_q1_avepk = time_in_q1 / tfinish;
    // stat_q2_avepk = time_in_q2 / tfinish;
    if(packets == 0) {
        printf("    average packet inter-arrival time N/A, no packet arrived\n");
    }
    else {
    	printf("    average packet inter-arrival time = %.6g\n", (double)(prev_arrival_time / packets) / 1000000.0);
    }
    if(num_pkt_served == 0) {
        printf("    average packet service time N/A, no packet served\n");
    }
    else {
        printf("    average packet service time = %.6g\n\n", (double)(total_service_time / num_pkt_served) / 1000000.0);
    }
    printf("    average number of packets in Q1 = %.6g\n    average number of packets in Q2 = %.6g\n    average number of packets at S1 = %.6g\n    average number of packets at S2 = %.6g\n\n", time_in_q1 / tfinish, time_in_q2 / tfinish, stat_pkt_s1_ave, stat_pkt_s2_ave);
    //printf("    average number of packets in Q2 = %.6g\n", time_in_q2 / tfinish);
    //printf("    average number of packets at S1 = %.6g\n", stat_pkt_s1_ave / tfinish);
    //printf("    average number of packets at S2 = %.6g\n\n", stat_pkt_s2_ave / tfinish);
    if(num_pkt_served == 0) {
        printf("    average time a packet spent in system N/A, no packet served\n");
        printf("    standard deviation for time spent in system = (N/A, no packet served)\n");
    }
    else {
        printf("    average time a packet spent in system = %.6g\n", (double)total_time_in_system / 1000000.0);
        printf("    standard deviation for time spent in system = %.6g\n\n", sqrt(stat_system_time_sqrt_ave - stat_system_time_ave*stat_system_time_ave) / 1000000.0);
    }
    if(tokens == 0) {
        printf("    token drop probability N/A, no token arrived\n");
    }
    else {
        printf("    token drop probability = %.6g\n", percentage_dropped_token);
    }
    if(packets == 0) {
        printf("    packet drop probability N/A, no packet arrived\n");
    }
    else {
        printf("    packet drop probability = %.6g\n", percentage_dropped_packet);
    }
	return 0;
}

// void timersub(struct timeval *a, struct timeval *b, struct timeval *res);  a - b = res
double cur_sys_time_struct() {
    struct timeval now;
    struct timeval res;
    gettimeofday(&now, 0);
    timersub(&now, &default_time, &res);
    return res.tv_usec + 1000000*res.tv_sec;  // res->tv_usec has a value in the range 0 to 999999
}

/* convert a unix timestamp (int) to system timestamp such as 00000251.726 */
void convert_to_sys_time(char* sys_time, int unix_time) {
    // to show system timestamp
    int len = 0;
    int cache = unix_time;
    while (unix_time > 0) {
        len++;
        unix_time /= 10;
    }
    unix_time = cache;
    sys_time[12] = '\0'; // 12 digits
    sys_time[8] = '.';   // 8th is '.'
    int i = 11;
    while (len > 0) {
        if (i == 8) {
        	i--;
            continue;
        }
        else {
            sys_time[i--] = unix_time % 10 + '0';
            unix_time /= 10;
            len--;
        }
    }
    while (i >= 0) {
        if (i == 8) {
            i--;
            continue;
        }
        else {
            sys_time[i--] = '0';
        }
    }
}