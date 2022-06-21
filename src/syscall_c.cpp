//
// Created by os on 6/21/22.
//


#include "../h/syscall_c.h"
#include "../h/MemoryAllocator.h"
#include "../lib/hw.h"
#include "../h/riscv.h"
#include "../h/_thread.h"
#include "../lib/console.h"

enum ABI_codes{
    MEM_ALLOC = 0x01,
    MEM_FREE  = 0x02,
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13
};

void abi_invoker(int serviceId, ... ){
    __asm__ volatile("ecall");
}

extern "C" void trap();

extern "C" void trapHandler(){

    uint64 scause = Riscv::r_scause();
    if (scause == 0x0000000000000009UL) {
        uint64 volatile sepc = 0;
        __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
        sepc +=4;

        size_t opCode;
        __asm__ volatile("mv %0, a0": "=r" (opCode));

        switch (opCode) {
            case MEM_ALLOC:
            {
                size_t size;
                __asm__ volatile("mv %0, a1": "=r"(size));
                MemoryAllocator::mem_alloc(size);
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
                __asm__ volatile("ld s4, 14*8(fp)");
                thread_t* handle = nullptr;
                __asm__ volatile("mv %0, s1": "=r"(handle));
                _thread::Body body;
                __asm__ volatile("mv %0, s2": "=r"(body));
                void* arg;
                __asm__ volatile("mv %0, s3": "=r"(arg));
                void* stack;
                __asm__ volatile("mv %0, s4": "=r"(stack));

                _thread::createThread(handle, body, stack, arg);
                (*handle)->start();

                int ret = 0;
                if (!handle) {ret = -1;}
                __asm__ volatile("mv %0, a0" : :"r"(ret));
                break;
            }
            case THREAD_EXIT:
                _thread::threadExit();
                break;
            case THREAD_DISPATCH:
                _thread::dispatch();
                break;
            default:
                uint64 volatile sstatus = Riscv::r_sstatus();
                _thread::resetTimeSliceCounter();
                _thread::dispatch();
                Riscv::w_sstatus(sstatus);
        }
        Riscv::w_sepc(sepc);
    }
}

void* mem_alloc(size_t size){

    //upis broja blokova
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
                         + ((size+sizeof(MemoryAllocator::FullMem))%MEM_BLOCK_SIZE?1:0);

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(MEM_ALLOC, numOfBlocks);

    //povratak
    void* p = nullptr;
    __asm__ volatile("mv a0, %0": "=r"(p));
    return p;

}

int mem_free(void *p){

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(MEM_FREE, p);

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    return ret;
}

int thread_exit(){
    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_EXIT);

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    return ret;
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    if (!stack) return -1;

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_CREATE, handle, start_routine, arg, stack);

    if(_thread::running == nullptr) _thread::running = *handle;

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    return ret;
}

void thread_dispatch(){
    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_DISPATCH);
}

void wrapperRun(void* p){
    if(p == nullptr) return;
    ((void(*)())(p))();
}

