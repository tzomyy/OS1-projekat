//
// Created by os on 6/21/22.
//

#ifndef OS_PROJEKAT_SCHEDULER_H
#define OS_PROJEKAT_SCHEDULER_H

#include "list.h"

class _thread;

class Scheduler
{
public:
    static _thread *get();

    static void put(_thread *ccb);

    struct Elem{
        _thread* data;
        Elem* prev;
        Elem* next;
    };
    static Elem* head;
    static Elem* tail;

};


#endif //OS_PROJEKAT_SCHEDULER_H
