//
// Created by os on 6/21/22.
//


#include "../h/riscv.h"

void Riscv::popSppSpie()
{
    __asm__ volatile ("csrw sepc, ra");
    ms_sstatus(SSTATUS_SPP);
    __asm__ volatile ("sret");
}

