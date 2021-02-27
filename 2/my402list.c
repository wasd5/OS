#include <stdlib.h>
#include "my402list.h"

int My402ListLength(My402List* list) {
    return list->num_members;
}

int My402ListEmpty(My402List* list) {
    return list->num_members <= 0;
}

int My402ListAppend(My402List* list, void* obj) {
    My402ListElem* listElem = (My402ListElem*)malloc(sizeof(My402ListElem));
    if(!listElem) {
        return 0;
    }
    My402ListElem* last = list->anchor.prev;
    listElem->obj = obj;
    last->next = listElem;
    listElem->prev = last;
    listElem->next = &(list->anchor);
    list->anchor.prev = listElem;
    list->num_members++;
    return 1;
}

int My402ListPrepend(My402List* list, void* obj) {
    My402ListElem* listElem = (My402ListElem*)malloc(sizeof(My402ListElem));
    if(!listElem) {
        return 0;
    }
    My402ListElem* first = list->anchor.next;
    listElem->obj = obj;
    first->prev = listElem;
    listElem->next = first;
    listElem->prev = &(list->anchor);
    list->anchor.next = listElem;
    list->num_members++;
    return 1;
}

void My402ListUnlink(My402List* list, My402ListElem* listElem) {
    if(!listElem) {
        return ;
    }
    list->num_members--;
    listElem->next->prev = listElem->prev;
    listElem->prev->next = listElem->next;
    free(listElem);
}

void My402ListUnlinkAll(My402List* list) {
    My402ListElem* p = My402ListFirst(list);
    while(p && p != &(list->anchor)) {
        My402ListElem* q = My402ListNext(list, p);
        My402ListUnlink(list, p);
        p = q;
    }
    My402ListInit(list);
}


int My402ListInsertBefore(My402List* list, void* obj, My402ListElem* listElem) {
    if(!listElem) {
        My402ListPrepend(list, obj);
        return 1;
    }
    My402ListElem* n = (My402ListElem*)malloc(sizeof(My402ListElem));
    n->obj = obj;
    if(!n) {
        return 0;
    }
    My402ListElem* p = listElem->prev;
    p->next = n;
    n->prev = p;
    n->next = listElem;
    listElem->prev = n;
    list->num_members++;
    return 1;
}

int My402ListInsertAfter(My402List* list, void* obj, My402ListElem* listElem) {
    if(!listElem) {
        My402ListAppend(list, obj);
        return 1;
    }
    My402ListElem* n = (My402ListElem*)malloc(sizeof(My402ListElem));
    n->obj = obj;
    if(!n) {
        return 0;
    }
    My402ListElem* p = listElem->next;
    p->prev = n;
    n->next = p;
    n->prev = listElem;
    listElem->next = n;
    list->num_members++;
    return 1;
}

My402ListElem* My402ListFirst(My402List* list) {
    if(list->num_members == 0) {
        return NULL;
    }
    return list->anchor.next;
}

My402ListElem* My402ListLast(My402List* list) {
    if(list->num_members == 0) {
        return NULL;
    }
    return list->anchor.prev;
}

My402ListElem* My402ListNext(My402List* list, My402ListElem* listElem) {
    if(listElem == My402ListLast(list)) {
        return NULL;
    }
    return listElem->next;
}

My402ListElem* My402ListPrev(My402List* list, My402ListElem* listElem) {
    if(listElem == My402ListFirst(list)) {
        return NULL;
    }
    return listElem->prev;
}

My402ListElem* My402ListFind(My402List* list, void* obj) {
    My402ListElem* p = list->anchor.next;
    while(p && p != &(list->anchor)) {
        if(p->obj == obj) {
            return p;
        }
        p = My402ListNext(list, p);
    }
    return NULL;
}

int My402ListInit(My402List* list) {
    list->num_members = 0;
    list->anchor.prev = &(list->anchor);
    list->anchor.next = &(list->anchor);
    list->anchor.obj = NULL;
    return 1;
}