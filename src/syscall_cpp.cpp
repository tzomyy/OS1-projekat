//
// Created by os on 6/21/22.
//


#include "../h/syscall_cpp.h"
#include "../h/syscall_c.h"
#include "../h/_thread.h"


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
    auto fptr = &Thread::run;
    void *a = reinterpret_cast<void *&>(fptr);
    thread_create(&myHandle, &wrapperRun, a);
}

void Thread::run() {

}
