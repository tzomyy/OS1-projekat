//
// Created by os on 6/21/22.
//


#include "../h/syscall_cpp.h"
#include "../h/syscall_c.h"
#include "../h/_thread.h"
#include "../lib/hw.h"

typedef  void (Thread::*ptrOnFun)();
struct Wrapper {
    ptrOnFun func;
};

void wrapperRun(void* p){
    if(p == nullptr) return;
    ((Thread*)p)->run();
//    p = (char*)0x80001af8;
//    ((void(*)())(p))();
    //if(p == nullptr) return;

}

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
    thread_start(myHandle);
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
    /*auto ptr = &Thread::run;
    void *a = reinterpret_cast<void*&>(ptr);*/
//    void *(Thread::*mfp)() = &(Thread::run);
//    struct Wrapper my_wrapper = { this->run };

   // this->run();
    thread_create_only(&myHandle,wrapperRun,this);
}


void *Thread::operator new(size_t sz) {
    return MemoryAllocator::getInstance()->mem_alloc((sz+
                                               sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);

}

