//
// Created by os on 6/21/22.
//

#ifndef OS_PROJEKAT_SYSCALL_CPP_H
#define OS_PROJEKAT_SYSCALL_CPP_H

#include "syscall_c.h"

void* operator new(size_t);
void* operator new[](size_t);
void operator delete(void*);
void operator delete[](void*);

class Thread{
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread();

    int start();

    static void dispatch();
    static int sleep(time_t);

    friend void wrapperRun(void* p);
protected:
    Thread();
    virtual void run(){};
private:
    thread_t myHandle;
};

class Semaphore {
public:
    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();
    int wait ();
    int signal ();
private:
    sem_t myHandle;
};

class Console{
public:
    static char getc();
    static void putc(char);
};

#endif //OS_PROJEKAT_SYSCALL_CPP_H
