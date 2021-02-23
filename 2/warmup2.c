#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <pthread.h>
#include <sys/time.h>
#include <unistd.h>
#include <signal.h>
#include "my402list.h"
#include "cs402.h"

pthread_mutex_t mutex = PTHREAD_MUTEX_INITIALIZER;
pthread_t packet_arrival, token_arrival, server1, server2, ctrl_c;
pthread_cond_t cv = PTHREAD_COND_INITIALIZER;
sigset_t set;
int terminate = 0;

My402List* q1 = NULL;
My402List* q2 = NULL;

int num_to_arrive = 20;
double lambda = 2;            //(print this line only if -t is not specified)
double mu = 0.35;             //(print this line only if -t is not specified)
double r = 4;
double B = 10;
double P = 3;                //(print this line only if -t is not specified)
tsfile = FILENAME;            //(print this line only if -t is specified)


typedef struct packet {
    int id;
    double num_token_required;
    double inter_arrival_time;
    double serve_time;

    double arrival_time;
    double enter_q1;
    double leave_q1;
    double enter_q2;
    double leave_q2;
    double enter_server;
    double leave_server;
} packet;

/* convert a unix timestamp (int) to system timestamp such as 00000251.726 */
void getTimeStamp(char* sys_time, int unix_time) {
    int len = 0;
    int cache = unix_time;
    while (unix_time > 0) {
        len++;
        unix_time /= 10;
    }
    unix_time = cache;
    sys_time[12] = '\0';
    sys_time[8] = '.';
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


void* packet_arrival_func() {
    for (int i = 1; i <= num; i++) {
        pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, 0);

        pthread_mutex_lock(&mutex);
        if (terminated) {
            pthread_mutex_unlock(&mutex);
            return 0;
        }
        pthread_mutex_unlock(&mutex);

        packet* pk;

        // read from file or const
        if(flag) {
        	char buf[1024];
            if(int line = getline(buf, 1024, fp) != -1) {
                double inter_arrival_time = 0, tokens_needed = 0, service_time = 0;
                // delimits using '\n' and '\t'
                if (sscanf(buf, "%d %d %d", &inter_arrival_time, &tokens_needed, &service_time) != 3) {
                    printf("File line %d input format error!\n", line);
                    exit(1);
                }
                pk = (packet*)malloc(sizeof(packet));
                pk->interval_arrival_time = interval_arrival_time * 1000;
                pk->num_token_required = number_of_tokens;
                pk->serviceTime = serviceTime * 1000;
                pk->id = i;
            }
            
        }
        else {
            curpacket = (packet *)malloc(sizeof(packet));
            curpacket->packetid = i;
            curpacket->number_of_token = P;
            curpacket->serviceTime = getRoundMicrosec(mu);
            curpacket->interval_arrival_time = getRoundMicrosec(lambda);
        }
        total_packets++;

        pthread_mutex_lock(&mutex);
        if (terminate == 1)
        {
            free(curpacket);
            pthread_mutex_unlock(&mutex);
            return 0;
        }
        double sleeptime = round((prev_arrive_time + curpacket->interval_arrival_time - getTime()) / 1000) * 1000;

        pthread_mutex_unlock(&mutex);

        pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, 0);

        if (sleeptime >= 1000)
        {
            usleep(sleeptime);
        }
        pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, 0);

        pthread_mutex_lock(&mutex);
        if (terminate == 1)
        {
            free(curpacket);
            pthread_mutex_unlock(&mutex);
            return 0;
        }
        curpacket->arrivalTime = getTime();

        if (curpacket->number_of_token <= B)
        {
            char buf[12];
            getTimeStamp(buf, curpacket->arrivalTime);
            printf("%sms: p%d arrives, needs %.6g tokens, inter-arrival time = %.3fms\n",
                   buf, i, curpacket->number_of_token, (curpacket->arrivalTime - prev_arrive_time) / 1000.0);
            curpacket->interval_arrival_time = curpacket->arrivalTime - prev_arrive_time;
            total_interval_time = total_interval_time + curpacket->interval_arrival_time;
            prev_arrive_time = curpacket->arrivalTime;
            My402ListAppend(&q1, curpacket);
            //printf("this is size of q1: %d\n", !My402ListEmpty(&q1));
            curpacket->add_Q1 = getTime();
            getTimeStamp(buf, curpacket->add_Q1);
            printf("%sms: p%d enters Q1\n", buf, i);
        }
        else
        {
            dropped_packets++;
            char buf[12];
            getTimeStamp(buf, curpacket->arrivalTime);
            printf("%sms: p%d arrives, needs %.6g tokens, inter-arrival time = %.3fms, dropped\n",
                   buf, i, curpacket->number_of_token, (curpacket->arrivalTime - prev_arrive_time) / 1000.0);
            curpacket->interval_arrival_time = curpacket->arrivalTime - prev_arrive_time;
            total_interval_time = total_interval_time + curpacket->interval_arrival_time;
            prev_arrive_time = curpacket->arrivalTime;
        }

        if (My402ListLength(&q1) == 1)
        {
            My402ListElem *elem = My402ListFirst(&q1);
            packet *cur = (packet *)(elem->obj);
            if (cur->number_of_token <= tokeninBucket)
            {
                tokeninBucket -= cur->number_of_token;
                My402ListUnlink(&q1, elem);
                //printf("now removed size is %d\n", My402ListLength(&q1));
                cur->remove_Q1 = getTime();
                char buf[12];
                getTimeStamp(buf, curpacket->remove_Q1);
                printf("%sms: p%d leaves Q1, time in Q1 = %.3fms, token bucket now has %d token\n",
                       buf, cur->packetid, (cur->remove_Q1 - cur->add_Q1) / 1000, tokeninBucket);

                cur->add_Q2 = getTime();
                My402ListAppend(&q2, cur);
                getTimeStamp(buf, curpacket->add_Q2);
                printf("%sms: p%d enters Q2\n", buf, cur->packetid);
                pthread_cond_broadcast(&cv);
            }
        }
        pthread_mutex_unlock(&mutex);
    }
    pthread_mutex_lock(&mutex);
    if (terminate == 1)
    {
        pthread_mutex_unlock(&mutex);
        return 0;
    }
    arrive_thread = FALSE;
    pthread_mutex_unlock(&mutex);

    //printf("arrived thread is stopped\n");
    return 0;
}




void* token_arrival_func() {
    double prevtime = 0;
    int loop = 1;
    while (loop) {
        //pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, 0);

        pthread_mutex_lock(&mutex);
        if (terminate) {
            pthread_mutex_unlock(&mutex);
            return (void*)0;
        }
        double sleep_time = round((prev_time + getRoundMicrosec(r) - getTime()) / 1000) * 1000;
        pthread_mutex_unlock(&mutex);
        //pthread_setcancelstate(PTHREAD_CANCEL_ENABLE, 0);
        if (sleep_time >= 1000) {
            usleep(sleep_time);
        }
        //pthread_setcancelstate(PTHREAD_CANCEL_DISABLE, 0);
        pthread_mutex_lock(&mutex);
        if (terminate) {
            pthread_mutex_unlock(&mutex);
            return 0;
        }
        if (My402ListEmpty(q1) && !arrive_thread) {
            loop = 0;
        }
        else {
            tokens++;
            double token_arrival_time = getTime();
            char buf[20];
        	memset(buf, '\0', sizeof(buf));
            getTimeStamp(buf, token_arrival_time);
            if (num_bucket_token < B) {
                num_bucket_token++;
                printf("%sms: token t%d arrives, token bucket now has %d tokens\n", buf, tokens, num_bucket_token);
            }
            else { // drop token
                dropped_tokens++;
                printf("%sms: token t%d arrives, dropped\n", buf, tokens);
            }
            prev_time = token_arrival_time;
            if (!My402ListEmpty(q1)) {
                packet* pk = (packet*)(My402ListFirst(q1)->obj);
                // if first packet in Q1 can now be moved into Q2
                if (pk->num_token_required <= num_bucket_token) {
                    num_bucket_token -= cur->number_of_token;
                    My402ListUnlink(q1, My402ListFirst(q1)->obj);
                    pk->leave_q1 = getTime();
                    getTimeStamp(buf, pk->leave_q1);
                    printf("%sms: p%d leaves Q1, time in Q1 = %.3fms, token bucket now has %d token\n", 
                    	buf, pk->id, (pk->leave_q1 - pk->enter_q1) / 1000, num_bucket_token);
                    My402ListAppend(q2, pk);
                    pk->enter_q2 = getTime();
                    getTimeStamp(buf, pk->enter_q2);
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
    token_thread = FALSE;
    pthread_cond_broadcast(&cv);
    pthread_mutex_unlock(&mutex);

    //printf("token thread is stopped\n");
    return 0;
}