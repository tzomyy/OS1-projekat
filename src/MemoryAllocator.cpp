//
// Created by os on 6/21/22.
//

#include "../h/MemoryAllocator.h"
#include "../lib/console.h"
#include "../lib/hw.h"
#include "../h/syscall_c.h"
#include "../h/syscall_cpp.h"


MemoryAllocator::FreeMem* MemoryAllocator::fmem_head = (MemoryAllocator::FreeMem*)HEAP_START_ADDR; //stavila onako
MemoryAllocator::FullMem* MemoryAllocator::full_head = nullptr;
MemoryAllocator* MemoryAllocator::memoryAllocator = nullptr;

const size_t freeMemSize = (size_t) (HEAP_END_ADDR) -(size_t )HEAP_START_ADDR;

MemoryAllocator *MemoryAllocator::getInstance() {

    if (memoryAllocator == nullptr) {
        fmem_head = (FreeMem*)84000000;
        fmem_head->next = nullptr;
        fmem_head->prev = nullptr;
        fmem_head->size = (size_t)84000000 -(size_t )HEAP_START_ADDR;
        memoryAllocator = (MemoryAllocator*)MemoryAllocator::mem_alloc((sizeof(MemoryAllocator)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    }
    return memoryAllocator;
}

void *MemoryAllocator::mem_alloc(size_t size) {
    if (size <=0) return nullptr;
    // broj blokova koliko zauzima zaglavlje ovo je bilo bez prekidne
    //size_t headBlocks = sizeof(FullMem)/MEM_BLOCK_SIZE + (sizeof(FullMem)%MEM_BLOCK_SIZE?1:0);

    //velicina zaglavlja
    size_t headSize = sizeof(FullMem);

    FreeMem* cur = fmem_head;
    for(;cur !=0; cur = cur->next){
        if(cur->size < (size)*MEM_BLOCK_SIZE) continue;
        if(cur->size - (size)*MEM_BLOCK_SIZE < sizeof(FreeMem)){
            if(cur->prev) cur->prev->next = cur->next;
            else fmem_head = cur->next;
            if(cur->next) cur->next->prev = cur->prev;
        }
        else{
            FreeMem* newfrgm = (FreeMem*)((char*)cur + (size)*MEM_BLOCK_SIZE);
            newfrgm->prev = cur->prev;
            newfrgm->next = cur->next;
            newfrgm->size = cur->size - (size)*MEM_BLOCK_SIZE;
            if(cur->prev) cur->prev->next = newfrgm;
            else fmem_head = newfrgm;
            if(cur->next) cur->next->prev = newfrgm;
        }

        //ovde dodajem u listu zauzetih

        FullMem* tmp;
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
        else {
            for (tmp = full_head; tmp->next != nullptr && (char *) cur > (char *) (tmp->next); tmp = tmp->next);
        }

        FullMem* newSeg = (FullMem*)cur;
        newSeg->size = (size)*MEM_BLOCK_SIZE ;
        newSeg->prev = tmp;
        if (tmp) newSeg->next = tmp->next;
        else newSeg->next = full_head;
        if(newSeg->next) newSeg->next->prev = newSeg;
        if (tmp) tmp->next = newSeg;
        else full_head = newSeg;
        return (void*)((char*)cur+headSize);
    }
    return nullptr;
}

int MemoryAllocator::mem_free(void *addr) {

    if (addr == nullptr) return -2;
    //size_t headBlocks = sizeof(FullMem)/MEM_BLOCK_SIZE + (sizeof(FullMem)%MEM_BLOCK_SIZE?1:0);

    size_t headSize = sizeof(FullMem);

    addr = (void*)((char*)addr-headSize);

    FullMem* dSeg = (FullMem*)addr;
    FullMem* tmp = full_head;
    bool flag = false;
    for(; tmp && dSeg>=tmp; tmp = tmp->next){
        if(tmp == dSeg) {
            flag = true;
            break;
        }
    }

    if (!flag) return -1;

    //odvezujem se iz FullMem

    if (tmp->prev) tmp->prev->next = tmp->next;
    else full_head = tmp->next;
    if (tmp->next) tmp->next->prev = tmp->prev;

    //uvezujem se u freemem

    FreeMem* cur= nullptr;
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    else {
        for (cur = fmem_head; cur->next != nullptr && (char*)addr>(char*)(cur->next); cur = cur->next);
    }

    if(cur && (char*)cur+cur->size == addr){
        cur->size += tmp->size;
        if (cur->next && (char*)((char*)cur+ cur->size) == (char*)(cur->next)){
            cur->size += cur->next->size;
            cur->next = cur->next->next;
            if (cur->next) cur->next->prev = cur;
        }
        return 0;
    }
    else {
        FreeMem* nxtSeg = cur?cur->next:fmem_head;
        if(nxtSeg && (char*)((char*)tmp + tmp->size) == (char*) nxtSeg){
            FreeMem* newSeg = (FreeMem*)addr;
            newSeg->size = nxtSeg->size + tmp->size;
            newSeg->prev = nxtSeg->prev;
            newSeg->next = nxtSeg->next;
            if(nxtSeg->next) nxtSeg->next->prev = newSeg;
            if(nxtSeg->prev) nxtSeg->prev->next = newSeg;
            else fmem_head = newSeg;
            return 0;
        }
        else {
            FreeMem* newSeg = (FreeMem*)addr;
            newSeg->size = tmp->size;
            newSeg->prev = cur;
            if(cur) newSeg->next = cur->next;
            else newSeg->next =fmem_head;
            if(newSeg->next) newSeg->next->prev = newSeg;
            if (cur) cur->next = newSeg;
            else fmem_head = newSeg;
            return 0;
        }
    }
}







