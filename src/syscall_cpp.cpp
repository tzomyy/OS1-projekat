//
// Created by os on 6/21/22.
//


#include "../h/syscall_cpp.h"
#include "../h/_thread.h"
#include "../lib/hw.h"

typedef  void (Thread::*ptrOnFun)();
struct Wrapper {
    ptrOnFun func;
};

void wrapperRun(void* p){
    if(p == nullptr) return;
    ((Thread*)p)->run();
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
    mem_free(this);
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

    thread_create_only(&myHandle,wrapperRun,this);
}


Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    if (myHandle != nullptr) {
        sem_close(myHandle);
    }
}

int Semaphore::wait() {
    if (myHandle != nullptr) {
        return sem_wait(myHandle);
    }
    return -1;
}

int Semaphore::signal() {
    if (myHandle != nullptr) {
        return sem_signal(myHandle);
    }
    return -1;
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}