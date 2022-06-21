//
// Created by os on 6/21/22.
//

#ifndef OS_PROJEKAT_MEMORYALLOCATOR_H
#define OS_PROJEKAT_MEMORYALLOCATOR_H

#include "../lib/hw.h"

class MemoryAllocator {
public:
    struct FreeMem{
        FreeMem* next;
        FreeMem* prev;
        size_t size;
        //FreeMem(size_t freeMemSize):next(nullptr), prev(nullptr), size(freeMemSize){}
    };

    struct FullMem{
        FullMem* next;
        FullMem* prev;
        size_t size;
    };

private:
    MemoryAllocator(){};

    static MemoryAllocator* memoryAllocator;
    static FreeMem* fmem_head;
    static FullMem* full_head;
public:
    MemoryAllocator(MemoryAllocator &) = delete;
    void operator=(const MemoryAllocator&) = delete;

    static MemoryAllocator *getInstance();

    /* void* operator new(size_t size);
     void operator delete(void * p);*/

    static void* mem_alloc(size_t size);
    static int mem_free(void* addr);
};

#endif //OS_PROJEKAT_MEMORYALLOCATOR_H
