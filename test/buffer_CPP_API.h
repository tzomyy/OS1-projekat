//
// Created by os on 6/28/22.
//

#ifndef OS_PROJEKAT_BUFFER_CPP_API_H
#define OS_PROJEKAT_BUFFER_CPP_API_H

#include "../h/syscall_cpp.h"
#include "printing.h"

class BufferCPP {
private:
    int cap;
    int *buffer;
    int head, tail;

    Semaphore* spaceAvailable;
    Semaphore* itemAvailable;
    Semaphore* mutexHead;
    Semaphore* mutexTail;

public:
    BufferCPP(int _cap);
    ~BufferCPP();

    void put(int val);
    int get();

    int getCnt();
};


#endif //OS_PROJEKAT_BUFFER_CPP_API_H
