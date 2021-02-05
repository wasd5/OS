#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/time.h>
#include <time.h>
#include <ctype.h>
#include <errno.h>
#include "cs402.h"
#include "my402list.c"

typedef struct BankTransaction {
    int type;   //1 , -1 
    int timestamp;
    double amount;
    char description[1024];
} transcation;

int checktype(char * tp){
	if(tp == NULL || strlen(tp) != 1){
		return FALSE;
	}
	if(tp[0] != '+' && tp[0] != '-'){
		return FALSE;
	}
	if(tp[0] == '+'){
		return 1;
	}
	return -1;
}

int checktime(char*time){
	if(time == NULL || strlen(time) == 0 || strlen(time) >10){
		return FALSE;
	}
	if(time[0] == '0'){
		return FALSE;
	}
	int res = 0;
	for(int i = 0; i < strlen(time); i++){
		if(!isdigit(time[i])){
			return FALSE;
		}
		int cur = (int)(time[i] - '0');
		res = res*10 + cur;
	}
	//case
	if(res < 0){
		return FALSE;
	}
	struct timeval cur;
	gettimeofday(&cur, NULL);
	if(cur.tv_sec < res){
		return FALSE;
	}
	return res;
}

double checkamount(char*amt)
{
	if(amt == NULL || strlen(amt) == 0 || strlen(amt) > 10){
		return FALSE;
	}
	int point = 0;

	for(int i = 0; i < strlen(amt); i++){
		if(!isdigit(amt[i] && amt[i] != '.')){
			return FALSE;
		}
		if(amt[i] == '.'){
			point++;
			if(point > 1 || i != (strlen(amt) - 3)){
				return FALSE;
			}
		}
	}
	char* a = strtok(amt,".");
	char* b = strtok(NULL,".");
	int number = atoi(a);
	int decimal = atoi(b);
	double res = (double)number + (double)(decimal/100);
	return res;
}

char* checkdcp(char*dcp){
	if(dcp == NULL || strlen(dcp) == 0){
		printf("%s\n", "description cannot be empty");
		return FALSE;
	}
	return dcp;
}

int insert1(int i, transcation *t, My402List *l)
{
	//empty
	if(My402ListEmpty(l)){
		if(!My402ListInit(l)){
			return FALSE;
		}
		if(!My402ListPrepend(l, t)){
			return FALSE;
		}
		return TRUE;
	}
	//insert
	My402ListElem *cur = My402ListFirst(l);
	while(cur){
		transcation *curt = (transcation *)cur -> obj;
		if(curt->timestamp == t-> timestamp){
			//duplicate
			return FALSE;
		}
		if(curt->timestamp > t-> timestamp){
			if(!My402ListInsertBefore(l, t ,cur)){
				return FALSE;
			}
			return TRUE;
		}
	}
	if(!My402ListAppend(l, t)){
		return FALSE;	
	}
	return TRUE;
}

int helper(int count, char *buf, My402List *l){
	if(buf == NULL){
		return FALSE;
	}
	if(strlen(buf) ==0){
		return FALSE;
	}
	if(strlen(buf) > 1024){
		return FALSE;
	}
	//check num of tab
	int tab = 0;
	for(int i = 0;i < strlen(buf); i++){
		if(buf[i] == '\t'){
			tab++;
		}
	}
	if(tab != 3){
		return FALSE;
	}
	char *tp= strtok(buf,"\t");
	char *ts= strtok(NULL,"\t");
	char *amt= strtok(NULL,"\t");
	char *dcp= strtok(NULL,"\t\n");

	int type1 = checktype(tp);
	if(!type1){
		return FALSE;
	}
	int time1 = checktime(ts);
	if(!time1){
		return FALSE;
	}
	double amount1 = checkamount(amt);
	if(!amount1){
		return FALSE;
	}
	char *dcp1 = checkdcp(dcp);
	if(!dcp1){
		return FALSE;
	}
	transcation *t = (transcation*)malloc(sizeof(transcation));
	if(!t){
		return FALSE;
	}
	t->type = type1;
	t->timestamp = time1;
	t->amount = amount1;
	strncpy(t->description, dcp1, strlen(dcp1));
	if(!insert1(count, t, l)){
		return FALSE;
	}
	return TRUE;
}

int parse(FILE *f, My402List *l){
	if(f == NULL){
		return FALSE;
	}
	char buf[1030];
	int i = 0;
	while(fgets(buf, 1030, f) != NULL){
		i++;
		if(!helper(i, buf, l)){
			return FALSE;
		}
	}
	if(i == 0){
			return FALSE;
	}
	return TRUE;
}

void printtable(My402List *l){
	printf("%s\n", "+-----------------+--------------------------+----------------+----------------+");
    printf("%s\n", "|       Date      | Description              |         Amount |        Balance |");
    printf("%s\n", "+-----------------+--------------------------+----------------+----------------+");
    My402ListElem *cur = My402ListFirst(l);
    /* 
    int type;   //1 +, 2 -
    int timestamp;
    double amount;
    char description[1024];
    */
    while(cur){
    	double money = 0;
    	transcation *curt = (transcation*)(cur -> obj);
    //step 1: print date
    	printf("%s", "| "); 
    	time_t date = (time_t)(curt -> timestamp);
    	char a[25] = "";
    	strcpy(a, ctime(&date));
    	a[24] = '\0';
    	char b[16] = "";
    	for (int i = 0, j = 0; i < strlen(a); i++) {
            if (i >= 11 && i <= 19){
            	continue;
            }
            b[j] = a[i];
            j++;
        } 
         printf("%s", b);

    // 2 print Description 
        printf("%s", " | ");
        char tmp[25];
        memset(tmp, ' ', sizeof(tmp));
        strncpy(tmp, curt->description, 24);
        printf("%-24s", tmp);
    //3 amount
        printf("%s", " | ");
        char amount[15];
        memset(amount, ' ', sizeof(amount));
        amount[14] = '\0';

        if (curt->type != 1) {
            amount[0] = '(';
            amount[13] = ')';
        }
        double amt = curt -> amount;
        int x = (int)(amt*100);
        //amount[10] = .
        int idx = 12;
        amount[10] = '.';
        while(x > 0){
        	int y = x %10;
        	char a = (char)(y - '0');
        	x = x/10;
        	if(idx == 10){
        		idx--;
        	}
        	if(idx == 6 || idx == 2){
        		amount[idx] = ',';
        		idx--;
        	}
        	amount[idx] = a;
        	idx--;
       	}
       	printf("%s", amount);
    // 4 print balance
       	printf("%s", " | ");
       	char balance[15];
       	memset(balance, ' ', sizeof(balance));
        balance[14] = '\0';
        money += curt ->type * curt -> amount;
        if(money < 0){
        	balance[0] = '(';
            balance[13] = ')';
        }
        /*if(money >= 10000000 || money <= -1000000000){
               balance = "   ?,???,???.??";
        }else if(money == 0){
        	balance = "           0.  ";
        }else{
        	*/
        	int d = (int)(money*100);
        	int index = 12;
        	while(d > 0){
        	int f = x %10;
        	char g = (char)(f - '0');
        	d = d/10;
        	if(index == 10){
        		balance[index] = '.';
        		index--;
        	}
        	if(index == 6 || index == 2){
        		balance[index] = ',';
        		index--;
        	}
        	balance[index] = g;
        	index--;
        }

        printf("%s", balance);
        printf("%s\n", " |");
    }
    printf("%s\n", "+-----------------+--------------------------+----------------+----------------+"); 
}



int main(int argc, char *argv[]){
	printf("11\n");
    FILE *f;
    printf("0\n");
    f = fopen(argv[2], "r"); 
    printf("1\n");
  
	My402List l;

	if (!My402ListInit(&l)) {
        printf("%s\n", "initialize my402list failed");
        exit(-1);
    }
    printf("2\n");
	if(!parse(f, &l)){
		printf("%s\n", "incorrect input file");
        exit(-1);
	}
	printf("3\n");
	if (f != stdin){
		fclose(f);
	}
	printf("4\n");
    printtable(&l);
	return(0);
}


































































































































































































































































































































































































