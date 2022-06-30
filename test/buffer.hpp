//
// Created by os on 6/26/22.
//

#ifndef OS_PROJEKAT_BUFFER_HPP
#define OS_PROJEKAT_BUFFER_HPP

#include "../h/syscall_c.h"
#include "printing.h"


class Buffer {
private:
    int cap;
    int *buffer;
    int head, tail;

    sem_t spaceAvailable;
    sem_t itemAvailable;
    sem_t mutexHead;
    sem_t mutexTail;

public:
    Buffer(int _cap);
    ~Buffer();

    void put(int val);
    int get();

    int getCnt();

};


#endif //OS_PROJEKAT_BUFFER_HPP
