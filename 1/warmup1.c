#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>
#include "my402list.c"

typedef struct Transcation {
	char type;
    long time;
    float amount;
    char description[1000];
}Transcation;

char* to_money(char str[]) {
	char* buf = (char*)malloc(50 * sizeof(char));
	int len = strlen(str) - 3; //XXX.aa
	int total = (len-1) / 3;
	int i = strlen(str) - 1 + total, j = strlen(str) - 1;
	buf[strlen(str)+total] = '\0';
	while(str[j] != '.') {
		buf[i--] = str[j--];
	}
	int count = 0;
	buf[i--] = str[j--];
	while(j >= 0) {
		buf[i--] = str[j--];
		count++;
		if(count % 3 == 0 && total > 0) {
			buf[i--] = ',';
			total--;
		}
	}
	return buf;
}

int main(int argc, char **argv) {


	My402List* list = (My402List*)malloc(sizeof(My402List));
	if(My402ListInit(list) == 0) {
		printf("init list error\n");
		exit(1);
	}


	if(argc != 3 && argc != 2) {
		printf("invalid # of cmd args\n");
		exit(1);
	}
	if(strcmp(argv[1], "sort") != 0) {
		printf("type 'sort' as the first cmd arg\n");
		exit(1);
	}
	FILE* fp;
	if((fp = fopen(argv[2], "r")) == NULL) {
		printf("file open error\n");
		exit(1);
	}
	char buf[2048];
	while(fgets(buf, 2048, fp) != NULL) {
		if(buf[0] == '\n') {
			break;
		}
		if(strlen(buf) > 1024 || strlen(buf) < 8) {
			printf("invalid line, exit program\n");
			exit(1);
		}
		char type = buf[0];
		int i = 2;
		char time_str[20];
		int ti = 0;
		while(i < strlen(buf) && buf[i] != '\t') {
			time_str[ti++] = buf[i++];
			if(ti > 11) {
				printf("bad timestamp\n");
				exit(1);
			}
		}
		long time = strtol(time_str, NULL, 0);
		i++;
		int ai = 0;
		char amount_str[20]; 
		while(i < strlen(buf) && buf[i] != '\t') {
			amount_str[ai++] = buf[i++];
		}
		char* pEnd;
		float amount = strtof(amount_str, &pEnd);
		i++;
		if(amount > 10000000) {
			printf("bad amount\n");
			exit(1);
		}


		int di = 0;
		char desp[1000];
		while(buf[i] == ' ') {
			i++;
		}
		while(buf[i] != '\n' && buf[i] != '\0') {
			desp[di++] = buf[i++];
		}
		desp[di] = '\0';
		if(strlen(desp) == 0) {
			printf("empty description\n");
			exit(1);
		}
		memset(&buf, 0, sizeof(buf));
		Transcation* T = (Transcation*)malloc(sizeof(Transcation));
		T->type = type;
		T->time = time;
		T->amount = (float)(int)(amount * 100) / 100; //rounding
		strncpy(T->description, desp, sizeof(desp));
		//printf("T    %c, %ld, %f, %s\n", T->type, T->time, T->amount, T->description);

		// target time < T time < target->next time
		My402ListElem* target = NULL;
		if(list->num_members == 0) {
			target = &(list->anchor);
		}
		else if(list->num_members == 1){
			My402ListElem* f = My402ListFirst(list);
			if(((Transcation*)f->obj)->time < T->time) {
				target = f;
			}
			else if(((Transcation*)f->obj)->time > T->time) {
				target = &(list->anchor);
			}
			else {
				printf("time conflict\n");
				exit(1);
			}
		}
		else {
			My402ListElem* f = My402ListFirst(list);
			My402ListElem* l = My402ListLast(list);
			if(((Transcation*)f->obj)->time > T->time) {
				target = &(list->anchor);
			}
			else if(((Transcation*)l->obj)->time < T->time) {
				target = l;
			}
			else {
				My402ListElem* cur = f;
				while(cur != &(list->anchor)) {
					if(((Transcation*)cur->obj)->time == T->time || ((Transcation*)cur->next->obj)->time == T->time) {
						printf("time conflict\n");
						exit(1);
					}
					if(((Transcation*)cur->obj)->time < T->time && ((Transcation*)cur->next->obj)->time > T->time) {
						target = cur;
						break;
					}
					cur = cur->next;
				}
			}
			
		}
		if(My402ListInsertAfter(list, T, target) == 0) {
			printf("insert wrong\n");
			exit(1);
		}
	}

	// My402ListElem* tra = My402ListFirst(list);
	// while(tra != &(list->anchor)) {
 //    	printf("cur    %c, %ld, %f, %s\n", ((Transcation*)tra->obj)->type, ((Transcation*)tra->obj)->time, 
 //    		((Transcation*)tra->obj)->amount, ((Transcation*)tra->obj)->description);
 //    	tra = tra->next;
 //    }


	/* print sorted list */
	printf("+-----------------+--------------------------+----------------+----------------+\n");
    printf("|       Date      | Description              |         Amount |        Balance |\n");
    printf("+-----------------+--------------------------+----------------+----------------+\n");
    
    My402ListElem* f = My402ListFirst(list);
    float balance = 0.0;
    while(f != &(list->anchor)) {

    	if(((Transcation*)f->obj)->type == '-') {
    		balance -= ((Transcation*)f->obj)->amount;
    	}
    	else {
    		balance += ((Transcation*)f->obj)->amount;
    	}


    	printf("| ");
		time_t rawtime = ((Transcation*)f->obj)->time;
		char* rawtime_string = ctime(&rawtime);  // Wed Dec 31 13:07:13 2008
		char time_string[16];
		for(int j = 0; j < 11; j++) {
			time_string[j] = rawtime_string[j];
		}
		for(int j = 11; j < 15; j++) {
			time_string[j] = rawtime_string[j+9];
		}
		time_string[15] = '\0';
		printf("%s", time_string);



		printf(" | ");
		if(strlen(((Transcation*)f->obj)->description) > 24) {
			((Transcation*)f->obj)->description[24] = '\0';
		}
		printf("%s", ((Transcation*)f->obj)->description);
		for(int j = 0; j < 24 - strlen(((Transcation*)f->obj)->description); j++) {
			printf(" ");
		}



		printf(" | ");
		if(((Transcation*)f->obj)->type == '-') {
			printf("(");
		}
		else {
			printf(" ");
		}
		char amt_str[50];
		sprintf(amt_str, "%.2f", ((Transcation*)f->obj)->amount);
		char* amt_money = to_money(amt_str);
		for(int j = 0; j < 12 - strlen(amt_money); j++) {
			printf(" ");
		}
		printf("%s", amt_money);
		if(((Transcation*)f->obj)->type == '-') {
			printf(")");
		}
		else {
			printf(" ");
		}



		printf(" | ");
		if(balance < 0) {
			printf("(");
		}
		else {
			printf(" ");
		}
		char blc_str[50];
		sprintf(blc_str, "%.2f", balance < 0 ? -balance : balance);
		char* blc_money = to_money(blc_str);
		for(int j = 0; j < 12 - strlen(blc_money); j++) {
			printf(" ");
		}
		printf("%s", blc_money);
		if(balance < 0) {
			printf(")");
		}
		else {
			printf(" ");
		}


		printf(" |\n");
		f = f->next;
    }
    printf("+-----------------+--------------------------+----------------+----------------+\n");
	return 0;
}