//
// Created by os on 6/25/22.
//

#ifndef OS_PROJEKAT__SEM_H
#define OS_PROJEKAT__SEM_H

#include "syscall_c.h"
#include "Blocked.h"

class _sem{
public:
    friend class _thread;

    static sem_t semOpen(unsigned init);

    static int semClose(sem_t handle);

    static int semWait(sem_t id);

    static int semSignal(sem_t id);

    void block();

    void deblock();

    _sem(unsigned init):init(init){
        blockedThreads = new Blocked();
    }

private:
    int init;
    Blocked* blockedThreads;
};

#endif //OS_PROJEKAT__SEM_H
