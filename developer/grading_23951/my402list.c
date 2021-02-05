

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <sys/time.h>

#include "cs402.h"

#include "my402list.h"


/* ----------------------- Utility Functions ----------------------- */

int  My402ListLength(My402List *l){
    return l -> num_members;
}

int  My402ListEmpty(My402List *l){
	return l -> num_members == 0;
}
// append last
int  My402ListAppend(My402List *l, void* x){
	//new node
	My402ListElem *newnode;
	newnode = (My402ListElem *)malloc(sizeof(My402ListElem));
	if(!newnode){
		return FALSE;
	}
	newnode -> obj = x;
	// case1 empty
	if( My402ListEmpty(l)){
		newnode -> next = &(l -> anchor);
		(l -> anchor).prev = newnode;
		newnode -> prev = &(l -> anchor);
		(l -> anchor).next = newnode;
	}else{
		//case2
		My402ListElem *last = My402ListLast(l);
		newnode -> next = &(l -> anchor);
		(l -> anchor).prev = newnode;
		newnode -> prev = last;
		last -> next = newnode;
	}
	l -> num_members ++;
    return TRUE;
}

int  My402ListPrepend(My402List *l, void* x){
	My402ListElem *newnode;
	newnode = (My402ListElem *)malloc(sizeof(My402ListElem));
	if(!newnode){
        return FALSE;
	}
	newnode -> obj = x;
	if( My402ListEmpty(l)){
		newnode -> prev = &(l -> anchor);
		(l -> anchor).next = newnode;
		newnode -> next = &(l -> anchor);
		(l -> anchor).prev = newnode;
	}else{
		//case2
		My402ListElem *f = My402ListFirst(l);
		newnode -> next = f;
		f -> prev = newnode;
		(l -> anchor).next = newnode;
		newnode -> prev = &(l -> anchor);
	}
	l -> num_members ++;
    return TRUE;
}

void My402ListUnlink(My402List *l, My402ListElem* cur){
	if(My402ListEmpty(l)){
		return;
	}
	My402ListElem *p = cur -> prev;
	My402ListElem *n = cur -> next;
	p -> next = n;
	n -> prev = p;
	l -> num_members --;
	free(cur);
}

void My402ListUnlinkAll(My402List *l){
	if(My402ListEmpty(l)){
		return;
	}
	My402ListElem *cur = My402ListFirst(l);
	while(cur){
		My402ListElem *q= cur;
		cur = My402ListNext(l, cur);
		My402ListUnlink(l, q);
	}
	(l -> anchor).next = &(l -> anchor);
	(l -> anchor).prev = &(l -> anchor);
}

int  My402ListInsertAfter(My402List *l, void* x, My402ListElem* cur){
    if(!l){
        return FALSE;
    }
	My402ListElem *newnode;
	newnode = (My402ListElem *)malloc(sizeof(My402ListElem));
	if(!newnode){
		return 0;
	}
	newnode -> obj = x;
	My402ListElem *p = cur -> next;
	newnode -> next = p;
	p -> prev = newnode;
	newnode -> prev = cur;
	cur -> next = newnode;
	l -> num_members ++;
    return TRUE;
}

int  My402ListInsertBefore(My402List *l, void* x, My402ListElem* cur){
    if(!l){
        return FALSE;
    }
	My402ListElem *newnode;
	newnode = (My402ListElem *)malloc(sizeof(My402ListElem));
	if(!newnode){
        return FALSE;
	}
	newnode -> obj = x;
	My402ListElem *p = cur -> prev;
	newnode -> next = cur;
	cur -> prev = newnode;
	newnode -> prev = p;
	p -> next = newnode;
	l -> num_members ++;
    return TRUE;
}

//empty? find itself
My402ListElem *My402ListFirst(My402List *l){
	if(My402ListEmpty(l)){
		return NULL;
	}
	return l -> anchor.next;
	
}

My402ListElem *My402ListLast(My402List *l){
	if(My402ListEmpty(l)){
		return NULL;
	}
	return l -> anchor.prev;
}

//already last? null
My402ListElem *My402ListNext(My402List *l, My402ListElem *cur){
	if(My402ListLast(l) == cur){
		return NULL;
	}
	return cur -> next;
}

My402ListElem *My402ListPrev(My402List *l, My402ListElem *cur){
	if(My402ListFirst(l) == cur){
		return NULL;
	}
	return cur -> prev;
}

My402ListElem *My402ListFind(My402List *l, void *t){
	My402ListElem *a = My402ListFirst(l);
	while(a){
		if(a -> obj == t){
			return a;
		}
		a = My402ListNext(l, a);
	}
    return NULL;
}

//initial
int My402ListInit(My402List *l){
	(l -> anchor).obj = NULL;
	l -> num_members = 0;
	(l -> anchor).next = &(l -> anchor);
	(l -> anchor).prev = &(l -> anchor);
    return TRUE;
}
