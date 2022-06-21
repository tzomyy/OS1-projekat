
#include "../lib/hw.h"
#include "../lib/console.h"
#include "../h/MemoryAllocator.h"
#include "../h/syscall_c.h"
#include "../h/riscv.h"
#include "../h/_thread.h"


//uint64  timerCount = 0;
//
//extern "C" void handleSupervisorTrap(){
//    uint64 scause;
//    __asm__ volatile("csrr %[scause], scause" : [scause] "=r" (scause) );
//    if(scause == (0x01UL << 63 | 0x01)){
//        timerCount++;
//        if (timerCount >= 50){
//            __putc('a');
//            __putc('\n');
//            timerCount = 0;
//        }
//        __asm__ volatile("csrc sip, 0x02");
//    }
//    console_handler();
//}
//extern "C" void supervisorTrap();

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
        __putc('?');
        __putc('0' + x);
    }
    x++;
}

void checkStatus(int status) {
    static int y = 0;
    if(status) {
        __putc('0' + y);
        __putc('?');
    }
    y++;
}
extern "C" void trap();
void userMain(void *);

int main(){

    MemoryAllocator::getInstance();
    __putc('c');
    thread_t thr[2];
    thread_create(&thr[0], nullptr, nullptr);
    thread_create(&thr[1], userMain, nullptr);

    //Riscv::w_stvec((uint64) &trap);
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    _thread::running = thr[0];
    _thread::yield();
    return 0;
}



