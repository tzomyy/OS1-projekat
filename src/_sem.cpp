//
// Created by os on 6/25/22.
//

#include "../h/_sem.h"


sem_t _sem::semOpen(unsigned init) {
    _sem* ret = (_sem*)MemoryAllocator::getInstance()->mem_alloc((sizeof(_sem) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    if (ret == nullptr) return ret;

    ret->init = init;
    ret->blockedThreads = new Blocked();
    return ret;
}

int _sem::semClose(sem_t handle){
    // deblock all threads and call MemoryAllocator to dealloc
    if (handle == nullptr) return -1;
    while (handle->blockedThreads->head != nullptr) handle->deblock();
    MemoryAllocator::mem_free(handle);
    return 0;
}

int _sem::semWait(sem_t id){
    if (id == nullptr) return -1;
    if (--id->init < 0) id->block();
    return 0;
}

int _sem::semSignal(sem_t id){
    if (id == nullptr) return -1;
    if (++id->init <= 0) id->deblock();
    return 0;
}

void _sem::block(){

    _thread *old = _thread::running;
    old->setBlocked(true);
    this->blockedThreads->put(old);
    _thread::running = Scheduler::get();
    _thread::contextSwitch(&old->context, &_thread::running->context);

}

void _sem::deblock(){
    _thread* t = this->blockedThreads->get();
    t->setBlocked(false);
    Scheduler::put(t);
}