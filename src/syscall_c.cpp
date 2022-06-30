//
// Created by os on 6/21/22.
//


#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.h"
#include "../lib/hw.h"
#include "../h/riscv.h"
#include "../h/_thread.h"
#include "../h/_sem.h"
#include "../lib/console.h"

void userMain(void *);

enum ABI_codes{
    MEM_ALLOC = 0x01,
    MEM_FREE  = 0x02,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13,
    THREAD_CREATE_ONLY = 0x14,
    THREAD_START = 0x15,
    SEM_OPEN = 0x21,
    SEM_CLOSE = 0x22,
    SEM_WAIT = 0x23,
    SEM_SIGNAL = 0x24,
    GETC = 0x41,
    PUTC = 0x42
};

void abi_invoker(int serviceId, ... ){
    __asm__ volatile("ecall");
}

extern "C" void trap();

extern "C" void trapHandler(){

    uint64 scause = Riscv::r_scause();
       if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
        uint64 volatile sepc = 0;
        __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
        sepc +=4;

        uint64 volatile status = Riscv::r_sstatus();

        size_t opCode;
        __asm__ volatile("mv %0, a0": "=r" (opCode));

        switch (opCode) {
            case MEM_ALLOC:
            {
                size_t size;
                __asm__ volatile("mv %0, a1": "=r"(size));

                void* ret = MemoryAllocator::getInstance()->mem_alloc(size);
                __asm__ volatile("sd a0, 10*8(fp)");

                __asm__ volatile("mv a0, %0" : : "r"(ret));
                break;}
            case MEM_FREE:
            {
                void *p;
                __asm__ volatile("mv %0, a1": "=r"(p));
                MemoryAllocator::mem_free(p);
                break;}
            case THREAD_CREATE:
            {
                __asm__ volatile("ld s1, 11*8(fp)");
                __asm__ volatile("ld s2, 12*8(fp)");
                __asm__ volatile("ld s3, 13*8(fp)");
                thread_t* handle = nullptr;
                __asm__ volatile("mv %0, s1": "=r"(handle));
                _thread::Body body;
                __asm__ volatile("mv %0, s2": "=r"(body));
                void* arg;
                __asm__ volatile("mv %0, s3": "=r"(arg));

                *handle = _thread::createThread(body,arg);
                (*handle)->start();

                int ret = 0;
                if (!handle) { ret = -1;}

                __asm__ volatile("mv a0, %0" : :"r"(ret));
                break;
            }
            case THREAD_EXIT:
            {
                _thread::threadExit();
                break;}
            case THREAD_DISPATCH:
            {
                _thread::dispatch();
                break;
            }
            case THREAD_CREATE_ONLY:{
                __asm__ volatile("ld s1, 11*8(fp)");
                __asm__ volatile("ld s2, 12*8(fp)");
                __asm__ volatile("ld s3, 13*8(fp)");
                thread_t* handle = nullptr;
                __asm__ volatile("mv %0, s1": "=r"(handle));
                _thread::Body body;
                __asm__ volatile("mv %0, s2": "=r"(body));
                void* arg;
                __asm__ volatile("mv %0, s3": "=r"(arg));

                *handle = _thread::createThread(body,arg);

                int ret = 0;
                if (!handle) {ret = -1;}
                __asm__ volatile("mv a0, %0" : :"r"(ret));
                break;}
            case THREAD_START:{
                thread_t handle = nullptr;
                __asm__ volatile("mv %0, a1": "=r"(handle));

                handle->start();
                break;}
            case SEM_OPEN:{
                sem_t* handle = nullptr;
                __asm__ volatile("mv %0, a1": "=r"(handle));
                unsigned init = 0;
                __asm__ volatile("mv %0, a2": "=r"(init));

                *handle = _sem::semOpen(init);
                __asm__ volatile("mv a0, %0" : :"r"(handle));
                break;
            }
            case SEM_CLOSE:{
                sem_t handle = nullptr;
                __asm__ volatile("mv %0, a1": "=r"(handle));

                int ret = _sem::semClose(handle);
                __asm__ volatile("mv a0, %0" : :"r"(ret));
                break;
            }
            case SEM_WAIT:{
                sem_t id = nullptr;
                __asm__ volatile("mv %0, a1": "=r"(id));

                int ret = _sem::semWait(id);
                __asm__ volatile("mv a0, %0" : :"r"(ret));
                break;
            }
            case SEM_SIGNAL:{
                sem_t id = nullptr;
                __asm__ volatile("mv %0, a1": "=r"(id));

                int ret = _sem::semSignal(id);
                __asm__ volatile("mv a0, %0" : :"r"(ret));
                break;
            }
            case PUTC:{
                char c;
                __asm__ volatile("mv %0, a1": "=r"(c));
                __putc(c);
                break;
            }
            case GETC:{
                char c = __getc();
                __asm__ volatile("sd a0, 10*8(fp)");
                __asm__ volatile("mv a0, %0" : : "r"(c));
                //__asm__ volatile("mv a0, %0" : :"r"(c));
                break;
            }
        }
        Riscv::w_sepc(sepc);
        Riscv::w_sstatus(status);
    }
    else if (scause == 0x8000000000000001UL)
    {
        Riscv::mc_sip(Riscv::SIP_SSIP);
    } else if (scause == 0x8000000000000009UL)
    {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    } else
    {
        // unexpected trap cause
    }
}

void* mem_alloc(size_t size){
    //upis broja blokova
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
                         + ((size+sizeof(MemoryAllocator::FullMem))%MEM_BLOCK_SIZE?1:0);

    abi_invoker(MEM_ALLOC, numOfBlocks);

    //povratak
    void* p = nullptr;
    __asm__ volatile("mv a0, %0": "=r"(p));
    return p;

}

int mem_free(void *p){
    abi_invoker(MEM_FREE, p);

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    return ret;
}

int thread_exit(){
    //__asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_EXIT);

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    return ret;
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    if (!stack) return -1;

    abi_invoker(THREAD_CREATE, handle, start_routine, arg, stack);

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    return ret;
}

void thread_dispatch(){
    abi_invoker(THREAD_DISPATCH);
}

void thread_create_only(thread_t* handle,
                        void(*start_routine)(void*),
                        void* arg){
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    if (!stack) return ;

    abi_invoker(THREAD_CREATE_ONLY, handle, start_routine, arg, stack);

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
}

void thread_start(thread_t handle){
    abi_invoker(THREAD_START, handle);
}

int sem_open(sem_t* handle, unsigned init){
    abi_invoker(SEM_OPEN, handle, init);

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    return ret;
}

int sem_close(sem_t handle){
    abi_invoker(SEM_CLOSE, handle);

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    return ret;
}

int sem_wait(sem_t id){
    abi_invoker(SEM_WAIT, id);

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    return ret;
}

int sem_signal(sem_t id){
    abi_invoker(SEM_SIGNAL, id);

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    return ret;
}

void putc(char c){
    abi_invoker(PUTC, c);
}

char getc(){
    abi_invoker(GETC);
    char ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return ret;
}