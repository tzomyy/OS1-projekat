//
// Created by os on 6/21/22.
//

#include "../h/Scheduler.h"

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

_thread *Scheduler::get()
{
    if (!head) return nullptr;

    Elem* elem = head;
    head = head->next;
    if (!head) tail = 0;

    _thread *ret = elem->data;
    MemoryAllocator::mem_free(elem);
    return ret;
}

void Scheduler::put(_thread *ccb)
{
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    elem->data = ccb;
    elem->next = nullptr;
    if(tail){
        tail->next = elem;
        tail = elem;
    }else{
        head = tail = elem;
    }
}