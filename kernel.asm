
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	f8813103          	ld	sp,-120(sp) # 80005f88 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4a1020ef          	jal	ra,80002cbc <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <trap>:
.extern trapHandler
.global trap
.align 4
trap:
    addi sp, sp, -256 //prostor za 32 registra
    80001000:	f0010113          	addi	sp,sp,-256

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001004:	00013023          	sd	zero,0(sp)
    80001008:	00113423          	sd	ra,8(sp)
    8000100c:	00213823          	sd	sp,16(sp)
    80001010:	00313c23          	sd	gp,24(sp)
    80001014:	02413023          	sd	tp,32(sp)
    80001018:	02513423          	sd	t0,40(sp)
    8000101c:	02613823          	sd	t1,48(sp)
    80001020:	02713c23          	sd	t2,56(sp)
    80001024:	04813023          	sd	s0,64(sp)
    80001028:	04913423          	sd	s1,72(sp)
    8000102c:	04a13823          	sd	a0,80(sp)
    80001030:	04b13c23          	sd	a1,88(sp)
    80001034:	06c13023          	sd	a2,96(sp)
    80001038:	06d13423          	sd	a3,104(sp)
    8000103c:	06e13823          	sd	a4,112(sp)
    80001040:	06f13c23          	sd	a5,120(sp)
    80001044:	09013023          	sd	a6,128(sp)
    80001048:	09113423          	sd	a7,136(sp)
    8000104c:	09213823          	sd	s2,144(sp)
    80001050:	09313c23          	sd	s3,152(sp)
    80001054:	0b413023          	sd	s4,160(sp)
    80001058:	0b513423          	sd	s5,168(sp)
    8000105c:	0b613823          	sd	s6,176(sp)
    80001060:	0b713c23          	sd	s7,184(sp)
    80001064:	0d813023          	sd	s8,192(sp)
    80001068:	0d913423          	sd	s9,200(sp)
    8000106c:	0da13823          	sd	s10,208(sp)
    80001070:	0db13c23          	sd	s11,216(sp)
    80001074:	0fc13023          	sd	t3,224(sp)
    80001078:	0fd13423          	sd	t4,232(sp)
    8000107c:	0fe13823          	sd	t5,240(sp)
    80001080:	0ff13c23          	sd	t6,248(sp)

    call trapHandler
    80001084:	1f0000ef          	jal	ra,80001274 <trapHandler>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    80001088:	00013003          	ld	zero,0(sp)
    8000108c:	00813083          	ld	ra,8(sp)
    80001090:	01013103          	ld	sp,16(sp)
    80001094:	01813183          	ld	gp,24(sp)
    80001098:	02013203          	ld	tp,32(sp)
    8000109c:	02813283          	ld	t0,40(sp)
    800010a0:	03013303          	ld	t1,48(sp)
    800010a4:	03813383          	ld	t2,56(sp)
    800010a8:	04013403          	ld	s0,64(sp)
    800010ac:	04813483          	ld	s1,72(sp)
    800010b0:	05013503          	ld	a0,80(sp)
    800010b4:	05813583          	ld	a1,88(sp)
    800010b8:	06013603          	ld	a2,96(sp)
    800010bc:	06813683          	ld	a3,104(sp)
    800010c0:	07013703          	ld	a4,112(sp)
    800010c4:	07813783          	ld	a5,120(sp)
    800010c8:	08013803          	ld	a6,128(sp)
    800010cc:	08813883          	ld	a7,136(sp)
    800010d0:	09013903          	ld	s2,144(sp)
    800010d4:	09813983          	ld	s3,152(sp)
    800010d8:	0a013a03          	ld	s4,160(sp)
    800010dc:	0a813a83          	ld	s5,168(sp)
    800010e0:	0b013b03          	ld	s6,176(sp)
    800010e4:	0b813b83          	ld	s7,184(sp)
    800010e8:	0c013c03          	ld	s8,192(sp)
    800010ec:	0c813c83          	ld	s9,200(sp)
    800010f0:	0d013d03          	ld	s10,208(sp)
    800010f4:	0d813d83          	ld	s11,216(sp)
    800010f8:	0e013e03          	ld	t3,224(sp)
    800010fc:	0e813e83          	ld	t4,232(sp)
    80001100:	0f013f03          	ld	t5,240(sp)
    80001104:	0f813f83          	ld	t6,248(sp)

    addi sp, sp, 256
    80001108:	10010113          	addi	sp,sp,256

    sret
    8000110c:	10200073          	sret

0000000080001110 <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    80001110:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001114:	00b29a63          	bne	t0,a1,80001128 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001118:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    8000111c:	fe029ae3          	bnez	t0,80001110 <copy_and_swap>
    li a0, 0               # Set return to success.
    80001120:	00000513          	li	a0,0
    jr ra                  # Return.
    80001124:	00008067          	ret

0000000080001128 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001128:	00100513          	li	a0,1
    8000112c:	00008067          	ret

0000000080001130 <_ZN5Riscv13pushRegistersEv>:
.global _ZN5Riscv13pushRegistersEv
.type _ZN5Riscv13pushRegistersEv, @function
_ZN5Riscv13pushRegistersEv:
    addi sp, sp, -256
    80001130:	f0010113          	addi	sp,sp,-256
    // https://sourceware.org/binutils/docs/as/Irp.html
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8(sp)
    .endr
    80001134:	00313c23          	sd	gp,24(sp)
    80001138:	02413023          	sd	tp,32(sp)
    8000113c:	02513423          	sd	t0,40(sp)
    80001140:	02613823          	sd	t1,48(sp)
    80001144:	02713c23          	sd	t2,56(sp)
    80001148:	04813023          	sd	s0,64(sp)
    8000114c:	04913423          	sd	s1,72(sp)
    80001150:	04a13823          	sd	a0,80(sp)
    80001154:	04b13c23          	sd	a1,88(sp)
    80001158:	06c13023          	sd	a2,96(sp)
    8000115c:	06d13423          	sd	a3,104(sp)
    80001160:	06e13823          	sd	a4,112(sp)
    80001164:	06f13c23          	sd	a5,120(sp)
    80001168:	09013023          	sd	a6,128(sp)
    8000116c:	09113423          	sd	a7,136(sp)
    80001170:	09213823          	sd	s2,144(sp)
    80001174:	09313c23          	sd	s3,152(sp)
    80001178:	0b413023          	sd	s4,160(sp)
    8000117c:	0b513423          	sd	s5,168(sp)
    80001180:	0b613823          	sd	s6,176(sp)
    80001184:	0b713c23          	sd	s7,184(sp)
    80001188:	0d813023          	sd	s8,192(sp)
    8000118c:	0d913423          	sd	s9,200(sp)
    80001190:	0da13823          	sd	s10,208(sp)
    80001194:	0db13c23          	sd	s11,216(sp)
    80001198:	0fc13023          	sd	t3,224(sp)
    8000119c:	0fd13423          	sd	t4,232(sp)
    800011a0:	0fe13823          	sd	t5,240(sp)
    800011a4:	0ff13c23          	sd	t6,248(sp)
    ret
    800011a8:	00008067          	ret

00000000800011ac <_ZN5Riscv12popRegistersEv>:
.type _ZN5Riscv12popRegistersEv, @function
_ZN5Riscv12popRegistersEv:
    // https://sourceware.org/binutils/docs/as/Irp.html
    .irp index, 3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8(sp)
    .endr
    800011ac:	01813183          	ld	gp,24(sp)
    800011b0:	02013203          	ld	tp,32(sp)
    800011b4:	02813283          	ld	t0,40(sp)
    800011b8:	03013303          	ld	t1,48(sp)
    800011bc:	03813383          	ld	t2,56(sp)
    800011c0:	04013403          	ld	s0,64(sp)
    800011c4:	04813483          	ld	s1,72(sp)
    800011c8:	05013503          	ld	a0,80(sp)
    800011cc:	05813583          	ld	a1,88(sp)
    800011d0:	06013603          	ld	a2,96(sp)
    800011d4:	06813683          	ld	a3,104(sp)
    800011d8:	07013703          	ld	a4,112(sp)
    800011dc:	07813783          	ld	a5,120(sp)
    800011e0:	08013803          	ld	a6,128(sp)
    800011e4:	08813883          	ld	a7,136(sp)
    800011e8:	09013903          	ld	s2,144(sp)
    800011ec:	09813983          	ld	s3,152(sp)
    800011f0:	0a013a03          	ld	s4,160(sp)
    800011f4:	0a813a83          	ld	s5,168(sp)
    800011f8:	0b013b03          	ld	s6,176(sp)
    800011fc:	0b813b83          	ld	s7,184(sp)
    80001200:	0c013c03          	ld	s8,192(sp)
    80001204:	0c813c83          	ld	s9,200(sp)
    80001208:	0d013d03          	ld	s10,208(sp)
    8000120c:	0d813d83          	ld	s11,216(sp)
    80001210:	0e013e03          	ld	t3,224(sp)
    80001214:	0e813e83          	ld	t4,232(sp)
    80001218:	0f013f03          	ld	t5,240(sp)
    8000121c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001220:	10010113          	addi	sp,sp,256
    ret
    80001224:	00008067          	ret

0000000080001228 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>:
.global _ZN7_thread13contextSwitchEPNS_7ContextES1_
.type _ZN7_thread13contextSwitchEPNS_7ContextES1_, @function
_ZN7_thread13contextSwitchEPNS_7ContextES1_:
    sd ra, 0 * 8(a0)
    80001228:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1 * 8(a0)
    8000122c:	00253423          	sd	sp,8(a0)

    ld ra, 0 * 8(a1)
    80001230:	0005b083          	ld	ra,0(a1)
    ld sp, 1 * 8(a1)
    80001234:	0085b103          	ld	sp,8(a1)

    80001238:	00008067          	ret

000000008000123c <_Z11abi_invokeriz>:
    THREAD_CREATE = 0x11,
    THREAD_EXIT = 0x12,
    THREAD_DISPATCH = 0x13
};

void abi_invoker(int serviceId, ... ){
    8000123c:	fb010113          	addi	sp,sp,-80
    80001240:	00813423          	sd	s0,8(sp)
    80001244:	01010413          	addi	s0,sp,16
    80001248:	00b43423          	sd	a1,8(s0)
    8000124c:	00c43823          	sd	a2,16(s0)
    80001250:	00d43c23          	sd	a3,24(s0)
    80001254:	02e43023          	sd	a4,32(s0)
    80001258:	02f43423          	sd	a5,40(s0)
    8000125c:	03043823          	sd	a6,48(s0)
    80001260:	03143c23          	sd	a7,56(s0)
    __asm__ volatile("ecall");
    80001264:	00000073          	ecall
}
    80001268:	00813403          	ld	s0,8(sp)
    8000126c:	05010113          	addi	sp,sp,80
    80001270:	00008067          	ret

0000000080001274 <trapHandler>:
};

inline uint64 Riscv::r_scause()
{
    uint64 scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001274:	14202773          	csrr	a4,scause
extern "C" void trap();

extern "C" void trapHandler(){

    uint64 scause = Riscv::r_scause();
    if (scause == 0x0000000000000009UL) {
    80001278:	00900793          	li	a5,9
    8000127c:	00f70463          	beq	a4,a5,80001284 <trapHandler+0x10>
    80001280:	00008067          	ret
extern "C" void trapHandler(){
    80001284:	fc010113          	addi	sp,sp,-64
    80001288:	02113c23          	sd	ra,56(sp)
    8000128c:	02813823          	sd	s0,48(sp)
    80001290:	02913423          	sd	s1,40(sp)
    80001294:	04010413          	addi	s0,sp,64
        uint64 volatile sepc = 0;
    80001298:	fc043423          	sd	zero,-56(s0)
        __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    8000129c:	141027f3          	csrr	a5,sepc
    800012a0:	fcf43423          	sd	a5,-56(s0)
        sepc +=4;
    800012a4:	fc843783          	ld	a5,-56(s0)
    800012a8:	00478793          	addi	a5,a5,4
    800012ac:	fcf43423          	sd	a5,-56(s0)

        size_t opCode;
        __asm__ volatile("mv %0, a0": "=r" (opCode));
    800012b0:	00050793          	mv	a5,a0

        switch (opCode) {
    800012b4:	01300713          	li	a4,19
    800012b8:	0cf76063          	bltu	a4,a5,80001378 <trapHandler+0x104>
    800012bc:	00279793          	slli	a5,a5,0x2
    800012c0:	00004717          	auipc	a4,0x4
    800012c4:	d6070713          	addi	a4,a4,-672 # 80005020 <CONSOLE_STATUS+0x10>
    800012c8:	00e787b3          	add	a5,a5,a4
    800012cc:	0007a783          	lw	a5,0(a5)
    800012d0:	00e787b3          	add	a5,a5,a4
    800012d4:	00078067          	jr	a5
            case MEM_ALLOC:
            {
                size_t size;
                __asm__ volatile("mv %0, a1": "=r"(size));
    800012d8:	00058513          	mv	a0,a1
                MemoryAllocator::mem_alloc(size);
    800012dc:	00001097          	auipc	ra,0x1
    800012e0:	630080e7          	jalr	1584(ra) # 8000290c <_ZN15MemoryAllocator9mem_allocEm>
                uint64 volatile sstatus = Riscv::r_sstatus();
                _thread::resetTimeSliceCounter();
                _thread::dispatch();
                Riscv::w_sstatus(sstatus);
        }
        Riscv::w_sepc(sepc);
    800012e4:	fc843783          	ld	a5,-56(s0)
    return sepc;
}

inline void Riscv::w_sepc(uint64 sepc)
{
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800012e8:	14179073          	csrw	sepc,a5
    }
}
    800012ec:	03813083          	ld	ra,56(sp)
    800012f0:	03013403          	ld	s0,48(sp)
    800012f4:	02813483          	ld	s1,40(sp)
    800012f8:	04010113          	addi	sp,sp,64
    800012fc:	00008067          	ret
                __asm__ volatile("mv %0, a1": "=r"(p));
    80001300:	00058513          	mv	a0,a1
                MemoryAllocator::mem_free(p);
    80001304:	00001097          	auipc	ra,0x1
    80001308:	7c8080e7          	jalr	1992(ra) # 80002acc <_ZN15MemoryAllocator8mem_freeEPv>
                break;}
    8000130c:	fd9ff06f          	j	800012e4 <trapHandler+0x70>
                __asm__ volatile("ld s1, 11*8(fp)");
    80001310:	05843483          	ld	s1,88(s0)
                __asm__ volatile("ld s2, 12*8(fp)");
    80001314:	06043903          	ld	s2,96(s0)
                __asm__ volatile("ld s3, 13*8(fp)");
    80001318:	06843983          	ld	s3,104(s0)
                __asm__ volatile("ld s4, 14*8(fp)");
    8000131c:	07043a03          	ld	s4,112(s0)
                __asm__ volatile("mv %0, s1": "=r"(handle));
    80001320:	00048493          	mv	s1,s1
                __asm__ volatile("mv %0, s2": "=r"(body));
    80001324:	00090593          	mv	a1,s2
                __asm__ volatile("mv %0, s3": "=r"(arg));
    80001328:	00098693          	mv	a3,s3
                __asm__ volatile("mv %0, s4": "=r"(stack));
    8000132c:	000a0613          	mv	a2,s4
                _thread::createThread(handle, body, stack, arg);
    80001330:	00048513          	mv	a0,s1
    80001334:	00000097          	auipc	ra,0x0
    80001338:	298080e7          	jalr	664(ra) # 800015cc <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_>
                (*handle)->start();
    8000133c:	0004b503          	ld	a0,0(s1)
    80001340:	00000097          	auipc	ra,0x0
    80001344:	428080e7          	jalr	1064(ra) # 80001768 <_ZN7_thread5startEv>
                if (!handle) {ret = -1;}
    80001348:	00048863          	beqz	s1,80001358 <trapHandler+0xe4>
                int ret = 0;
    8000134c:	00000793          	li	a5,0
                __asm__ volatile("mv %0, a0" : :"r"(ret));
    80001350:	00050793          	mv	a5,a0
                break;
    80001354:	f91ff06f          	j	800012e4 <trapHandler+0x70>
                if (!handle) {ret = -1;}
    80001358:	fff00793          	li	a5,-1
    8000135c:	ff5ff06f          	j	80001350 <trapHandler+0xdc>
                _thread::threadExit();
    80001360:	00000097          	auipc	ra,0x0
    80001364:	234080e7          	jalr	564(ra) # 80001594 <_ZN7_thread10threadExitEv>
                break;
    80001368:	f7dff06f          	j	800012e4 <trapHandler+0x70>
                _thread::dispatch();
    8000136c:	00000097          	auipc	ra,0x0
    80001370:	310080e7          	jalr	784(ra) # 8000167c <_ZN7_thread8dispatchEv>
                break;
    80001374:	f71ff06f          	j	800012e4 <trapHandler+0x70>
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001378:	100027f3          	csrr	a5,sstatus
    8000137c:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    80001380:	fd843783          	ld	a5,-40(s0)
                uint64 volatile sstatus = Riscv::r_sstatus();
    80001384:	fcf43823          	sd	a5,-48(s0)

    void setFinished(bool value) { finished = value; }

    uint64 getTimeSlice() const { return timeSlice; }

    static void resetTimeSliceCounter() { timeSliceCounter=0;}
    80001388:	00005797          	auipc	a5,0x5
    8000138c:	c207b783          	ld	a5,-992(a5) # 80005fa8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80001390:	0007b023          	sd	zero,0(a5)
                _thread::dispatch();
    80001394:	00000097          	auipc	ra,0x0
    80001398:	2e8080e7          	jalr	744(ra) # 8000167c <_ZN7_thread8dispatchEv>
                Riscv::w_sstatus(sstatus);
    8000139c:	fd043783          	ld	a5,-48(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800013a0:	10079073          	csrw	sstatus,a5
}
    800013a4:	f41ff06f          	j	800012e4 <trapHandler+0x70>

00000000800013a8 <_Z9mem_allocm>:

void* mem_alloc(size_t size){
    800013a8:	ff010113          	addi	sp,sp,-16
    800013ac:	00113423          	sd	ra,8(sp)
    800013b0:	00813023          	sd	s0,0(sp)
    800013b4:	01010413          	addi	s0,sp,16

    //upis broja blokova
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
    800013b8:	01850593          	addi	a1,a0,24
    800013bc:	0065d513          	srli	a0,a1,0x6
                         + ((size+sizeof(MemoryAllocator::FullMem))%MEM_BLOCK_SIZE?1:0);
    800013c0:	03f5f593          	andi	a1,a1,63
    800013c4:	00058463          	beqz	a1,800013cc <_Z9mem_allocm+0x24>
    800013c8:	00100593          	li	a1,1
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
    800013cc:	00b505b3          	add	a1,a0,a1

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    800013d0:	00005797          	auipc	a5,0x5
    800013d4:	bc87b783          	ld	a5,-1080(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x30>
    800013d8:	10579073          	csrw	stvec,a5
    abi_invoker(MEM_ALLOC, numOfBlocks);
    800013dc:	00100513          	li	a0,1
    800013e0:	00000097          	auipc	ra,0x0
    800013e4:	e5c080e7          	jalr	-420(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    void* p = nullptr;
    __asm__ volatile("mv a0, %0": "=r"(p));
    800013e8:	00050513          	mv	a0,a0
    return p;

}
    800013ec:	00813083          	ld	ra,8(sp)
    800013f0:	00013403          	ld	s0,0(sp)
    800013f4:	01010113          	addi	sp,sp,16
    800013f8:	00008067          	ret

00000000800013fc <_Z8mem_freePv>:

int mem_free(void *p){
    800013fc:	ff010113          	addi	sp,sp,-16
    80001400:	00113423          	sd	ra,8(sp)
    80001404:	00813023          	sd	s0,0(sp)
    80001408:	01010413          	addi	s0,sp,16
    8000140c:	00050593          	mv	a1,a0

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    80001410:	00005797          	auipc	a5,0x5
    80001414:	b887b783          	ld	a5,-1144(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001418:	10579073          	csrw	stvec,a5
    abi_invoker(MEM_FREE, p);
    8000141c:	00200513          	li	a0,2
    80001420:	00000097          	auipc	ra,0x0
    80001424:	e1c080e7          	jalr	-484(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    80001428:	00050513          	mv	a0,a0
    return ret;
}
    8000142c:	0005051b          	sext.w	a0,a0
    80001430:	00813083          	ld	ra,8(sp)
    80001434:	00013403          	ld	s0,0(sp)
    80001438:	01010113          	addi	sp,sp,16
    8000143c:	00008067          	ret

0000000080001440 <_Z11thread_exitv>:

int thread_exit(){
    80001440:	ff010113          	addi	sp,sp,-16
    80001444:	00113423          	sd	ra,8(sp)
    80001448:	00813023          	sd	s0,0(sp)
    8000144c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    80001450:	00005797          	auipc	a5,0x5
    80001454:	b487b783          	ld	a5,-1208(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001458:	10579073          	csrw	stvec,a5
    abi_invoker(THREAD_EXIT);
    8000145c:	01200513          	li	a0,18
    80001460:	00000097          	auipc	ra,0x0
    80001464:	ddc080e7          	jalr	-548(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    80001468:	00050513          	mv	a0,a0
    return ret;
}
    8000146c:	0005051b          	sext.w	a0,a0
    80001470:	00813083          	ld	ra,8(sp)
    80001474:	00013403          	ld	s0,0(sp)
    80001478:	01010113          	addi	sp,sp,16
    8000147c:	00008067          	ret

0000000080001480 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    80001480:	fd010113          	addi	sp,sp,-48
    80001484:	02113423          	sd	ra,40(sp)
    80001488:	02813023          	sd	s0,32(sp)
    8000148c:	00913c23          	sd	s1,24(sp)
    80001490:	01213823          	sd	s2,16(sp)
    80001494:	01313423          	sd	s3,8(sp)
    80001498:	03010413          	addi	s0,sp,48
    8000149c:	00050493          	mv	s1,a0
    800014a0:	00058913          	mv	s2,a1
    800014a4:	00060993          	mv	s3,a2
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800014a8:	04100513          	li	a0,65
    800014ac:	00001097          	auipc	ra,0x1
    800014b0:	460080e7          	jalr	1120(ra) # 8000290c <_ZN15MemoryAllocator9mem_allocEm>
    if (!stack) return -1;
    800014b4:	06050a63          	beqz	a0,80001528 <_Z13thread_createPP7_threadPFvPvES2_+0xa8>
    800014b8:	00050713          	mv	a4,a0

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    800014bc:	00005797          	auipc	a5,0x5
    800014c0:	adc7b783          	ld	a5,-1316(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x30>
    800014c4:	10579073          	csrw	stvec,a5
    abi_invoker(THREAD_CREATE, handle, start_routine, arg, stack);
    800014c8:	00098693          	mv	a3,s3
    800014cc:	00090613          	mv	a2,s2
    800014d0:	00048593          	mv	a1,s1
    800014d4:	01100513          	li	a0,17
    800014d8:	00000097          	auipc	ra,0x0
    800014dc:	d64080e7          	jalr	-668(ra) # 8000123c <_Z11abi_invokeriz>

    if(_thread::running == nullptr) _thread::running = *handle;
    800014e0:	00005797          	auipc	a5,0x5
    800014e4:	a987b783          	ld	a5,-1384(a5) # 80005f78 <_GLOBAL_OFFSET_TABLE_+0x10>
    800014e8:	0007b783          	ld	a5,0(a5)
    800014ec:	02078463          	beqz	a5,80001514 <_Z13thread_createPP7_threadPFvPvES2_+0x94>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    800014f0:	00050513          	mv	a0,a0
    800014f4:	0005051b          	sext.w	a0,a0
    return ret;
}
    800014f8:	02813083          	ld	ra,40(sp)
    800014fc:	02013403          	ld	s0,32(sp)
    80001500:	01813483          	ld	s1,24(sp)
    80001504:	01013903          	ld	s2,16(sp)
    80001508:	00813983          	ld	s3,8(sp)
    8000150c:	03010113          	addi	sp,sp,48
    80001510:	00008067          	ret
    if(_thread::running == nullptr) _thread::running = *handle;
    80001514:	0004b703          	ld	a4,0(s1)
    80001518:	00005797          	auipc	a5,0x5
    8000151c:	a607b783          	ld	a5,-1440(a5) # 80005f78 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001520:	00e7b023          	sd	a4,0(a5)
    80001524:	fcdff06f          	j	800014f0 <_Z13thread_createPP7_threadPFvPvES2_+0x70>
    if (!stack) return -1;
    80001528:	fff00513          	li	a0,-1
    8000152c:	fcdff06f          	j	800014f8 <_Z13thread_createPP7_threadPFvPvES2_+0x78>

0000000080001530 <_Z15thread_dispatchv>:

void thread_dispatch(){
    80001530:	ff010113          	addi	sp,sp,-16
    80001534:	00113423          	sd	ra,8(sp)
    80001538:	00813023          	sd	s0,0(sp)
    8000153c:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    80001540:	00005797          	auipc	a5,0x5
    80001544:	a587b783          	ld	a5,-1448(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001548:	10579073          	csrw	stvec,a5
    abi_invoker(THREAD_DISPATCH);
    8000154c:	01300513          	li	a0,19
    80001550:	00000097          	auipc	ra,0x0
    80001554:	cec080e7          	jalr	-788(ra) # 8000123c <_Z11abi_invokeriz>
}
    80001558:	00813083          	ld	ra,8(sp)
    8000155c:	00013403          	ld	s0,0(sp)
    80001560:	01010113          	addi	sp,sp,16
    80001564:	00008067          	ret

0000000080001568 <_Z10wrapperRunPv>:

void wrapperRun(void* p){
    if(p == nullptr) return;
    80001568:	02050463          	beqz	a0,80001590 <_Z10wrapperRunPv+0x28>
void wrapperRun(void* p){
    8000156c:	ff010113          	addi	sp,sp,-16
    80001570:	00113423          	sd	ra,8(sp)
    80001574:	00813023          	sd	s0,0(sp)
    80001578:	01010413          	addi	s0,sp,16
    ((void(*)())(p))();
    8000157c:	000500e7          	jalr	a0
}
    80001580:	00813083          	ld	ra,8(sp)
    80001584:	00013403          	ld	s0,0(sp)
    80001588:	01010113          	addi	sp,sp,16
    8000158c:	00008067          	ret
    80001590:	00008067          	ret

0000000080001594 <_ZN7_thread10threadExitEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

int _thread::threadExit(){
    80001594:	ff010113          	addi	sp,sp,-16
    80001598:	00813423          	sd	s0,8(sp)
    8000159c:	01010413          	addi	s0,sp,16
    if (_thread::running == nullptr ) return -1;
    800015a0:	00005797          	auipc	a5,0x5
    800015a4:	a607b783          	ld	a5,-1440(a5) # 80006000 <_ZN7_thread7runningE>
    800015a8:	00078e63          	beqz	a5,800015c4 <_ZN7_thread10threadExitEv+0x30>
    void setFinished(bool value) { finished = value; }
    800015ac:	00100713          	li	a4,1
    800015b0:	00e78c23          	sb	a4,24(a5)
    _thread::running->setFinished(true);
    return 0;
    800015b4:	00000513          	li	a0,0
}
    800015b8:	00813403          	ld	s0,8(sp)
    800015bc:	01010113          	addi	sp,sp,16
    800015c0:	00008067          	ret
    if (_thread::running == nullptr ) return -1;
    800015c4:	fff00513          	li	a0,-1
    800015c8:	ff1ff06f          	j	800015b8 <_ZN7_thread10threadExitEv+0x24>

00000000800015cc <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_>:

_thread *_thread::createThread(_thread** handle,Body body, void* stack, void* arg)
{
    800015cc:	fd010113          	addi	sp,sp,-48
    800015d0:	02113423          	sd	ra,40(sp)
    800015d4:	02813023          	sd	s0,32(sp)
    800015d8:	00913c23          	sd	s1,24(sp)
    800015dc:	01213823          	sd	s2,16(sp)
    800015e0:	01313423          	sd	s3,8(sp)
    800015e4:	01413023          	sd	s4,0(sp)
    800015e8:	03010413          	addi	s0,sp,48
    800015ec:	00050493          	mv	s1,a0
    800015f0:	00058913          	mv	s2,a1
    800015f4:	00060993          	mv	s3,a2
    800015f8:	00068a13          	mv	s4,a3
    _thread* ret = (_thread*)MemoryAllocator::mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800015fc:	00200513          	li	a0,2
    80001600:	00001097          	auipc	ra,0x1
    80001604:	30c080e7          	jalr	780(ra) # 8000290c <_ZN15MemoryAllocator9mem_allocEm>
    if (ret == nullptr) return ret;
    80001608:	04050663          	beqz	a0,80001654 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_+0x88>
    *handle = ret;
    8000160c:	00a4b023          	sd	a0,0(s1)
    (*handle)->body = body;
    80001610:	01253023          	sd	s2,0(a0)
    (*handle)->stack = (uint64*)stack;
    80001614:	0004b783          	ld	a5,0(s1)
    80001618:	0137b423          	sd	s3,8(a5)
    (*handle)->timeSlice = TIME_SLICE;
    8000161c:	0004b783          	ld	a5,0(s1)
    80001620:	00200713          	li	a4,2
    80001624:	00e7b823          	sd	a4,16(a5)
    (*handle)->finished = false;
    80001628:	0004b783          	ld	a5,0(s1)
    8000162c:	00078c23          	sb	zero,24(a5)
    (*handle)->arg = arg;
    80001630:	0004b783          	ld	a5,0(s1)
    80001634:	0347b023          	sd	s4,32(a5)
    (*handle)->context = {
    80001638:	0004b783          	ld	a5,0(s1)
            body != nullptr ? (uint64) body : 0,
            stack != nullptr ? (uint64) &(*handle)->stack[STACK_SIZE]: 0
    8000163c:	02098c63          	beqz	s3,80001674 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_+0xa8>
    80001640:	0087b703          	ld	a4,8(a5)
    80001644:	000086b7          	lui	a3,0x8
    80001648:	00d70733          	add	a4,a4,a3
    (*handle)->context = {
    8000164c:	0327b423          	sd	s2,40(a5)
    80001650:	02e7b823          	sd	a4,48(a5)
    };
    return ret;
}
    80001654:	02813083          	ld	ra,40(sp)
    80001658:	02013403          	ld	s0,32(sp)
    8000165c:	01813483          	ld	s1,24(sp)
    80001660:	01013903          	ld	s2,16(sp)
    80001664:	00813983          	ld	s3,8(sp)
    80001668:	00013a03          	ld	s4,0(sp)
    8000166c:	03010113          	addi	sp,sp,48
    80001670:	00008067          	ret
            stack != nullptr ? (uint64) &(*handle)->stack[STACK_SIZE]: 0
    80001674:	00000713          	li	a4,0
    80001678:	fd5ff06f          	j	8000164c <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_+0x80>

000000008000167c <_ZN7_thread8dispatchEv>:
    Riscv::popRegisters();

}

void _thread::dispatch()
{
    8000167c:	fe010113          	addi	sp,sp,-32
    80001680:	00113c23          	sd	ra,24(sp)
    80001684:	00813823          	sd	s0,16(sp)
    80001688:	00913423          	sd	s1,8(sp)
    8000168c:	01213023          	sd	s2,0(sp)
    80001690:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001694:	00005917          	auipc	s2,0x5
    80001698:	96c93903          	ld	s2,-1684(s2) # 80006000 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    8000169c:	01894783          	lbu	a5,24(s2)
    if (!old->isFinished()) { Scheduler::put(old); }
    800016a0:	04078863          	beqz	a5,800016f0 <_ZN7_thread8dispatchEv+0x74>
    running = Scheduler::get();
    800016a4:	00001097          	auipc	ra,0x1
    800016a8:	dc4080e7          	jalr	-572(ra) # 80002468 <_ZN9Scheduler3getEv>
    800016ac:	00050493          	mv	s1,a0
    800016b0:	00005797          	auipc	a5,0x5
    800016b4:	94a7b823          	sd	a0,-1712(a5) # 80006000 <_ZN7_thread7runningE>
    if (running->body == nullptr && Scheduler::head != nullptr){
    800016b8:	00053783          	ld	a5,0(a0)
    800016bc:	04078263          	beqz	a5,80001700 <_ZN7_thread8dispatchEv+0x84>
        _thread* tmp = running;
        running = Scheduler::get();
        Scheduler::put(tmp);
    }

    _thread::contextSwitch(&old->context, &running->context);
    800016c0:	00005597          	auipc	a1,0x5
    800016c4:	9405b583          	ld	a1,-1728(a1) # 80006000 <_ZN7_thread7runningE>
    800016c8:	02858593          	addi	a1,a1,40
    800016cc:	02890513          	addi	a0,s2,40
    800016d0:	00000097          	auipc	ra,0x0
    800016d4:	b58080e7          	jalr	-1192(ra) # 80001228 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    800016d8:	01813083          	ld	ra,24(sp)
    800016dc:	01013403          	ld	s0,16(sp)
    800016e0:	00813483          	ld	s1,8(sp)
    800016e4:	00013903          	ld	s2,0(sp)
    800016e8:	02010113          	addi	sp,sp,32
    800016ec:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    800016f0:	00090513          	mv	a0,s2
    800016f4:	00001097          	auipc	ra,0x1
    800016f8:	ddc080e7          	jalr	-548(ra) # 800024d0 <_ZN9Scheduler3putEP7_thread>
    800016fc:	fa9ff06f          	j	800016a4 <_ZN7_thread8dispatchEv+0x28>
    if (running->body == nullptr && Scheduler::head != nullptr){
    80001700:	00005797          	auipc	a5,0x5
    80001704:	8807b783          	ld	a5,-1920(a5) # 80005f80 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001708:	0007b783          	ld	a5,0(a5)
    8000170c:	fa078ae3          	beqz	a5,800016c0 <_ZN7_thread8dispatchEv+0x44>
        running = Scheduler::get();
    80001710:	00001097          	auipc	ra,0x1
    80001714:	d58080e7          	jalr	-680(ra) # 80002468 <_ZN9Scheduler3getEv>
    80001718:	00005797          	auipc	a5,0x5
    8000171c:	8ea7b423          	sd	a0,-1816(a5) # 80006000 <_ZN7_thread7runningE>
        Scheduler::put(tmp);
    80001720:	00048513          	mv	a0,s1
    80001724:	00001097          	auipc	ra,0x1
    80001728:	dac080e7          	jalr	-596(ra) # 800024d0 <_ZN9Scheduler3putEP7_thread>
    8000172c:	f95ff06f          	j	800016c0 <_ZN7_thread8dispatchEv+0x44>

0000000080001730 <_ZN7_thread5yieldEv>:
{
    80001730:	ff010113          	addi	sp,sp,-16
    80001734:	00113423          	sd	ra,8(sp)
    80001738:	00813023          	sd	s0,0(sp)
    8000173c:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80001740:	00000097          	auipc	ra,0x0
    80001744:	9f0080e7          	jalr	-1552(ra) # 80001130 <_ZN5Riscv13pushRegistersEv>
    _thread::dispatch();
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	f34080e7          	jalr	-204(ra) # 8000167c <_ZN7_thread8dispatchEv>
    Riscv::popRegisters();
    80001750:	00000097          	auipc	ra,0x0
    80001754:	a5c080e7          	jalr	-1444(ra) # 800011ac <_ZN5Riscv12popRegistersEv>
}
    80001758:	00813083          	ld	ra,8(sp)
    8000175c:	00013403          	ld	s0,0(sp)
    80001760:	01010113          	addi	sp,sp,16
    80001764:	00008067          	ret

0000000080001768 <_ZN7_thread5startEv>:

void _thread::start() {
    if ( this->body != nullptr) {Scheduler::put(this);}
    80001768:	00053783          	ld	a5,0(a0)
    8000176c:	02078663          	beqz	a5,80001798 <_ZN7_thread5startEv+0x30>
void _thread::start() {
    80001770:	ff010113          	addi	sp,sp,-16
    80001774:	00113423          	sd	ra,8(sp)
    80001778:	00813023          	sd	s0,0(sp)
    8000177c:	01010413          	addi	s0,sp,16
    if ( this->body != nullptr) {Scheduler::put(this);}
    80001780:	00001097          	auipc	ra,0x1
    80001784:	d50080e7          	jalr	-688(ra) # 800024d0 <_ZN9Scheduler3putEP7_thread>
}
    80001788:	00813083          	ld	ra,8(sp)
    8000178c:	00013403          	ld	s0,0(sp)
    80001790:	01010113          	addi	sp,sp,16
    80001794:	00008067          	ret
    80001798:	00008067          	ret

000000008000179c <_ZN7_thread13threadWrapperEv>:

void _thread::threadWrapper()
{
    8000179c:	fe010113          	addi	sp,sp,-32
    800017a0:	00113c23          	sd	ra,24(sp)
    800017a4:	00813823          	sd	s0,16(sp)
    800017a8:	00913423          	sd	s1,8(sp)
    800017ac:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    800017b0:	00001097          	auipc	ra,0x1
    800017b4:	0f8080e7          	jalr	248(ra) # 800028a8 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    800017b8:	00005497          	auipc	s1,0x5
    800017bc:	84848493          	addi	s1,s1,-1976 # 80006000 <_ZN7_thread7runningE>
    800017c0:	0004b783          	ld	a5,0(s1)
    800017c4:	0007b703          	ld	a4,0(a5)
    800017c8:	0207b503          	ld	a0,32(a5)
    800017cc:	000700e7          	jalr	a4
    running->setFinished(true);
    800017d0:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    800017d4:	00100713          	li	a4,1
    800017d8:	00e78c23          	sb	a4,24(a5)
    _thread::yield();
    800017dc:	00000097          	auipc	ra,0x0
    800017e0:	f54080e7          	jalr	-172(ra) # 80001730 <_ZN7_thread5yieldEv>
}
    800017e4:	01813083          	ld	ra,24(sp)
    800017e8:	01013403          	ld	s0,16(sp)
    800017ec:	00813483          	ld	s1,8(sp)
    800017f0:	02010113          	addi	sp,sp,32
    800017f4:	00008067          	ret

00000000800017f8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800017f8:	fe010113          	addi	sp,sp,-32
    800017fc:	00113c23          	sd	ra,24(sp)
    80001800:	00813823          	sd	s0,16(sp)
    80001804:	00913423          	sd	s1,8(sp)
    80001808:	02010413          	addi	s0,sp,32
    8000180c:	00050493          	mv	s1,a0
    LOCK();
    80001810:	00100613          	li	a2,1
    80001814:	00000593          	li	a1,0
    80001818:	00004517          	auipc	a0,0x4
    8000181c:	7f850513          	addi	a0,a0,2040 # 80006010 <lockPrint>
    80001820:	00000097          	auipc	ra,0x0
    80001824:	8f0080e7          	jalr	-1808(ra) # 80001110 <copy_and_swap>
    80001828:	fe0514e3          	bnez	a0,80001810 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000182c:	0004c503          	lbu	a0,0(s1)
    80001830:	00050a63          	beqz	a0,80001844 <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    80001834:	00003097          	auipc	ra,0x3
    80001838:	548080e7          	jalr	1352(ra) # 80004d7c <__putc>
        string++;
    8000183c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001840:	fedff06f          	j	8000182c <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001844:	00000613          	li	a2,0
    80001848:	00100593          	li	a1,1
    8000184c:	00004517          	auipc	a0,0x4
    80001850:	7c450513          	addi	a0,a0,1988 # 80006010 <lockPrint>
    80001854:	00000097          	auipc	ra,0x0
    80001858:	8bc080e7          	jalr	-1860(ra) # 80001110 <copy_and_swap>
    8000185c:	fe0514e3          	bnez	a0,80001844 <_Z11printStringPKc+0x4c>
}
    80001860:	01813083          	ld	ra,24(sp)
    80001864:	01013403          	ld	s0,16(sp)
    80001868:	00813483          	ld	s1,8(sp)
    8000186c:	02010113          	addi	sp,sp,32
    80001870:	00008067          	ret

0000000080001874 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001874:	fd010113          	addi	sp,sp,-48
    80001878:	02113423          	sd	ra,40(sp)
    8000187c:	02813023          	sd	s0,32(sp)
    80001880:	00913c23          	sd	s1,24(sp)
    80001884:	01213823          	sd	s2,16(sp)
    80001888:	01313423          	sd	s3,8(sp)
    8000188c:	01413023          	sd	s4,0(sp)
    80001890:	03010413          	addi	s0,sp,48
    80001894:	00050993          	mv	s3,a0
    80001898:	00058a13          	mv	s4,a1
    LOCK();
    8000189c:	00100613          	li	a2,1
    800018a0:	00000593          	li	a1,0
    800018a4:	00004517          	auipc	a0,0x4
    800018a8:	76c50513          	addi	a0,a0,1900 # 80006010 <lockPrint>
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	864080e7          	jalr	-1948(ra) # 80001110 <copy_and_swap>
    800018b4:	fe0514e3          	bnez	a0,8000189c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800018b8:	00000913          	li	s2,0
    800018bc:	00090493          	mv	s1,s2
    800018c0:	0019091b          	addiw	s2,s2,1
    800018c4:	03495a63          	bge	s2,s4,800018f8 <_Z9getStringPci+0x84>
        cc = __getc();
    800018c8:	00003097          	auipc	ra,0x3
    800018cc:	4f0080e7          	jalr	1264(ra) # 80004db8 <__getc>
        if(cc < 1)
    800018d0:	02050463          	beqz	a0,800018f8 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    800018d4:	009984b3          	add	s1,s3,s1
    800018d8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800018dc:	00a00793          	li	a5,10
    800018e0:	00f50a63          	beq	a0,a5,800018f4 <_Z9getStringPci+0x80>
    800018e4:	00d00793          	li	a5,13
    800018e8:	fcf51ae3          	bne	a0,a5,800018bc <_Z9getStringPci+0x48>
        buf[i++] = c;
    800018ec:	00090493          	mv	s1,s2
    800018f0:	0080006f          	j	800018f8 <_Z9getStringPci+0x84>
    800018f4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800018f8:	009984b3          	add	s1,s3,s1
    800018fc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80001900:	00000613          	li	a2,0
    80001904:	00100593          	li	a1,1
    80001908:	00004517          	auipc	a0,0x4
    8000190c:	70850513          	addi	a0,a0,1800 # 80006010 <lockPrint>
    80001910:	00000097          	auipc	ra,0x0
    80001914:	800080e7          	jalr	-2048(ra) # 80001110 <copy_and_swap>
    80001918:	fe0514e3          	bnez	a0,80001900 <_Z9getStringPci+0x8c>
    return buf;
}
    8000191c:	00098513          	mv	a0,s3
    80001920:	02813083          	ld	ra,40(sp)
    80001924:	02013403          	ld	s0,32(sp)
    80001928:	01813483          	ld	s1,24(sp)
    8000192c:	01013903          	ld	s2,16(sp)
    80001930:	00813983          	ld	s3,8(sp)
    80001934:	00013a03          	ld	s4,0(sp)
    80001938:	03010113          	addi	sp,sp,48
    8000193c:	00008067          	ret

0000000080001940 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001940:	ff010113          	addi	sp,sp,-16
    80001944:	00813423          	sd	s0,8(sp)
    80001948:	01010413          	addi	s0,sp,16
    8000194c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001950:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001954:	0006c603          	lbu	a2,0(a3) # 8000 <_entry-0x7fff8000>
    80001958:	fd06071b          	addiw	a4,a2,-48
    8000195c:	0ff77713          	andi	a4,a4,255
    80001960:	00900793          	li	a5,9
    80001964:	02e7e063          	bltu	a5,a4,80001984 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001968:	0025179b          	slliw	a5,a0,0x2
    8000196c:	00a787bb          	addw	a5,a5,a0
    80001970:	0017979b          	slliw	a5,a5,0x1
    80001974:	00168693          	addi	a3,a3,1
    80001978:	00c787bb          	addw	a5,a5,a2
    8000197c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001980:	fd5ff06f          	j	80001954 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001984:	00813403          	ld	s0,8(sp)
    80001988:	01010113          	addi	sp,sp,16
    8000198c:	00008067          	ret

0000000080001990 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001990:	fc010113          	addi	sp,sp,-64
    80001994:	02113c23          	sd	ra,56(sp)
    80001998:	02813823          	sd	s0,48(sp)
    8000199c:	02913423          	sd	s1,40(sp)
    800019a0:	03213023          	sd	s2,32(sp)
    800019a4:	01313c23          	sd	s3,24(sp)
    800019a8:	04010413          	addi	s0,sp,64
    800019ac:	00050493          	mv	s1,a0
    800019b0:	00058913          	mv	s2,a1
    800019b4:	00060993          	mv	s3,a2
    LOCK();
    800019b8:	00100613          	li	a2,1
    800019bc:	00000593          	li	a1,0
    800019c0:	00004517          	auipc	a0,0x4
    800019c4:	65050513          	addi	a0,a0,1616 # 80006010 <lockPrint>
    800019c8:	fffff097          	auipc	ra,0xfffff
    800019cc:	748080e7          	jalr	1864(ra) # 80001110 <copy_and_swap>
    800019d0:	fe0514e3          	bnez	a0,800019b8 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800019d4:	00098463          	beqz	s3,800019dc <_Z8printIntiii+0x4c>
    800019d8:	0804c463          	bltz	s1,80001a60 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800019dc:	0004851b          	sext.w	a0,s1
    neg = 0;
    800019e0:	00000593          	li	a1,0
    }

    i = 0;
    800019e4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800019e8:	0009079b          	sext.w	a5,s2
    800019ec:	0325773b          	remuw	a4,a0,s2
    800019f0:	00048613          	mv	a2,s1
    800019f4:	0014849b          	addiw	s1,s1,1
    800019f8:	02071693          	slli	a3,a4,0x20
    800019fc:	0206d693          	srli	a3,a3,0x20
    80001a00:	00004717          	auipc	a4,0x4
    80001a04:	48070713          	addi	a4,a4,1152 # 80005e80 <digits>
    80001a08:	00d70733          	add	a4,a4,a3
    80001a0c:	00074683          	lbu	a3,0(a4)
    80001a10:	fd040713          	addi	a4,s0,-48
    80001a14:	00c70733          	add	a4,a4,a2
    80001a18:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001a1c:	0005071b          	sext.w	a4,a0
    80001a20:	0325553b          	divuw	a0,a0,s2
    80001a24:	fcf772e3          	bgeu	a4,a5,800019e8 <_Z8printIntiii+0x58>
    if(neg)
    80001a28:	00058c63          	beqz	a1,80001a40 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001a2c:	fd040793          	addi	a5,s0,-48
    80001a30:	009784b3          	add	s1,a5,s1
    80001a34:	02d00793          	li	a5,45
    80001a38:	fef48823          	sb	a5,-16(s1)
    80001a3c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001a40:	fff4849b          	addiw	s1,s1,-1
    80001a44:	0204c463          	bltz	s1,80001a6c <_Z8printIntiii+0xdc>
        __putc(buf[i]);
    80001a48:	fd040793          	addi	a5,s0,-48
    80001a4c:	009787b3          	add	a5,a5,s1
    80001a50:	ff07c503          	lbu	a0,-16(a5)
    80001a54:	00003097          	auipc	ra,0x3
    80001a58:	328080e7          	jalr	808(ra) # 80004d7c <__putc>
    80001a5c:	fe5ff06f          	j	80001a40 <_Z8printIntiii+0xb0>
        x = -xx;
    80001a60:	4090053b          	negw	a0,s1
        neg = 1;
    80001a64:	00100593          	li	a1,1
        x = -xx;
    80001a68:	f7dff06f          	j	800019e4 <_Z8printIntiii+0x54>

    UNLOCK();
    80001a6c:	00000613          	li	a2,0
    80001a70:	00100593          	li	a1,1
    80001a74:	00004517          	auipc	a0,0x4
    80001a78:	59c50513          	addi	a0,a0,1436 # 80006010 <lockPrint>
    80001a7c:	fffff097          	auipc	ra,0xfffff
    80001a80:	694080e7          	jalr	1684(ra) # 80001110 <copy_and_swap>
    80001a84:	fe0514e3          	bnez	a0,80001a6c <_Z8printIntiii+0xdc>
    80001a88:	03813083          	ld	ra,56(sp)
    80001a8c:	03013403          	ld	s0,48(sp)
    80001a90:	02813483          	ld	s1,40(sp)
    80001a94:	02013903          	ld	s2,32(sp)
    80001a98:	01813983          	ld	s3,24(sp)
    80001a9c:	04010113          	addi	sp,sp,64
    80001aa0:	00008067          	ret

0000000080001aa4 <_Z9fibonaccim>:
bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

uint64 fibonacci(uint64 n) {
    80001aa4:	fe010113          	addi	sp,sp,-32
    80001aa8:	00113c23          	sd	ra,24(sp)
    80001aac:	00813823          	sd	s0,16(sp)
    80001ab0:	00913423          	sd	s1,8(sp)
    80001ab4:	01213023          	sd	s2,0(sp)
    80001ab8:	02010413          	addi	s0,sp,32
    80001abc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001ac0:	00100793          	li	a5,1
    80001ac4:	02a7f863          	bgeu	a5,a0,80001af4 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80001ac8:	00a00793          	li	a5,10
    80001acc:	02f577b3          	remu	a5,a0,a5
    80001ad0:	02078e63          	beqz	a5,80001b0c <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001ad4:	fff48513          	addi	a0,s1,-1
    80001ad8:	00000097          	auipc	ra,0x0
    80001adc:	fcc080e7          	jalr	-52(ra) # 80001aa4 <_Z9fibonaccim>
    80001ae0:	00050913          	mv	s2,a0
    80001ae4:	ffe48513          	addi	a0,s1,-2
    80001ae8:	00000097          	auipc	ra,0x0
    80001aec:	fbc080e7          	jalr	-68(ra) # 80001aa4 <_Z9fibonaccim>
    80001af0:	00a90533          	add	a0,s2,a0
}
    80001af4:	01813083          	ld	ra,24(sp)
    80001af8:	01013403          	ld	s0,16(sp)
    80001afc:	00813483          	ld	s1,8(sp)
    80001b00:	00013903          	ld	s2,0(sp)
    80001b04:	02010113          	addi	sp,sp,32
    80001b08:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001b0c:	00000097          	auipc	ra,0x0
    80001b10:	a24080e7          	jalr	-1500(ra) # 80001530 <_Z15thread_dispatchv>
    80001b14:	fc1ff06f          	j	80001ad4 <_Z9fibonaccim+0x30>

0000000080001b18 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80001b18:	fe010113          	addi	sp,sp,-32
    80001b1c:	00113c23          	sd	ra,24(sp)
    80001b20:	00813823          	sd	s0,16(sp)
    80001b24:	00913423          	sd	s1,8(sp)
    80001b28:	01213023          	sd	s2,0(sp)
    80001b2c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001b30:	00000913          	li	s2,0
    80001b34:	0380006f          	j	80001b6c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	9f8080e7          	jalr	-1544(ra) # 80001530 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001b40:	00148493          	addi	s1,s1,1
    80001b44:	000027b7          	lui	a5,0x2
    80001b48:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001b4c:	0097ee63          	bltu	a5,s1,80001b68 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001b50:	00000713          	li	a4,0
    80001b54:	000077b7          	lui	a5,0x7
    80001b58:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001b5c:	fce7eee3          	bltu	a5,a4,80001b38 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80001b60:	00170713          	addi	a4,a4,1
    80001b64:	ff1ff06f          	j	80001b54 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80001b68:	00190913          	addi	s2,s2,1
    80001b6c:	00900793          	li	a5,9
    80001b70:	0527e063          	bltu	a5,s2,80001bb0 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80001b74:	00003517          	auipc	a0,0x3
    80001b78:	4fc50513          	addi	a0,a0,1276 # 80005070 <CONSOLE_STATUS+0x60>
    80001b7c:	00000097          	auipc	ra,0x0
    80001b80:	c7c080e7          	jalr	-900(ra) # 800017f8 <_Z11printStringPKc>
    80001b84:	00000613          	li	a2,0
    80001b88:	00a00593          	li	a1,10
    80001b8c:	0009051b          	sext.w	a0,s2
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	e00080e7          	jalr	-512(ra) # 80001990 <_Z8printIntiii>
    80001b98:	00003517          	auipc	a0,0x3
    80001b9c:	6e050513          	addi	a0,a0,1760 # 80005278 <CONSOLE_STATUS+0x268>
    80001ba0:	00000097          	auipc	ra,0x0
    80001ba4:	c58080e7          	jalr	-936(ra) # 800017f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001ba8:	00000493          	li	s1,0
    80001bac:	f99ff06f          	j	80001b44 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80001bb0:	00003517          	auipc	a0,0x3
    80001bb4:	4c850513          	addi	a0,a0,1224 # 80005078 <CONSOLE_STATUS+0x68>
    80001bb8:	00000097          	auipc	ra,0x0
    80001bbc:	c40080e7          	jalr	-960(ra) # 800017f8 <_Z11printStringPKc>
    finishedA = true;
    80001bc0:	00100793          	li	a5,1
    80001bc4:	00004717          	auipc	a4,0x4
    80001bc8:	44f70a23          	sb	a5,1108(a4) # 80006018 <finishedA>
}
    80001bcc:	01813083          	ld	ra,24(sp)
    80001bd0:	01013403          	ld	s0,16(sp)
    80001bd4:	00813483          	ld	s1,8(sp)
    80001bd8:	00013903          	ld	s2,0(sp)
    80001bdc:	02010113          	addi	sp,sp,32
    80001be0:	00008067          	ret

0000000080001be4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80001be4:	fe010113          	addi	sp,sp,-32
    80001be8:	00113c23          	sd	ra,24(sp)
    80001bec:	00813823          	sd	s0,16(sp)
    80001bf0:	00913423          	sd	s1,8(sp)
    80001bf4:	01213023          	sd	s2,0(sp)
    80001bf8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001bfc:	00000913          	li	s2,0
    80001c00:	0380006f          	j	80001c38 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001c04:	00000097          	auipc	ra,0x0
    80001c08:	92c080e7          	jalr	-1748(ra) # 80001530 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001c0c:	00148493          	addi	s1,s1,1
    80001c10:	000027b7          	lui	a5,0x2
    80001c14:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001c18:	0097ee63          	bltu	a5,s1,80001c34 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001c1c:	00000713          	li	a4,0
    80001c20:	000077b7          	lui	a5,0x7
    80001c24:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001c28:	fce7eee3          	bltu	a5,a4,80001c04 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80001c2c:	00170713          	addi	a4,a4,1
    80001c30:	ff1ff06f          	j	80001c20 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80001c34:	00190913          	addi	s2,s2,1
    80001c38:	00f00793          	li	a5,15
    80001c3c:	0527e063          	bltu	a5,s2,80001c7c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80001c40:	00003517          	auipc	a0,0x3
    80001c44:	44850513          	addi	a0,a0,1096 # 80005088 <CONSOLE_STATUS+0x78>
    80001c48:	00000097          	auipc	ra,0x0
    80001c4c:	bb0080e7          	jalr	-1104(ra) # 800017f8 <_Z11printStringPKc>
    80001c50:	00000613          	li	a2,0
    80001c54:	00a00593          	li	a1,10
    80001c58:	0009051b          	sext.w	a0,s2
    80001c5c:	00000097          	auipc	ra,0x0
    80001c60:	d34080e7          	jalr	-716(ra) # 80001990 <_Z8printIntiii>
    80001c64:	00003517          	auipc	a0,0x3
    80001c68:	61450513          	addi	a0,a0,1556 # 80005278 <CONSOLE_STATUS+0x268>
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	b8c080e7          	jalr	-1140(ra) # 800017f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001c74:	00000493          	li	s1,0
    80001c78:	f99ff06f          	j	80001c10 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80001c7c:	00003517          	auipc	a0,0x3
    80001c80:	41450513          	addi	a0,a0,1044 # 80005090 <CONSOLE_STATUS+0x80>
    80001c84:	00000097          	auipc	ra,0x0
    80001c88:	b74080e7          	jalr	-1164(ra) # 800017f8 <_Z11printStringPKc>
    finishedB = true;
    80001c8c:	00100793          	li	a5,1
    80001c90:	00004717          	auipc	a4,0x4
    80001c94:	38f704a3          	sb	a5,905(a4) # 80006019 <finishedB>
    thread_dispatch();
    80001c98:	00000097          	auipc	ra,0x0
    80001c9c:	898080e7          	jalr	-1896(ra) # 80001530 <_Z15thread_dispatchv>
}
    80001ca0:	01813083          	ld	ra,24(sp)
    80001ca4:	01013403          	ld	s0,16(sp)
    80001ca8:	00813483          	ld	s1,8(sp)
    80001cac:	00013903          	ld	s2,0(sp)
    80001cb0:	02010113          	addi	sp,sp,32
    80001cb4:	00008067          	ret

0000000080001cb8 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80001cb8:	fe010113          	addi	sp,sp,-32
    80001cbc:	00113c23          	sd	ra,24(sp)
    80001cc0:	00813823          	sd	s0,16(sp)
    80001cc4:	00913423          	sd	s1,8(sp)
    80001cc8:	01213023          	sd	s2,0(sp)
    80001ccc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001cd0:	00000493          	li	s1,0
    80001cd4:	0400006f          	j	80001d14 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001cd8:	00003517          	auipc	a0,0x3
    80001cdc:	3c850513          	addi	a0,a0,968 # 800050a0 <CONSOLE_STATUS+0x90>
    80001ce0:	00000097          	auipc	ra,0x0
    80001ce4:	b18080e7          	jalr	-1256(ra) # 800017f8 <_Z11printStringPKc>
    80001ce8:	00000613          	li	a2,0
    80001cec:	00a00593          	li	a1,10
    80001cf0:	00048513          	mv	a0,s1
    80001cf4:	00000097          	auipc	ra,0x0
    80001cf8:	c9c080e7          	jalr	-868(ra) # 80001990 <_Z8printIntiii>
    80001cfc:	00003517          	auipc	a0,0x3
    80001d00:	57c50513          	addi	a0,a0,1404 # 80005278 <CONSOLE_STATUS+0x268>
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	af4080e7          	jalr	-1292(ra) # 800017f8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001d0c:	0014849b          	addiw	s1,s1,1
    80001d10:	0ff4f493          	andi	s1,s1,255
    80001d14:	00200793          	li	a5,2
    80001d18:	fc97f0e3          	bgeu	a5,s1,80001cd8 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80001d1c:	00003517          	auipc	a0,0x3
    80001d20:	38c50513          	addi	a0,a0,908 # 800050a8 <CONSOLE_STATUS+0x98>
    80001d24:	00000097          	auipc	ra,0x0
    80001d28:	ad4080e7          	jalr	-1324(ra) # 800017f8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001d2c:	00700313          	li	t1,7
    thread_dispatch();
    80001d30:	00000097          	auipc	ra,0x0
    80001d34:	800080e7          	jalr	-2048(ra) # 80001530 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001d38:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80001d3c:	00003517          	auipc	a0,0x3
    80001d40:	37c50513          	addi	a0,a0,892 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	ab4080e7          	jalr	-1356(ra) # 800017f8 <_Z11printStringPKc>
    80001d4c:	00000613          	li	a2,0
    80001d50:	00a00593          	li	a1,10
    80001d54:	0009051b          	sext.w	a0,s2
    80001d58:	00000097          	auipc	ra,0x0
    80001d5c:	c38080e7          	jalr	-968(ra) # 80001990 <_Z8printIntiii>
    80001d60:	00003517          	auipc	a0,0x3
    80001d64:	51850513          	addi	a0,a0,1304 # 80005278 <CONSOLE_STATUS+0x268>
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	a90080e7          	jalr	-1392(ra) # 800017f8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001d70:	00c00513          	li	a0,12
    80001d74:	00000097          	auipc	ra,0x0
    80001d78:	d30080e7          	jalr	-720(ra) # 80001aa4 <_Z9fibonaccim>
    80001d7c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80001d80:	00003517          	auipc	a0,0x3
    80001d84:	34050513          	addi	a0,a0,832 # 800050c0 <CONSOLE_STATUS+0xb0>
    80001d88:	00000097          	auipc	ra,0x0
    80001d8c:	a70080e7          	jalr	-1424(ra) # 800017f8 <_Z11printStringPKc>
    80001d90:	00000613          	li	a2,0
    80001d94:	00a00593          	li	a1,10
    80001d98:	0009051b          	sext.w	a0,s2
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	bf4080e7          	jalr	-1036(ra) # 80001990 <_Z8printIntiii>
    80001da4:	00003517          	auipc	a0,0x3
    80001da8:	4d450513          	addi	a0,a0,1236 # 80005278 <CONSOLE_STATUS+0x268>
    80001dac:	00000097          	auipc	ra,0x0
    80001db0:	a4c080e7          	jalr	-1460(ra) # 800017f8 <_Z11printStringPKc>
    80001db4:	0400006f          	j	80001df4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001db8:	00003517          	auipc	a0,0x3
    80001dbc:	2e850513          	addi	a0,a0,744 # 800050a0 <CONSOLE_STATUS+0x90>
    80001dc0:	00000097          	auipc	ra,0x0
    80001dc4:	a38080e7          	jalr	-1480(ra) # 800017f8 <_Z11printStringPKc>
    80001dc8:	00000613          	li	a2,0
    80001dcc:	00a00593          	li	a1,10
    80001dd0:	00048513          	mv	a0,s1
    80001dd4:	00000097          	auipc	ra,0x0
    80001dd8:	bbc080e7          	jalr	-1092(ra) # 80001990 <_Z8printIntiii>
    80001ddc:	00003517          	auipc	a0,0x3
    80001de0:	49c50513          	addi	a0,a0,1180 # 80005278 <CONSOLE_STATUS+0x268>
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	a14080e7          	jalr	-1516(ra) # 800017f8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80001dec:	0014849b          	addiw	s1,s1,1
    80001df0:	0ff4f493          	andi	s1,s1,255
    80001df4:	00500793          	li	a5,5
    80001df8:	fc97f0e3          	bgeu	a5,s1,80001db8 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80001dfc:	00003517          	auipc	a0,0x3
    80001e00:	27c50513          	addi	a0,a0,636 # 80005078 <CONSOLE_STATUS+0x68>
    80001e04:	00000097          	auipc	ra,0x0
    80001e08:	9f4080e7          	jalr	-1548(ra) # 800017f8 <_Z11printStringPKc>
    finishedC = true;
    80001e0c:	00100793          	li	a5,1
    80001e10:	00004717          	auipc	a4,0x4
    80001e14:	20f70523          	sb	a5,522(a4) # 8000601a <finishedC>
    thread_dispatch();
    80001e18:	fffff097          	auipc	ra,0xfffff
    80001e1c:	718080e7          	jalr	1816(ra) # 80001530 <_Z15thread_dispatchv>
}
    80001e20:	01813083          	ld	ra,24(sp)
    80001e24:	01013403          	ld	s0,16(sp)
    80001e28:	00813483          	ld	s1,8(sp)
    80001e2c:	00013903          	ld	s2,0(sp)
    80001e30:	02010113          	addi	sp,sp,32
    80001e34:	00008067          	ret

0000000080001e38 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80001e38:	fe010113          	addi	sp,sp,-32
    80001e3c:	00113c23          	sd	ra,24(sp)
    80001e40:	00813823          	sd	s0,16(sp)
    80001e44:	00913423          	sd	s1,8(sp)
    80001e48:	01213023          	sd	s2,0(sp)
    80001e4c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001e50:	00a00493          	li	s1,10
    80001e54:	0400006f          	j	80001e94 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80001e58:	00003517          	auipc	a0,0x3
    80001e5c:	27850513          	addi	a0,a0,632 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001e60:	00000097          	auipc	ra,0x0
    80001e64:	998080e7          	jalr	-1640(ra) # 800017f8 <_Z11printStringPKc>
    80001e68:	00000613          	li	a2,0
    80001e6c:	00a00593          	li	a1,10
    80001e70:	00048513          	mv	a0,s1
    80001e74:	00000097          	auipc	ra,0x0
    80001e78:	b1c080e7          	jalr	-1252(ra) # 80001990 <_Z8printIntiii>
    80001e7c:	00003517          	auipc	a0,0x3
    80001e80:	3fc50513          	addi	a0,a0,1020 # 80005278 <CONSOLE_STATUS+0x268>
    80001e84:	00000097          	auipc	ra,0x0
    80001e88:	974080e7          	jalr	-1676(ra) # 800017f8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80001e8c:	0014849b          	addiw	s1,s1,1
    80001e90:	0ff4f493          	andi	s1,s1,255
    80001e94:	00c00793          	li	a5,12
    80001e98:	fc97f0e3          	bgeu	a5,s1,80001e58 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80001e9c:	00003517          	auipc	a0,0x3
    80001ea0:	23c50513          	addi	a0,a0,572 # 800050d8 <CONSOLE_STATUS+0xc8>
    80001ea4:	00000097          	auipc	ra,0x0
    80001ea8:	954080e7          	jalr	-1708(ra) # 800017f8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001eac:	00500313          	li	t1,5
    thread_dispatch();
    80001eb0:	fffff097          	auipc	ra,0xfffff
    80001eb4:	680080e7          	jalr	1664(ra) # 80001530 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80001eb8:	01000513          	li	a0,16
    80001ebc:	00000097          	auipc	ra,0x0
    80001ec0:	be8080e7          	jalr	-1048(ra) # 80001aa4 <_Z9fibonaccim>
    80001ec4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80001ec8:	00003517          	auipc	a0,0x3
    80001ecc:	22050513          	addi	a0,a0,544 # 800050e8 <CONSOLE_STATUS+0xd8>
    80001ed0:	00000097          	auipc	ra,0x0
    80001ed4:	928080e7          	jalr	-1752(ra) # 800017f8 <_Z11printStringPKc>
    80001ed8:	00000613          	li	a2,0
    80001edc:	00a00593          	li	a1,10
    80001ee0:	0009051b          	sext.w	a0,s2
    80001ee4:	00000097          	auipc	ra,0x0
    80001ee8:	aac080e7          	jalr	-1364(ra) # 80001990 <_Z8printIntiii>
    80001eec:	00003517          	auipc	a0,0x3
    80001ef0:	38c50513          	addi	a0,a0,908 # 80005278 <CONSOLE_STATUS+0x268>
    80001ef4:	00000097          	auipc	ra,0x0
    80001ef8:	904080e7          	jalr	-1788(ra) # 800017f8 <_Z11printStringPKc>
    80001efc:	0400006f          	j	80001f3c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80001f00:	00003517          	auipc	a0,0x3
    80001f04:	1d050513          	addi	a0,a0,464 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001f08:	00000097          	auipc	ra,0x0
    80001f0c:	8f0080e7          	jalr	-1808(ra) # 800017f8 <_Z11printStringPKc>
    80001f10:	00000613          	li	a2,0
    80001f14:	00a00593          	li	a1,10
    80001f18:	00048513          	mv	a0,s1
    80001f1c:	00000097          	auipc	ra,0x0
    80001f20:	a74080e7          	jalr	-1420(ra) # 80001990 <_Z8printIntiii>
    80001f24:	00003517          	auipc	a0,0x3
    80001f28:	35450513          	addi	a0,a0,852 # 80005278 <CONSOLE_STATUS+0x268>
    80001f2c:	00000097          	auipc	ra,0x0
    80001f30:	8cc080e7          	jalr	-1844(ra) # 800017f8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80001f34:	0014849b          	addiw	s1,s1,1
    80001f38:	0ff4f493          	andi	s1,s1,255
    80001f3c:	00f00793          	li	a5,15
    80001f40:	fc97f0e3          	bgeu	a5,s1,80001f00 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80001f44:	00003517          	auipc	a0,0x3
    80001f48:	1b450513          	addi	a0,a0,436 # 800050f8 <CONSOLE_STATUS+0xe8>
    80001f4c:	00000097          	auipc	ra,0x0
    80001f50:	8ac080e7          	jalr	-1876(ra) # 800017f8 <_Z11printStringPKc>
    finishedD = true;
    80001f54:	00100793          	li	a5,1
    80001f58:	00004717          	auipc	a4,0x4
    80001f5c:	0cf701a3          	sb	a5,195(a4) # 8000601b <finishedD>
    thread_dispatch();
    80001f60:	fffff097          	auipc	ra,0xfffff
    80001f64:	5d0080e7          	jalr	1488(ra) # 80001530 <_Z15thread_dispatchv>
}
    80001f68:	01813083          	ld	ra,24(sp)
    80001f6c:	01013403          	ld	s0,16(sp)
    80001f70:	00813483          	ld	s1,8(sp)
    80001f74:	00013903          	ld	s2,0(sp)
    80001f78:	02010113          	addi	sp,sp,32
    80001f7c:	00008067          	ret

0000000080001f80 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80001f80:	fc010113          	addi	sp,sp,-64
    80001f84:	02113c23          	sd	ra,56(sp)
    80001f88:	02813823          	sd	s0,48(sp)
    80001f8c:	02913423          	sd	s1,40(sp)
    80001f90:	03213023          	sd	s2,32(sp)
    80001f94:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80001f98:	01000513          	li	a0,16
    80001f9c:	00000097          	auipc	ra,0x0
    80001fa0:	750080e7          	jalr	1872(ra) # 800026ec <_Znwm>
    80001fa4:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80001fa8:	00001097          	auipc	ra,0x1
    80001fac:	8bc080e7          	jalr	-1860(ra) # 80002864 <_ZN6ThreadC1Ev>
    80001fb0:	00004797          	auipc	a5,0x4
    80001fb4:	ef878793          	addi	a5,a5,-264 # 80005ea8 <_ZTV7WorkerA+0x10>
    80001fb8:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80001fbc:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80001fc0:	00003517          	auipc	a0,0x3
    80001fc4:	14850513          	addi	a0,a0,328 # 80005108 <CONSOLE_STATUS+0xf8>
    80001fc8:	00000097          	auipc	ra,0x0
    80001fcc:	830080e7          	jalr	-2000(ra) # 800017f8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80001fd0:	01000513          	li	a0,16
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	718080e7          	jalr	1816(ra) # 800026ec <_Znwm>
    80001fdc:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80001fe0:	00001097          	auipc	ra,0x1
    80001fe4:	884080e7          	jalr	-1916(ra) # 80002864 <_ZN6ThreadC1Ev>
    80001fe8:	00004797          	auipc	a5,0x4
    80001fec:	ee878793          	addi	a5,a5,-280 # 80005ed0 <_ZTV7WorkerB+0x10>
    80001ff0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80001ff4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80001ff8:	00003517          	auipc	a0,0x3
    80001ffc:	12850513          	addi	a0,a0,296 # 80005120 <CONSOLE_STATUS+0x110>
    80002000:	fffff097          	auipc	ra,0xfffff
    80002004:	7f8080e7          	jalr	2040(ra) # 800017f8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80002008:	01000513          	li	a0,16
    8000200c:	00000097          	auipc	ra,0x0
    80002010:	6e0080e7          	jalr	1760(ra) # 800026ec <_Znwm>
    80002014:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80002018:	00001097          	auipc	ra,0x1
    8000201c:	84c080e7          	jalr	-1972(ra) # 80002864 <_ZN6ThreadC1Ev>
    80002020:	00004797          	auipc	a5,0x4
    80002024:	ed878793          	addi	a5,a5,-296 # 80005ef8 <_ZTV7WorkerC+0x10>
    80002028:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000202c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80002030:	00003517          	auipc	a0,0x3
    80002034:	10850513          	addi	a0,a0,264 # 80005138 <CONSOLE_STATUS+0x128>
    80002038:	fffff097          	auipc	ra,0xfffff
    8000203c:	7c0080e7          	jalr	1984(ra) # 800017f8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80002040:	01000513          	li	a0,16
    80002044:	00000097          	auipc	ra,0x0
    80002048:	6a8080e7          	jalr	1704(ra) # 800026ec <_Znwm>
    8000204c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80002050:	00001097          	auipc	ra,0x1
    80002054:	814080e7          	jalr	-2028(ra) # 80002864 <_ZN6ThreadC1Ev>
    80002058:	00004797          	auipc	a5,0x4
    8000205c:	ec878793          	addi	a5,a5,-312 # 80005f20 <_ZTV7WorkerD+0x10>
    80002060:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80002064:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80002068:	00003517          	auipc	a0,0x3
    8000206c:	0e850513          	addi	a0,a0,232 # 80005150 <CONSOLE_STATUS+0x140>
    80002070:	fffff097          	auipc	ra,0xfffff
    80002074:	788080e7          	jalr	1928(ra) # 800017f8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80002078:	00000493          	li	s1,0
    8000207c:	00300793          	li	a5,3
    80002080:	0297c663          	blt	a5,s1,800020ac <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80002084:	00349793          	slli	a5,s1,0x3
    80002088:	fe040713          	addi	a4,s0,-32
    8000208c:	00f707b3          	add	a5,a4,a5
    80002090:	fe07b503          	ld	a0,-32(a5)
    80002094:	00000097          	auipc	ra,0x0
    80002098:	770080e7          	jalr	1904(ra) # 80002804 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000209c:	0014849b          	addiw	s1,s1,1
    800020a0:	fddff06f          	j	8000207c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800020a4:	00000097          	auipc	ra,0x0
    800020a8:	77c080e7          	jalr	1916(ra) # 80002820 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800020ac:	00004797          	auipc	a5,0x4
    800020b0:	f6c7c783          	lbu	a5,-148(a5) # 80006018 <finishedA>
    800020b4:	fe0788e3          	beqz	a5,800020a4 <_Z20Threads_CPP_API_testv+0x124>
    800020b8:	00004797          	auipc	a5,0x4
    800020bc:	f617c783          	lbu	a5,-159(a5) # 80006019 <finishedB>
    800020c0:	fe0782e3          	beqz	a5,800020a4 <_Z20Threads_CPP_API_testv+0x124>
    800020c4:	00004797          	auipc	a5,0x4
    800020c8:	f567c783          	lbu	a5,-170(a5) # 8000601a <finishedC>
    800020cc:	fc078ce3          	beqz	a5,800020a4 <_Z20Threads_CPP_API_testv+0x124>
    800020d0:	00004797          	auipc	a5,0x4
    800020d4:	f4b7c783          	lbu	a5,-181(a5) # 8000601b <finishedD>
    800020d8:	fc0786e3          	beqz	a5,800020a4 <_Z20Threads_CPP_API_testv+0x124>
    }

    for (auto thread: threads) { delete thread; }
    800020dc:	fc040493          	addi	s1,s0,-64
    800020e0:	0080006f          	j	800020e8 <_Z20Threads_CPP_API_testv+0x168>
    800020e4:	00848493          	addi	s1,s1,8
    800020e8:	fe040793          	addi	a5,s0,-32
    800020ec:	08f48663          	beq	s1,a5,80002178 <_Z20Threads_CPP_API_testv+0x1f8>
    800020f0:	0004b503          	ld	a0,0(s1)
    800020f4:	fe0508e3          	beqz	a0,800020e4 <_Z20Threads_CPP_API_testv+0x164>
    800020f8:	00053783          	ld	a5,0(a0)
    800020fc:	0087b783          	ld	a5,8(a5)
    80002100:	000780e7          	jalr	a5
    80002104:	fe1ff06f          	j	800020e4 <_Z20Threads_CPP_API_testv+0x164>
    80002108:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000210c:	00048513          	mv	a0,s1
    80002110:	00000097          	auipc	ra,0x0
    80002114:	62c080e7          	jalr	1580(ra) # 8000273c <_ZdlPv>
    80002118:	00090513          	mv	a0,s2
    8000211c:	00005097          	auipc	ra,0x5
    80002120:	ffc080e7          	jalr	-4(ra) # 80007118 <_Unwind_Resume>
    80002124:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80002128:	00048513          	mv	a0,s1
    8000212c:	00000097          	auipc	ra,0x0
    80002130:	610080e7          	jalr	1552(ra) # 8000273c <_ZdlPv>
    80002134:	00090513          	mv	a0,s2
    80002138:	00005097          	auipc	ra,0x5
    8000213c:	fe0080e7          	jalr	-32(ra) # 80007118 <_Unwind_Resume>
    80002140:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80002144:	00048513          	mv	a0,s1
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	5f4080e7          	jalr	1524(ra) # 8000273c <_ZdlPv>
    80002150:	00090513          	mv	a0,s2
    80002154:	00005097          	auipc	ra,0x5
    80002158:	fc4080e7          	jalr	-60(ra) # 80007118 <_Unwind_Resume>
    8000215c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80002160:	00048513          	mv	a0,s1
    80002164:	00000097          	auipc	ra,0x0
    80002168:	5d8080e7          	jalr	1496(ra) # 8000273c <_ZdlPv>
    8000216c:	00090513          	mv	a0,s2
    80002170:	00005097          	auipc	ra,0x5
    80002174:	fa8080e7          	jalr	-88(ra) # 80007118 <_Unwind_Resume>
}
    80002178:	03813083          	ld	ra,56(sp)
    8000217c:	03013403          	ld	s0,48(sp)
    80002180:	02813483          	ld	s1,40(sp)
    80002184:	02013903          	ld	s2,32(sp)
    80002188:	04010113          	addi	sp,sp,64
    8000218c:	00008067          	ret

0000000080002190 <_Z8userMainPv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain(void *) {
    80002190:	ff010113          	addi	sp,sp,-16
    80002194:	00113423          	sd	ra,8(sp)
    80002198:	00813023          	sd	s0,0(sp)
    8000219c:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	de0080e7          	jalr	-544(ra) # 80001f80 <_Z20Threads_CPP_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
//    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

}
    800021a8:	00813083          	ld	ra,8(sp)
    800021ac:	00013403          	ld	s0,0(sp)
    800021b0:	01010113          	addi	sp,sp,16
    800021b4:	00008067          	ret

00000000800021b8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800021b8:	ff010113          	addi	sp,sp,-16
    800021bc:	00113423          	sd	ra,8(sp)
    800021c0:	00813023          	sd	s0,0(sp)
    800021c4:	01010413          	addi	s0,sp,16
    800021c8:	00004797          	auipc	a5,0x4
    800021cc:	ce078793          	addi	a5,a5,-800 # 80005ea8 <_ZTV7WorkerA+0x10>
    800021d0:	00f53023          	sd	a5,0(a0)
    800021d4:	00000097          	auipc	ra,0x0
    800021d8:	4e4080e7          	jalr	1252(ra) # 800026b8 <_ZN6ThreadD1Ev>
    800021dc:	00813083          	ld	ra,8(sp)
    800021e0:	00013403          	ld	s0,0(sp)
    800021e4:	01010113          	addi	sp,sp,16
    800021e8:	00008067          	ret

00000000800021ec <_ZN7WorkerAD0Ev>:
    800021ec:	fe010113          	addi	sp,sp,-32
    800021f0:	00113c23          	sd	ra,24(sp)
    800021f4:	00813823          	sd	s0,16(sp)
    800021f8:	00913423          	sd	s1,8(sp)
    800021fc:	02010413          	addi	s0,sp,32
    80002200:	00050493          	mv	s1,a0
    80002204:	00004797          	auipc	a5,0x4
    80002208:	ca478793          	addi	a5,a5,-860 # 80005ea8 <_ZTV7WorkerA+0x10>
    8000220c:	00f53023          	sd	a5,0(a0)
    80002210:	00000097          	auipc	ra,0x0
    80002214:	4a8080e7          	jalr	1192(ra) # 800026b8 <_ZN6ThreadD1Ev>
    80002218:	00048513          	mv	a0,s1
    8000221c:	00000097          	auipc	ra,0x0
    80002220:	520080e7          	jalr	1312(ra) # 8000273c <_ZdlPv>
    80002224:	01813083          	ld	ra,24(sp)
    80002228:	01013403          	ld	s0,16(sp)
    8000222c:	00813483          	ld	s1,8(sp)
    80002230:	02010113          	addi	sp,sp,32
    80002234:	00008067          	ret

0000000080002238 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80002238:	ff010113          	addi	sp,sp,-16
    8000223c:	00113423          	sd	ra,8(sp)
    80002240:	00813023          	sd	s0,0(sp)
    80002244:	01010413          	addi	s0,sp,16
    80002248:	00004797          	auipc	a5,0x4
    8000224c:	c8878793          	addi	a5,a5,-888 # 80005ed0 <_ZTV7WorkerB+0x10>
    80002250:	00f53023          	sd	a5,0(a0)
    80002254:	00000097          	auipc	ra,0x0
    80002258:	464080e7          	jalr	1124(ra) # 800026b8 <_ZN6ThreadD1Ev>
    8000225c:	00813083          	ld	ra,8(sp)
    80002260:	00013403          	ld	s0,0(sp)
    80002264:	01010113          	addi	sp,sp,16
    80002268:	00008067          	ret

000000008000226c <_ZN7WorkerBD0Ev>:
    8000226c:	fe010113          	addi	sp,sp,-32
    80002270:	00113c23          	sd	ra,24(sp)
    80002274:	00813823          	sd	s0,16(sp)
    80002278:	00913423          	sd	s1,8(sp)
    8000227c:	02010413          	addi	s0,sp,32
    80002280:	00050493          	mv	s1,a0
    80002284:	00004797          	auipc	a5,0x4
    80002288:	c4c78793          	addi	a5,a5,-948 # 80005ed0 <_ZTV7WorkerB+0x10>
    8000228c:	00f53023          	sd	a5,0(a0)
    80002290:	00000097          	auipc	ra,0x0
    80002294:	428080e7          	jalr	1064(ra) # 800026b8 <_ZN6ThreadD1Ev>
    80002298:	00048513          	mv	a0,s1
    8000229c:	00000097          	auipc	ra,0x0
    800022a0:	4a0080e7          	jalr	1184(ra) # 8000273c <_ZdlPv>
    800022a4:	01813083          	ld	ra,24(sp)
    800022a8:	01013403          	ld	s0,16(sp)
    800022ac:	00813483          	ld	s1,8(sp)
    800022b0:	02010113          	addi	sp,sp,32
    800022b4:	00008067          	ret

00000000800022b8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800022b8:	ff010113          	addi	sp,sp,-16
    800022bc:	00113423          	sd	ra,8(sp)
    800022c0:	00813023          	sd	s0,0(sp)
    800022c4:	01010413          	addi	s0,sp,16
    800022c8:	00004797          	auipc	a5,0x4
    800022cc:	c3078793          	addi	a5,a5,-976 # 80005ef8 <_ZTV7WorkerC+0x10>
    800022d0:	00f53023          	sd	a5,0(a0)
    800022d4:	00000097          	auipc	ra,0x0
    800022d8:	3e4080e7          	jalr	996(ra) # 800026b8 <_ZN6ThreadD1Ev>
    800022dc:	00813083          	ld	ra,8(sp)
    800022e0:	00013403          	ld	s0,0(sp)
    800022e4:	01010113          	addi	sp,sp,16
    800022e8:	00008067          	ret

00000000800022ec <_ZN7WorkerCD0Ev>:
    800022ec:	fe010113          	addi	sp,sp,-32
    800022f0:	00113c23          	sd	ra,24(sp)
    800022f4:	00813823          	sd	s0,16(sp)
    800022f8:	00913423          	sd	s1,8(sp)
    800022fc:	02010413          	addi	s0,sp,32
    80002300:	00050493          	mv	s1,a0
    80002304:	00004797          	auipc	a5,0x4
    80002308:	bf478793          	addi	a5,a5,-1036 # 80005ef8 <_ZTV7WorkerC+0x10>
    8000230c:	00f53023          	sd	a5,0(a0)
    80002310:	00000097          	auipc	ra,0x0
    80002314:	3a8080e7          	jalr	936(ra) # 800026b8 <_ZN6ThreadD1Ev>
    80002318:	00048513          	mv	a0,s1
    8000231c:	00000097          	auipc	ra,0x0
    80002320:	420080e7          	jalr	1056(ra) # 8000273c <_ZdlPv>
    80002324:	01813083          	ld	ra,24(sp)
    80002328:	01013403          	ld	s0,16(sp)
    8000232c:	00813483          	ld	s1,8(sp)
    80002330:	02010113          	addi	sp,sp,32
    80002334:	00008067          	ret

0000000080002338 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80002338:	ff010113          	addi	sp,sp,-16
    8000233c:	00113423          	sd	ra,8(sp)
    80002340:	00813023          	sd	s0,0(sp)
    80002344:	01010413          	addi	s0,sp,16
    80002348:	00004797          	auipc	a5,0x4
    8000234c:	bd878793          	addi	a5,a5,-1064 # 80005f20 <_ZTV7WorkerD+0x10>
    80002350:	00f53023          	sd	a5,0(a0)
    80002354:	00000097          	auipc	ra,0x0
    80002358:	364080e7          	jalr	868(ra) # 800026b8 <_ZN6ThreadD1Ev>
    8000235c:	00813083          	ld	ra,8(sp)
    80002360:	00013403          	ld	s0,0(sp)
    80002364:	01010113          	addi	sp,sp,16
    80002368:	00008067          	ret

000000008000236c <_ZN7WorkerDD0Ev>:
    8000236c:	fe010113          	addi	sp,sp,-32
    80002370:	00113c23          	sd	ra,24(sp)
    80002374:	00813823          	sd	s0,16(sp)
    80002378:	00913423          	sd	s1,8(sp)
    8000237c:	02010413          	addi	s0,sp,32
    80002380:	00050493          	mv	s1,a0
    80002384:	00004797          	auipc	a5,0x4
    80002388:	b9c78793          	addi	a5,a5,-1124 # 80005f20 <_ZTV7WorkerD+0x10>
    8000238c:	00f53023          	sd	a5,0(a0)
    80002390:	00000097          	auipc	ra,0x0
    80002394:	328080e7          	jalr	808(ra) # 800026b8 <_ZN6ThreadD1Ev>
    80002398:	00048513          	mv	a0,s1
    8000239c:	00000097          	auipc	ra,0x0
    800023a0:	3a0080e7          	jalr	928(ra) # 8000273c <_ZdlPv>
    800023a4:	01813083          	ld	ra,24(sp)
    800023a8:	01013403          	ld	s0,16(sp)
    800023ac:	00813483          	ld	s1,8(sp)
    800023b0:	02010113          	addi	sp,sp,32
    800023b4:	00008067          	ret

00000000800023b8 <_ZN7WorkerA3runEv>:
    void run() override {
    800023b8:	ff010113          	addi	sp,sp,-16
    800023bc:	00113423          	sd	ra,8(sp)
    800023c0:	00813023          	sd	s0,0(sp)
    800023c4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800023c8:	00000593          	li	a1,0
    800023cc:	fffff097          	auipc	ra,0xfffff
    800023d0:	74c080e7          	jalr	1868(ra) # 80001b18 <_ZN7WorkerA11workerBodyAEPv>
    }
    800023d4:	00813083          	ld	ra,8(sp)
    800023d8:	00013403          	ld	s0,0(sp)
    800023dc:	01010113          	addi	sp,sp,16
    800023e0:	00008067          	ret

00000000800023e4 <_ZN7WorkerB3runEv>:
    void run() override {
    800023e4:	ff010113          	addi	sp,sp,-16
    800023e8:	00113423          	sd	ra,8(sp)
    800023ec:	00813023          	sd	s0,0(sp)
    800023f0:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800023f4:	00000593          	li	a1,0
    800023f8:	fffff097          	auipc	ra,0xfffff
    800023fc:	7ec080e7          	jalr	2028(ra) # 80001be4 <_ZN7WorkerB11workerBodyBEPv>
    }
    80002400:	00813083          	ld	ra,8(sp)
    80002404:	00013403          	ld	s0,0(sp)
    80002408:	01010113          	addi	sp,sp,16
    8000240c:	00008067          	ret

0000000080002410 <_ZN7WorkerC3runEv>:
    void run() override {
    80002410:	ff010113          	addi	sp,sp,-16
    80002414:	00113423          	sd	ra,8(sp)
    80002418:	00813023          	sd	s0,0(sp)
    8000241c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80002420:	00000593          	li	a1,0
    80002424:	00000097          	auipc	ra,0x0
    80002428:	894080e7          	jalr	-1900(ra) # 80001cb8 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000242c:	00813083          	ld	ra,8(sp)
    80002430:	00013403          	ld	s0,0(sp)
    80002434:	01010113          	addi	sp,sp,16
    80002438:	00008067          	ret

000000008000243c <_ZN7WorkerD3runEv>:
    void run() override {
    8000243c:	ff010113          	addi	sp,sp,-16
    80002440:	00113423          	sd	ra,8(sp)
    80002444:	00813023          	sd	s0,0(sp)
    80002448:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000244c:	00000593          	li	a1,0
    80002450:	00000097          	auipc	ra,0x0
    80002454:	9e8080e7          	jalr	-1560(ra) # 80001e38 <_ZN7WorkerD11workerBodyDEPv>
    }
    80002458:	00813083          	ld	ra,8(sp)
    8000245c:	00013403          	ld	s0,0(sp)
    80002460:	01010113          	addi	sp,sp,16
    80002464:	00008067          	ret

0000000080002468 <_ZN9Scheduler3getEv>:

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

_thread *Scheduler::get()
{
    80002468:	fe010113          	addi	sp,sp,-32
    8000246c:	00113c23          	sd	ra,24(sp)
    80002470:	00813823          	sd	s0,16(sp)
    80002474:	00913423          	sd	s1,8(sp)
    80002478:	02010413          	addi	s0,sp,32
    if (!head) return nullptr;
    8000247c:	00004517          	auipc	a0,0x4
    80002480:	ba453503          	ld	a0,-1116(a0) # 80006020 <_ZN9Scheduler4headE>
    80002484:	04050263          	beqz	a0,800024c8 <_ZN9Scheduler3getEv+0x60>

    Elem* elem = head;
    head = head->next;
    80002488:	01053783          	ld	a5,16(a0)
    8000248c:	00004717          	auipc	a4,0x4
    80002490:	b8f73a23          	sd	a5,-1132(a4) # 80006020 <_ZN9Scheduler4headE>
    if (!head) tail = 0;
    80002494:	02078463          	beqz	a5,800024bc <_ZN9Scheduler3getEv+0x54>

    _thread *ret = elem->data;
    80002498:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    8000249c:	00000097          	auipc	ra,0x0
    800024a0:	630080e7          	jalr	1584(ra) # 80002acc <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    800024a4:	00048513          	mv	a0,s1
    800024a8:	01813083          	ld	ra,24(sp)
    800024ac:	01013403          	ld	s0,16(sp)
    800024b0:	00813483          	ld	s1,8(sp)
    800024b4:	02010113          	addi	sp,sp,32
    800024b8:	00008067          	ret
    if (!head) tail = 0;
    800024bc:	00004797          	auipc	a5,0x4
    800024c0:	b607b623          	sd	zero,-1172(a5) # 80006028 <_ZN9Scheduler4tailE>
    800024c4:	fd5ff06f          	j	80002498 <_ZN9Scheduler3getEv+0x30>
    if (!head) return nullptr;
    800024c8:	00050493          	mv	s1,a0
    800024cc:	fd9ff06f          	j	800024a4 <_ZN9Scheduler3getEv+0x3c>

00000000800024d0 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(_thread *ccb)
{
    800024d0:	fe010113          	addi	sp,sp,-32
    800024d4:	00113c23          	sd	ra,24(sp)
    800024d8:	00813823          	sd	s0,16(sp)
    800024dc:	00913423          	sd	s1,8(sp)
    800024e0:	02010413          	addi	s0,sp,32
    800024e4:	00050493          	mv	s1,a0
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800024e8:	00100513          	li	a0,1
    800024ec:	00000097          	auipc	ra,0x0
    800024f0:	420080e7          	jalr	1056(ra) # 8000290c <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = ccb;
    800024f4:	00953023          	sd	s1,0(a0)
    elem->next = nullptr;
    800024f8:	00053823          	sd	zero,16(a0)
    if(tail){
    800024fc:	00004797          	auipc	a5,0x4
    80002500:	b2c7b783          	ld	a5,-1236(a5) # 80006028 <_ZN9Scheduler4tailE>
    80002504:	02078263          	beqz	a5,80002528 <_ZN9Scheduler3putEP7_thread+0x58>
        tail->next = elem;
    80002508:	00a7b823          	sd	a0,16(a5)
        tail = elem;
    8000250c:	00004797          	auipc	a5,0x4
    80002510:	b0a7be23          	sd	a0,-1252(a5) # 80006028 <_ZN9Scheduler4tailE>
    }else{
        head = tail = elem;
    }
    80002514:	01813083          	ld	ra,24(sp)
    80002518:	01013403          	ld	s0,16(sp)
    8000251c:	00813483          	ld	s1,8(sp)
    80002520:	02010113          	addi	sp,sp,32
    80002524:	00008067          	ret
        head = tail = elem;
    80002528:	00004797          	auipc	a5,0x4
    8000252c:	af878793          	addi	a5,a5,-1288 # 80006020 <_ZN9Scheduler4headE>
    80002530:	00a7b423          	sd	a0,8(a5)
    80002534:	00a7b023          	sd	a0,0(a5)
    80002538:	fddff06f          	j	80002514 <_ZN9Scheduler3putEP7_thread+0x44>

000000008000253c <_Z12checkNullptrPv>:
//}
//extern "C" void supervisorTrap();

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
    8000253c:	00050e63          	beqz	a0,80002558 <_Z12checkNullptrPv+0x1c>
        __putc('?');
        __putc('0' + x);
    }
    x++;
    80002540:	00004717          	auipc	a4,0x4
    80002544:	af070713          	addi	a4,a4,-1296 # 80006030 <_ZZ12checkNullptrPvE1x>
    80002548:	00072783          	lw	a5,0(a4)
    8000254c:	0017879b          	addiw	a5,a5,1
    80002550:	00f72023          	sw	a5,0(a4)
    80002554:	00008067          	ret
void checkNullptr(void* p) {
    80002558:	ff010113          	addi	sp,sp,-16
    8000255c:	00113423          	sd	ra,8(sp)
    80002560:	00813023          	sd	s0,0(sp)
    80002564:	01010413          	addi	s0,sp,16
        __putc('?');
    80002568:	03f00513          	li	a0,63
    8000256c:	00003097          	auipc	ra,0x3
    80002570:	810080e7          	jalr	-2032(ra) # 80004d7c <__putc>
        __putc('0' + x);
    80002574:	00004517          	auipc	a0,0x4
    80002578:	abc52503          	lw	a0,-1348(a0) # 80006030 <_ZZ12checkNullptrPvE1x>
    8000257c:	0305051b          	addiw	a0,a0,48
    80002580:	0ff57513          	andi	a0,a0,255
    80002584:	00002097          	auipc	ra,0x2
    80002588:	7f8080e7          	jalr	2040(ra) # 80004d7c <__putc>
    x++;
    8000258c:	00004717          	auipc	a4,0x4
    80002590:	aa470713          	addi	a4,a4,-1372 # 80006030 <_ZZ12checkNullptrPvE1x>
    80002594:	00072783          	lw	a5,0(a4)
    80002598:	0017879b          	addiw	a5,a5,1
    8000259c:	00f72023          	sw	a5,0(a4)
}
    800025a0:	00813083          	ld	ra,8(sp)
    800025a4:	00013403          	ld	s0,0(sp)
    800025a8:	01010113          	addi	sp,sp,16
    800025ac:	00008067          	ret

00000000800025b0 <_Z11checkStatusi>:

void checkStatus(int status) {
    static int y = 0;
    if(status) {
    800025b0:	00051e63          	bnez	a0,800025cc <_Z11checkStatusi+0x1c>
        __putc('0' + y);
        __putc('?');
    }
    y++;
    800025b4:	00004717          	auipc	a4,0x4
    800025b8:	a7c70713          	addi	a4,a4,-1412 # 80006030 <_ZZ12checkNullptrPvE1x>
    800025bc:	00472783          	lw	a5,4(a4)
    800025c0:	0017879b          	addiw	a5,a5,1
    800025c4:	00f72223          	sw	a5,4(a4)
    800025c8:	00008067          	ret
void checkStatus(int status) {
    800025cc:	ff010113          	addi	sp,sp,-16
    800025d0:	00113423          	sd	ra,8(sp)
    800025d4:	00813023          	sd	s0,0(sp)
    800025d8:	01010413          	addi	s0,sp,16
        __putc('0' + y);
    800025dc:	00004517          	auipc	a0,0x4
    800025e0:	a5852503          	lw	a0,-1448(a0) # 80006034 <_ZZ11checkStatusiE1y>
    800025e4:	0305051b          	addiw	a0,a0,48
    800025e8:	0ff57513          	andi	a0,a0,255
    800025ec:	00002097          	auipc	ra,0x2
    800025f0:	790080e7          	jalr	1936(ra) # 80004d7c <__putc>
        __putc('?');
    800025f4:	03f00513          	li	a0,63
    800025f8:	00002097          	auipc	ra,0x2
    800025fc:	784080e7          	jalr	1924(ra) # 80004d7c <__putc>
    y++;
    80002600:	00004717          	auipc	a4,0x4
    80002604:	a3070713          	addi	a4,a4,-1488 # 80006030 <_ZZ12checkNullptrPvE1x>
    80002608:	00472783          	lw	a5,4(a4)
    8000260c:	0017879b          	addiw	a5,a5,1
    80002610:	00f72223          	sw	a5,4(a4)
}
    80002614:	00813083          	ld	ra,8(sp)
    80002618:	00013403          	ld	s0,0(sp)
    8000261c:	01010113          	addi	sp,sp,16
    80002620:	00008067          	ret

0000000080002624 <main>:
extern "C" void trap();
void userMain(void *);

int main(){
    80002624:	fe010113          	addi	sp,sp,-32
    80002628:	00113c23          	sd	ra,24(sp)
    8000262c:	00813823          	sd	s0,16(sp)
    80002630:	02010413          	addi	s0,sp,32

    MemoryAllocator::getInstance();
    80002634:	00000097          	auipc	ra,0x0
    80002638:	418080e7          	jalr	1048(ra) # 80002a4c <_ZN15MemoryAllocator11getInstanceEv>
    __putc('c');
    8000263c:	06300513          	li	a0,99
    80002640:	00002097          	auipc	ra,0x2
    80002644:	73c080e7          	jalr	1852(ra) # 80004d7c <__putc>
    thread_t thr[2];
    thread_create(&thr[0], nullptr, nullptr);
    80002648:	00000613          	li	a2,0
    8000264c:	00000593          	li	a1,0
    80002650:	fe040513          	addi	a0,s0,-32
    80002654:	fffff097          	auipc	ra,0xfffff
    80002658:	e2c080e7          	jalr	-468(ra) # 80001480 <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&thr[1], userMain, nullptr);
    8000265c:	00000613          	li	a2,0
    80002660:	00004597          	auipc	a1,0x4
    80002664:	9305b583          	ld	a1,-1744(a1) # 80005f90 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002668:	fe840513          	addi	a0,s0,-24
    8000266c:	fffff097          	auipc	ra,0xfffff
    80002670:	e14080e7          	jalr	-492(ra) # 80001480 <_Z13thread_createPP7_threadPFvPvES2_>

    //Riscv::w_stvec((uint64) &trap);
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    _thread::running = thr[0];
    80002674:	fe043703          	ld	a4,-32(s0)
    80002678:	00004797          	auipc	a5,0x4
    8000267c:	9007b783          	ld	a5,-1792(a5) # 80005f78 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002680:	00e7b023          	sd	a4,0(a5)
    _thread::yield();
    80002684:	fffff097          	auipc	ra,0xfffff
    80002688:	0ac080e7          	jalr	172(ra) # 80001730 <_ZN7_thread5yieldEv>
    return 0;
}
    8000268c:	00000513          	li	a0,0
    80002690:	01813083          	ld	ra,24(sp)
    80002694:	01013403          	ld	s0,16(sp)
    80002698:	02010113          	addi	sp,sp,32
    8000269c:	00008067          	ret

00000000800026a0 <_ZN6Thread3runEv>:
    auto fptr = &Thread::run;
    void *a = reinterpret_cast<void *&>(fptr);
    thread_create(&myHandle, &wrapperRun, a);
}

void Thread::run() {
    800026a0:	ff010113          	addi	sp,sp,-16
    800026a4:	00813423          	sd	s0,8(sp)
    800026a8:	01010413          	addi	s0,sp,16

}
    800026ac:	00813403          	ld	s0,8(sp)
    800026b0:	01010113          	addi	sp,sp,16
    800026b4:	00008067          	ret

00000000800026b8 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800026b8:	ff010113          	addi	sp,sp,-16
    800026bc:	00113423          	sd	ra,8(sp)
    800026c0:	00813023          	sd	s0,0(sp)
    800026c4:	01010413          	addi	s0,sp,16
    800026c8:	00004797          	auipc	a5,0x4
    800026cc:	88878793          	addi	a5,a5,-1912 # 80005f50 <_ZTV6Thread+0x10>
    800026d0:	00f53023          	sd	a5,0(a0)
    thread_exit();
    800026d4:	fffff097          	auipc	ra,0xfffff
    800026d8:	d6c080e7          	jalr	-660(ra) # 80001440 <_Z11thread_exitv>
}
    800026dc:	00813083          	ld	ra,8(sp)
    800026e0:	00013403          	ld	s0,0(sp)
    800026e4:	01010113          	addi	sp,sp,16
    800026e8:	00008067          	ret

00000000800026ec <_Znwm>:
void* operator new(size_t size){
    800026ec:	ff010113          	addi	sp,sp,-16
    800026f0:	00113423          	sd	ra,8(sp)
    800026f4:	00813023          	sd	s0,0(sp)
    800026f8:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    800026fc:	fffff097          	auipc	ra,0xfffff
    80002700:	cac080e7          	jalr	-852(ra) # 800013a8 <_Z9mem_allocm>
}
    80002704:	00813083          	ld	ra,8(sp)
    80002708:	00013403          	ld	s0,0(sp)
    8000270c:	01010113          	addi	sp,sp,16
    80002710:	00008067          	ret

0000000080002714 <_Znam>:
void* operator new[](size_t size){
    80002714:	ff010113          	addi	sp,sp,-16
    80002718:	00113423          	sd	ra,8(sp)
    8000271c:	00813023          	sd	s0,0(sp)
    80002720:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    80002724:	fffff097          	auipc	ra,0xfffff
    80002728:	c84080e7          	jalr	-892(ra) # 800013a8 <_Z9mem_allocm>
}
    8000272c:	00813083          	ld	ra,8(sp)
    80002730:	00013403          	ld	s0,0(sp)
    80002734:	01010113          	addi	sp,sp,16
    80002738:	00008067          	ret

000000008000273c <_ZdlPv>:
void operator delete(void * p){
    8000273c:	ff010113          	addi	sp,sp,-16
    80002740:	00113423          	sd	ra,8(sp)
    80002744:	00813023          	sd	s0,0(sp)
    80002748:	01010413          	addi	s0,sp,16
    mem_free(p);
    8000274c:	fffff097          	auipc	ra,0xfffff
    80002750:	cb0080e7          	jalr	-848(ra) # 800013fc <_Z8mem_freePv>
}
    80002754:	00813083          	ld	ra,8(sp)
    80002758:	00013403          	ld	s0,0(sp)
    8000275c:	01010113          	addi	sp,sp,16
    80002760:	00008067          	ret

0000000080002764 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002764:	fe010113          	addi	sp,sp,-32
    80002768:	00113c23          	sd	ra,24(sp)
    8000276c:	00813823          	sd	s0,16(sp)
    80002770:	00913423          	sd	s1,8(sp)
    80002774:	02010413          	addi	s0,sp,32
    80002778:	00050493          	mv	s1,a0
}
    8000277c:	00000097          	auipc	ra,0x0
    80002780:	f3c080e7          	jalr	-196(ra) # 800026b8 <_ZN6ThreadD1Ev>
    80002784:	00048513          	mv	a0,s1
    80002788:	00000097          	auipc	ra,0x0
    8000278c:	fb4080e7          	jalr	-76(ra) # 8000273c <_ZdlPv>
    80002790:	01813083          	ld	ra,24(sp)
    80002794:	01013403          	ld	s0,16(sp)
    80002798:	00813483          	ld	s1,8(sp)
    8000279c:	02010113          	addi	sp,sp,32
    800027a0:	00008067          	ret

00000000800027a4 <_ZdaPv>:
void operator delete[](void * p){
    800027a4:	ff010113          	addi	sp,sp,-16
    800027a8:	00113423          	sd	ra,8(sp)
    800027ac:	00813023          	sd	s0,0(sp)
    800027b0:	01010413          	addi	s0,sp,16
    mem_free(p);
    800027b4:	fffff097          	auipc	ra,0xfffff
    800027b8:	c48080e7          	jalr	-952(ra) # 800013fc <_Z8mem_freePv>
}
    800027bc:	00813083          	ld	ra,8(sp)
    800027c0:	00013403          	ld	s0,0(sp)
    800027c4:	01010113          	addi	sp,sp,16
    800027c8:	00008067          	ret

00000000800027cc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800027cc:	ff010113          	addi	sp,sp,-16
    800027d0:	00113423          	sd	ra,8(sp)
    800027d4:	00813023          	sd	s0,0(sp)
    800027d8:	01010413          	addi	s0,sp,16
    800027dc:	00003797          	auipc	a5,0x3
    800027e0:	77478793          	addi	a5,a5,1908 # 80005f50 <_ZTV6Thread+0x10>
    800027e4:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    800027e8:	00850513          	addi	a0,a0,8
    800027ec:	fffff097          	auipc	ra,0xfffff
    800027f0:	c94080e7          	jalr	-876(ra) # 80001480 <_Z13thread_createPP7_threadPFvPvES2_>
}
    800027f4:	00813083          	ld	ra,8(sp)
    800027f8:	00013403          	ld	s0,0(sp)
    800027fc:	01010113          	addi	sp,sp,16
    80002800:	00008067          	ret

0000000080002804 <_ZN6Thread5startEv>:
int Thread::start() {
    80002804:	ff010113          	addi	sp,sp,-16
    80002808:	00813423          	sd	s0,8(sp)
    8000280c:	01010413          	addi	s0,sp,16
}
    80002810:	00000513          	li	a0,0
    80002814:	00813403          	ld	s0,8(sp)
    80002818:	01010113          	addi	sp,sp,16
    8000281c:	00008067          	ret

0000000080002820 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002820:	ff010113          	addi	sp,sp,-16
    80002824:	00113423          	sd	ra,8(sp)
    80002828:	00813023          	sd	s0,0(sp)
    8000282c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002830:	fffff097          	auipc	ra,0xfffff
    80002834:	d00080e7          	jalr	-768(ra) # 80001530 <_Z15thread_dispatchv>
}
    80002838:	00813083          	ld	ra,8(sp)
    8000283c:	00013403          	ld	s0,0(sp)
    80002840:	01010113          	addi	sp,sp,16
    80002844:	00008067          	ret

0000000080002848 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80002848:	ff010113          	addi	sp,sp,-16
    8000284c:	00813423          	sd	s0,8(sp)
    80002850:	01010413          	addi	s0,sp,16
}
    80002854:	00000513          	li	a0,0
    80002858:	00813403          	ld	s0,8(sp)
    8000285c:	01010113          	addi	sp,sp,16
    80002860:	00008067          	ret

0000000080002864 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002864:	ff010113          	addi	sp,sp,-16
    80002868:	00113423          	sd	ra,8(sp)
    8000286c:	00813023          	sd	s0,0(sp)
    80002870:	01010413          	addi	s0,sp,16
    80002874:	00003797          	auipc	a5,0x3
    80002878:	6dc78793          	addi	a5,a5,1756 # 80005f50 <_ZTV6Thread+0x10>
    8000287c:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, &wrapperRun, a);
    80002880:	01100613          	li	a2,17
    80002884:	00003597          	auipc	a1,0x3
    80002888:	71c5b583          	ld	a1,1820(a1) # 80005fa0 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000288c:	00850513          	addi	a0,a0,8
    80002890:	fffff097          	auipc	ra,0xfffff
    80002894:	bf0080e7          	jalr	-1040(ra) # 80001480 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80002898:	00813083          	ld	ra,8(sp)
    8000289c:	00013403          	ld	s0,0(sp)
    800028a0:	01010113          	addi	sp,sp,16
    800028a4:	00008067          	ret

00000000800028a8 <_ZN5Riscv10popSppSpieEv>:
#include "../h/riscv.h"
//#include "../h/tcb.hpp"
#include "../lib/console.h"

void Riscv::popSppSpie()
{
    800028a8:	ff010113          	addi	sp,sp,-16
    800028ac:	00813423          	sd	s0,8(sp)
    800028b0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800028b4:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    800028b8:	10200073          	sret
}
    800028bc:	00813403          	ld	s0,8(sp)
    800028c0:	01010113          	addi	sp,sp,16
    800028c4:	00008067          	ret

00000000800028c8 <_Z41__static_initialization_and_destruction_0ii>:
            if (cur) cur->next = newSeg;
            else fmem_head = newSeg;
            return 0;
        }
    }
}
    800028c8:	ff010113          	addi	sp,sp,-16
    800028cc:	00813423          	sd	s0,8(sp)
    800028d0:	01010413          	addi	s0,sp,16
    800028d4:	00100793          	li	a5,1
    800028d8:	00f50863          	beq	a0,a5,800028e8 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800028dc:	00813403          	ld	s0,8(sp)
    800028e0:	01010113          	addi	sp,sp,16
    800028e4:	00008067          	ret
    800028e8:	000107b7          	lui	a5,0x10
    800028ec:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800028f0:	fef596e3          	bne	a1,a5,800028dc <_Z41__static_initialization_and_destruction_0ii+0x14>
MemoryAllocator::FreeMem* MemoryAllocator::fmem_head = (MemoryAllocator::FreeMem*)HEAP_START_ADDR; //stavila onako
    800028f4:	00003797          	auipc	a5,0x3
    800028f8:	67c7b783          	ld	a5,1660(a5) # 80005f70 <_GLOBAL_OFFSET_TABLE_+0x8>
    800028fc:	0007b783          	ld	a5,0(a5)
    80002900:	00003717          	auipc	a4,0x3
    80002904:	72f73c23          	sd	a5,1848(a4) # 80006038 <_ZN15MemoryAllocator9fmem_headE>
}
    80002908:	fd5ff06f          	j	800028dc <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000290c <_ZN15MemoryAllocator9mem_allocEm>:
void *MemoryAllocator::mem_alloc(size_t size) {
    8000290c:	ff010113          	addi	sp,sp,-16
    80002910:	00813423          	sd	s0,8(sp)
    80002914:	01010413          	addi	s0,sp,16
    if (size <=0) return nullptr;
    80002918:	12050663          	beqz	a0,80002a44 <_ZN15MemoryAllocator9mem_allocEm+0x138>
    8000291c:	00050793          	mv	a5,a0
    FreeMem* cur = fmem_head;
    80002920:	00003517          	auipc	a0,0x3
    80002924:	71853503          	ld	a0,1816(a0) # 80006038 <_ZN15MemoryAllocator9fmem_headE>
    for(;cur !=0; cur = cur->next){
    80002928:	0e050e63          	beqz	a0,80002a24 <_ZN15MemoryAllocator9mem_allocEm+0x118>
        if(cur->size < (size)*MEM_BLOCK_SIZE) continue;
    8000292c:	01053703          	ld	a4,16(a0)
    80002930:	00679693          	slli	a3,a5,0x6
    80002934:	04d76c63          	bltu	a4,a3,8000298c <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(cur->size - (size)*MEM_BLOCK_SIZE < sizeof(FreeMem)){
    80002938:	40d70733          	sub	a4,a4,a3
    8000293c:	01700793          	li	a5,23
    80002940:	06e7e263          	bltu	a5,a4,800029a4 <_ZN15MemoryAllocator9mem_allocEm+0x98>
            if(cur->prev) cur->prev->next = cur->next;
    80002944:	00853783          	ld	a5,8(a0)
    80002948:	04078663          	beqz	a5,80002994 <_ZN15MemoryAllocator9mem_allocEm+0x88>
    8000294c:	00053703          	ld	a4,0(a0)
    80002950:	00e7b023          	sd	a4,0(a5)
            if(cur->next) cur->next->prev = cur->prev;
    80002954:	00053783          	ld	a5,0(a0)
    80002958:	00078663          	beqz	a5,80002964 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    8000295c:	00853703          	ld	a4,8(a0)
    80002960:	00e7b423          	sd	a4,8(a5)
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    80002964:	00003617          	auipc	a2,0x3
    80002968:	6dc63603          	ld	a2,1756(a2) # 80006040 <_ZN15MemoryAllocator9full_headE>
    8000296c:	08060063          	beqz	a2,800029ec <_ZN15MemoryAllocator9mem_allocEm+0xe0>
    80002970:	08c56263          	bltu	a0,a2,800029f4 <_ZN15MemoryAllocator9mem_allocEm+0xe8>
            for (tmp = full_head; tmp->next != nullptr && (char *) cur > (char *) (tmp->next); tmp = tmp->next);
    80002974:	00060793          	mv	a5,a2
    80002978:	00078713          	mv	a4,a5
    8000297c:	0007b783          	ld	a5,0(a5)
    80002980:	06078c63          	beqz	a5,800029f8 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    80002984:	fea7eae3          	bltu	a5,a0,80002978 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    80002988:	0700006f          	j	800029f8 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    for(;cur !=0; cur = cur->next){
    8000298c:	00053503          	ld	a0,0(a0)
    80002990:	f99ff06f          	j	80002928 <_ZN15MemoryAllocator9mem_allocEm+0x1c>
            else fmem_head = cur->next;
    80002994:	00053783          	ld	a5,0(a0)
    80002998:	00003717          	auipc	a4,0x3
    8000299c:	6af73023          	sd	a5,1696(a4) # 80006038 <_ZN15MemoryAllocator9fmem_headE>
    800029a0:	fb5ff06f          	j	80002954 <_ZN15MemoryAllocator9mem_allocEm+0x48>
            FreeMem* newfrgm = (FreeMem*)((char*)cur + (size)*MEM_BLOCK_SIZE);
    800029a4:	00d507b3          	add	a5,a0,a3
            newfrgm->prev = cur->prev;
    800029a8:	00853703          	ld	a4,8(a0)
    800029ac:	00e7b423          	sd	a4,8(a5)
            newfrgm->next = cur->next;
    800029b0:	00053703          	ld	a4,0(a0)
    800029b4:	00e7b023          	sd	a4,0(a5)
            newfrgm->size = cur->size - (size)*MEM_BLOCK_SIZE;
    800029b8:	01053703          	ld	a4,16(a0)
    800029bc:	40d70733          	sub	a4,a4,a3
    800029c0:	00e7b823          	sd	a4,16(a5)
            if(cur->prev) cur->prev->next = newfrgm;
    800029c4:	00853703          	ld	a4,8(a0)
    800029c8:	00070c63          	beqz	a4,800029e0 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    800029cc:	00f73023          	sd	a5,0(a4)
            if(cur->next) cur->next->prev = newfrgm;
    800029d0:	00053703          	ld	a4,0(a0)
    800029d4:	f80708e3          	beqz	a4,80002964 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    800029d8:	00f73423          	sd	a5,8(a4)
    800029dc:	f89ff06f          	j	80002964 <_ZN15MemoryAllocator9mem_allocEm+0x58>
            else fmem_head = newfrgm;
    800029e0:	00003717          	auipc	a4,0x3
    800029e4:	64f73c23          	sd	a5,1624(a4) # 80006038 <_ZN15MemoryAllocator9fmem_headE>
    800029e8:	fe9ff06f          	j	800029d0 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    800029ec:	00060713          	mv	a4,a2
    800029f0:	0080006f          	j	800029f8 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    800029f4:	00000713          	li	a4,0
        newSeg->size = (size)*MEM_BLOCK_SIZE ;
    800029f8:	00d53823          	sd	a3,16(a0)
        newSeg->prev = tmp;
    800029fc:	00e53423          	sd	a4,8(a0)
        if (tmp) newSeg->next = tmp->next;
    80002a00:	02070863          	beqz	a4,80002a30 <_ZN15MemoryAllocator9mem_allocEm+0x124>
    80002a04:	00073783          	ld	a5,0(a4)
    80002a08:	00f53023          	sd	a5,0(a0)
        if(newSeg->next) newSeg->next->prev = newSeg;
    80002a0c:	00053783          	ld	a5,0(a0)
    80002a10:	00078463          	beqz	a5,80002a18 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
    80002a14:	00a7b423          	sd	a0,8(a5)
        if (tmp) tmp->next = newSeg;
    80002a18:	02070063          	beqz	a4,80002a38 <_ZN15MemoryAllocator9mem_allocEm+0x12c>
    80002a1c:	00a73023          	sd	a0,0(a4)
        return (void*)((char*)cur+headSize);
    80002a20:	01850513          	addi	a0,a0,24
}
    80002a24:	00813403          	ld	s0,8(sp)
    80002a28:	01010113          	addi	sp,sp,16
    80002a2c:	00008067          	ret
        else newSeg->next = full_head;
    80002a30:	00c53023          	sd	a2,0(a0)
    80002a34:	fd9ff06f          	j	80002a0c <_ZN15MemoryAllocator9mem_allocEm+0x100>
        else full_head = newSeg;
    80002a38:	00003797          	auipc	a5,0x3
    80002a3c:	60a7b423          	sd	a0,1544(a5) # 80006040 <_ZN15MemoryAllocator9full_headE>
    80002a40:	fe1ff06f          	j	80002a20 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    if (size <=0) return nullptr;
    80002a44:	00000513          	li	a0,0
    80002a48:	fddff06f          	j	80002a24 <_ZN15MemoryAllocator9mem_allocEm+0x118>

0000000080002a4c <_ZN15MemoryAllocator11getInstanceEv>:
    if (memoryAllocator == nullptr) {
    80002a4c:	00003797          	auipc	a5,0x3
    80002a50:	5fc7b783          	ld	a5,1532(a5) # 80006048 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002a54:	00078863          	beqz	a5,80002a64 <_ZN15MemoryAllocator11getInstanceEv+0x18>
}
    80002a58:	00003517          	auipc	a0,0x3
    80002a5c:	5f053503          	ld	a0,1520(a0) # 80006048 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002a60:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80002a64:	fe010113          	addi	sp,sp,-32
    80002a68:	00113c23          	sd	ra,24(sp)
    80002a6c:	00813823          	sd	s0,16(sp)
    80002a70:	00913423          	sd	s1,8(sp)
    80002a74:	02010413          	addi	s0,sp,32
        fmem_head = (FreeMem*)0x81000000;
    80002a78:	00003497          	auipc	s1,0x3
    80002a7c:	5c048493          	addi	s1,s1,1472 # 80006038 <_ZN15MemoryAllocator9fmem_headE>
    80002a80:	08100793          	li	a5,129
    80002a84:	01879793          	slli	a5,a5,0x18
    80002a88:	00f4b023          	sd	a5,0(s1)
        fmem_head->next = nullptr;
    80002a8c:	0007b023          	sd	zero,0(a5)
        fmem_head->prev = nullptr;
    80002a90:	0004b783          	ld	a5,0(s1)
    80002a94:	0007b423          	sd	zero,8(a5)
        fmem_head->size = (size_t) (0x88000000) -(size_t )0x80007000;
    80002a98:	07ff9737          	lui	a4,0x7ff9
    80002a9c:	00e7b823          	sd	a4,16(a5)
        memoryAllocator = (MemoryAllocator*)MemoryAllocator::mem_alloc((sizeof(MemoryAllocator)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80002aa0:	00100513          	li	a0,1
    80002aa4:	00000097          	auipc	ra,0x0
    80002aa8:	e68080e7          	jalr	-408(ra) # 8000290c <_ZN15MemoryAllocator9mem_allocEm>
    80002aac:	00a4b823          	sd	a0,16(s1)
}
    80002ab0:	00003517          	auipc	a0,0x3
    80002ab4:	59853503          	ld	a0,1432(a0) # 80006048 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002ab8:	01813083          	ld	ra,24(sp)
    80002abc:	01013403          	ld	s0,16(sp)
    80002ac0:	00813483          	ld	s1,8(sp)
    80002ac4:	02010113          	addi	sp,sp,32
    80002ac8:	00008067          	ret

0000000080002acc <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void *addr) {
    80002acc:	ff010113          	addi	sp,sp,-16
    80002ad0:	00813423          	sd	s0,8(sp)
    80002ad4:	01010413          	addi	s0,sp,16
    if (addr == nullptr) return -2;
    80002ad8:	1a050063          	beqz	a0,80002c78 <_ZN15MemoryAllocator8mem_freeEPv+0x1ac>
    addr = (void*)((char*)addr-headSize);
    80002adc:	fe850713          	addi	a4,a0,-24
    FullMem* tmp = full_head;
    80002ae0:	00003797          	auipc	a5,0x3
    80002ae4:	5607b783          	ld	a5,1376(a5) # 80006040 <_ZN15MemoryAllocator9full_headE>
    bool flag = false;
    80002ae8:	0080006f          	j	80002af0 <_ZN15MemoryAllocator8mem_freeEPv+0x24>
    for(; tmp && dSeg>=tmp; tmp = tmp->next){
    80002aec:	0007b783          	ld	a5,0(a5)
    80002af0:	00078a63          	beqz	a5,80002b04 <_ZN15MemoryAllocator8mem_freeEPv+0x38>
    80002af4:	08f76663          	bltu	a4,a5,80002b80 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        if(tmp == dSeg) {
    80002af8:	fee79ae3          	bne	a5,a4,80002aec <_ZN15MemoryAllocator8mem_freeEPv+0x20>
            flag = true;
    80002afc:	00100693          	li	a3,1
    80002b00:	0080006f          	j	80002b08 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    bool flag = false;
    80002b04:	00000693          	li	a3,0
    if (!flag) return -1;
    80002b08:	16068c63          	beqz	a3,80002c80 <_ZN15MemoryAllocator8mem_freeEPv+0x1b4>
    if (tmp->prev) tmp->prev->next = tmp->next;
    80002b0c:	0087b683          	ld	a3,8(a5)
    80002b10:	06068c63          	beqz	a3,80002b88 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80002b14:	0007b603          	ld	a2,0(a5)
    80002b18:	00c6b023          	sd	a2,0(a3)
    if (tmp->next) tmp->next->prev = tmp->prev;
    80002b1c:	0007b683          	ld	a3,0(a5)
    80002b20:	00068663          	beqz	a3,80002b2c <_ZN15MemoryAllocator8mem_freeEPv+0x60>
    80002b24:	0087b603          	ld	a2,8(a5)
    80002b28:	00c6b423          	sd	a2,8(a3)
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002b2c:	00003597          	auipc	a1,0x3
    80002b30:	50c5b583          	ld	a1,1292(a1) # 80006038 <_ZN15MemoryAllocator9fmem_headE>
    80002b34:	08058263          	beqz	a1,80002bb8 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    80002b38:	08b76463          	bltu	a4,a1,80002bc0 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
        for (cur = fmem_head; cur->next != nullptr && (char*)addr>(char*)(cur->next); cur = cur->next);
    80002b3c:	00058693          	mv	a3,a1
    80002b40:	00068613          	mv	a2,a3
    80002b44:	0006b683          	ld	a3,0(a3)
    80002b48:	00068463          	beqz	a3,80002b50 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    80002b4c:	fee6eae3          	bltu	a3,a4,80002b40 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if(cur && (char*)cur+cur->size == addr){
    80002b50:	06060a63          	beqz	a2,80002bc4 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002b54:	01063803          	ld	a6,16(a2)
    80002b58:	010608b3          	add	a7,a2,a6
    80002b5c:	06e89463          	bne	a7,a4,80002bc4 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
        cur->size += tmp->size;
    80002b60:	0107b783          	ld	a5,16(a5)
    80002b64:	00f80833          	add	a6,a6,a5
    80002b68:	01063823          	sd	a6,16(a2)
        if (cur->next && (char*)((char*)cur+ cur->size) == (char*)(cur->next)){
    80002b6c:	00068663          	beqz	a3,80002b78 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002b70:	010607b3          	add	a5,a2,a6
    80002b74:	02f68263          	beq	a3,a5,80002b98 <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
        return 0;
    80002b78:	00000513          	li	a0,0
    80002b7c:	0900006f          	j	80002c0c <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    bool flag = false;
    80002b80:	00000693          	li	a3,0
    80002b84:	f85ff06f          	j	80002b08 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    else full_head = tmp->next;
    80002b88:	0007b683          	ld	a3,0(a5)
    80002b8c:	00003617          	auipc	a2,0x3
    80002b90:	4ad63a23          	sd	a3,1204(a2) # 80006040 <_ZN15MemoryAllocator9full_headE>
    80002b94:	f89ff06f          	j	80002b1c <_ZN15MemoryAllocator8mem_freeEPv+0x50>
            cur->size += cur->next->size;
    80002b98:	0106b783          	ld	a5,16(a3)
    80002b9c:	00f80833          	add	a6,a6,a5
    80002ba0:	01063823          	sd	a6,16(a2)
            cur->next = cur->next->next;
    80002ba4:	0006b783          	ld	a5,0(a3)
    80002ba8:	00f63023          	sd	a5,0(a2)
            if (cur->next) cur->next->prev = cur;
    80002bac:	fc0786e3          	beqz	a5,80002b78 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002bb0:	00c7b423          	sd	a2,8(a5)
    80002bb4:	fc5ff06f          	j	80002b78 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002bb8:	00058613          	mv	a2,a1
    80002bbc:	0080006f          	j	80002bc4 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002bc0:	00000613          	li	a2,0
        FreeMem* nxtSeg = cur?cur->next:fmem_head;
    80002bc4:	00060463          	beqz	a2,80002bcc <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    80002bc8:	00063583          	ld	a1,0(a2)
        if(nxtSeg && (char*)((char*)tmp + tmp->size) == (char*) nxtSeg){
    80002bcc:	00058863          	beqz	a1,80002bdc <_ZN15MemoryAllocator8mem_freeEPv+0x110>
    80002bd0:	0107b683          	ld	a3,16(a5)
    80002bd4:	00d78833          	add	a6,a5,a3
    80002bd8:	04b80063          	beq	a6,a1,80002c18 <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
            newSeg->size = tmp->size;
    80002bdc:	0107b783          	ld	a5,16(a5)
    80002be0:	fef53c23          	sd	a5,-8(a0)
            newSeg->prev = cur;
    80002be4:	fec53823          	sd	a2,-16(a0)
            if(cur) newSeg->next = cur->next;
    80002be8:	06060a63          	beqz	a2,80002c5c <_ZN15MemoryAllocator8mem_freeEPv+0x190>
    80002bec:	00063783          	ld	a5,0(a2)
    80002bf0:	fef53423          	sd	a5,-24(a0)
            if(newSeg->next) newSeg->next->prev = newSeg;
    80002bf4:	fe853783          	ld	a5,-24(a0)
    80002bf8:	00078463          	beqz	a5,80002c00 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
    80002bfc:	00e7b423          	sd	a4,8(a5)
            if (cur) cur->next = newSeg;
    80002c00:	06060663          	beqz	a2,80002c6c <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
    80002c04:	00e63023          	sd	a4,0(a2)
            return 0;
    80002c08:	00000513          	li	a0,0
}
    80002c0c:	00813403          	ld	s0,8(sp)
    80002c10:	01010113          	addi	sp,sp,16
    80002c14:	00008067          	ret
            newSeg->size = nxtSeg->size + tmp->size;
    80002c18:	0105b783          	ld	a5,16(a1)
    80002c1c:	00f686b3          	add	a3,a3,a5
    80002c20:	fed53c23          	sd	a3,-8(a0)
            newSeg->prev = nxtSeg->prev;
    80002c24:	0085b783          	ld	a5,8(a1)
    80002c28:	fef53823          	sd	a5,-16(a0)
            newSeg->next = nxtSeg->next;
    80002c2c:	0005b783          	ld	a5,0(a1)
    80002c30:	fef53423          	sd	a5,-24(a0)
            if(nxtSeg->next) nxtSeg->next->prev = newSeg;
    80002c34:	00078463          	beqz	a5,80002c3c <_ZN15MemoryAllocator8mem_freeEPv+0x170>
    80002c38:	00e7b423          	sd	a4,8(a5)
            if(nxtSeg->prev) nxtSeg->prev->next = newSeg;
    80002c3c:	0085b783          	ld	a5,8(a1)
    80002c40:	00078863          	beqz	a5,80002c50 <_ZN15MemoryAllocator8mem_freeEPv+0x184>
    80002c44:	00e7b023          	sd	a4,0(a5)
            return 0;
    80002c48:	00000513          	li	a0,0
    80002c4c:	fc1ff06f          	j	80002c0c <_ZN15MemoryAllocator8mem_freeEPv+0x140>
            else fmem_head = newSeg;
    80002c50:	00003797          	auipc	a5,0x3
    80002c54:	3ee7b423          	sd	a4,1000(a5) # 80006038 <_ZN15MemoryAllocator9fmem_headE>
    80002c58:	ff1ff06f          	j	80002c48 <_ZN15MemoryAllocator8mem_freeEPv+0x17c>
            else newSeg->next =fmem_head;
    80002c5c:	00003797          	auipc	a5,0x3
    80002c60:	3dc7b783          	ld	a5,988(a5) # 80006038 <_ZN15MemoryAllocator9fmem_headE>
    80002c64:	fef53423          	sd	a5,-24(a0)
    80002c68:	f8dff06f          	j	80002bf4 <_ZN15MemoryAllocator8mem_freeEPv+0x128>
            else fmem_head = newSeg;
    80002c6c:	00003797          	auipc	a5,0x3
    80002c70:	3ce7b623          	sd	a4,972(a5) # 80006038 <_ZN15MemoryAllocator9fmem_headE>
    80002c74:	f95ff06f          	j	80002c08 <_ZN15MemoryAllocator8mem_freeEPv+0x13c>
    if (addr == nullptr) return -2;
    80002c78:	ffe00513          	li	a0,-2
    80002c7c:	f91ff06f          	j	80002c0c <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    if (!flag) return -1;
    80002c80:	fff00513          	li	a0,-1
    80002c84:	f89ff06f          	j	80002c0c <_ZN15MemoryAllocator8mem_freeEPv+0x140>

0000000080002c88 <_GLOBAL__sub_I__ZN15MemoryAllocator9fmem_headE>:
}
    80002c88:	ff010113          	addi	sp,sp,-16
    80002c8c:	00113423          	sd	ra,8(sp)
    80002c90:	00813023          	sd	s0,0(sp)
    80002c94:	01010413          	addi	s0,sp,16
    80002c98:	000105b7          	lui	a1,0x10
    80002c9c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002ca0:	00100513          	li	a0,1
    80002ca4:	00000097          	auipc	ra,0x0
    80002ca8:	c24080e7          	jalr	-988(ra) # 800028c8 <_Z41__static_initialization_and_destruction_0ii>
    80002cac:	00813083          	ld	ra,8(sp)
    80002cb0:	00013403          	ld	s0,0(sp)
    80002cb4:	01010113          	addi	sp,sp,16
    80002cb8:	00008067          	ret

0000000080002cbc <start>:
    80002cbc:	ff010113          	addi	sp,sp,-16
    80002cc0:	00813423          	sd	s0,8(sp)
    80002cc4:	01010413          	addi	s0,sp,16
    80002cc8:	300027f3          	csrr	a5,mstatus
    80002ccc:	ffffe737          	lui	a4,0xffffe
    80002cd0:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff754f>
    80002cd4:	00e7f7b3          	and	a5,a5,a4
    80002cd8:	00001737          	lui	a4,0x1
    80002cdc:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002ce0:	00e7e7b3          	or	a5,a5,a4
    80002ce4:	30079073          	csrw	mstatus,a5
    80002ce8:	00000797          	auipc	a5,0x0
    80002cec:	16078793          	addi	a5,a5,352 # 80002e48 <system_main>
    80002cf0:	34179073          	csrw	mepc,a5
    80002cf4:	00000793          	li	a5,0
    80002cf8:	18079073          	csrw	satp,a5
    80002cfc:	000107b7          	lui	a5,0x10
    80002d00:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002d04:	30279073          	csrw	medeleg,a5
    80002d08:	30379073          	csrw	mideleg,a5
    80002d0c:	104027f3          	csrr	a5,sie
    80002d10:	2227e793          	ori	a5,a5,546
    80002d14:	10479073          	csrw	sie,a5
    80002d18:	fff00793          	li	a5,-1
    80002d1c:	00a7d793          	srli	a5,a5,0xa
    80002d20:	3b079073          	csrw	pmpaddr0,a5
    80002d24:	00f00793          	li	a5,15
    80002d28:	3a079073          	csrw	pmpcfg0,a5
    80002d2c:	f14027f3          	csrr	a5,mhartid
    80002d30:	0200c737          	lui	a4,0x200c
    80002d34:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002d38:	0007869b          	sext.w	a3,a5
    80002d3c:	00269713          	slli	a4,a3,0x2
    80002d40:	000f4637          	lui	a2,0xf4
    80002d44:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002d48:	00d70733          	add	a4,a4,a3
    80002d4c:	0037979b          	slliw	a5,a5,0x3
    80002d50:	020046b7          	lui	a3,0x2004
    80002d54:	00d787b3          	add	a5,a5,a3
    80002d58:	00c585b3          	add	a1,a1,a2
    80002d5c:	00371693          	slli	a3,a4,0x3
    80002d60:	00003717          	auipc	a4,0x3
    80002d64:	2f070713          	addi	a4,a4,752 # 80006050 <timer_scratch>
    80002d68:	00b7b023          	sd	a1,0(a5)
    80002d6c:	00d70733          	add	a4,a4,a3
    80002d70:	00f73c23          	sd	a5,24(a4)
    80002d74:	02c73023          	sd	a2,32(a4)
    80002d78:	34071073          	csrw	mscratch,a4
    80002d7c:	00000797          	auipc	a5,0x0
    80002d80:	6e478793          	addi	a5,a5,1764 # 80003460 <timervec>
    80002d84:	30579073          	csrw	mtvec,a5
    80002d88:	300027f3          	csrr	a5,mstatus
    80002d8c:	0087e793          	ori	a5,a5,8
    80002d90:	30079073          	csrw	mstatus,a5
    80002d94:	304027f3          	csrr	a5,mie
    80002d98:	0807e793          	ori	a5,a5,128
    80002d9c:	30479073          	csrw	mie,a5
    80002da0:	f14027f3          	csrr	a5,mhartid
    80002da4:	0007879b          	sext.w	a5,a5
    80002da8:	00078213          	mv	tp,a5
    80002dac:	30200073          	mret
    80002db0:	00813403          	ld	s0,8(sp)
    80002db4:	01010113          	addi	sp,sp,16
    80002db8:	00008067          	ret

0000000080002dbc <timerinit>:
    80002dbc:	ff010113          	addi	sp,sp,-16
    80002dc0:	00813423          	sd	s0,8(sp)
    80002dc4:	01010413          	addi	s0,sp,16
    80002dc8:	f14027f3          	csrr	a5,mhartid
    80002dcc:	0200c737          	lui	a4,0x200c
    80002dd0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002dd4:	0007869b          	sext.w	a3,a5
    80002dd8:	00269713          	slli	a4,a3,0x2
    80002ddc:	000f4637          	lui	a2,0xf4
    80002de0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002de4:	00d70733          	add	a4,a4,a3
    80002de8:	0037979b          	slliw	a5,a5,0x3
    80002dec:	020046b7          	lui	a3,0x2004
    80002df0:	00d787b3          	add	a5,a5,a3
    80002df4:	00c585b3          	add	a1,a1,a2
    80002df8:	00371693          	slli	a3,a4,0x3
    80002dfc:	00003717          	auipc	a4,0x3
    80002e00:	25470713          	addi	a4,a4,596 # 80006050 <timer_scratch>
    80002e04:	00b7b023          	sd	a1,0(a5)
    80002e08:	00d70733          	add	a4,a4,a3
    80002e0c:	00f73c23          	sd	a5,24(a4)
    80002e10:	02c73023          	sd	a2,32(a4)
    80002e14:	34071073          	csrw	mscratch,a4
    80002e18:	00000797          	auipc	a5,0x0
    80002e1c:	64878793          	addi	a5,a5,1608 # 80003460 <timervec>
    80002e20:	30579073          	csrw	mtvec,a5
    80002e24:	300027f3          	csrr	a5,mstatus
    80002e28:	0087e793          	ori	a5,a5,8
    80002e2c:	30079073          	csrw	mstatus,a5
    80002e30:	304027f3          	csrr	a5,mie
    80002e34:	0807e793          	ori	a5,a5,128
    80002e38:	30479073          	csrw	mie,a5
    80002e3c:	00813403          	ld	s0,8(sp)
    80002e40:	01010113          	addi	sp,sp,16
    80002e44:	00008067          	ret

0000000080002e48 <system_main>:
    80002e48:	fe010113          	addi	sp,sp,-32
    80002e4c:	00813823          	sd	s0,16(sp)
    80002e50:	00913423          	sd	s1,8(sp)
    80002e54:	00113c23          	sd	ra,24(sp)
    80002e58:	02010413          	addi	s0,sp,32
    80002e5c:	00000097          	auipc	ra,0x0
    80002e60:	0c4080e7          	jalr	196(ra) # 80002f20 <cpuid>
    80002e64:	00003497          	auipc	s1,0x3
    80002e68:	16c48493          	addi	s1,s1,364 # 80005fd0 <started>
    80002e6c:	02050263          	beqz	a0,80002e90 <system_main+0x48>
    80002e70:	0004a783          	lw	a5,0(s1)
    80002e74:	0007879b          	sext.w	a5,a5
    80002e78:	fe078ce3          	beqz	a5,80002e70 <system_main+0x28>
    80002e7c:	0ff0000f          	fence
    80002e80:	00002517          	auipc	a0,0x2
    80002e84:	31850513          	addi	a0,a0,792 # 80005198 <CONSOLE_STATUS+0x188>
    80002e88:	00001097          	auipc	ra,0x1
    80002e8c:	a74080e7          	jalr	-1420(ra) # 800038fc <panic>
    80002e90:	00001097          	auipc	ra,0x1
    80002e94:	9c8080e7          	jalr	-1592(ra) # 80003858 <consoleinit>
    80002e98:	00001097          	auipc	ra,0x1
    80002e9c:	154080e7          	jalr	340(ra) # 80003fec <printfinit>
    80002ea0:	00002517          	auipc	a0,0x2
    80002ea4:	3d850513          	addi	a0,a0,984 # 80005278 <CONSOLE_STATUS+0x268>
    80002ea8:	00001097          	auipc	ra,0x1
    80002eac:	ab0080e7          	jalr	-1360(ra) # 80003958 <__printf>
    80002eb0:	00002517          	auipc	a0,0x2
    80002eb4:	2b850513          	addi	a0,a0,696 # 80005168 <CONSOLE_STATUS+0x158>
    80002eb8:	00001097          	auipc	ra,0x1
    80002ebc:	aa0080e7          	jalr	-1376(ra) # 80003958 <__printf>
    80002ec0:	00002517          	auipc	a0,0x2
    80002ec4:	3b850513          	addi	a0,a0,952 # 80005278 <CONSOLE_STATUS+0x268>
    80002ec8:	00001097          	auipc	ra,0x1
    80002ecc:	a90080e7          	jalr	-1392(ra) # 80003958 <__printf>
    80002ed0:	00001097          	auipc	ra,0x1
    80002ed4:	4a8080e7          	jalr	1192(ra) # 80004378 <kinit>
    80002ed8:	00000097          	auipc	ra,0x0
    80002edc:	148080e7          	jalr	328(ra) # 80003020 <trapinit>
    80002ee0:	00000097          	auipc	ra,0x0
    80002ee4:	16c080e7          	jalr	364(ra) # 8000304c <trapinithart>
    80002ee8:	00000097          	auipc	ra,0x0
    80002eec:	5b8080e7          	jalr	1464(ra) # 800034a0 <plicinit>
    80002ef0:	00000097          	auipc	ra,0x0
    80002ef4:	5d8080e7          	jalr	1496(ra) # 800034c8 <plicinithart>
    80002ef8:	00000097          	auipc	ra,0x0
    80002efc:	078080e7          	jalr	120(ra) # 80002f70 <userinit>
    80002f00:	0ff0000f          	fence
    80002f04:	00100793          	li	a5,1
    80002f08:	00002517          	auipc	a0,0x2
    80002f0c:	27850513          	addi	a0,a0,632 # 80005180 <CONSOLE_STATUS+0x170>
    80002f10:	00f4a023          	sw	a5,0(s1)
    80002f14:	00001097          	auipc	ra,0x1
    80002f18:	a44080e7          	jalr	-1468(ra) # 80003958 <__printf>
    80002f1c:	0000006f          	j	80002f1c <system_main+0xd4>

0000000080002f20 <cpuid>:
    80002f20:	ff010113          	addi	sp,sp,-16
    80002f24:	00813423          	sd	s0,8(sp)
    80002f28:	01010413          	addi	s0,sp,16
    80002f2c:	00020513          	mv	a0,tp
    80002f30:	00813403          	ld	s0,8(sp)
    80002f34:	0005051b          	sext.w	a0,a0
    80002f38:	01010113          	addi	sp,sp,16
    80002f3c:	00008067          	ret

0000000080002f40 <mycpu>:
    80002f40:	ff010113          	addi	sp,sp,-16
    80002f44:	00813423          	sd	s0,8(sp)
    80002f48:	01010413          	addi	s0,sp,16
    80002f4c:	00020793          	mv	a5,tp
    80002f50:	00813403          	ld	s0,8(sp)
    80002f54:	0007879b          	sext.w	a5,a5
    80002f58:	00779793          	slli	a5,a5,0x7
    80002f5c:	00004517          	auipc	a0,0x4
    80002f60:	12450513          	addi	a0,a0,292 # 80007080 <cpus>
    80002f64:	00f50533          	add	a0,a0,a5
    80002f68:	01010113          	addi	sp,sp,16
    80002f6c:	00008067          	ret

0000000080002f70 <userinit>:
    80002f70:	ff010113          	addi	sp,sp,-16
    80002f74:	00813423          	sd	s0,8(sp)
    80002f78:	01010413          	addi	s0,sp,16
    80002f7c:	00813403          	ld	s0,8(sp)
    80002f80:	01010113          	addi	sp,sp,16
    80002f84:	fffff317          	auipc	t1,0xfffff
    80002f88:	6a030067          	jr	1696(t1) # 80002624 <main>

0000000080002f8c <either_copyout>:
    80002f8c:	ff010113          	addi	sp,sp,-16
    80002f90:	00813023          	sd	s0,0(sp)
    80002f94:	00113423          	sd	ra,8(sp)
    80002f98:	01010413          	addi	s0,sp,16
    80002f9c:	02051663          	bnez	a0,80002fc8 <either_copyout+0x3c>
    80002fa0:	00058513          	mv	a0,a1
    80002fa4:	00060593          	mv	a1,a2
    80002fa8:	0006861b          	sext.w	a2,a3
    80002fac:	00002097          	auipc	ra,0x2
    80002fb0:	c58080e7          	jalr	-936(ra) # 80004c04 <__memmove>
    80002fb4:	00813083          	ld	ra,8(sp)
    80002fb8:	00013403          	ld	s0,0(sp)
    80002fbc:	00000513          	li	a0,0
    80002fc0:	01010113          	addi	sp,sp,16
    80002fc4:	00008067          	ret
    80002fc8:	00002517          	auipc	a0,0x2
    80002fcc:	1f850513          	addi	a0,a0,504 # 800051c0 <CONSOLE_STATUS+0x1b0>
    80002fd0:	00001097          	auipc	ra,0x1
    80002fd4:	92c080e7          	jalr	-1748(ra) # 800038fc <panic>

0000000080002fd8 <either_copyin>:
    80002fd8:	ff010113          	addi	sp,sp,-16
    80002fdc:	00813023          	sd	s0,0(sp)
    80002fe0:	00113423          	sd	ra,8(sp)
    80002fe4:	01010413          	addi	s0,sp,16
    80002fe8:	02059463          	bnez	a1,80003010 <either_copyin+0x38>
    80002fec:	00060593          	mv	a1,a2
    80002ff0:	0006861b          	sext.w	a2,a3
    80002ff4:	00002097          	auipc	ra,0x2
    80002ff8:	c10080e7          	jalr	-1008(ra) # 80004c04 <__memmove>
    80002ffc:	00813083          	ld	ra,8(sp)
    80003000:	00013403          	ld	s0,0(sp)
    80003004:	00000513          	li	a0,0
    80003008:	01010113          	addi	sp,sp,16
    8000300c:	00008067          	ret
    80003010:	00002517          	auipc	a0,0x2
    80003014:	1d850513          	addi	a0,a0,472 # 800051e8 <CONSOLE_STATUS+0x1d8>
    80003018:	00001097          	auipc	ra,0x1
    8000301c:	8e4080e7          	jalr	-1820(ra) # 800038fc <panic>

0000000080003020 <trapinit>:
    80003020:	ff010113          	addi	sp,sp,-16
    80003024:	00813423          	sd	s0,8(sp)
    80003028:	01010413          	addi	s0,sp,16
    8000302c:	00813403          	ld	s0,8(sp)
    80003030:	00002597          	auipc	a1,0x2
    80003034:	1e058593          	addi	a1,a1,480 # 80005210 <CONSOLE_STATUS+0x200>
    80003038:	00004517          	auipc	a0,0x4
    8000303c:	0c850513          	addi	a0,a0,200 # 80007100 <tickslock>
    80003040:	01010113          	addi	sp,sp,16
    80003044:	00001317          	auipc	t1,0x1
    80003048:	5c430067          	jr	1476(t1) # 80004608 <initlock>

000000008000304c <trapinithart>:
    8000304c:	ff010113          	addi	sp,sp,-16
    80003050:	00813423          	sd	s0,8(sp)
    80003054:	01010413          	addi	s0,sp,16
    80003058:	00000797          	auipc	a5,0x0
    8000305c:	2f878793          	addi	a5,a5,760 # 80003350 <kernelvec>
    80003060:	10579073          	csrw	stvec,a5
    80003064:	00813403          	ld	s0,8(sp)
    80003068:	01010113          	addi	sp,sp,16
    8000306c:	00008067          	ret

0000000080003070 <usertrap>:
    80003070:	ff010113          	addi	sp,sp,-16
    80003074:	00813423          	sd	s0,8(sp)
    80003078:	01010413          	addi	s0,sp,16
    8000307c:	00813403          	ld	s0,8(sp)
    80003080:	01010113          	addi	sp,sp,16
    80003084:	00008067          	ret

0000000080003088 <usertrapret>:
    80003088:	ff010113          	addi	sp,sp,-16
    8000308c:	00813423          	sd	s0,8(sp)
    80003090:	01010413          	addi	s0,sp,16
    80003094:	00813403          	ld	s0,8(sp)
    80003098:	01010113          	addi	sp,sp,16
    8000309c:	00008067          	ret

00000000800030a0 <kerneltrap>:
    800030a0:	fe010113          	addi	sp,sp,-32
    800030a4:	00813823          	sd	s0,16(sp)
    800030a8:	00113c23          	sd	ra,24(sp)
    800030ac:	00913423          	sd	s1,8(sp)
    800030b0:	02010413          	addi	s0,sp,32
    800030b4:	142025f3          	csrr	a1,scause
    800030b8:	100027f3          	csrr	a5,sstatus
    800030bc:	0027f793          	andi	a5,a5,2
    800030c0:	10079c63          	bnez	a5,800031d8 <kerneltrap+0x138>
    800030c4:	142027f3          	csrr	a5,scause
    800030c8:	0207ce63          	bltz	a5,80003104 <kerneltrap+0x64>
    800030cc:	00002517          	auipc	a0,0x2
    800030d0:	18c50513          	addi	a0,a0,396 # 80005258 <CONSOLE_STATUS+0x248>
    800030d4:	00001097          	auipc	ra,0x1
    800030d8:	884080e7          	jalr	-1916(ra) # 80003958 <__printf>
    800030dc:	141025f3          	csrr	a1,sepc
    800030e0:	14302673          	csrr	a2,stval
    800030e4:	00002517          	auipc	a0,0x2
    800030e8:	18450513          	addi	a0,a0,388 # 80005268 <CONSOLE_STATUS+0x258>
    800030ec:	00001097          	auipc	ra,0x1
    800030f0:	86c080e7          	jalr	-1940(ra) # 80003958 <__printf>
    800030f4:	00002517          	auipc	a0,0x2
    800030f8:	18c50513          	addi	a0,a0,396 # 80005280 <CONSOLE_STATUS+0x270>
    800030fc:	00001097          	auipc	ra,0x1
    80003100:	800080e7          	jalr	-2048(ra) # 800038fc <panic>
    80003104:	0ff7f713          	andi	a4,a5,255
    80003108:	00900693          	li	a3,9
    8000310c:	04d70063          	beq	a4,a3,8000314c <kerneltrap+0xac>
    80003110:	fff00713          	li	a4,-1
    80003114:	03f71713          	slli	a4,a4,0x3f
    80003118:	00170713          	addi	a4,a4,1
    8000311c:	fae798e3          	bne	a5,a4,800030cc <kerneltrap+0x2c>
    80003120:	00000097          	auipc	ra,0x0
    80003124:	e00080e7          	jalr	-512(ra) # 80002f20 <cpuid>
    80003128:	06050663          	beqz	a0,80003194 <kerneltrap+0xf4>
    8000312c:	144027f3          	csrr	a5,sip
    80003130:	ffd7f793          	andi	a5,a5,-3
    80003134:	14479073          	csrw	sip,a5
    80003138:	01813083          	ld	ra,24(sp)
    8000313c:	01013403          	ld	s0,16(sp)
    80003140:	00813483          	ld	s1,8(sp)
    80003144:	02010113          	addi	sp,sp,32
    80003148:	00008067          	ret
    8000314c:	00000097          	auipc	ra,0x0
    80003150:	3c8080e7          	jalr	968(ra) # 80003514 <plic_claim>
    80003154:	00a00793          	li	a5,10
    80003158:	00050493          	mv	s1,a0
    8000315c:	06f50863          	beq	a0,a5,800031cc <kerneltrap+0x12c>
    80003160:	fc050ce3          	beqz	a0,80003138 <kerneltrap+0x98>
    80003164:	00050593          	mv	a1,a0
    80003168:	00002517          	auipc	a0,0x2
    8000316c:	0d050513          	addi	a0,a0,208 # 80005238 <CONSOLE_STATUS+0x228>
    80003170:	00000097          	auipc	ra,0x0
    80003174:	7e8080e7          	jalr	2024(ra) # 80003958 <__printf>
    80003178:	01013403          	ld	s0,16(sp)
    8000317c:	01813083          	ld	ra,24(sp)
    80003180:	00048513          	mv	a0,s1
    80003184:	00813483          	ld	s1,8(sp)
    80003188:	02010113          	addi	sp,sp,32
    8000318c:	00000317          	auipc	t1,0x0
    80003190:	3c030067          	jr	960(t1) # 8000354c <plic_complete>
    80003194:	00004517          	auipc	a0,0x4
    80003198:	f6c50513          	addi	a0,a0,-148 # 80007100 <tickslock>
    8000319c:	00001097          	auipc	ra,0x1
    800031a0:	490080e7          	jalr	1168(ra) # 8000462c <acquire>
    800031a4:	00003717          	auipc	a4,0x3
    800031a8:	e3070713          	addi	a4,a4,-464 # 80005fd4 <ticks>
    800031ac:	00072783          	lw	a5,0(a4)
    800031b0:	00004517          	auipc	a0,0x4
    800031b4:	f5050513          	addi	a0,a0,-176 # 80007100 <tickslock>
    800031b8:	0017879b          	addiw	a5,a5,1
    800031bc:	00f72023          	sw	a5,0(a4)
    800031c0:	00001097          	auipc	ra,0x1
    800031c4:	538080e7          	jalr	1336(ra) # 800046f8 <release>
    800031c8:	f65ff06f          	j	8000312c <kerneltrap+0x8c>
    800031cc:	00001097          	auipc	ra,0x1
    800031d0:	094080e7          	jalr	148(ra) # 80004260 <uartintr>
    800031d4:	fa5ff06f          	j	80003178 <kerneltrap+0xd8>
    800031d8:	00002517          	auipc	a0,0x2
    800031dc:	04050513          	addi	a0,a0,64 # 80005218 <CONSOLE_STATUS+0x208>
    800031e0:	00000097          	auipc	ra,0x0
    800031e4:	71c080e7          	jalr	1820(ra) # 800038fc <panic>

00000000800031e8 <clockintr>:
    800031e8:	fe010113          	addi	sp,sp,-32
    800031ec:	00813823          	sd	s0,16(sp)
    800031f0:	00913423          	sd	s1,8(sp)
    800031f4:	00113c23          	sd	ra,24(sp)
    800031f8:	02010413          	addi	s0,sp,32
    800031fc:	00004497          	auipc	s1,0x4
    80003200:	f0448493          	addi	s1,s1,-252 # 80007100 <tickslock>
    80003204:	00048513          	mv	a0,s1
    80003208:	00001097          	auipc	ra,0x1
    8000320c:	424080e7          	jalr	1060(ra) # 8000462c <acquire>
    80003210:	00003717          	auipc	a4,0x3
    80003214:	dc470713          	addi	a4,a4,-572 # 80005fd4 <ticks>
    80003218:	00072783          	lw	a5,0(a4)
    8000321c:	01013403          	ld	s0,16(sp)
    80003220:	01813083          	ld	ra,24(sp)
    80003224:	00048513          	mv	a0,s1
    80003228:	0017879b          	addiw	a5,a5,1
    8000322c:	00813483          	ld	s1,8(sp)
    80003230:	00f72023          	sw	a5,0(a4)
    80003234:	02010113          	addi	sp,sp,32
    80003238:	00001317          	auipc	t1,0x1
    8000323c:	4c030067          	jr	1216(t1) # 800046f8 <release>

0000000080003240 <devintr>:
    80003240:	142027f3          	csrr	a5,scause
    80003244:	00000513          	li	a0,0
    80003248:	0007c463          	bltz	a5,80003250 <devintr+0x10>
    8000324c:	00008067          	ret
    80003250:	fe010113          	addi	sp,sp,-32
    80003254:	00813823          	sd	s0,16(sp)
    80003258:	00113c23          	sd	ra,24(sp)
    8000325c:	00913423          	sd	s1,8(sp)
    80003260:	02010413          	addi	s0,sp,32
    80003264:	0ff7f713          	andi	a4,a5,255
    80003268:	00900693          	li	a3,9
    8000326c:	04d70c63          	beq	a4,a3,800032c4 <devintr+0x84>
    80003270:	fff00713          	li	a4,-1
    80003274:	03f71713          	slli	a4,a4,0x3f
    80003278:	00170713          	addi	a4,a4,1
    8000327c:	00e78c63          	beq	a5,a4,80003294 <devintr+0x54>
    80003280:	01813083          	ld	ra,24(sp)
    80003284:	01013403          	ld	s0,16(sp)
    80003288:	00813483          	ld	s1,8(sp)
    8000328c:	02010113          	addi	sp,sp,32
    80003290:	00008067          	ret
    80003294:	00000097          	auipc	ra,0x0
    80003298:	c8c080e7          	jalr	-884(ra) # 80002f20 <cpuid>
    8000329c:	06050663          	beqz	a0,80003308 <devintr+0xc8>
    800032a0:	144027f3          	csrr	a5,sip
    800032a4:	ffd7f793          	andi	a5,a5,-3
    800032a8:	14479073          	csrw	sip,a5
    800032ac:	01813083          	ld	ra,24(sp)
    800032b0:	01013403          	ld	s0,16(sp)
    800032b4:	00813483          	ld	s1,8(sp)
    800032b8:	00200513          	li	a0,2
    800032bc:	02010113          	addi	sp,sp,32
    800032c0:	00008067          	ret
    800032c4:	00000097          	auipc	ra,0x0
    800032c8:	250080e7          	jalr	592(ra) # 80003514 <plic_claim>
    800032cc:	00a00793          	li	a5,10
    800032d0:	00050493          	mv	s1,a0
    800032d4:	06f50663          	beq	a0,a5,80003340 <devintr+0x100>
    800032d8:	00100513          	li	a0,1
    800032dc:	fa0482e3          	beqz	s1,80003280 <devintr+0x40>
    800032e0:	00048593          	mv	a1,s1
    800032e4:	00002517          	auipc	a0,0x2
    800032e8:	f5450513          	addi	a0,a0,-172 # 80005238 <CONSOLE_STATUS+0x228>
    800032ec:	00000097          	auipc	ra,0x0
    800032f0:	66c080e7          	jalr	1644(ra) # 80003958 <__printf>
    800032f4:	00048513          	mv	a0,s1
    800032f8:	00000097          	auipc	ra,0x0
    800032fc:	254080e7          	jalr	596(ra) # 8000354c <plic_complete>
    80003300:	00100513          	li	a0,1
    80003304:	f7dff06f          	j	80003280 <devintr+0x40>
    80003308:	00004517          	auipc	a0,0x4
    8000330c:	df850513          	addi	a0,a0,-520 # 80007100 <tickslock>
    80003310:	00001097          	auipc	ra,0x1
    80003314:	31c080e7          	jalr	796(ra) # 8000462c <acquire>
    80003318:	00003717          	auipc	a4,0x3
    8000331c:	cbc70713          	addi	a4,a4,-836 # 80005fd4 <ticks>
    80003320:	00072783          	lw	a5,0(a4)
    80003324:	00004517          	auipc	a0,0x4
    80003328:	ddc50513          	addi	a0,a0,-548 # 80007100 <tickslock>
    8000332c:	0017879b          	addiw	a5,a5,1
    80003330:	00f72023          	sw	a5,0(a4)
    80003334:	00001097          	auipc	ra,0x1
    80003338:	3c4080e7          	jalr	964(ra) # 800046f8 <release>
    8000333c:	f65ff06f          	j	800032a0 <devintr+0x60>
    80003340:	00001097          	auipc	ra,0x1
    80003344:	f20080e7          	jalr	-224(ra) # 80004260 <uartintr>
    80003348:	fadff06f          	j	800032f4 <devintr+0xb4>
    8000334c:	0000                	unimp
	...

0000000080003350 <kernelvec>:
    80003350:	f0010113          	addi	sp,sp,-256
    80003354:	00113023          	sd	ra,0(sp)
    80003358:	00213423          	sd	sp,8(sp)
    8000335c:	00313823          	sd	gp,16(sp)
    80003360:	00413c23          	sd	tp,24(sp)
    80003364:	02513023          	sd	t0,32(sp)
    80003368:	02613423          	sd	t1,40(sp)
    8000336c:	02713823          	sd	t2,48(sp)
    80003370:	02813c23          	sd	s0,56(sp)
    80003374:	04913023          	sd	s1,64(sp)
    80003378:	04a13423          	sd	a0,72(sp)
    8000337c:	04b13823          	sd	a1,80(sp)
    80003380:	04c13c23          	sd	a2,88(sp)
    80003384:	06d13023          	sd	a3,96(sp)
    80003388:	06e13423          	sd	a4,104(sp)
    8000338c:	06f13823          	sd	a5,112(sp)
    80003390:	07013c23          	sd	a6,120(sp)
    80003394:	09113023          	sd	a7,128(sp)
    80003398:	09213423          	sd	s2,136(sp)
    8000339c:	09313823          	sd	s3,144(sp)
    800033a0:	09413c23          	sd	s4,152(sp)
    800033a4:	0b513023          	sd	s5,160(sp)
    800033a8:	0b613423          	sd	s6,168(sp)
    800033ac:	0b713823          	sd	s7,176(sp)
    800033b0:	0b813c23          	sd	s8,184(sp)
    800033b4:	0d913023          	sd	s9,192(sp)
    800033b8:	0da13423          	sd	s10,200(sp)
    800033bc:	0db13823          	sd	s11,208(sp)
    800033c0:	0dc13c23          	sd	t3,216(sp)
    800033c4:	0fd13023          	sd	t4,224(sp)
    800033c8:	0fe13423          	sd	t5,232(sp)
    800033cc:	0ff13823          	sd	t6,240(sp)
    800033d0:	cd1ff0ef          	jal	ra,800030a0 <kerneltrap>
    800033d4:	00013083          	ld	ra,0(sp)
    800033d8:	00813103          	ld	sp,8(sp)
    800033dc:	01013183          	ld	gp,16(sp)
    800033e0:	02013283          	ld	t0,32(sp)
    800033e4:	02813303          	ld	t1,40(sp)
    800033e8:	03013383          	ld	t2,48(sp)
    800033ec:	03813403          	ld	s0,56(sp)
    800033f0:	04013483          	ld	s1,64(sp)
    800033f4:	04813503          	ld	a0,72(sp)
    800033f8:	05013583          	ld	a1,80(sp)
    800033fc:	05813603          	ld	a2,88(sp)
    80003400:	06013683          	ld	a3,96(sp)
    80003404:	06813703          	ld	a4,104(sp)
    80003408:	07013783          	ld	a5,112(sp)
    8000340c:	07813803          	ld	a6,120(sp)
    80003410:	08013883          	ld	a7,128(sp)
    80003414:	08813903          	ld	s2,136(sp)
    80003418:	09013983          	ld	s3,144(sp)
    8000341c:	09813a03          	ld	s4,152(sp)
    80003420:	0a013a83          	ld	s5,160(sp)
    80003424:	0a813b03          	ld	s6,168(sp)
    80003428:	0b013b83          	ld	s7,176(sp)
    8000342c:	0b813c03          	ld	s8,184(sp)
    80003430:	0c013c83          	ld	s9,192(sp)
    80003434:	0c813d03          	ld	s10,200(sp)
    80003438:	0d013d83          	ld	s11,208(sp)
    8000343c:	0d813e03          	ld	t3,216(sp)
    80003440:	0e013e83          	ld	t4,224(sp)
    80003444:	0e813f03          	ld	t5,232(sp)
    80003448:	0f013f83          	ld	t6,240(sp)
    8000344c:	10010113          	addi	sp,sp,256
    80003450:	10200073          	sret
    80003454:	00000013          	nop
    80003458:	00000013          	nop
    8000345c:	00000013          	nop

0000000080003460 <timervec>:
    80003460:	34051573          	csrrw	a0,mscratch,a0
    80003464:	00b53023          	sd	a1,0(a0)
    80003468:	00c53423          	sd	a2,8(a0)
    8000346c:	00d53823          	sd	a3,16(a0)
    80003470:	01853583          	ld	a1,24(a0)
    80003474:	02053603          	ld	a2,32(a0)
    80003478:	0005b683          	ld	a3,0(a1)
    8000347c:	00c686b3          	add	a3,a3,a2
    80003480:	00d5b023          	sd	a3,0(a1)
    80003484:	00200593          	li	a1,2
    80003488:	14459073          	csrw	sip,a1
    8000348c:	01053683          	ld	a3,16(a0)
    80003490:	00853603          	ld	a2,8(a0)
    80003494:	00053583          	ld	a1,0(a0)
    80003498:	34051573          	csrrw	a0,mscratch,a0
    8000349c:	30200073          	mret

00000000800034a0 <plicinit>:
    800034a0:	ff010113          	addi	sp,sp,-16
    800034a4:	00813423          	sd	s0,8(sp)
    800034a8:	01010413          	addi	s0,sp,16
    800034ac:	00813403          	ld	s0,8(sp)
    800034b0:	0c0007b7          	lui	a5,0xc000
    800034b4:	00100713          	li	a4,1
    800034b8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800034bc:	00e7a223          	sw	a4,4(a5)
    800034c0:	01010113          	addi	sp,sp,16
    800034c4:	00008067          	ret

00000000800034c8 <plicinithart>:
    800034c8:	ff010113          	addi	sp,sp,-16
    800034cc:	00813023          	sd	s0,0(sp)
    800034d0:	00113423          	sd	ra,8(sp)
    800034d4:	01010413          	addi	s0,sp,16
    800034d8:	00000097          	auipc	ra,0x0
    800034dc:	a48080e7          	jalr	-1464(ra) # 80002f20 <cpuid>
    800034e0:	0085171b          	slliw	a4,a0,0x8
    800034e4:	0c0027b7          	lui	a5,0xc002
    800034e8:	00e787b3          	add	a5,a5,a4
    800034ec:	40200713          	li	a4,1026
    800034f0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800034f4:	00813083          	ld	ra,8(sp)
    800034f8:	00013403          	ld	s0,0(sp)
    800034fc:	00d5151b          	slliw	a0,a0,0xd
    80003500:	0c2017b7          	lui	a5,0xc201
    80003504:	00a78533          	add	a0,a5,a0
    80003508:	00052023          	sw	zero,0(a0)
    8000350c:	01010113          	addi	sp,sp,16
    80003510:	00008067          	ret

0000000080003514 <plic_claim>:
    80003514:	ff010113          	addi	sp,sp,-16
    80003518:	00813023          	sd	s0,0(sp)
    8000351c:	00113423          	sd	ra,8(sp)
    80003520:	01010413          	addi	s0,sp,16
    80003524:	00000097          	auipc	ra,0x0
    80003528:	9fc080e7          	jalr	-1540(ra) # 80002f20 <cpuid>
    8000352c:	00813083          	ld	ra,8(sp)
    80003530:	00013403          	ld	s0,0(sp)
    80003534:	00d5151b          	slliw	a0,a0,0xd
    80003538:	0c2017b7          	lui	a5,0xc201
    8000353c:	00a78533          	add	a0,a5,a0
    80003540:	00452503          	lw	a0,4(a0)
    80003544:	01010113          	addi	sp,sp,16
    80003548:	00008067          	ret

000000008000354c <plic_complete>:
    8000354c:	fe010113          	addi	sp,sp,-32
    80003550:	00813823          	sd	s0,16(sp)
    80003554:	00913423          	sd	s1,8(sp)
    80003558:	00113c23          	sd	ra,24(sp)
    8000355c:	02010413          	addi	s0,sp,32
    80003560:	00050493          	mv	s1,a0
    80003564:	00000097          	auipc	ra,0x0
    80003568:	9bc080e7          	jalr	-1604(ra) # 80002f20 <cpuid>
    8000356c:	01813083          	ld	ra,24(sp)
    80003570:	01013403          	ld	s0,16(sp)
    80003574:	00d5179b          	slliw	a5,a0,0xd
    80003578:	0c201737          	lui	a4,0xc201
    8000357c:	00f707b3          	add	a5,a4,a5
    80003580:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003584:	00813483          	ld	s1,8(sp)
    80003588:	02010113          	addi	sp,sp,32
    8000358c:	00008067          	ret

0000000080003590 <consolewrite>:
    80003590:	fb010113          	addi	sp,sp,-80
    80003594:	04813023          	sd	s0,64(sp)
    80003598:	04113423          	sd	ra,72(sp)
    8000359c:	02913c23          	sd	s1,56(sp)
    800035a0:	03213823          	sd	s2,48(sp)
    800035a4:	03313423          	sd	s3,40(sp)
    800035a8:	03413023          	sd	s4,32(sp)
    800035ac:	01513c23          	sd	s5,24(sp)
    800035b0:	05010413          	addi	s0,sp,80
    800035b4:	06c05c63          	blez	a2,8000362c <consolewrite+0x9c>
    800035b8:	00060993          	mv	s3,a2
    800035bc:	00050a13          	mv	s4,a0
    800035c0:	00058493          	mv	s1,a1
    800035c4:	00000913          	li	s2,0
    800035c8:	fff00a93          	li	s5,-1
    800035cc:	01c0006f          	j	800035e8 <consolewrite+0x58>
    800035d0:	fbf44503          	lbu	a0,-65(s0)
    800035d4:	0019091b          	addiw	s2,s2,1
    800035d8:	00148493          	addi	s1,s1,1
    800035dc:	00001097          	auipc	ra,0x1
    800035e0:	a9c080e7          	jalr	-1380(ra) # 80004078 <uartputc>
    800035e4:	03298063          	beq	s3,s2,80003604 <consolewrite+0x74>
    800035e8:	00048613          	mv	a2,s1
    800035ec:	00100693          	li	a3,1
    800035f0:	000a0593          	mv	a1,s4
    800035f4:	fbf40513          	addi	a0,s0,-65
    800035f8:	00000097          	auipc	ra,0x0
    800035fc:	9e0080e7          	jalr	-1568(ra) # 80002fd8 <either_copyin>
    80003600:	fd5518e3          	bne	a0,s5,800035d0 <consolewrite+0x40>
    80003604:	04813083          	ld	ra,72(sp)
    80003608:	04013403          	ld	s0,64(sp)
    8000360c:	03813483          	ld	s1,56(sp)
    80003610:	02813983          	ld	s3,40(sp)
    80003614:	02013a03          	ld	s4,32(sp)
    80003618:	01813a83          	ld	s5,24(sp)
    8000361c:	00090513          	mv	a0,s2
    80003620:	03013903          	ld	s2,48(sp)
    80003624:	05010113          	addi	sp,sp,80
    80003628:	00008067          	ret
    8000362c:	00000913          	li	s2,0
    80003630:	fd5ff06f          	j	80003604 <consolewrite+0x74>

0000000080003634 <consoleread>:
    80003634:	f9010113          	addi	sp,sp,-112
    80003638:	06813023          	sd	s0,96(sp)
    8000363c:	04913c23          	sd	s1,88(sp)
    80003640:	05213823          	sd	s2,80(sp)
    80003644:	05313423          	sd	s3,72(sp)
    80003648:	05413023          	sd	s4,64(sp)
    8000364c:	03513c23          	sd	s5,56(sp)
    80003650:	03613823          	sd	s6,48(sp)
    80003654:	03713423          	sd	s7,40(sp)
    80003658:	03813023          	sd	s8,32(sp)
    8000365c:	06113423          	sd	ra,104(sp)
    80003660:	01913c23          	sd	s9,24(sp)
    80003664:	07010413          	addi	s0,sp,112
    80003668:	00060b93          	mv	s7,a2
    8000366c:	00050913          	mv	s2,a0
    80003670:	00058c13          	mv	s8,a1
    80003674:	00060b1b          	sext.w	s6,a2
    80003678:	00004497          	auipc	s1,0x4
    8000367c:	ab048493          	addi	s1,s1,-1360 # 80007128 <cons>
    80003680:	00400993          	li	s3,4
    80003684:	fff00a13          	li	s4,-1
    80003688:	00a00a93          	li	s5,10
    8000368c:	05705e63          	blez	s7,800036e8 <consoleread+0xb4>
    80003690:	09c4a703          	lw	a4,156(s1)
    80003694:	0984a783          	lw	a5,152(s1)
    80003698:	0007071b          	sext.w	a4,a4
    8000369c:	08e78463          	beq	a5,a4,80003724 <consoleread+0xf0>
    800036a0:	07f7f713          	andi	a4,a5,127
    800036a4:	00e48733          	add	a4,s1,a4
    800036a8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800036ac:	0017869b          	addiw	a3,a5,1
    800036b0:	08d4ac23          	sw	a3,152(s1)
    800036b4:	00070c9b          	sext.w	s9,a4
    800036b8:	0b370663          	beq	a4,s3,80003764 <consoleread+0x130>
    800036bc:	00100693          	li	a3,1
    800036c0:	f9f40613          	addi	a2,s0,-97
    800036c4:	000c0593          	mv	a1,s8
    800036c8:	00090513          	mv	a0,s2
    800036cc:	f8e40fa3          	sb	a4,-97(s0)
    800036d0:	00000097          	auipc	ra,0x0
    800036d4:	8bc080e7          	jalr	-1860(ra) # 80002f8c <either_copyout>
    800036d8:	01450863          	beq	a0,s4,800036e8 <consoleread+0xb4>
    800036dc:	001c0c13          	addi	s8,s8,1
    800036e0:	fffb8b9b          	addiw	s7,s7,-1
    800036e4:	fb5c94e3          	bne	s9,s5,8000368c <consoleread+0x58>
    800036e8:	000b851b          	sext.w	a0,s7
    800036ec:	06813083          	ld	ra,104(sp)
    800036f0:	06013403          	ld	s0,96(sp)
    800036f4:	05813483          	ld	s1,88(sp)
    800036f8:	05013903          	ld	s2,80(sp)
    800036fc:	04813983          	ld	s3,72(sp)
    80003700:	04013a03          	ld	s4,64(sp)
    80003704:	03813a83          	ld	s5,56(sp)
    80003708:	02813b83          	ld	s7,40(sp)
    8000370c:	02013c03          	ld	s8,32(sp)
    80003710:	01813c83          	ld	s9,24(sp)
    80003714:	40ab053b          	subw	a0,s6,a0
    80003718:	03013b03          	ld	s6,48(sp)
    8000371c:	07010113          	addi	sp,sp,112
    80003720:	00008067          	ret
    80003724:	00001097          	auipc	ra,0x1
    80003728:	1d8080e7          	jalr	472(ra) # 800048fc <push_on>
    8000372c:	0984a703          	lw	a4,152(s1)
    80003730:	09c4a783          	lw	a5,156(s1)
    80003734:	0007879b          	sext.w	a5,a5
    80003738:	fef70ce3          	beq	a4,a5,80003730 <consoleread+0xfc>
    8000373c:	00001097          	auipc	ra,0x1
    80003740:	234080e7          	jalr	564(ra) # 80004970 <pop_on>
    80003744:	0984a783          	lw	a5,152(s1)
    80003748:	07f7f713          	andi	a4,a5,127
    8000374c:	00e48733          	add	a4,s1,a4
    80003750:	01874703          	lbu	a4,24(a4)
    80003754:	0017869b          	addiw	a3,a5,1
    80003758:	08d4ac23          	sw	a3,152(s1)
    8000375c:	00070c9b          	sext.w	s9,a4
    80003760:	f5371ee3          	bne	a4,s3,800036bc <consoleread+0x88>
    80003764:	000b851b          	sext.w	a0,s7
    80003768:	f96bf2e3          	bgeu	s7,s6,800036ec <consoleread+0xb8>
    8000376c:	08f4ac23          	sw	a5,152(s1)
    80003770:	f7dff06f          	j	800036ec <consoleread+0xb8>

0000000080003774 <consputc>:
    80003774:	10000793          	li	a5,256
    80003778:	00f50663          	beq	a0,a5,80003784 <consputc+0x10>
    8000377c:	00001317          	auipc	t1,0x1
    80003780:	9f430067          	jr	-1548(t1) # 80004170 <uartputc_sync>
    80003784:	ff010113          	addi	sp,sp,-16
    80003788:	00113423          	sd	ra,8(sp)
    8000378c:	00813023          	sd	s0,0(sp)
    80003790:	01010413          	addi	s0,sp,16
    80003794:	00800513          	li	a0,8
    80003798:	00001097          	auipc	ra,0x1
    8000379c:	9d8080e7          	jalr	-1576(ra) # 80004170 <uartputc_sync>
    800037a0:	02000513          	li	a0,32
    800037a4:	00001097          	auipc	ra,0x1
    800037a8:	9cc080e7          	jalr	-1588(ra) # 80004170 <uartputc_sync>
    800037ac:	00013403          	ld	s0,0(sp)
    800037b0:	00813083          	ld	ra,8(sp)
    800037b4:	00800513          	li	a0,8
    800037b8:	01010113          	addi	sp,sp,16
    800037bc:	00001317          	auipc	t1,0x1
    800037c0:	9b430067          	jr	-1612(t1) # 80004170 <uartputc_sync>

00000000800037c4 <consoleintr>:
    800037c4:	fe010113          	addi	sp,sp,-32
    800037c8:	00813823          	sd	s0,16(sp)
    800037cc:	00913423          	sd	s1,8(sp)
    800037d0:	01213023          	sd	s2,0(sp)
    800037d4:	00113c23          	sd	ra,24(sp)
    800037d8:	02010413          	addi	s0,sp,32
    800037dc:	00004917          	auipc	s2,0x4
    800037e0:	94c90913          	addi	s2,s2,-1716 # 80007128 <cons>
    800037e4:	00050493          	mv	s1,a0
    800037e8:	00090513          	mv	a0,s2
    800037ec:	00001097          	auipc	ra,0x1
    800037f0:	e40080e7          	jalr	-448(ra) # 8000462c <acquire>
    800037f4:	02048c63          	beqz	s1,8000382c <consoleintr+0x68>
    800037f8:	0a092783          	lw	a5,160(s2)
    800037fc:	09892703          	lw	a4,152(s2)
    80003800:	07f00693          	li	a3,127
    80003804:	40e7873b          	subw	a4,a5,a4
    80003808:	02e6e263          	bltu	a3,a4,8000382c <consoleintr+0x68>
    8000380c:	00d00713          	li	a4,13
    80003810:	04e48063          	beq	s1,a4,80003850 <consoleintr+0x8c>
    80003814:	07f7f713          	andi	a4,a5,127
    80003818:	00e90733          	add	a4,s2,a4
    8000381c:	0017879b          	addiw	a5,a5,1
    80003820:	0af92023          	sw	a5,160(s2)
    80003824:	00970c23          	sb	s1,24(a4)
    80003828:	08f92e23          	sw	a5,156(s2)
    8000382c:	01013403          	ld	s0,16(sp)
    80003830:	01813083          	ld	ra,24(sp)
    80003834:	00813483          	ld	s1,8(sp)
    80003838:	00013903          	ld	s2,0(sp)
    8000383c:	00004517          	auipc	a0,0x4
    80003840:	8ec50513          	addi	a0,a0,-1812 # 80007128 <cons>
    80003844:	02010113          	addi	sp,sp,32
    80003848:	00001317          	auipc	t1,0x1
    8000384c:	eb030067          	jr	-336(t1) # 800046f8 <release>
    80003850:	00a00493          	li	s1,10
    80003854:	fc1ff06f          	j	80003814 <consoleintr+0x50>

0000000080003858 <consoleinit>:
    80003858:	fe010113          	addi	sp,sp,-32
    8000385c:	00113c23          	sd	ra,24(sp)
    80003860:	00813823          	sd	s0,16(sp)
    80003864:	00913423          	sd	s1,8(sp)
    80003868:	02010413          	addi	s0,sp,32
    8000386c:	00004497          	auipc	s1,0x4
    80003870:	8bc48493          	addi	s1,s1,-1860 # 80007128 <cons>
    80003874:	00048513          	mv	a0,s1
    80003878:	00002597          	auipc	a1,0x2
    8000387c:	a1858593          	addi	a1,a1,-1512 # 80005290 <CONSOLE_STATUS+0x280>
    80003880:	00001097          	auipc	ra,0x1
    80003884:	d88080e7          	jalr	-632(ra) # 80004608 <initlock>
    80003888:	00000097          	auipc	ra,0x0
    8000388c:	7ac080e7          	jalr	1964(ra) # 80004034 <uartinit>
    80003890:	01813083          	ld	ra,24(sp)
    80003894:	01013403          	ld	s0,16(sp)
    80003898:	00000797          	auipc	a5,0x0
    8000389c:	d9c78793          	addi	a5,a5,-612 # 80003634 <consoleread>
    800038a0:	0af4bc23          	sd	a5,184(s1)
    800038a4:	00000797          	auipc	a5,0x0
    800038a8:	cec78793          	addi	a5,a5,-788 # 80003590 <consolewrite>
    800038ac:	0cf4b023          	sd	a5,192(s1)
    800038b0:	00813483          	ld	s1,8(sp)
    800038b4:	02010113          	addi	sp,sp,32
    800038b8:	00008067          	ret

00000000800038bc <console_read>:
    800038bc:	ff010113          	addi	sp,sp,-16
    800038c0:	00813423          	sd	s0,8(sp)
    800038c4:	01010413          	addi	s0,sp,16
    800038c8:	00813403          	ld	s0,8(sp)
    800038cc:	00004317          	auipc	t1,0x4
    800038d0:	91433303          	ld	t1,-1772(t1) # 800071e0 <devsw+0x10>
    800038d4:	01010113          	addi	sp,sp,16
    800038d8:	00030067          	jr	t1

00000000800038dc <console_write>:
    800038dc:	ff010113          	addi	sp,sp,-16
    800038e0:	00813423          	sd	s0,8(sp)
    800038e4:	01010413          	addi	s0,sp,16
    800038e8:	00813403          	ld	s0,8(sp)
    800038ec:	00004317          	auipc	t1,0x4
    800038f0:	8fc33303          	ld	t1,-1796(t1) # 800071e8 <devsw+0x18>
    800038f4:	01010113          	addi	sp,sp,16
    800038f8:	00030067          	jr	t1

00000000800038fc <panic>:
    800038fc:	fe010113          	addi	sp,sp,-32
    80003900:	00113c23          	sd	ra,24(sp)
    80003904:	00813823          	sd	s0,16(sp)
    80003908:	00913423          	sd	s1,8(sp)
    8000390c:	02010413          	addi	s0,sp,32
    80003910:	00050493          	mv	s1,a0
    80003914:	00002517          	auipc	a0,0x2
    80003918:	98450513          	addi	a0,a0,-1660 # 80005298 <CONSOLE_STATUS+0x288>
    8000391c:	00004797          	auipc	a5,0x4
    80003920:	9607a623          	sw	zero,-1684(a5) # 80007288 <pr+0x18>
    80003924:	00000097          	auipc	ra,0x0
    80003928:	034080e7          	jalr	52(ra) # 80003958 <__printf>
    8000392c:	00048513          	mv	a0,s1
    80003930:	00000097          	auipc	ra,0x0
    80003934:	028080e7          	jalr	40(ra) # 80003958 <__printf>
    80003938:	00002517          	auipc	a0,0x2
    8000393c:	94050513          	addi	a0,a0,-1728 # 80005278 <CONSOLE_STATUS+0x268>
    80003940:	00000097          	auipc	ra,0x0
    80003944:	018080e7          	jalr	24(ra) # 80003958 <__printf>
    80003948:	00100793          	li	a5,1
    8000394c:	00002717          	auipc	a4,0x2
    80003950:	68f72623          	sw	a5,1676(a4) # 80005fd8 <panicked>
    80003954:	0000006f          	j	80003954 <panic+0x58>

0000000080003958 <__printf>:
    80003958:	f3010113          	addi	sp,sp,-208
    8000395c:	08813023          	sd	s0,128(sp)
    80003960:	07313423          	sd	s3,104(sp)
    80003964:	09010413          	addi	s0,sp,144
    80003968:	05813023          	sd	s8,64(sp)
    8000396c:	08113423          	sd	ra,136(sp)
    80003970:	06913c23          	sd	s1,120(sp)
    80003974:	07213823          	sd	s2,112(sp)
    80003978:	07413023          	sd	s4,96(sp)
    8000397c:	05513c23          	sd	s5,88(sp)
    80003980:	05613823          	sd	s6,80(sp)
    80003984:	05713423          	sd	s7,72(sp)
    80003988:	03913c23          	sd	s9,56(sp)
    8000398c:	03a13823          	sd	s10,48(sp)
    80003990:	03b13423          	sd	s11,40(sp)
    80003994:	00004317          	auipc	t1,0x4
    80003998:	8dc30313          	addi	t1,t1,-1828 # 80007270 <pr>
    8000399c:	01832c03          	lw	s8,24(t1)
    800039a0:	00b43423          	sd	a1,8(s0)
    800039a4:	00c43823          	sd	a2,16(s0)
    800039a8:	00d43c23          	sd	a3,24(s0)
    800039ac:	02e43023          	sd	a4,32(s0)
    800039b0:	02f43423          	sd	a5,40(s0)
    800039b4:	03043823          	sd	a6,48(s0)
    800039b8:	03143c23          	sd	a7,56(s0)
    800039bc:	00050993          	mv	s3,a0
    800039c0:	4a0c1663          	bnez	s8,80003e6c <__printf+0x514>
    800039c4:	60098c63          	beqz	s3,80003fdc <__printf+0x684>
    800039c8:	0009c503          	lbu	a0,0(s3)
    800039cc:	00840793          	addi	a5,s0,8
    800039d0:	f6f43c23          	sd	a5,-136(s0)
    800039d4:	00000493          	li	s1,0
    800039d8:	22050063          	beqz	a0,80003bf8 <__printf+0x2a0>
    800039dc:	00002a37          	lui	s4,0x2
    800039e0:	00018ab7          	lui	s5,0x18
    800039e4:	000f4b37          	lui	s6,0xf4
    800039e8:	00989bb7          	lui	s7,0x989
    800039ec:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800039f0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800039f4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800039f8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800039fc:	00148c9b          	addiw	s9,s1,1
    80003a00:	02500793          	li	a5,37
    80003a04:	01998933          	add	s2,s3,s9
    80003a08:	38f51263          	bne	a0,a5,80003d8c <__printf+0x434>
    80003a0c:	00094783          	lbu	a5,0(s2)
    80003a10:	00078c9b          	sext.w	s9,a5
    80003a14:	1e078263          	beqz	a5,80003bf8 <__printf+0x2a0>
    80003a18:	0024849b          	addiw	s1,s1,2
    80003a1c:	07000713          	li	a4,112
    80003a20:	00998933          	add	s2,s3,s1
    80003a24:	38e78a63          	beq	a5,a4,80003db8 <__printf+0x460>
    80003a28:	20f76863          	bltu	a4,a5,80003c38 <__printf+0x2e0>
    80003a2c:	42a78863          	beq	a5,a0,80003e5c <__printf+0x504>
    80003a30:	06400713          	li	a4,100
    80003a34:	40e79663          	bne	a5,a4,80003e40 <__printf+0x4e8>
    80003a38:	f7843783          	ld	a5,-136(s0)
    80003a3c:	0007a603          	lw	a2,0(a5)
    80003a40:	00878793          	addi	a5,a5,8
    80003a44:	f6f43c23          	sd	a5,-136(s0)
    80003a48:	42064a63          	bltz	a2,80003e7c <__printf+0x524>
    80003a4c:	00a00713          	li	a4,10
    80003a50:	02e677bb          	remuw	a5,a2,a4
    80003a54:	00002d97          	auipc	s11,0x2
    80003a58:	86cd8d93          	addi	s11,s11,-1940 # 800052c0 <digits>
    80003a5c:	00900593          	li	a1,9
    80003a60:	0006051b          	sext.w	a0,a2
    80003a64:	00000c93          	li	s9,0
    80003a68:	02079793          	slli	a5,a5,0x20
    80003a6c:	0207d793          	srli	a5,a5,0x20
    80003a70:	00fd87b3          	add	a5,s11,a5
    80003a74:	0007c783          	lbu	a5,0(a5)
    80003a78:	02e656bb          	divuw	a3,a2,a4
    80003a7c:	f8f40023          	sb	a5,-128(s0)
    80003a80:	14c5d863          	bge	a1,a2,80003bd0 <__printf+0x278>
    80003a84:	06300593          	li	a1,99
    80003a88:	00100c93          	li	s9,1
    80003a8c:	02e6f7bb          	remuw	a5,a3,a4
    80003a90:	02079793          	slli	a5,a5,0x20
    80003a94:	0207d793          	srli	a5,a5,0x20
    80003a98:	00fd87b3          	add	a5,s11,a5
    80003a9c:	0007c783          	lbu	a5,0(a5)
    80003aa0:	02e6d73b          	divuw	a4,a3,a4
    80003aa4:	f8f400a3          	sb	a5,-127(s0)
    80003aa8:	12a5f463          	bgeu	a1,a0,80003bd0 <__printf+0x278>
    80003aac:	00a00693          	li	a3,10
    80003ab0:	00900593          	li	a1,9
    80003ab4:	02d777bb          	remuw	a5,a4,a3
    80003ab8:	02079793          	slli	a5,a5,0x20
    80003abc:	0207d793          	srli	a5,a5,0x20
    80003ac0:	00fd87b3          	add	a5,s11,a5
    80003ac4:	0007c503          	lbu	a0,0(a5)
    80003ac8:	02d757bb          	divuw	a5,a4,a3
    80003acc:	f8a40123          	sb	a0,-126(s0)
    80003ad0:	48e5f263          	bgeu	a1,a4,80003f54 <__printf+0x5fc>
    80003ad4:	06300513          	li	a0,99
    80003ad8:	02d7f5bb          	remuw	a1,a5,a3
    80003adc:	02059593          	slli	a1,a1,0x20
    80003ae0:	0205d593          	srli	a1,a1,0x20
    80003ae4:	00bd85b3          	add	a1,s11,a1
    80003ae8:	0005c583          	lbu	a1,0(a1)
    80003aec:	02d7d7bb          	divuw	a5,a5,a3
    80003af0:	f8b401a3          	sb	a1,-125(s0)
    80003af4:	48e57263          	bgeu	a0,a4,80003f78 <__printf+0x620>
    80003af8:	3e700513          	li	a0,999
    80003afc:	02d7f5bb          	remuw	a1,a5,a3
    80003b00:	02059593          	slli	a1,a1,0x20
    80003b04:	0205d593          	srli	a1,a1,0x20
    80003b08:	00bd85b3          	add	a1,s11,a1
    80003b0c:	0005c583          	lbu	a1,0(a1)
    80003b10:	02d7d7bb          	divuw	a5,a5,a3
    80003b14:	f8b40223          	sb	a1,-124(s0)
    80003b18:	46e57663          	bgeu	a0,a4,80003f84 <__printf+0x62c>
    80003b1c:	02d7f5bb          	remuw	a1,a5,a3
    80003b20:	02059593          	slli	a1,a1,0x20
    80003b24:	0205d593          	srli	a1,a1,0x20
    80003b28:	00bd85b3          	add	a1,s11,a1
    80003b2c:	0005c583          	lbu	a1,0(a1)
    80003b30:	02d7d7bb          	divuw	a5,a5,a3
    80003b34:	f8b402a3          	sb	a1,-123(s0)
    80003b38:	46ea7863          	bgeu	s4,a4,80003fa8 <__printf+0x650>
    80003b3c:	02d7f5bb          	remuw	a1,a5,a3
    80003b40:	02059593          	slli	a1,a1,0x20
    80003b44:	0205d593          	srli	a1,a1,0x20
    80003b48:	00bd85b3          	add	a1,s11,a1
    80003b4c:	0005c583          	lbu	a1,0(a1)
    80003b50:	02d7d7bb          	divuw	a5,a5,a3
    80003b54:	f8b40323          	sb	a1,-122(s0)
    80003b58:	3eeaf863          	bgeu	s5,a4,80003f48 <__printf+0x5f0>
    80003b5c:	02d7f5bb          	remuw	a1,a5,a3
    80003b60:	02059593          	slli	a1,a1,0x20
    80003b64:	0205d593          	srli	a1,a1,0x20
    80003b68:	00bd85b3          	add	a1,s11,a1
    80003b6c:	0005c583          	lbu	a1,0(a1)
    80003b70:	02d7d7bb          	divuw	a5,a5,a3
    80003b74:	f8b403a3          	sb	a1,-121(s0)
    80003b78:	42eb7e63          	bgeu	s6,a4,80003fb4 <__printf+0x65c>
    80003b7c:	02d7f5bb          	remuw	a1,a5,a3
    80003b80:	02059593          	slli	a1,a1,0x20
    80003b84:	0205d593          	srli	a1,a1,0x20
    80003b88:	00bd85b3          	add	a1,s11,a1
    80003b8c:	0005c583          	lbu	a1,0(a1)
    80003b90:	02d7d7bb          	divuw	a5,a5,a3
    80003b94:	f8b40423          	sb	a1,-120(s0)
    80003b98:	42ebfc63          	bgeu	s7,a4,80003fd0 <__printf+0x678>
    80003b9c:	02079793          	slli	a5,a5,0x20
    80003ba0:	0207d793          	srli	a5,a5,0x20
    80003ba4:	00fd8db3          	add	s11,s11,a5
    80003ba8:	000dc703          	lbu	a4,0(s11)
    80003bac:	00a00793          	li	a5,10
    80003bb0:	00900c93          	li	s9,9
    80003bb4:	f8e404a3          	sb	a4,-119(s0)
    80003bb8:	00065c63          	bgez	a2,80003bd0 <__printf+0x278>
    80003bbc:	f9040713          	addi	a4,s0,-112
    80003bc0:	00f70733          	add	a4,a4,a5
    80003bc4:	02d00693          	li	a3,45
    80003bc8:	fed70823          	sb	a3,-16(a4)
    80003bcc:	00078c93          	mv	s9,a5
    80003bd0:	f8040793          	addi	a5,s0,-128
    80003bd4:	01978cb3          	add	s9,a5,s9
    80003bd8:	f7f40d13          	addi	s10,s0,-129
    80003bdc:	000cc503          	lbu	a0,0(s9)
    80003be0:	fffc8c93          	addi	s9,s9,-1
    80003be4:	00000097          	auipc	ra,0x0
    80003be8:	b90080e7          	jalr	-1136(ra) # 80003774 <consputc>
    80003bec:	ffac98e3          	bne	s9,s10,80003bdc <__printf+0x284>
    80003bf0:	00094503          	lbu	a0,0(s2)
    80003bf4:	e00514e3          	bnez	a0,800039fc <__printf+0xa4>
    80003bf8:	1a0c1663          	bnez	s8,80003da4 <__printf+0x44c>
    80003bfc:	08813083          	ld	ra,136(sp)
    80003c00:	08013403          	ld	s0,128(sp)
    80003c04:	07813483          	ld	s1,120(sp)
    80003c08:	07013903          	ld	s2,112(sp)
    80003c0c:	06813983          	ld	s3,104(sp)
    80003c10:	06013a03          	ld	s4,96(sp)
    80003c14:	05813a83          	ld	s5,88(sp)
    80003c18:	05013b03          	ld	s6,80(sp)
    80003c1c:	04813b83          	ld	s7,72(sp)
    80003c20:	04013c03          	ld	s8,64(sp)
    80003c24:	03813c83          	ld	s9,56(sp)
    80003c28:	03013d03          	ld	s10,48(sp)
    80003c2c:	02813d83          	ld	s11,40(sp)
    80003c30:	0d010113          	addi	sp,sp,208
    80003c34:	00008067          	ret
    80003c38:	07300713          	li	a4,115
    80003c3c:	1ce78a63          	beq	a5,a4,80003e10 <__printf+0x4b8>
    80003c40:	07800713          	li	a4,120
    80003c44:	1ee79e63          	bne	a5,a4,80003e40 <__printf+0x4e8>
    80003c48:	f7843783          	ld	a5,-136(s0)
    80003c4c:	0007a703          	lw	a4,0(a5)
    80003c50:	00878793          	addi	a5,a5,8
    80003c54:	f6f43c23          	sd	a5,-136(s0)
    80003c58:	28074263          	bltz	a4,80003edc <__printf+0x584>
    80003c5c:	00001d97          	auipc	s11,0x1
    80003c60:	664d8d93          	addi	s11,s11,1636 # 800052c0 <digits>
    80003c64:	00f77793          	andi	a5,a4,15
    80003c68:	00fd87b3          	add	a5,s11,a5
    80003c6c:	0007c683          	lbu	a3,0(a5)
    80003c70:	00f00613          	li	a2,15
    80003c74:	0007079b          	sext.w	a5,a4
    80003c78:	f8d40023          	sb	a3,-128(s0)
    80003c7c:	0047559b          	srliw	a1,a4,0x4
    80003c80:	0047569b          	srliw	a3,a4,0x4
    80003c84:	00000c93          	li	s9,0
    80003c88:	0ee65063          	bge	a2,a4,80003d68 <__printf+0x410>
    80003c8c:	00f6f693          	andi	a3,a3,15
    80003c90:	00dd86b3          	add	a3,s11,a3
    80003c94:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003c98:	0087d79b          	srliw	a5,a5,0x8
    80003c9c:	00100c93          	li	s9,1
    80003ca0:	f8d400a3          	sb	a3,-127(s0)
    80003ca4:	0cb67263          	bgeu	a2,a1,80003d68 <__printf+0x410>
    80003ca8:	00f7f693          	andi	a3,a5,15
    80003cac:	00dd86b3          	add	a3,s11,a3
    80003cb0:	0006c583          	lbu	a1,0(a3)
    80003cb4:	00f00613          	li	a2,15
    80003cb8:	0047d69b          	srliw	a3,a5,0x4
    80003cbc:	f8b40123          	sb	a1,-126(s0)
    80003cc0:	0047d593          	srli	a1,a5,0x4
    80003cc4:	28f67e63          	bgeu	a2,a5,80003f60 <__printf+0x608>
    80003cc8:	00f6f693          	andi	a3,a3,15
    80003ccc:	00dd86b3          	add	a3,s11,a3
    80003cd0:	0006c503          	lbu	a0,0(a3)
    80003cd4:	0087d813          	srli	a6,a5,0x8
    80003cd8:	0087d69b          	srliw	a3,a5,0x8
    80003cdc:	f8a401a3          	sb	a0,-125(s0)
    80003ce0:	28b67663          	bgeu	a2,a1,80003f6c <__printf+0x614>
    80003ce4:	00f6f693          	andi	a3,a3,15
    80003ce8:	00dd86b3          	add	a3,s11,a3
    80003cec:	0006c583          	lbu	a1,0(a3)
    80003cf0:	00c7d513          	srli	a0,a5,0xc
    80003cf4:	00c7d69b          	srliw	a3,a5,0xc
    80003cf8:	f8b40223          	sb	a1,-124(s0)
    80003cfc:	29067a63          	bgeu	a2,a6,80003f90 <__printf+0x638>
    80003d00:	00f6f693          	andi	a3,a3,15
    80003d04:	00dd86b3          	add	a3,s11,a3
    80003d08:	0006c583          	lbu	a1,0(a3)
    80003d0c:	0107d813          	srli	a6,a5,0x10
    80003d10:	0107d69b          	srliw	a3,a5,0x10
    80003d14:	f8b402a3          	sb	a1,-123(s0)
    80003d18:	28a67263          	bgeu	a2,a0,80003f9c <__printf+0x644>
    80003d1c:	00f6f693          	andi	a3,a3,15
    80003d20:	00dd86b3          	add	a3,s11,a3
    80003d24:	0006c683          	lbu	a3,0(a3)
    80003d28:	0147d79b          	srliw	a5,a5,0x14
    80003d2c:	f8d40323          	sb	a3,-122(s0)
    80003d30:	21067663          	bgeu	a2,a6,80003f3c <__printf+0x5e4>
    80003d34:	02079793          	slli	a5,a5,0x20
    80003d38:	0207d793          	srli	a5,a5,0x20
    80003d3c:	00fd8db3          	add	s11,s11,a5
    80003d40:	000dc683          	lbu	a3,0(s11)
    80003d44:	00800793          	li	a5,8
    80003d48:	00700c93          	li	s9,7
    80003d4c:	f8d403a3          	sb	a3,-121(s0)
    80003d50:	00075c63          	bgez	a4,80003d68 <__printf+0x410>
    80003d54:	f9040713          	addi	a4,s0,-112
    80003d58:	00f70733          	add	a4,a4,a5
    80003d5c:	02d00693          	li	a3,45
    80003d60:	fed70823          	sb	a3,-16(a4)
    80003d64:	00078c93          	mv	s9,a5
    80003d68:	f8040793          	addi	a5,s0,-128
    80003d6c:	01978cb3          	add	s9,a5,s9
    80003d70:	f7f40d13          	addi	s10,s0,-129
    80003d74:	000cc503          	lbu	a0,0(s9)
    80003d78:	fffc8c93          	addi	s9,s9,-1
    80003d7c:	00000097          	auipc	ra,0x0
    80003d80:	9f8080e7          	jalr	-1544(ra) # 80003774 <consputc>
    80003d84:	ff9d18e3          	bne	s10,s9,80003d74 <__printf+0x41c>
    80003d88:	0100006f          	j	80003d98 <__printf+0x440>
    80003d8c:	00000097          	auipc	ra,0x0
    80003d90:	9e8080e7          	jalr	-1560(ra) # 80003774 <consputc>
    80003d94:	000c8493          	mv	s1,s9
    80003d98:	00094503          	lbu	a0,0(s2)
    80003d9c:	c60510e3          	bnez	a0,800039fc <__printf+0xa4>
    80003da0:	e40c0ee3          	beqz	s8,80003bfc <__printf+0x2a4>
    80003da4:	00003517          	auipc	a0,0x3
    80003da8:	4cc50513          	addi	a0,a0,1228 # 80007270 <pr>
    80003dac:	00001097          	auipc	ra,0x1
    80003db0:	94c080e7          	jalr	-1716(ra) # 800046f8 <release>
    80003db4:	e49ff06f          	j	80003bfc <__printf+0x2a4>
    80003db8:	f7843783          	ld	a5,-136(s0)
    80003dbc:	03000513          	li	a0,48
    80003dc0:	01000d13          	li	s10,16
    80003dc4:	00878713          	addi	a4,a5,8
    80003dc8:	0007bc83          	ld	s9,0(a5)
    80003dcc:	f6e43c23          	sd	a4,-136(s0)
    80003dd0:	00000097          	auipc	ra,0x0
    80003dd4:	9a4080e7          	jalr	-1628(ra) # 80003774 <consputc>
    80003dd8:	07800513          	li	a0,120
    80003ddc:	00000097          	auipc	ra,0x0
    80003de0:	998080e7          	jalr	-1640(ra) # 80003774 <consputc>
    80003de4:	00001d97          	auipc	s11,0x1
    80003de8:	4dcd8d93          	addi	s11,s11,1244 # 800052c0 <digits>
    80003dec:	03ccd793          	srli	a5,s9,0x3c
    80003df0:	00fd87b3          	add	a5,s11,a5
    80003df4:	0007c503          	lbu	a0,0(a5)
    80003df8:	fffd0d1b          	addiw	s10,s10,-1
    80003dfc:	004c9c93          	slli	s9,s9,0x4
    80003e00:	00000097          	auipc	ra,0x0
    80003e04:	974080e7          	jalr	-1676(ra) # 80003774 <consputc>
    80003e08:	fe0d12e3          	bnez	s10,80003dec <__printf+0x494>
    80003e0c:	f8dff06f          	j	80003d98 <__printf+0x440>
    80003e10:	f7843783          	ld	a5,-136(s0)
    80003e14:	0007bc83          	ld	s9,0(a5)
    80003e18:	00878793          	addi	a5,a5,8
    80003e1c:	f6f43c23          	sd	a5,-136(s0)
    80003e20:	000c9a63          	bnez	s9,80003e34 <__printf+0x4dc>
    80003e24:	1080006f          	j	80003f2c <__printf+0x5d4>
    80003e28:	001c8c93          	addi	s9,s9,1
    80003e2c:	00000097          	auipc	ra,0x0
    80003e30:	948080e7          	jalr	-1720(ra) # 80003774 <consputc>
    80003e34:	000cc503          	lbu	a0,0(s9)
    80003e38:	fe0518e3          	bnez	a0,80003e28 <__printf+0x4d0>
    80003e3c:	f5dff06f          	j	80003d98 <__printf+0x440>
    80003e40:	02500513          	li	a0,37
    80003e44:	00000097          	auipc	ra,0x0
    80003e48:	930080e7          	jalr	-1744(ra) # 80003774 <consputc>
    80003e4c:	000c8513          	mv	a0,s9
    80003e50:	00000097          	auipc	ra,0x0
    80003e54:	924080e7          	jalr	-1756(ra) # 80003774 <consputc>
    80003e58:	f41ff06f          	j	80003d98 <__printf+0x440>
    80003e5c:	02500513          	li	a0,37
    80003e60:	00000097          	auipc	ra,0x0
    80003e64:	914080e7          	jalr	-1772(ra) # 80003774 <consputc>
    80003e68:	f31ff06f          	j	80003d98 <__printf+0x440>
    80003e6c:	00030513          	mv	a0,t1
    80003e70:	00000097          	auipc	ra,0x0
    80003e74:	7bc080e7          	jalr	1980(ra) # 8000462c <acquire>
    80003e78:	b4dff06f          	j	800039c4 <__printf+0x6c>
    80003e7c:	40c0053b          	negw	a0,a2
    80003e80:	00a00713          	li	a4,10
    80003e84:	02e576bb          	remuw	a3,a0,a4
    80003e88:	00001d97          	auipc	s11,0x1
    80003e8c:	438d8d93          	addi	s11,s11,1080 # 800052c0 <digits>
    80003e90:	ff700593          	li	a1,-9
    80003e94:	02069693          	slli	a3,a3,0x20
    80003e98:	0206d693          	srli	a3,a3,0x20
    80003e9c:	00dd86b3          	add	a3,s11,a3
    80003ea0:	0006c683          	lbu	a3,0(a3)
    80003ea4:	02e557bb          	divuw	a5,a0,a4
    80003ea8:	f8d40023          	sb	a3,-128(s0)
    80003eac:	10b65e63          	bge	a2,a1,80003fc8 <__printf+0x670>
    80003eb0:	06300593          	li	a1,99
    80003eb4:	02e7f6bb          	remuw	a3,a5,a4
    80003eb8:	02069693          	slli	a3,a3,0x20
    80003ebc:	0206d693          	srli	a3,a3,0x20
    80003ec0:	00dd86b3          	add	a3,s11,a3
    80003ec4:	0006c683          	lbu	a3,0(a3)
    80003ec8:	02e7d73b          	divuw	a4,a5,a4
    80003ecc:	00200793          	li	a5,2
    80003ed0:	f8d400a3          	sb	a3,-127(s0)
    80003ed4:	bca5ece3          	bltu	a1,a0,80003aac <__printf+0x154>
    80003ed8:	ce5ff06f          	j	80003bbc <__printf+0x264>
    80003edc:	40e007bb          	negw	a5,a4
    80003ee0:	00001d97          	auipc	s11,0x1
    80003ee4:	3e0d8d93          	addi	s11,s11,992 # 800052c0 <digits>
    80003ee8:	00f7f693          	andi	a3,a5,15
    80003eec:	00dd86b3          	add	a3,s11,a3
    80003ef0:	0006c583          	lbu	a1,0(a3)
    80003ef4:	ff100613          	li	a2,-15
    80003ef8:	0047d69b          	srliw	a3,a5,0x4
    80003efc:	f8b40023          	sb	a1,-128(s0)
    80003f00:	0047d59b          	srliw	a1,a5,0x4
    80003f04:	0ac75e63          	bge	a4,a2,80003fc0 <__printf+0x668>
    80003f08:	00f6f693          	andi	a3,a3,15
    80003f0c:	00dd86b3          	add	a3,s11,a3
    80003f10:	0006c603          	lbu	a2,0(a3)
    80003f14:	00f00693          	li	a3,15
    80003f18:	0087d79b          	srliw	a5,a5,0x8
    80003f1c:	f8c400a3          	sb	a2,-127(s0)
    80003f20:	d8b6e4e3          	bltu	a3,a1,80003ca8 <__printf+0x350>
    80003f24:	00200793          	li	a5,2
    80003f28:	e2dff06f          	j	80003d54 <__printf+0x3fc>
    80003f2c:	00001c97          	auipc	s9,0x1
    80003f30:	374c8c93          	addi	s9,s9,884 # 800052a0 <CONSOLE_STATUS+0x290>
    80003f34:	02800513          	li	a0,40
    80003f38:	ef1ff06f          	j	80003e28 <__printf+0x4d0>
    80003f3c:	00700793          	li	a5,7
    80003f40:	00600c93          	li	s9,6
    80003f44:	e0dff06f          	j	80003d50 <__printf+0x3f8>
    80003f48:	00700793          	li	a5,7
    80003f4c:	00600c93          	li	s9,6
    80003f50:	c69ff06f          	j	80003bb8 <__printf+0x260>
    80003f54:	00300793          	li	a5,3
    80003f58:	00200c93          	li	s9,2
    80003f5c:	c5dff06f          	j	80003bb8 <__printf+0x260>
    80003f60:	00300793          	li	a5,3
    80003f64:	00200c93          	li	s9,2
    80003f68:	de9ff06f          	j	80003d50 <__printf+0x3f8>
    80003f6c:	00400793          	li	a5,4
    80003f70:	00300c93          	li	s9,3
    80003f74:	dddff06f          	j	80003d50 <__printf+0x3f8>
    80003f78:	00400793          	li	a5,4
    80003f7c:	00300c93          	li	s9,3
    80003f80:	c39ff06f          	j	80003bb8 <__printf+0x260>
    80003f84:	00500793          	li	a5,5
    80003f88:	00400c93          	li	s9,4
    80003f8c:	c2dff06f          	j	80003bb8 <__printf+0x260>
    80003f90:	00500793          	li	a5,5
    80003f94:	00400c93          	li	s9,4
    80003f98:	db9ff06f          	j	80003d50 <__printf+0x3f8>
    80003f9c:	00600793          	li	a5,6
    80003fa0:	00500c93          	li	s9,5
    80003fa4:	dadff06f          	j	80003d50 <__printf+0x3f8>
    80003fa8:	00600793          	li	a5,6
    80003fac:	00500c93          	li	s9,5
    80003fb0:	c09ff06f          	j	80003bb8 <__printf+0x260>
    80003fb4:	00800793          	li	a5,8
    80003fb8:	00700c93          	li	s9,7
    80003fbc:	bfdff06f          	j	80003bb8 <__printf+0x260>
    80003fc0:	00100793          	li	a5,1
    80003fc4:	d91ff06f          	j	80003d54 <__printf+0x3fc>
    80003fc8:	00100793          	li	a5,1
    80003fcc:	bf1ff06f          	j	80003bbc <__printf+0x264>
    80003fd0:	00900793          	li	a5,9
    80003fd4:	00800c93          	li	s9,8
    80003fd8:	be1ff06f          	j	80003bb8 <__printf+0x260>
    80003fdc:	00001517          	auipc	a0,0x1
    80003fe0:	2cc50513          	addi	a0,a0,716 # 800052a8 <CONSOLE_STATUS+0x298>
    80003fe4:	00000097          	auipc	ra,0x0
    80003fe8:	918080e7          	jalr	-1768(ra) # 800038fc <panic>

0000000080003fec <printfinit>:
    80003fec:	fe010113          	addi	sp,sp,-32
    80003ff0:	00813823          	sd	s0,16(sp)
    80003ff4:	00913423          	sd	s1,8(sp)
    80003ff8:	00113c23          	sd	ra,24(sp)
    80003ffc:	02010413          	addi	s0,sp,32
    80004000:	00003497          	auipc	s1,0x3
    80004004:	27048493          	addi	s1,s1,624 # 80007270 <pr>
    80004008:	00048513          	mv	a0,s1
    8000400c:	00001597          	auipc	a1,0x1
    80004010:	2ac58593          	addi	a1,a1,684 # 800052b8 <CONSOLE_STATUS+0x2a8>
    80004014:	00000097          	auipc	ra,0x0
    80004018:	5f4080e7          	jalr	1524(ra) # 80004608 <initlock>
    8000401c:	01813083          	ld	ra,24(sp)
    80004020:	01013403          	ld	s0,16(sp)
    80004024:	0004ac23          	sw	zero,24(s1)
    80004028:	00813483          	ld	s1,8(sp)
    8000402c:	02010113          	addi	sp,sp,32
    80004030:	00008067          	ret

0000000080004034 <uartinit>:
    80004034:	ff010113          	addi	sp,sp,-16
    80004038:	00813423          	sd	s0,8(sp)
    8000403c:	01010413          	addi	s0,sp,16
    80004040:	100007b7          	lui	a5,0x10000
    80004044:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004048:	f8000713          	li	a4,-128
    8000404c:	00e781a3          	sb	a4,3(a5)
    80004050:	00300713          	li	a4,3
    80004054:	00e78023          	sb	a4,0(a5)
    80004058:	000780a3          	sb	zero,1(a5)
    8000405c:	00e781a3          	sb	a4,3(a5)
    80004060:	00700693          	li	a3,7
    80004064:	00d78123          	sb	a3,2(a5)
    80004068:	00e780a3          	sb	a4,1(a5)
    8000406c:	00813403          	ld	s0,8(sp)
    80004070:	01010113          	addi	sp,sp,16
    80004074:	00008067          	ret

0000000080004078 <uartputc>:
    80004078:	00002797          	auipc	a5,0x2
    8000407c:	f607a783          	lw	a5,-160(a5) # 80005fd8 <panicked>
    80004080:	00078463          	beqz	a5,80004088 <uartputc+0x10>
    80004084:	0000006f          	j	80004084 <uartputc+0xc>
    80004088:	fd010113          	addi	sp,sp,-48
    8000408c:	02813023          	sd	s0,32(sp)
    80004090:	00913c23          	sd	s1,24(sp)
    80004094:	01213823          	sd	s2,16(sp)
    80004098:	01313423          	sd	s3,8(sp)
    8000409c:	02113423          	sd	ra,40(sp)
    800040a0:	03010413          	addi	s0,sp,48
    800040a4:	00002917          	auipc	s2,0x2
    800040a8:	f3c90913          	addi	s2,s2,-196 # 80005fe0 <uart_tx_r>
    800040ac:	00093783          	ld	a5,0(s2)
    800040b0:	00002497          	auipc	s1,0x2
    800040b4:	f3848493          	addi	s1,s1,-200 # 80005fe8 <uart_tx_w>
    800040b8:	0004b703          	ld	a4,0(s1)
    800040bc:	02078693          	addi	a3,a5,32
    800040c0:	00050993          	mv	s3,a0
    800040c4:	02e69c63          	bne	a3,a4,800040fc <uartputc+0x84>
    800040c8:	00001097          	auipc	ra,0x1
    800040cc:	834080e7          	jalr	-1996(ra) # 800048fc <push_on>
    800040d0:	00093783          	ld	a5,0(s2)
    800040d4:	0004b703          	ld	a4,0(s1)
    800040d8:	02078793          	addi	a5,a5,32
    800040dc:	00e79463          	bne	a5,a4,800040e4 <uartputc+0x6c>
    800040e0:	0000006f          	j	800040e0 <uartputc+0x68>
    800040e4:	00001097          	auipc	ra,0x1
    800040e8:	88c080e7          	jalr	-1908(ra) # 80004970 <pop_on>
    800040ec:	00093783          	ld	a5,0(s2)
    800040f0:	0004b703          	ld	a4,0(s1)
    800040f4:	02078693          	addi	a3,a5,32
    800040f8:	fce688e3          	beq	a3,a4,800040c8 <uartputc+0x50>
    800040fc:	01f77693          	andi	a3,a4,31
    80004100:	00003597          	auipc	a1,0x3
    80004104:	19058593          	addi	a1,a1,400 # 80007290 <uart_tx_buf>
    80004108:	00d586b3          	add	a3,a1,a3
    8000410c:	00170713          	addi	a4,a4,1
    80004110:	01368023          	sb	s3,0(a3)
    80004114:	00e4b023          	sd	a4,0(s1)
    80004118:	10000637          	lui	a2,0x10000
    8000411c:	02f71063          	bne	a4,a5,8000413c <uartputc+0xc4>
    80004120:	0340006f          	j	80004154 <uartputc+0xdc>
    80004124:	00074703          	lbu	a4,0(a4)
    80004128:	00f93023          	sd	a5,0(s2)
    8000412c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004130:	00093783          	ld	a5,0(s2)
    80004134:	0004b703          	ld	a4,0(s1)
    80004138:	00f70e63          	beq	a4,a5,80004154 <uartputc+0xdc>
    8000413c:	00564683          	lbu	a3,5(a2)
    80004140:	01f7f713          	andi	a4,a5,31
    80004144:	00e58733          	add	a4,a1,a4
    80004148:	0206f693          	andi	a3,a3,32
    8000414c:	00178793          	addi	a5,a5,1
    80004150:	fc069ae3          	bnez	a3,80004124 <uartputc+0xac>
    80004154:	02813083          	ld	ra,40(sp)
    80004158:	02013403          	ld	s0,32(sp)
    8000415c:	01813483          	ld	s1,24(sp)
    80004160:	01013903          	ld	s2,16(sp)
    80004164:	00813983          	ld	s3,8(sp)
    80004168:	03010113          	addi	sp,sp,48
    8000416c:	00008067          	ret

0000000080004170 <uartputc_sync>:
    80004170:	ff010113          	addi	sp,sp,-16
    80004174:	00813423          	sd	s0,8(sp)
    80004178:	01010413          	addi	s0,sp,16
    8000417c:	00002717          	auipc	a4,0x2
    80004180:	e5c72703          	lw	a4,-420(a4) # 80005fd8 <panicked>
    80004184:	02071663          	bnez	a4,800041b0 <uartputc_sync+0x40>
    80004188:	00050793          	mv	a5,a0
    8000418c:	100006b7          	lui	a3,0x10000
    80004190:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004194:	02077713          	andi	a4,a4,32
    80004198:	fe070ce3          	beqz	a4,80004190 <uartputc_sync+0x20>
    8000419c:	0ff7f793          	andi	a5,a5,255
    800041a0:	00f68023          	sb	a5,0(a3)
    800041a4:	00813403          	ld	s0,8(sp)
    800041a8:	01010113          	addi	sp,sp,16
    800041ac:	00008067          	ret
    800041b0:	0000006f          	j	800041b0 <uartputc_sync+0x40>

00000000800041b4 <uartstart>:
    800041b4:	ff010113          	addi	sp,sp,-16
    800041b8:	00813423          	sd	s0,8(sp)
    800041bc:	01010413          	addi	s0,sp,16
    800041c0:	00002617          	auipc	a2,0x2
    800041c4:	e2060613          	addi	a2,a2,-480 # 80005fe0 <uart_tx_r>
    800041c8:	00002517          	auipc	a0,0x2
    800041cc:	e2050513          	addi	a0,a0,-480 # 80005fe8 <uart_tx_w>
    800041d0:	00063783          	ld	a5,0(a2)
    800041d4:	00053703          	ld	a4,0(a0)
    800041d8:	04f70263          	beq	a4,a5,8000421c <uartstart+0x68>
    800041dc:	100005b7          	lui	a1,0x10000
    800041e0:	00003817          	auipc	a6,0x3
    800041e4:	0b080813          	addi	a6,a6,176 # 80007290 <uart_tx_buf>
    800041e8:	01c0006f          	j	80004204 <uartstart+0x50>
    800041ec:	0006c703          	lbu	a4,0(a3)
    800041f0:	00f63023          	sd	a5,0(a2)
    800041f4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800041f8:	00063783          	ld	a5,0(a2)
    800041fc:	00053703          	ld	a4,0(a0)
    80004200:	00f70e63          	beq	a4,a5,8000421c <uartstart+0x68>
    80004204:	01f7f713          	andi	a4,a5,31
    80004208:	00e806b3          	add	a3,a6,a4
    8000420c:	0055c703          	lbu	a4,5(a1)
    80004210:	00178793          	addi	a5,a5,1
    80004214:	02077713          	andi	a4,a4,32
    80004218:	fc071ae3          	bnez	a4,800041ec <uartstart+0x38>
    8000421c:	00813403          	ld	s0,8(sp)
    80004220:	01010113          	addi	sp,sp,16
    80004224:	00008067          	ret

0000000080004228 <uartgetc>:
    80004228:	ff010113          	addi	sp,sp,-16
    8000422c:	00813423          	sd	s0,8(sp)
    80004230:	01010413          	addi	s0,sp,16
    80004234:	10000737          	lui	a4,0x10000
    80004238:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000423c:	0017f793          	andi	a5,a5,1
    80004240:	00078c63          	beqz	a5,80004258 <uartgetc+0x30>
    80004244:	00074503          	lbu	a0,0(a4)
    80004248:	0ff57513          	andi	a0,a0,255
    8000424c:	00813403          	ld	s0,8(sp)
    80004250:	01010113          	addi	sp,sp,16
    80004254:	00008067          	ret
    80004258:	fff00513          	li	a0,-1
    8000425c:	ff1ff06f          	j	8000424c <uartgetc+0x24>

0000000080004260 <uartintr>:
    80004260:	100007b7          	lui	a5,0x10000
    80004264:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004268:	0017f793          	andi	a5,a5,1
    8000426c:	0a078463          	beqz	a5,80004314 <uartintr+0xb4>
    80004270:	fe010113          	addi	sp,sp,-32
    80004274:	00813823          	sd	s0,16(sp)
    80004278:	00913423          	sd	s1,8(sp)
    8000427c:	00113c23          	sd	ra,24(sp)
    80004280:	02010413          	addi	s0,sp,32
    80004284:	100004b7          	lui	s1,0x10000
    80004288:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000428c:	0ff57513          	andi	a0,a0,255
    80004290:	fffff097          	auipc	ra,0xfffff
    80004294:	534080e7          	jalr	1332(ra) # 800037c4 <consoleintr>
    80004298:	0054c783          	lbu	a5,5(s1)
    8000429c:	0017f793          	andi	a5,a5,1
    800042a0:	fe0794e3          	bnez	a5,80004288 <uartintr+0x28>
    800042a4:	00002617          	auipc	a2,0x2
    800042a8:	d3c60613          	addi	a2,a2,-708 # 80005fe0 <uart_tx_r>
    800042ac:	00002517          	auipc	a0,0x2
    800042b0:	d3c50513          	addi	a0,a0,-708 # 80005fe8 <uart_tx_w>
    800042b4:	00063783          	ld	a5,0(a2)
    800042b8:	00053703          	ld	a4,0(a0)
    800042bc:	04f70263          	beq	a4,a5,80004300 <uartintr+0xa0>
    800042c0:	100005b7          	lui	a1,0x10000
    800042c4:	00003817          	auipc	a6,0x3
    800042c8:	fcc80813          	addi	a6,a6,-52 # 80007290 <uart_tx_buf>
    800042cc:	01c0006f          	j	800042e8 <uartintr+0x88>
    800042d0:	0006c703          	lbu	a4,0(a3)
    800042d4:	00f63023          	sd	a5,0(a2)
    800042d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800042dc:	00063783          	ld	a5,0(a2)
    800042e0:	00053703          	ld	a4,0(a0)
    800042e4:	00f70e63          	beq	a4,a5,80004300 <uartintr+0xa0>
    800042e8:	01f7f713          	andi	a4,a5,31
    800042ec:	00e806b3          	add	a3,a6,a4
    800042f0:	0055c703          	lbu	a4,5(a1)
    800042f4:	00178793          	addi	a5,a5,1
    800042f8:	02077713          	andi	a4,a4,32
    800042fc:	fc071ae3          	bnez	a4,800042d0 <uartintr+0x70>
    80004300:	01813083          	ld	ra,24(sp)
    80004304:	01013403          	ld	s0,16(sp)
    80004308:	00813483          	ld	s1,8(sp)
    8000430c:	02010113          	addi	sp,sp,32
    80004310:	00008067          	ret
    80004314:	00002617          	auipc	a2,0x2
    80004318:	ccc60613          	addi	a2,a2,-820 # 80005fe0 <uart_tx_r>
    8000431c:	00002517          	auipc	a0,0x2
    80004320:	ccc50513          	addi	a0,a0,-820 # 80005fe8 <uart_tx_w>
    80004324:	00063783          	ld	a5,0(a2)
    80004328:	00053703          	ld	a4,0(a0)
    8000432c:	04f70263          	beq	a4,a5,80004370 <uartintr+0x110>
    80004330:	100005b7          	lui	a1,0x10000
    80004334:	00003817          	auipc	a6,0x3
    80004338:	f5c80813          	addi	a6,a6,-164 # 80007290 <uart_tx_buf>
    8000433c:	01c0006f          	j	80004358 <uartintr+0xf8>
    80004340:	0006c703          	lbu	a4,0(a3)
    80004344:	00f63023          	sd	a5,0(a2)
    80004348:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000434c:	00063783          	ld	a5,0(a2)
    80004350:	00053703          	ld	a4,0(a0)
    80004354:	02f70063          	beq	a4,a5,80004374 <uartintr+0x114>
    80004358:	01f7f713          	andi	a4,a5,31
    8000435c:	00e806b3          	add	a3,a6,a4
    80004360:	0055c703          	lbu	a4,5(a1)
    80004364:	00178793          	addi	a5,a5,1
    80004368:	02077713          	andi	a4,a4,32
    8000436c:	fc071ae3          	bnez	a4,80004340 <uartintr+0xe0>
    80004370:	00008067          	ret
    80004374:	00008067          	ret

0000000080004378 <kinit>:
    80004378:	fc010113          	addi	sp,sp,-64
    8000437c:	02913423          	sd	s1,40(sp)
    80004380:	fffff7b7          	lui	a5,0xfffff
    80004384:	00004497          	auipc	s1,0x4
    80004388:	f2b48493          	addi	s1,s1,-213 # 800082af <end+0xfff>
    8000438c:	02813823          	sd	s0,48(sp)
    80004390:	01313c23          	sd	s3,24(sp)
    80004394:	00f4f4b3          	and	s1,s1,a5
    80004398:	02113c23          	sd	ra,56(sp)
    8000439c:	03213023          	sd	s2,32(sp)
    800043a0:	01413823          	sd	s4,16(sp)
    800043a4:	01513423          	sd	s5,8(sp)
    800043a8:	04010413          	addi	s0,sp,64
    800043ac:	000017b7          	lui	a5,0x1
    800043b0:	01100993          	li	s3,17
    800043b4:	00f487b3          	add	a5,s1,a5
    800043b8:	01b99993          	slli	s3,s3,0x1b
    800043bc:	06f9e063          	bltu	s3,a5,8000441c <kinit+0xa4>
    800043c0:	00003a97          	auipc	s5,0x3
    800043c4:	ef0a8a93          	addi	s5,s5,-272 # 800072b0 <end>
    800043c8:	0754ec63          	bltu	s1,s5,80004440 <kinit+0xc8>
    800043cc:	0734fa63          	bgeu	s1,s3,80004440 <kinit+0xc8>
    800043d0:	00088a37          	lui	s4,0x88
    800043d4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800043d8:	00002917          	auipc	s2,0x2
    800043dc:	c1890913          	addi	s2,s2,-1000 # 80005ff0 <kmem>
    800043e0:	00ca1a13          	slli	s4,s4,0xc
    800043e4:	0140006f          	j	800043f8 <kinit+0x80>
    800043e8:	000017b7          	lui	a5,0x1
    800043ec:	00f484b3          	add	s1,s1,a5
    800043f0:	0554e863          	bltu	s1,s5,80004440 <kinit+0xc8>
    800043f4:	0534f663          	bgeu	s1,s3,80004440 <kinit+0xc8>
    800043f8:	00001637          	lui	a2,0x1
    800043fc:	00100593          	li	a1,1
    80004400:	00048513          	mv	a0,s1
    80004404:	00000097          	auipc	ra,0x0
    80004408:	5e4080e7          	jalr	1508(ra) # 800049e8 <__memset>
    8000440c:	00093783          	ld	a5,0(s2)
    80004410:	00f4b023          	sd	a5,0(s1)
    80004414:	00993023          	sd	s1,0(s2)
    80004418:	fd4498e3          	bne	s1,s4,800043e8 <kinit+0x70>
    8000441c:	03813083          	ld	ra,56(sp)
    80004420:	03013403          	ld	s0,48(sp)
    80004424:	02813483          	ld	s1,40(sp)
    80004428:	02013903          	ld	s2,32(sp)
    8000442c:	01813983          	ld	s3,24(sp)
    80004430:	01013a03          	ld	s4,16(sp)
    80004434:	00813a83          	ld	s5,8(sp)
    80004438:	04010113          	addi	sp,sp,64
    8000443c:	00008067          	ret
    80004440:	00001517          	auipc	a0,0x1
    80004444:	e9850513          	addi	a0,a0,-360 # 800052d8 <digits+0x18>
    80004448:	fffff097          	auipc	ra,0xfffff
    8000444c:	4b4080e7          	jalr	1204(ra) # 800038fc <panic>

0000000080004450 <freerange>:
    80004450:	fc010113          	addi	sp,sp,-64
    80004454:	000017b7          	lui	a5,0x1
    80004458:	02913423          	sd	s1,40(sp)
    8000445c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004460:	009504b3          	add	s1,a0,s1
    80004464:	fffff537          	lui	a0,0xfffff
    80004468:	02813823          	sd	s0,48(sp)
    8000446c:	02113c23          	sd	ra,56(sp)
    80004470:	03213023          	sd	s2,32(sp)
    80004474:	01313c23          	sd	s3,24(sp)
    80004478:	01413823          	sd	s4,16(sp)
    8000447c:	01513423          	sd	s5,8(sp)
    80004480:	01613023          	sd	s6,0(sp)
    80004484:	04010413          	addi	s0,sp,64
    80004488:	00a4f4b3          	and	s1,s1,a0
    8000448c:	00f487b3          	add	a5,s1,a5
    80004490:	06f5e463          	bltu	a1,a5,800044f8 <freerange+0xa8>
    80004494:	00003a97          	auipc	s5,0x3
    80004498:	e1ca8a93          	addi	s5,s5,-484 # 800072b0 <end>
    8000449c:	0954e263          	bltu	s1,s5,80004520 <freerange+0xd0>
    800044a0:	01100993          	li	s3,17
    800044a4:	01b99993          	slli	s3,s3,0x1b
    800044a8:	0734fc63          	bgeu	s1,s3,80004520 <freerange+0xd0>
    800044ac:	00058a13          	mv	s4,a1
    800044b0:	00002917          	auipc	s2,0x2
    800044b4:	b4090913          	addi	s2,s2,-1216 # 80005ff0 <kmem>
    800044b8:	00002b37          	lui	s6,0x2
    800044bc:	0140006f          	j	800044d0 <freerange+0x80>
    800044c0:	000017b7          	lui	a5,0x1
    800044c4:	00f484b3          	add	s1,s1,a5
    800044c8:	0554ec63          	bltu	s1,s5,80004520 <freerange+0xd0>
    800044cc:	0534fa63          	bgeu	s1,s3,80004520 <freerange+0xd0>
    800044d0:	00001637          	lui	a2,0x1
    800044d4:	00100593          	li	a1,1
    800044d8:	00048513          	mv	a0,s1
    800044dc:	00000097          	auipc	ra,0x0
    800044e0:	50c080e7          	jalr	1292(ra) # 800049e8 <__memset>
    800044e4:	00093703          	ld	a4,0(s2)
    800044e8:	016487b3          	add	a5,s1,s6
    800044ec:	00e4b023          	sd	a4,0(s1)
    800044f0:	00993023          	sd	s1,0(s2)
    800044f4:	fcfa76e3          	bgeu	s4,a5,800044c0 <freerange+0x70>
    800044f8:	03813083          	ld	ra,56(sp)
    800044fc:	03013403          	ld	s0,48(sp)
    80004500:	02813483          	ld	s1,40(sp)
    80004504:	02013903          	ld	s2,32(sp)
    80004508:	01813983          	ld	s3,24(sp)
    8000450c:	01013a03          	ld	s4,16(sp)
    80004510:	00813a83          	ld	s5,8(sp)
    80004514:	00013b03          	ld	s6,0(sp)
    80004518:	04010113          	addi	sp,sp,64
    8000451c:	00008067          	ret
    80004520:	00001517          	auipc	a0,0x1
    80004524:	db850513          	addi	a0,a0,-584 # 800052d8 <digits+0x18>
    80004528:	fffff097          	auipc	ra,0xfffff
    8000452c:	3d4080e7          	jalr	980(ra) # 800038fc <panic>

0000000080004530 <kfree>:
    80004530:	fe010113          	addi	sp,sp,-32
    80004534:	00813823          	sd	s0,16(sp)
    80004538:	00113c23          	sd	ra,24(sp)
    8000453c:	00913423          	sd	s1,8(sp)
    80004540:	02010413          	addi	s0,sp,32
    80004544:	03451793          	slli	a5,a0,0x34
    80004548:	04079c63          	bnez	a5,800045a0 <kfree+0x70>
    8000454c:	00003797          	auipc	a5,0x3
    80004550:	d6478793          	addi	a5,a5,-668 # 800072b0 <end>
    80004554:	00050493          	mv	s1,a0
    80004558:	04f56463          	bltu	a0,a5,800045a0 <kfree+0x70>
    8000455c:	01100793          	li	a5,17
    80004560:	01b79793          	slli	a5,a5,0x1b
    80004564:	02f57e63          	bgeu	a0,a5,800045a0 <kfree+0x70>
    80004568:	00001637          	lui	a2,0x1
    8000456c:	00100593          	li	a1,1
    80004570:	00000097          	auipc	ra,0x0
    80004574:	478080e7          	jalr	1144(ra) # 800049e8 <__memset>
    80004578:	00002797          	auipc	a5,0x2
    8000457c:	a7878793          	addi	a5,a5,-1416 # 80005ff0 <kmem>
    80004580:	0007b703          	ld	a4,0(a5)
    80004584:	01813083          	ld	ra,24(sp)
    80004588:	01013403          	ld	s0,16(sp)
    8000458c:	00e4b023          	sd	a4,0(s1)
    80004590:	0097b023          	sd	s1,0(a5)
    80004594:	00813483          	ld	s1,8(sp)
    80004598:	02010113          	addi	sp,sp,32
    8000459c:	00008067          	ret
    800045a0:	00001517          	auipc	a0,0x1
    800045a4:	d3850513          	addi	a0,a0,-712 # 800052d8 <digits+0x18>
    800045a8:	fffff097          	auipc	ra,0xfffff
    800045ac:	354080e7          	jalr	852(ra) # 800038fc <panic>

00000000800045b0 <kalloc>:
    800045b0:	fe010113          	addi	sp,sp,-32
    800045b4:	00813823          	sd	s0,16(sp)
    800045b8:	00913423          	sd	s1,8(sp)
    800045bc:	00113c23          	sd	ra,24(sp)
    800045c0:	02010413          	addi	s0,sp,32
    800045c4:	00002797          	auipc	a5,0x2
    800045c8:	a2c78793          	addi	a5,a5,-1492 # 80005ff0 <kmem>
    800045cc:	0007b483          	ld	s1,0(a5)
    800045d0:	02048063          	beqz	s1,800045f0 <kalloc+0x40>
    800045d4:	0004b703          	ld	a4,0(s1)
    800045d8:	00001637          	lui	a2,0x1
    800045dc:	00500593          	li	a1,5
    800045e0:	00048513          	mv	a0,s1
    800045e4:	00e7b023          	sd	a4,0(a5)
    800045e8:	00000097          	auipc	ra,0x0
    800045ec:	400080e7          	jalr	1024(ra) # 800049e8 <__memset>
    800045f0:	01813083          	ld	ra,24(sp)
    800045f4:	01013403          	ld	s0,16(sp)
    800045f8:	00048513          	mv	a0,s1
    800045fc:	00813483          	ld	s1,8(sp)
    80004600:	02010113          	addi	sp,sp,32
    80004604:	00008067          	ret

0000000080004608 <initlock>:
    80004608:	ff010113          	addi	sp,sp,-16
    8000460c:	00813423          	sd	s0,8(sp)
    80004610:	01010413          	addi	s0,sp,16
    80004614:	00813403          	ld	s0,8(sp)
    80004618:	00b53423          	sd	a1,8(a0)
    8000461c:	00052023          	sw	zero,0(a0)
    80004620:	00053823          	sd	zero,16(a0)
    80004624:	01010113          	addi	sp,sp,16
    80004628:	00008067          	ret

000000008000462c <acquire>:
    8000462c:	fe010113          	addi	sp,sp,-32
    80004630:	00813823          	sd	s0,16(sp)
    80004634:	00913423          	sd	s1,8(sp)
    80004638:	00113c23          	sd	ra,24(sp)
    8000463c:	01213023          	sd	s2,0(sp)
    80004640:	02010413          	addi	s0,sp,32
    80004644:	00050493          	mv	s1,a0
    80004648:	10002973          	csrr	s2,sstatus
    8000464c:	100027f3          	csrr	a5,sstatus
    80004650:	ffd7f793          	andi	a5,a5,-3
    80004654:	10079073          	csrw	sstatus,a5
    80004658:	fffff097          	auipc	ra,0xfffff
    8000465c:	8e8080e7          	jalr	-1816(ra) # 80002f40 <mycpu>
    80004660:	07852783          	lw	a5,120(a0)
    80004664:	06078e63          	beqz	a5,800046e0 <acquire+0xb4>
    80004668:	fffff097          	auipc	ra,0xfffff
    8000466c:	8d8080e7          	jalr	-1832(ra) # 80002f40 <mycpu>
    80004670:	07852783          	lw	a5,120(a0)
    80004674:	0004a703          	lw	a4,0(s1)
    80004678:	0017879b          	addiw	a5,a5,1
    8000467c:	06f52c23          	sw	a5,120(a0)
    80004680:	04071063          	bnez	a4,800046c0 <acquire+0x94>
    80004684:	00100713          	li	a4,1
    80004688:	00070793          	mv	a5,a4
    8000468c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004690:	0007879b          	sext.w	a5,a5
    80004694:	fe079ae3          	bnez	a5,80004688 <acquire+0x5c>
    80004698:	0ff0000f          	fence
    8000469c:	fffff097          	auipc	ra,0xfffff
    800046a0:	8a4080e7          	jalr	-1884(ra) # 80002f40 <mycpu>
    800046a4:	01813083          	ld	ra,24(sp)
    800046a8:	01013403          	ld	s0,16(sp)
    800046ac:	00a4b823          	sd	a0,16(s1)
    800046b0:	00013903          	ld	s2,0(sp)
    800046b4:	00813483          	ld	s1,8(sp)
    800046b8:	02010113          	addi	sp,sp,32
    800046bc:	00008067          	ret
    800046c0:	0104b903          	ld	s2,16(s1)
    800046c4:	fffff097          	auipc	ra,0xfffff
    800046c8:	87c080e7          	jalr	-1924(ra) # 80002f40 <mycpu>
    800046cc:	faa91ce3          	bne	s2,a0,80004684 <acquire+0x58>
    800046d0:	00001517          	auipc	a0,0x1
    800046d4:	c1050513          	addi	a0,a0,-1008 # 800052e0 <digits+0x20>
    800046d8:	fffff097          	auipc	ra,0xfffff
    800046dc:	224080e7          	jalr	548(ra) # 800038fc <panic>
    800046e0:	00195913          	srli	s2,s2,0x1
    800046e4:	fffff097          	auipc	ra,0xfffff
    800046e8:	85c080e7          	jalr	-1956(ra) # 80002f40 <mycpu>
    800046ec:	00197913          	andi	s2,s2,1
    800046f0:	07252e23          	sw	s2,124(a0)
    800046f4:	f75ff06f          	j	80004668 <acquire+0x3c>

00000000800046f8 <release>:
    800046f8:	fe010113          	addi	sp,sp,-32
    800046fc:	00813823          	sd	s0,16(sp)
    80004700:	00113c23          	sd	ra,24(sp)
    80004704:	00913423          	sd	s1,8(sp)
    80004708:	01213023          	sd	s2,0(sp)
    8000470c:	02010413          	addi	s0,sp,32
    80004710:	00052783          	lw	a5,0(a0)
    80004714:	00079a63          	bnez	a5,80004728 <release+0x30>
    80004718:	00001517          	auipc	a0,0x1
    8000471c:	bd050513          	addi	a0,a0,-1072 # 800052e8 <digits+0x28>
    80004720:	fffff097          	auipc	ra,0xfffff
    80004724:	1dc080e7          	jalr	476(ra) # 800038fc <panic>
    80004728:	01053903          	ld	s2,16(a0)
    8000472c:	00050493          	mv	s1,a0
    80004730:	fffff097          	auipc	ra,0xfffff
    80004734:	810080e7          	jalr	-2032(ra) # 80002f40 <mycpu>
    80004738:	fea910e3          	bne	s2,a0,80004718 <release+0x20>
    8000473c:	0004b823          	sd	zero,16(s1)
    80004740:	0ff0000f          	fence
    80004744:	0f50000f          	fence	iorw,ow
    80004748:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000474c:	ffffe097          	auipc	ra,0xffffe
    80004750:	7f4080e7          	jalr	2036(ra) # 80002f40 <mycpu>
    80004754:	100027f3          	csrr	a5,sstatus
    80004758:	0027f793          	andi	a5,a5,2
    8000475c:	04079a63          	bnez	a5,800047b0 <release+0xb8>
    80004760:	07852783          	lw	a5,120(a0)
    80004764:	02f05e63          	blez	a5,800047a0 <release+0xa8>
    80004768:	fff7871b          	addiw	a4,a5,-1
    8000476c:	06e52c23          	sw	a4,120(a0)
    80004770:	00071c63          	bnez	a4,80004788 <release+0x90>
    80004774:	07c52783          	lw	a5,124(a0)
    80004778:	00078863          	beqz	a5,80004788 <release+0x90>
    8000477c:	100027f3          	csrr	a5,sstatus
    80004780:	0027e793          	ori	a5,a5,2
    80004784:	10079073          	csrw	sstatus,a5
    80004788:	01813083          	ld	ra,24(sp)
    8000478c:	01013403          	ld	s0,16(sp)
    80004790:	00813483          	ld	s1,8(sp)
    80004794:	00013903          	ld	s2,0(sp)
    80004798:	02010113          	addi	sp,sp,32
    8000479c:	00008067          	ret
    800047a0:	00001517          	auipc	a0,0x1
    800047a4:	b6850513          	addi	a0,a0,-1176 # 80005308 <digits+0x48>
    800047a8:	fffff097          	auipc	ra,0xfffff
    800047ac:	154080e7          	jalr	340(ra) # 800038fc <panic>
    800047b0:	00001517          	auipc	a0,0x1
    800047b4:	b4050513          	addi	a0,a0,-1216 # 800052f0 <digits+0x30>
    800047b8:	fffff097          	auipc	ra,0xfffff
    800047bc:	144080e7          	jalr	324(ra) # 800038fc <panic>

00000000800047c0 <holding>:
    800047c0:	00052783          	lw	a5,0(a0)
    800047c4:	00079663          	bnez	a5,800047d0 <holding+0x10>
    800047c8:	00000513          	li	a0,0
    800047cc:	00008067          	ret
    800047d0:	fe010113          	addi	sp,sp,-32
    800047d4:	00813823          	sd	s0,16(sp)
    800047d8:	00913423          	sd	s1,8(sp)
    800047dc:	00113c23          	sd	ra,24(sp)
    800047e0:	02010413          	addi	s0,sp,32
    800047e4:	01053483          	ld	s1,16(a0)
    800047e8:	ffffe097          	auipc	ra,0xffffe
    800047ec:	758080e7          	jalr	1880(ra) # 80002f40 <mycpu>
    800047f0:	01813083          	ld	ra,24(sp)
    800047f4:	01013403          	ld	s0,16(sp)
    800047f8:	40a48533          	sub	a0,s1,a0
    800047fc:	00153513          	seqz	a0,a0
    80004800:	00813483          	ld	s1,8(sp)
    80004804:	02010113          	addi	sp,sp,32
    80004808:	00008067          	ret

000000008000480c <push_off>:
    8000480c:	fe010113          	addi	sp,sp,-32
    80004810:	00813823          	sd	s0,16(sp)
    80004814:	00113c23          	sd	ra,24(sp)
    80004818:	00913423          	sd	s1,8(sp)
    8000481c:	02010413          	addi	s0,sp,32
    80004820:	100024f3          	csrr	s1,sstatus
    80004824:	100027f3          	csrr	a5,sstatus
    80004828:	ffd7f793          	andi	a5,a5,-3
    8000482c:	10079073          	csrw	sstatus,a5
    80004830:	ffffe097          	auipc	ra,0xffffe
    80004834:	710080e7          	jalr	1808(ra) # 80002f40 <mycpu>
    80004838:	07852783          	lw	a5,120(a0)
    8000483c:	02078663          	beqz	a5,80004868 <push_off+0x5c>
    80004840:	ffffe097          	auipc	ra,0xffffe
    80004844:	700080e7          	jalr	1792(ra) # 80002f40 <mycpu>
    80004848:	07852783          	lw	a5,120(a0)
    8000484c:	01813083          	ld	ra,24(sp)
    80004850:	01013403          	ld	s0,16(sp)
    80004854:	0017879b          	addiw	a5,a5,1
    80004858:	06f52c23          	sw	a5,120(a0)
    8000485c:	00813483          	ld	s1,8(sp)
    80004860:	02010113          	addi	sp,sp,32
    80004864:	00008067          	ret
    80004868:	0014d493          	srli	s1,s1,0x1
    8000486c:	ffffe097          	auipc	ra,0xffffe
    80004870:	6d4080e7          	jalr	1748(ra) # 80002f40 <mycpu>
    80004874:	0014f493          	andi	s1,s1,1
    80004878:	06952e23          	sw	s1,124(a0)
    8000487c:	fc5ff06f          	j	80004840 <push_off+0x34>

0000000080004880 <pop_off>:
    80004880:	ff010113          	addi	sp,sp,-16
    80004884:	00813023          	sd	s0,0(sp)
    80004888:	00113423          	sd	ra,8(sp)
    8000488c:	01010413          	addi	s0,sp,16
    80004890:	ffffe097          	auipc	ra,0xffffe
    80004894:	6b0080e7          	jalr	1712(ra) # 80002f40 <mycpu>
    80004898:	100027f3          	csrr	a5,sstatus
    8000489c:	0027f793          	andi	a5,a5,2
    800048a0:	04079663          	bnez	a5,800048ec <pop_off+0x6c>
    800048a4:	07852783          	lw	a5,120(a0)
    800048a8:	02f05a63          	blez	a5,800048dc <pop_off+0x5c>
    800048ac:	fff7871b          	addiw	a4,a5,-1
    800048b0:	06e52c23          	sw	a4,120(a0)
    800048b4:	00071c63          	bnez	a4,800048cc <pop_off+0x4c>
    800048b8:	07c52783          	lw	a5,124(a0)
    800048bc:	00078863          	beqz	a5,800048cc <pop_off+0x4c>
    800048c0:	100027f3          	csrr	a5,sstatus
    800048c4:	0027e793          	ori	a5,a5,2
    800048c8:	10079073          	csrw	sstatus,a5
    800048cc:	00813083          	ld	ra,8(sp)
    800048d0:	00013403          	ld	s0,0(sp)
    800048d4:	01010113          	addi	sp,sp,16
    800048d8:	00008067          	ret
    800048dc:	00001517          	auipc	a0,0x1
    800048e0:	a2c50513          	addi	a0,a0,-1492 # 80005308 <digits+0x48>
    800048e4:	fffff097          	auipc	ra,0xfffff
    800048e8:	018080e7          	jalr	24(ra) # 800038fc <panic>
    800048ec:	00001517          	auipc	a0,0x1
    800048f0:	a0450513          	addi	a0,a0,-1532 # 800052f0 <digits+0x30>
    800048f4:	fffff097          	auipc	ra,0xfffff
    800048f8:	008080e7          	jalr	8(ra) # 800038fc <panic>

00000000800048fc <push_on>:
    800048fc:	fe010113          	addi	sp,sp,-32
    80004900:	00813823          	sd	s0,16(sp)
    80004904:	00113c23          	sd	ra,24(sp)
    80004908:	00913423          	sd	s1,8(sp)
    8000490c:	02010413          	addi	s0,sp,32
    80004910:	100024f3          	csrr	s1,sstatus
    80004914:	100027f3          	csrr	a5,sstatus
    80004918:	0027e793          	ori	a5,a5,2
    8000491c:	10079073          	csrw	sstatus,a5
    80004920:	ffffe097          	auipc	ra,0xffffe
    80004924:	620080e7          	jalr	1568(ra) # 80002f40 <mycpu>
    80004928:	07852783          	lw	a5,120(a0)
    8000492c:	02078663          	beqz	a5,80004958 <push_on+0x5c>
    80004930:	ffffe097          	auipc	ra,0xffffe
    80004934:	610080e7          	jalr	1552(ra) # 80002f40 <mycpu>
    80004938:	07852783          	lw	a5,120(a0)
    8000493c:	01813083          	ld	ra,24(sp)
    80004940:	01013403          	ld	s0,16(sp)
    80004944:	0017879b          	addiw	a5,a5,1
    80004948:	06f52c23          	sw	a5,120(a0)
    8000494c:	00813483          	ld	s1,8(sp)
    80004950:	02010113          	addi	sp,sp,32
    80004954:	00008067          	ret
    80004958:	0014d493          	srli	s1,s1,0x1
    8000495c:	ffffe097          	auipc	ra,0xffffe
    80004960:	5e4080e7          	jalr	1508(ra) # 80002f40 <mycpu>
    80004964:	0014f493          	andi	s1,s1,1
    80004968:	06952e23          	sw	s1,124(a0)
    8000496c:	fc5ff06f          	j	80004930 <push_on+0x34>

0000000080004970 <pop_on>:
    80004970:	ff010113          	addi	sp,sp,-16
    80004974:	00813023          	sd	s0,0(sp)
    80004978:	00113423          	sd	ra,8(sp)
    8000497c:	01010413          	addi	s0,sp,16
    80004980:	ffffe097          	auipc	ra,0xffffe
    80004984:	5c0080e7          	jalr	1472(ra) # 80002f40 <mycpu>
    80004988:	100027f3          	csrr	a5,sstatus
    8000498c:	0027f793          	andi	a5,a5,2
    80004990:	04078463          	beqz	a5,800049d8 <pop_on+0x68>
    80004994:	07852783          	lw	a5,120(a0)
    80004998:	02f05863          	blez	a5,800049c8 <pop_on+0x58>
    8000499c:	fff7879b          	addiw	a5,a5,-1
    800049a0:	06f52c23          	sw	a5,120(a0)
    800049a4:	07853783          	ld	a5,120(a0)
    800049a8:	00079863          	bnez	a5,800049b8 <pop_on+0x48>
    800049ac:	100027f3          	csrr	a5,sstatus
    800049b0:	ffd7f793          	andi	a5,a5,-3
    800049b4:	10079073          	csrw	sstatus,a5
    800049b8:	00813083          	ld	ra,8(sp)
    800049bc:	00013403          	ld	s0,0(sp)
    800049c0:	01010113          	addi	sp,sp,16
    800049c4:	00008067          	ret
    800049c8:	00001517          	auipc	a0,0x1
    800049cc:	96850513          	addi	a0,a0,-1688 # 80005330 <digits+0x70>
    800049d0:	fffff097          	auipc	ra,0xfffff
    800049d4:	f2c080e7          	jalr	-212(ra) # 800038fc <panic>
    800049d8:	00001517          	auipc	a0,0x1
    800049dc:	93850513          	addi	a0,a0,-1736 # 80005310 <digits+0x50>
    800049e0:	fffff097          	auipc	ra,0xfffff
    800049e4:	f1c080e7          	jalr	-228(ra) # 800038fc <panic>

00000000800049e8 <__memset>:
    800049e8:	ff010113          	addi	sp,sp,-16
    800049ec:	00813423          	sd	s0,8(sp)
    800049f0:	01010413          	addi	s0,sp,16
    800049f4:	1a060e63          	beqz	a2,80004bb0 <__memset+0x1c8>
    800049f8:	40a007b3          	neg	a5,a0
    800049fc:	0077f793          	andi	a5,a5,7
    80004a00:	00778693          	addi	a3,a5,7
    80004a04:	00b00813          	li	a6,11
    80004a08:	0ff5f593          	andi	a1,a1,255
    80004a0c:	fff6071b          	addiw	a4,a2,-1
    80004a10:	1b06e663          	bltu	a3,a6,80004bbc <__memset+0x1d4>
    80004a14:	1cd76463          	bltu	a4,a3,80004bdc <__memset+0x1f4>
    80004a18:	1a078e63          	beqz	a5,80004bd4 <__memset+0x1ec>
    80004a1c:	00b50023          	sb	a1,0(a0)
    80004a20:	00100713          	li	a4,1
    80004a24:	1ae78463          	beq	a5,a4,80004bcc <__memset+0x1e4>
    80004a28:	00b500a3          	sb	a1,1(a0)
    80004a2c:	00200713          	li	a4,2
    80004a30:	1ae78a63          	beq	a5,a4,80004be4 <__memset+0x1fc>
    80004a34:	00b50123          	sb	a1,2(a0)
    80004a38:	00300713          	li	a4,3
    80004a3c:	18e78463          	beq	a5,a4,80004bc4 <__memset+0x1dc>
    80004a40:	00b501a3          	sb	a1,3(a0)
    80004a44:	00400713          	li	a4,4
    80004a48:	1ae78263          	beq	a5,a4,80004bec <__memset+0x204>
    80004a4c:	00b50223          	sb	a1,4(a0)
    80004a50:	00500713          	li	a4,5
    80004a54:	1ae78063          	beq	a5,a4,80004bf4 <__memset+0x20c>
    80004a58:	00b502a3          	sb	a1,5(a0)
    80004a5c:	00700713          	li	a4,7
    80004a60:	18e79e63          	bne	a5,a4,80004bfc <__memset+0x214>
    80004a64:	00b50323          	sb	a1,6(a0)
    80004a68:	00700e93          	li	t4,7
    80004a6c:	00859713          	slli	a4,a1,0x8
    80004a70:	00e5e733          	or	a4,a1,a4
    80004a74:	01059e13          	slli	t3,a1,0x10
    80004a78:	01c76e33          	or	t3,a4,t3
    80004a7c:	01859313          	slli	t1,a1,0x18
    80004a80:	006e6333          	or	t1,t3,t1
    80004a84:	02059893          	slli	a7,a1,0x20
    80004a88:	40f60e3b          	subw	t3,a2,a5
    80004a8c:	011368b3          	or	a7,t1,a7
    80004a90:	02859813          	slli	a6,a1,0x28
    80004a94:	0108e833          	or	a6,a7,a6
    80004a98:	03059693          	slli	a3,a1,0x30
    80004a9c:	003e589b          	srliw	a7,t3,0x3
    80004aa0:	00d866b3          	or	a3,a6,a3
    80004aa4:	03859713          	slli	a4,a1,0x38
    80004aa8:	00389813          	slli	a6,a7,0x3
    80004aac:	00f507b3          	add	a5,a0,a5
    80004ab0:	00e6e733          	or	a4,a3,a4
    80004ab4:	000e089b          	sext.w	a7,t3
    80004ab8:	00f806b3          	add	a3,a6,a5
    80004abc:	00e7b023          	sd	a4,0(a5)
    80004ac0:	00878793          	addi	a5,a5,8
    80004ac4:	fed79ce3          	bne	a5,a3,80004abc <__memset+0xd4>
    80004ac8:	ff8e7793          	andi	a5,t3,-8
    80004acc:	0007871b          	sext.w	a4,a5
    80004ad0:	01d787bb          	addw	a5,a5,t4
    80004ad4:	0ce88e63          	beq	a7,a4,80004bb0 <__memset+0x1c8>
    80004ad8:	00f50733          	add	a4,a0,a5
    80004adc:	00b70023          	sb	a1,0(a4)
    80004ae0:	0017871b          	addiw	a4,a5,1
    80004ae4:	0cc77663          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004ae8:	00e50733          	add	a4,a0,a4
    80004aec:	00b70023          	sb	a1,0(a4)
    80004af0:	0027871b          	addiw	a4,a5,2
    80004af4:	0ac77e63          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004af8:	00e50733          	add	a4,a0,a4
    80004afc:	00b70023          	sb	a1,0(a4)
    80004b00:	0037871b          	addiw	a4,a5,3
    80004b04:	0ac77663          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b08:	00e50733          	add	a4,a0,a4
    80004b0c:	00b70023          	sb	a1,0(a4)
    80004b10:	0047871b          	addiw	a4,a5,4
    80004b14:	08c77e63          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b18:	00e50733          	add	a4,a0,a4
    80004b1c:	00b70023          	sb	a1,0(a4)
    80004b20:	0057871b          	addiw	a4,a5,5
    80004b24:	08c77663          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b28:	00e50733          	add	a4,a0,a4
    80004b2c:	00b70023          	sb	a1,0(a4)
    80004b30:	0067871b          	addiw	a4,a5,6
    80004b34:	06c77e63          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b38:	00e50733          	add	a4,a0,a4
    80004b3c:	00b70023          	sb	a1,0(a4)
    80004b40:	0077871b          	addiw	a4,a5,7
    80004b44:	06c77663          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b48:	00e50733          	add	a4,a0,a4
    80004b4c:	00b70023          	sb	a1,0(a4)
    80004b50:	0087871b          	addiw	a4,a5,8
    80004b54:	04c77e63          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b58:	00e50733          	add	a4,a0,a4
    80004b5c:	00b70023          	sb	a1,0(a4)
    80004b60:	0097871b          	addiw	a4,a5,9
    80004b64:	04c77663          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b68:	00e50733          	add	a4,a0,a4
    80004b6c:	00b70023          	sb	a1,0(a4)
    80004b70:	00a7871b          	addiw	a4,a5,10
    80004b74:	02c77e63          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b78:	00e50733          	add	a4,a0,a4
    80004b7c:	00b70023          	sb	a1,0(a4)
    80004b80:	00b7871b          	addiw	a4,a5,11
    80004b84:	02c77663          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b88:	00e50733          	add	a4,a0,a4
    80004b8c:	00b70023          	sb	a1,0(a4)
    80004b90:	00c7871b          	addiw	a4,a5,12
    80004b94:	00c77e63          	bgeu	a4,a2,80004bb0 <__memset+0x1c8>
    80004b98:	00e50733          	add	a4,a0,a4
    80004b9c:	00b70023          	sb	a1,0(a4)
    80004ba0:	00d7879b          	addiw	a5,a5,13
    80004ba4:	00c7f663          	bgeu	a5,a2,80004bb0 <__memset+0x1c8>
    80004ba8:	00f507b3          	add	a5,a0,a5
    80004bac:	00b78023          	sb	a1,0(a5)
    80004bb0:	00813403          	ld	s0,8(sp)
    80004bb4:	01010113          	addi	sp,sp,16
    80004bb8:	00008067          	ret
    80004bbc:	00b00693          	li	a3,11
    80004bc0:	e55ff06f          	j	80004a14 <__memset+0x2c>
    80004bc4:	00300e93          	li	t4,3
    80004bc8:	ea5ff06f          	j	80004a6c <__memset+0x84>
    80004bcc:	00100e93          	li	t4,1
    80004bd0:	e9dff06f          	j	80004a6c <__memset+0x84>
    80004bd4:	00000e93          	li	t4,0
    80004bd8:	e95ff06f          	j	80004a6c <__memset+0x84>
    80004bdc:	00000793          	li	a5,0
    80004be0:	ef9ff06f          	j	80004ad8 <__memset+0xf0>
    80004be4:	00200e93          	li	t4,2
    80004be8:	e85ff06f          	j	80004a6c <__memset+0x84>
    80004bec:	00400e93          	li	t4,4
    80004bf0:	e7dff06f          	j	80004a6c <__memset+0x84>
    80004bf4:	00500e93          	li	t4,5
    80004bf8:	e75ff06f          	j	80004a6c <__memset+0x84>
    80004bfc:	00600e93          	li	t4,6
    80004c00:	e6dff06f          	j	80004a6c <__memset+0x84>

0000000080004c04 <__memmove>:
    80004c04:	ff010113          	addi	sp,sp,-16
    80004c08:	00813423          	sd	s0,8(sp)
    80004c0c:	01010413          	addi	s0,sp,16
    80004c10:	0e060863          	beqz	a2,80004d00 <__memmove+0xfc>
    80004c14:	fff6069b          	addiw	a3,a2,-1
    80004c18:	0006881b          	sext.w	a6,a3
    80004c1c:	0ea5e863          	bltu	a1,a0,80004d0c <__memmove+0x108>
    80004c20:	00758713          	addi	a4,a1,7
    80004c24:	00a5e7b3          	or	a5,a1,a0
    80004c28:	40a70733          	sub	a4,a4,a0
    80004c2c:	0077f793          	andi	a5,a5,7
    80004c30:	00f73713          	sltiu	a4,a4,15
    80004c34:	00174713          	xori	a4,a4,1
    80004c38:	0017b793          	seqz	a5,a5
    80004c3c:	00e7f7b3          	and	a5,a5,a4
    80004c40:	10078863          	beqz	a5,80004d50 <__memmove+0x14c>
    80004c44:	00900793          	li	a5,9
    80004c48:	1107f463          	bgeu	a5,a6,80004d50 <__memmove+0x14c>
    80004c4c:	0036581b          	srliw	a6,a2,0x3
    80004c50:	fff8081b          	addiw	a6,a6,-1
    80004c54:	02081813          	slli	a6,a6,0x20
    80004c58:	01d85893          	srli	a7,a6,0x1d
    80004c5c:	00858813          	addi	a6,a1,8
    80004c60:	00058793          	mv	a5,a1
    80004c64:	00050713          	mv	a4,a0
    80004c68:	01088833          	add	a6,a7,a6
    80004c6c:	0007b883          	ld	a7,0(a5)
    80004c70:	00878793          	addi	a5,a5,8
    80004c74:	00870713          	addi	a4,a4,8
    80004c78:	ff173c23          	sd	a7,-8(a4)
    80004c7c:	ff0798e3          	bne	a5,a6,80004c6c <__memmove+0x68>
    80004c80:	ff867713          	andi	a4,a2,-8
    80004c84:	02071793          	slli	a5,a4,0x20
    80004c88:	0207d793          	srli	a5,a5,0x20
    80004c8c:	00f585b3          	add	a1,a1,a5
    80004c90:	40e686bb          	subw	a3,a3,a4
    80004c94:	00f507b3          	add	a5,a0,a5
    80004c98:	06e60463          	beq	a2,a4,80004d00 <__memmove+0xfc>
    80004c9c:	0005c703          	lbu	a4,0(a1)
    80004ca0:	00e78023          	sb	a4,0(a5)
    80004ca4:	04068e63          	beqz	a3,80004d00 <__memmove+0xfc>
    80004ca8:	0015c603          	lbu	a2,1(a1)
    80004cac:	00100713          	li	a4,1
    80004cb0:	00c780a3          	sb	a2,1(a5)
    80004cb4:	04e68663          	beq	a3,a4,80004d00 <__memmove+0xfc>
    80004cb8:	0025c603          	lbu	a2,2(a1)
    80004cbc:	00200713          	li	a4,2
    80004cc0:	00c78123          	sb	a2,2(a5)
    80004cc4:	02e68e63          	beq	a3,a4,80004d00 <__memmove+0xfc>
    80004cc8:	0035c603          	lbu	a2,3(a1)
    80004ccc:	00300713          	li	a4,3
    80004cd0:	00c781a3          	sb	a2,3(a5)
    80004cd4:	02e68663          	beq	a3,a4,80004d00 <__memmove+0xfc>
    80004cd8:	0045c603          	lbu	a2,4(a1)
    80004cdc:	00400713          	li	a4,4
    80004ce0:	00c78223          	sb	a2,4(a5)
    80004ce4:	00e68e63          	beq	a3,a4,80004d00 <__memmove+0xfc>
    80004ce8:	0055c603          	lbu	a2,5(a1)
    80004cec:	00500713          	li	a4,5
    80004cf0:	00c782a3          	sb	a2,5(a5)
    80004cf4:	00e68663          	beq	a3,a4,80004d00 <__memmove+0xfc>
    80004cf8:	0065c703          	lbu	a4,6(a1)
    80004cfc:	00e78323          	sb	a4,6(a5)
    80004d00:	00813403          	ld	s0,8(sp)
    80004d04:	01010113          	addi	sp,sp,16
    80004d08:	00008067          	ret
    80004d0c:	02061713          	slli	a4,a2,0x20
    80004d10:	02075713          	srli	a4,a4,0x20
    80004d14:	00e587b3          	add	a5,a1,a4
    80004d18:	f0f574e3          	bgeu	a0,a5,80004c20 <__memmove+0x1c>
    80004d1c:	02069613          	slli	a2,a3,0x20
    80004d20:	02065613          	srli	a2,a2,0x20
    80004d24:	fff64613          	not	a2,a2
    80004d28:	00e50733          	add	a4,a0,a4
    80004d2c:	00c78633          	add	a2,a5,a2
    80004d30:	fff7c683          	lbu	a3,-1(a5)
    80004d34:	fff78793          	addi	a5,a5,-1
    80004d38:	fff70713          	addi	a4,a4,-1
    80004d3c:	00d70023          	sb	a3,0(a4)
    80004d40:	fec798e3          	bne	a5,a2,80004d30 <__memmove+0x12c>
    80004d44:	00813403          	ld	s0,8(sp)
    80004d48:	01010113          	addi	sp,sp,16
    80004d4c:	00008067          	ret
    80004d50:	02069713          	slli	a4,a3,0x20
    80004d54:	02075713          	srli	a4,a4,0x20
    80004d58:	00170713          	addi	a4,a4,1
    80004d5c:	00e50733          	add	a4,a0,a4
    80004d60:	00050793          	mv	a5,a0
    80004d64:	0005c683          	lbu	a3,0(a1)
    80004d68:	00178793          	addi	a5,a5,1
    80004d6c:	00158593          	addi	a1,a1,1
    80004d70:	fed78fa3          	sb	a3,-1(a5)
    80004d74:	fee798e3          	bne	a5,a4,80004d64 <__memmove+0x160>
    80004d78:	f89ff06f          	j	80004d00 <__memmove+0xfc>

0000000080004d7c <__putc>:
    80004d7c:	fe010113          	addi	sp,sp,-32
    80004d80:	00813823          	sd	s0,16(sp)
    80004d84:	00113c23          	sd	ra,24(sp)
    80004d88:	02010413          	addi	s0,sp,32
    80004d8c:	00050793          	mv	a5,a0
    80004d90:	fef40593          	addi	a1,s0,-17
    80004d94:	00100613          	li	a2,1
    80004d98:	00000513          	li	a0,0
    80004d9c:	fef407a3          	sb	a5,-17(s0)
    80004da0:	fffff097          	auipc	ra,0xfffff
    80004da4:	b3c080e7          	jalr	-1220(ra) # 800038dc <console_write>
    80004da8:	01813083          	ld	ra,24(sp)
    80004dac:	01013403          	ld	s0,16(sp)
    80004db0:	02010113          	addi	sp,sp,32
    80004db4:	00008067          	ret

0000000080004db8 <__getc>:
    80004db8:	fe010113          	addi	sp,sp,-32
    80004dbc:	00813823          	sd	s0,16(sp)
    80004dc0:	00113c23          	sd	ra,24(sp)
    80004dc4:	02010413          	addi	s0,sp,32
    80004dc8:	fe840593          	addi	a1,s0,-24
    80004dcc:	00100613          	li	a2,1
    80004dd0:	00000513          	li	a0,0
    80004dd4:	fffff097          	auipc	ra,0xfffff
    80004dd8:	ae8080e7          	jalr	-1304(ra) # 800038bc <console_read>
    80004ddc:	fe844503          	lbu	a0,-24(s0)
    80004de0:	01813083          	ld	ra,24(sp)
    80004de4:	01013403          	ld	s0,16(sp)
    80004de8:	02010113          	addi	sp,sp,32
    80004dec:	00008067          	ret

0000000080004df0 <console_handler>:
    80004df0:	fe010113          	addi	sp,sp,-32
    80004df4:	00813823          	sd	s0,16(sp)
    80004df8:	00113c23          	sd	ra,24(sp)
    80004dfc:	00913423          	sd	s1,8(sp)
    80004e00:	02010413          	addi	s0,sp,32
    80004e04:	14202773          	csrr	a4,scause
    80004e08:	100027f3          	csrr	a5,sstatus
    80004e0c:	0027f793          	andi	a5,a5,2
    80004e10:	06079e63          	bnez	a5,80004e8c <console_handler+0x9c>
    80004e14:	00074c63          	bltz	a4,80004e2c <console_handler+0x3c>
    80004e18:	01813083          	ld	ra,24(sp)
    80004e1c:	01013403          	ld	s0,16(sp)
    80004e20:	00813483          	ld	s1,8(sp)
    80004e24:	02010113          	addi	sp,sp,32
    80004e28:	00008067          	ret
    80004e2c:	0ff77713          	andi	a4,a4,255
    80004e30:	00900793          	li	a5,9
    80004e34:	fef712e3          	bne	a4,a5,80004e18 <console_handler+0x28>
    80004e38:	ffffe097          	auipc	ra,0xffffe
    80004e3c:	6dc080e7          	jalr	1756(ra) # 80003514 <plic_claim>
    80004e40:	00a00793          	li	a5,10
    80004e44:	00050493          	mv	s1,a0
    80004e48:	02f50c63          	beq	a0,a5,80004e80 <console_handler+0x90>
    80004e4c:	fc0506e3          	beqz	a0,80004e18 <console_handler+0x28>
    80004e50:	00050593          	mv	a1,a0
    80004e54:	00000517          	auipc	a0,0x0
    80004e58:	3e450513          	addi	a0,a0,996 # 80005238 <CONSOLE_STATUS+0x228>
    80004e5c:	fffff097          	auipc	ra,0xfffff
    80004e60:	afc080e7          	jalr	-1284(ra) # 80003958 <__printf>
    80004e64:	01013403          	ld	s0,16(sp)
    80004e68:	01813083          	ld	ra,24(sp)
    80004e6c:	00048513          	mv	a0,s1
    80004e70:	00813483          	ld	s1,8(sp)
    80004e74:	02010113          	addi	sp,sp,32
    80004e78:	ffffe317          	auipc	t1,0xffffe
    80004e7c:	6d430067          	jr	1748(t1) # 8000354c <plic_complete>
    80004e80:	fffff097          	auipc	ra,0xfffff
    80004e84:	3e0080e7          	jalr	992(ra) # 80004260 <uartintr>
    80004e88:	fddff06f          	j	80004e64 <console_handler+0x74>
    80004e8c:	00000517          	auipc	a0,0x0
    80004e90:	4ac50513          	addi	a0,a0,1196 # 80005338 <digits+0x78>
    80004e94:	fffff097          	auipc	ra,0xfffff
    80004e98:	a68080e7          	jalr	-1432(ra) # 800038fc <panic>
	...
