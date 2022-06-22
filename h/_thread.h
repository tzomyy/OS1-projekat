//
// Created by os on 6/21/22.
//

#ifndef OS_PROJEKAT__THREAD_H
#define OS_PROJEKAT__THREAD_H

//
// Created by os on 6/17/22.
//

#include "../lib/hw.h"
#include "Scheduler.h"
#include "riscv.h"
#include "../h/syscall_cpp.h"

class _thread {
public:
    ~_thread() { MemoryAllocator::mem_free((char*)stack-STACK_SIZE); }

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }

    uint64 getTimeSlice() const { return timeSlice; }

    static void resetTimeSliceCounter() { timeSliceCounter=0;}

    using Body = void (*)(void*);

    static int threadExit();

    static _thread *createThread(Body body, void* arg);

    static void yield();

    static void dispatch();

    void start();

    static _thread *running;

    void* operator new(size_t);
    void* operator new[](size_t);
    void operator delete(void*);
    void operator delete[](void*);

private:
    _thread(Body body, uint64 timeSlice, void* arg) :
            body(body),
            stack(body != nullptr ? new uint64[STACK_SIZE] : nullptr),
            timeSlice(timeSlice),
            finished(false),
            arg(arg),
            context({(uint64) &threadWrapper,
                     stack != nullptr ? (uint64) &stack[STACK_SIZE] : 0
                    })

    {
        if (body != nullptr) { Scheduler::put(this); }
    }

    struct Context
    {
        uint64 ra;
        uint64 sp;
    };

    Body body;
    uint64 *stack;
    uint64 timeSlice;
    bool finished;
    void* arg;
    Context context;


    friend class Riscv;

    static void threadWrapper();

    static void contextSwitch(Context *oldContext, Context *runningContext);

    static uint64 timeSliceCounter;

    static uint64 constexpr STACK_SIZE = DEFAULT_STACK_SIZE;
    static uint64 constexpr TIME_SLICE = DEFAULT_TIME_SLICE;


};


#endif //OS_PROJEKAT__THREAD_H
