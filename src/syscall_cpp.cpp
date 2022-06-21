//
// Created by os on 6/21/22.
//


#include "../h/syscall_cpp.h"
#include "../h/syscall_c.h"
#include "../h/_thread.h"
#include "../lib/hw.h"

typedef  void (Thread::*ptrOnFun)();

void* operator new(size_t size){
    void* p = mem_alloc(size);
    return p;
}

void* operator new[](size_t size){
    void* p = mem_alloc(size);
    return p;
}


void operator delete(void * p){
    mem_free(p);
}

void operator delete[](void * p){
    mem_free(p);
}

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    thread_exit();
}

int Thread::start() {
    return 0;
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t) {
    return 0;
}

Thread::Thread() {
    /*auto fptr = &(this->run);
    void *a = reinterpret_cast<void *&>(fptr);*/
    //fun_params* params = new fun_params;
    //int (Thread::*)(char,float)

    //void *ptr = static_cast<void *>(&Thread::run);
    //void *a = reinterpret_cast<void *&>(ptr);
    auto ptr = &Thread::run;
    void *a = reinterpret_cast<void*&>(ptr);

    thread_create(&myHandle, &wrapperRun, a);
}


void *Thread::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}

void wrapperRun(void* p){
    p = (char*)0x80001af8;
    ((void(*)())(p))();
    //if(p == nullptr) return;

}