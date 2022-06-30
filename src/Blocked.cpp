//
// Created by os on 6/26/22.
//

//
// Created by os on 6/21/22.
//

#include "../h/Blocked.h"


_thread *Blocked::get()
{
    if (!head) return nullptr;

    Elem* elem = head;
    head = head->next;
    if (!head) tail = 0;

    _thread *ret = elem->data;
    MemoryAllocator::mem_free(elem);
    return ret;
}

void Blocked::put(_thread *blocked)
{
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    elem->data = blocked;
    elem->next = nullptr;
    if(tail){
        tail->next = elem;
        tail = elem;
    }else{
        head = tail = elem;
    }
}