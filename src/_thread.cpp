//
// Created by os on 6/21/22.

#include "../h/_thread.h"


_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

int _thread::threadExit(){
    if (_thread::running == nullptr ) return -1;
    _thread::running->setFinished(true);
    return 0;
}

_thread *_thread::createThread(_thread** handle,Body body, void* stack, void* arg)
{
    _thread* ret = (_thread*)MemoryAllocator::mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    if (ret == nullptr) return ret;
    *handle = ret;
    (*handle)->body = body;
    (*handle)->stack = (uint64*)stack;
    (*handle)->timeSlice = TIME_SLICE;
    (*handle)->finished = false;
    (*handle)->arg = arg;
    (*handle)->context = {
            body != nullptr ? (uint64) body : 0,
            stack != nullptr ? (uint64) &(*handle)->stack[STACK_SIZE]: 0
    };
    return ret;
}

void _thread::yield()
{
    //__asm__ volatile ("ecall");

    Riscv::pushRegisters();

    _thread::dispatch();

    Riscv::popRegisters();

}

void _thread::dispatch()
{
    _thread *old = running;
    if (!old->isFinished()) { Scheduler::put(old); }
    running = Scheduler::get();
    if (running->body == nullptr && Scheduler::head != nullptr){
        _thread* tmp = running;
        running = Scheduler::get();
        Scheduler::put(tmp);
    }

    _thread::contextSwitch(&old->context, &running->context);
}

void _thread::start() {
    if ( this->body != nullptr) {Scheduler::put(this);}
}

void _thread::threadWrapper()
{
    Riscv::popSppSpie();
    running->body(running->arg);
    running->setFinished(true);
    _thread::yield();
}

/*void wrapperRun(Thread *p) {
    p->run();
}*/



