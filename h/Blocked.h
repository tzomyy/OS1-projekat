//
// Created by os on 6/26/22.
//

#ifndef OS_PROJEKAT_BLOCKED_H
#define OS_PROJEKAT_BLOCKED_H

#include "../h/_thread.h"

class Blocked
{
public:
    _thread *get();

    void put(_thread *ccb);

    struct Elem{
        _thread* data;
        Elem* next;
    };
    Elem* head;
    Elem* tail;

    Blocked(){
        head = tail = 0;
    }

};

#endif //OS_PROJEKAT_BLOCKED_H
