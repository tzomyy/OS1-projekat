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

    static _thread *createThread(_thread** handle, Body body, void* stack, void* arg);

    static void yield();

    static void dispatch();

    void start();

    static _thread *running;

    /* protected:

         friend void wrapperRun(Thread *p);*/

private:
    _thread(Body body, void* stck, void* arg, uint64 timeSlice) :
            body(body),
            stack((uint64*)stck),
            timeSlice(timeSlice),
            finished(false),
            arg(arg),
            context({body != nullptr ? (uint64) body : 0,
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
