
#include "../lib/hw.h"
#include "../lib/console.h"
#include "../h/MemoryAllocator.h"
#include "../h/syscall_c.h"
#include "../h/riscv.h"
#include "../h/_thread.h"

extern "C" void trap();
void userMain();

void wrapperUserMain(void *){
    userMain();
}

int main(){

    _thread* threads[2];

    threads[0] = _thread::createThread(nullptr, nullptr);
    threads[1] = _thread::createThread(&wrapperUserMain, nullptr);
    threads[1]->start();

    Riscv::w_stvec((uint64) &trap);
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);



    _thread::running = threads[0];

    while (!(threads[1]->isFinished()))
    {
        _thread::yield();
    }
    return 0;
}



