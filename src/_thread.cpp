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

_thread *_thread::createThread(Body body, void* arg){

    _thread* ret = (_thread*)MemoryAllocator::getInstance()->mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    if (ret == nullptr) return ret;

    ret->body = body;
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE) : nullptr),
    ret->timeSlice = TIME_SLICE;
    ret->finished = false;
    ret->arg = arg;
    ret->context = {
            (uint64) &threadWrapper,
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    };

    if(body != nullptr) {
        Scheduler::put(ret);
    }
    return ret;
}

void _thread::yield()
{

    Riscv::pushRegisters();

    _thread::dispatch();

    Riscv::popRegisters();
    //thread_dispatch();

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
    if (running == nullptr) running = this;
    if ( this->body != nullptr) {Scheduler::put(this);}
}

void _thread::threadWrapper()
{
    Riscv::popSppSpie();
    running->body(running->arg);
    running->setFinished(true);
    _thread::yield();
}

void* _thread::operator new(size_t sz){
    return MemoryAllocator::getInstance()->mem_alloc((sz+
    sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
}

void* _thread::operator new[](size_t sz){
    return MemoryAllocator::getInstance()->mem_alloc((sz+
                                               sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
}
void _thread::operator delete(void* p){
    MemoryAllocator::getInstance()->mem_free(p);
}

void _thread::operator delete[](void* p){
    MemoryAllocator::getInstance()->mem_free(p);
}



