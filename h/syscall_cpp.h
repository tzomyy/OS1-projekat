//
// Created by os on 6/21/22.
//

#ifndef OS_PROJEKAT_SYSCALL_CPP_H
#define OS_PROJEKAT_SYSCALL_CPP_H

#include "../h/syscall_c.h"

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

   // void* operator new(size_t);
    friend void wrapperRun(void* p);
protected:
    Thread();
    virtual void run(){};
private:
    thread_t myHandle;
};

#endif //OS_PROJEKAT_SYSCALL_CPP_H
