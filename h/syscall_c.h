//
// Created by os on 6/21/22.
//

#ifndef OS_PROJEKAT_SYSCALL_C_H
#define OS_PROJEKAT_SYSCALL_C_H

#include "../lib/hw.h"
#include "Scheduler.h"

void* mem_alloc(size_t size);

int mem_free(void *p);

class _thread;
typedef _thread* thread_t;

int thread_create(
        thread_t* handle,
        void(*start_routine)(void*),
        void* arg
);

int thread_exit();

void thread_dispatch();

void thread_create_only(thread_t* handle,
                        void(*start_routine)(void*),
                        void* arg);

void thread_start(thread_t t);

//void wrapperRun(void* p);


#endif //OS_PROJEKAT_SYSCALL_C_H
