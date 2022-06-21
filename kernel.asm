
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	fa813103          	ld	sp,-88(sp) # 80005fa8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	4d9020ef          	jal	ra,80002cf4 <start>

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
    800012b8:	0cf76663          	bltu	a4,a5,80001384 <trapHandler+0x110>
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
    800012e0:	668080e7          	jalr	1640(ra) # 80002944 <_ZN15MemoryAllocator9mem_allocEm>
                __putc('q');
    800012e4:	07100513          	li	a0,113
    800012e8:	00004097          	auipc	ra,0x4
    800012ec:	ad4080e7          	jalr	-1324(ra) # 80004dbc <__putc>
                uint64 volatile sstatus = Riscv::r_sstatus();
                _thread::resetTimeSliceCounter();
                _thread::dispatch();
                Riscv::w_sstatus(sstatus);
        }
        Riscv::w_sepc(sepc);
    800012f0:	fc843783          	ld	a5,-56(s0)
    return sepc;
}

inline void Riscv::w_sepc(uint64 sepc)
{
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800012f4:	14179073          	csrw	sepc,a5
    }
}
    800012f8:	03813083          	ld	ra,56(sp)
    800012fc:	03013403          	ld	s0,48(sp)
    80001300:	02813483          	ld	s1,40(sp)
    80001304:	04010113          	addi	sp,sp,64
    80001308:	00008067          	ret
                __asm__ volatile("mv %0, a1": "=r"(p));
    8000130c:	00058513          	mv	a0,a1
                MemoryAllocator::mem_free(p);
    80001310:	00001097          	auipc	ra,0x1
    80001314:	7f4080e7          	jalr	2036(ra) # 80002b04 <_ZN15MemoryAllocator8mem_freeEPv>
                break;}
    80001318:	fd9ff06f          	j	800012f0 <trapHandler+0x7c>
                __asm__ volatile("ld s1, 11*8(fp)");
    8000131c:	05843483          	ld	s1,88(s0)
                __asm__ volatile("ld s2, 12*8(fp)");
    80001320:	06043903          	ld	s2,96(s0)
                __asm__ volatile("ld s3, 13*8(fp)");
    80001324:	06843983          	ld	s3,104(s0)
                __asm__ volatile("ld s4, 14*8(fp)");
    80001328:	07043a03          	ld	s4,112(s0)
                __asm__ volatile("mv %0, s1": "=r"(handle));
    8000132c:	00048493          	mv	s1,s1
                __asm__ volatile("mv %0, s2": "=r"(body));
    80001330:	00090593          	mv	a1,s2
                __asm__ volatile("mv %0, s3": "=r"(arg));
    80001334:	00098693          	mv	a3,s3
                __asm__ volatile("mv %0, s4": "=r"(stack));
    80001338:	000a0613          	mv	a2,s4
                _thread::createThread(handle, body, stack, arg);
    8000133c:	00048513          	mv	a0,s1
    80001340:	00000097          	auipc	ra,0x0
    80001344:	26c080e7          	jalr	620(ra) # 800015ac <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_>
                (*handle)->start();
    80001348:	0004b503          	ld	a0,0(s1)
    8000134c:	00000097          	auipc	ra,0x0
    80001350:	3fc080e7          	jalr	1020(ra) # 80001748 <_ZN7_thread5startEv>
                if (!handle) {ret = -1;}
    80001354:	00048863          	beqz	s1,80001364 <trapHandler+0xf0>
                int ret = 0;
    80001358:	00000793          	li	a5,0
                __asm__ volatile("mv %0, a0" : :"r"(ret));
    8000135c:	00050793          	mv	a5,a0
                break;
    80001360:	f91ff06f          	j	800012f0 <trapHandler+0x7c>
                if (!handle) {ret = -1;}
    80001364:	fff00793          	li	a5,-1
    80001368:	ff5ff06f          	j	8000135c <trapHandler+0xe8>
                _thread::threadExit();
    8000136c:	00000097          	auipc	ra,0x0
    80001370:	208080e7          	jalr	520(ra) # 80001574 <_ZN7_thread10threadExitEv>
                break;
    80001374:	f7dff06f          	j	800012f0 <trapHandler+0x7c>
                _thread::dispatch();
    80001378:	00000097          	auipc	ra,0x0
    8000137c:	2e4080e7          	jalr	740(ra) # 8000165c <_ZN7_thread8dispatchEv>
                break;
    80001380:	f71ff06f          	j	800012f0 <trapHandler+0x7c>
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80001384:	100027f3          	csrr	a5,sstatus
    80001388:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    8000138c:	fd843783          	ld	a5,-40(s0)
                uint64 volatile sstatus = Riscv::r_sstatus();
    80001390:	fcf43823          	sd	a5,-48(s0)

    void setFinished(bool value) { finished = value; }

    uint64 getTimeSlice() const { return timeSlice; }

    static void resetTimeSliceCounter() { timeSliceCounter=0;}
    80001394:	00005797          	auipc	a5,0x5
    80001398:	c2c7b783          	ld	a5,-980(a5) # 80005fc0 <_GLOBAL_OFFSET_TABLE_+0x38>
    8000139c:	0007b023          	sd	zero,0(a5)
                _thread::dispatch();
    800013a0:	00000097          	auipc	ra,0x0
    800013a4:	2bc080e7          	jalr	700(ra) # 8000165c <_ZN7_thread8dispatchEv>
                Riscv::w_sstatus(sstatus);
    800013a8:	fd043783          	ld	a5,-48(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800013ac:	10079073          	csrw	sstatus,a5
}
    800013b0:	f41ff06f          	j	800012f0 <trapHandler+0x7c>

00000000800013b4 <_Z9mem_allocm>:

void* mem_alloc(size_t size){
    800013b4:	ff010113          	addi	sp,sp,-16
    800013b8:	00113423          	sd	ra,8(sp)
    800013bc:	00813023          	sd	s0,0(sp)
    800013c0:	01010413          	addi	s0,sp,16

    //upis broja blokova
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
    800013c4:	01850593          	addi	a1,a0,24
    800013c8:	0065d513          	srli	a0,a1,0x6
                         + ((size+sizeof(MemoryAllocator::FullMem))%MEM_BLOCK_SIZE?1:0);
    800013cc:	03f5f593          	andi	a1,a1,63
    800013d0:	00058463          	beqz	a1,800013d8 <_Z9mem_allocm+0x24>
    800013d4:	00100593          	li	a1,1
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
    800013d8:	00b505b3          	add	a1,a0,a1

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    800013dc:	00005797          	auipc	a5,0x5
    800013e0:	bdc7b783          	ld	a5,-1060(a5) # 80005fb8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800013e4:	10579073          	csrw	stvec,a5
    abi_invoker(MEM_ALLOC, numOfBlocks);
    800013e8:	00100513          	li	a0,1
    800013ec:	00000097          	auipc	ra,0x0
    800013f0:	e50080e7          	jalr	-432(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    void* p = nullptr;
    __asm__ volatile("mv a0, %0": "=r"(p));
    800013f4:	00050513          	mv	a0,a0
    return p;

}
    800013f8:	00813083          	ld	ra,8(sp)
    800013fc:	00013403          	ld	s0,0(sp)
    80001400:	01010113          	addi	sp,sp,16
    80001404:	00008067          	ret

0000000080001408 <_Z8mem_freePv>:

int mem_free(void *p){
    80001408:	ff010113          	addi	sp,sp,-16
    8000140c:	00113423          	sd	ra,8(sp)
    80001410:	00813023          	sd	s0,0(sp)
    80001414:	01010413          	addi	s0,sp,16
    80001418:	00050593          	mv	a1,a0

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    8000141c:	00005797          	auipc	a5,0x5
    80001420:	b9c7b783          	ld	a5,-1124(a5) # 80005fb8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001424:	10579073          	csrw	stvec,a5
    abi_invoker(MEM_FREE, p);
    80001428:	00200513          	li	a0,2
    8000142c:	00000097          	auipc	ra,0x0
    80001430:	e10080e7          	jalr	-496(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    80001434:	00050513          	mv	a0,a0
    return ret;
}
    80001438:	0005051b          	sext.w	a0,a0
    8000143c:	00813083          	ld	ra,8(sp)
    80001440:	00013403          	ld	s0,0(sp)
    80001444:	01010113          	addi	sp,sp,16
    80001448:	00008067          	ret

000000008000144c <_Z11thread_exitv>:

int thread_exit(){
    8000144c:	ff010113          	addi	sp,sp,-16
    80001450:	00113423          	sd	ra,8(sp)
    80001454:	00813023          	sd	s0,0(sp)
    80001458:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    8000145c:	00005797          	auipc	a5,0x5
    80001460:	b5c7b783          	ld	a5,-1188(a5) # 80005fb8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001464:	10579073          	csrw	stvec,a5
    abi_invoker(THREAD_EXIT);
    80001468:	01200513          	li	a0,18
    8000146c:	00000097          	auipc	ra,0x0
    80001470:	dd0080e7          	jalr	-560(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    80001474:	00050513          	mv	a0,a0
    return ret;
}
    80001478:	0005051b          	sext.w	a0,a0
    8000147c:	00813083          	ld	ra,8(sp)
    80001480:	00013403          	ld	s0,0(sp)
    80001484:	01010113          	addi	sp,sp,16
    80001488:	00008067          	ret

000000008000148c <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    8000148c:	fd010113          	addi	sp,sp,-48
    80001490:	02113423          	sd	ra,40(sp)
    80001494:	02813023          	sd	s0,32(sp)
    80001498:	00913c23          	sd	s1,24(sp)
    8000149c:	01213823          	sd	s2,16(sp)
    800014a0:	01313423          	sd	s3,8(sp)
    800014a4:	03010413          	addi	s0,sp,48
    800014a8:	00050493          	mv	s1,a0
    800014ac:	00058913          	mv	s2,a1
    800014b0:	00060993          	mv	s3,a2
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800014b4:	04100513          	li	a0,65
    800014b8:	00001097          	auipc	ra,0x1
    800014bc:	48c080e7          	jalr	1164(ra) # 80002944 <_ZN15MemoryAllocator9mem_allocEm>
    if (!stack) return -1;
    800014c0:	06050a63          	beqz	a0,80001534 <_Z13thread_createPP7_threadPFvPvES2_+0xa8>
    800014c4:	00050713          	mv	a4,a0

    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    800014c8:	00005797          	auipc	a5,0x5
    800014cc:	af07b783          	ld	a5,-1296(a5) # 80005fb8 <_GLOBAL_OFFSET_TABLE_+0x30>
    800014d0:	10579073          	csrw	stvec,a5
    abi_invoker(THREAD_CREATE, handle, start_routine, arg, stack);
    800014d4:	00098693          	mv	a3,s3
    800014d8:	00090613          	mv	a2,s2
    800014dc:	00048593          	mv	a1,s1
    800014e0:	01100513          	li	a0,17
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	d58080e7          	jalr	-680(ra) # 8000123c <_Z11abi_invokeriz>

    if(_thread::running == nullptr) _thread::running = *handle;
    800014ec:	00005797          	auipc	a5,0x5
    800014f0:	aac7b783          	ld	a5,-1364(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x10>
    800014f4:	0007b783          	ld	a5,0(a5)
    800014f8:	02078463          	beqz	a5,80001520 <_Z13thread_createPP7_threadPFvPvES2_+0x94>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    800014fc:	00050513          	mv	a0,a0
    80001500:	0005051b          	sext.w	a0,a0
    return ret;
}
    80001504:	02813083          	ld	ra,40(sp)
    80001508:	02013403          	ld	s0,32(sp)
    8000150c:	01813483          	ld	s1,24(sp)
    80001510:	01013903          	ld	s2,16(sp)
    80001514:	00813983          	ld	s3,8(sp)
    80001518:	03010113          	addi	sp,sp,48
    8000151c:	00008067          	ret
    if(_thread::running == nullptr) _thread::running = *handle;
    80001520:	0004b703          	ld	a4,0(s1)
    80001524:	00005797          	auipc	a5,0x5
    80001528:	a747b783          	ld	a5,-1420(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000152c:	00e7b023          	sd	a4,0(a5)
    80001530:	fcdff06f          	j	800014fc <_Z13thread_createPP7_threadPFvPvES2_+0x70>
    if (!stack) return -1;
    80001534:	fff00513          	li	a0,-1
    80001538:	fcdff06f          	j	80001504 <_Z13thread_createPP7_threadPFvPvES2_+0x78>

000000008000153c <_Z15thread_dispatchv>:

void thread_dispatch(){
    8000153c:	ff010113          	addi	sp,sp,-16
    80001540:	00113423          	sd	ra,8(sp)
    80001544:	00813023          	sd	s0,0(sp)
    80001548:	01010413          	addi	s0,sp,16
    __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    8000154c:	00005797          	auipc	a5,0x5
    80001550:	a6c7b783          	ld	a5,-1428(a5) # 80005fb8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001554:	10579073          	csrw	stvec,a5
    abi_invoker(THREAD_DISPATCH);
    80001558:	01300513          	li	a0,19
    8000155c:	00000097          	auipc	ra,0x0
    80001560:	ce0080e7          	jalr	-800(ra) # 8000123c <_Z11abi_invokeriz>
}
    80001564:	00813083          	ld	ra,8(sp)
    80001568:	00013403          	ld	s0,0(sp)
    8000156c:	01010113          	addi	sp,sp,16
    80001570:	00008067          	ret

0000000080001574 <_ZN7_thread10threadExitEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

int _thread::threadExit(){
    80001574:	ff010113          	addi	sp,sp,-16
    80001578:	00813423          	sd	s0,8(sp)
    8000157c:	01010413          	addi	s0,sp,16
    if (_thread::running == nullptr ) return -1;
    80001580:	00005797          	auipc	a5,0x5
    80001584:	a907b783          	ld	a5,-1392(a5) # 80006010 <_ZN7_thread7runningE>
    80001588:	00078e63          	beqz	a5,800015a4 <_ZN7_thread10threadExitEv+0x30>
    void setFinished(bool value) { finished = value; }
    8000158c:	00100713          	li	a4,1
    80001590:	00e78c23          	sb	a4,24(a5)
    _thread::running->setFinished(true);
    return 0;
    80001594:	00000513          	li	a0,0
}
    80001598:	00813403          	ld	s0,8(sp)
    8000159c:	01010113          	addi	sp,sp,16
    800015a0:	00008067          	ret
    if (_thread::running == nullptr ) return -1;
    800015a4:	fff00513          	li	a0,-1
    800015a8:	ff1ff06f          	j	80001598 <_ZN7_thread10threadExitEv+0x24>

00000000800015ac <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_>:

_thread *_thread::createThread(_thread** handle,Body body, void* stack, void* arg)
{
    800015ac:	fd010113          	addi	sp,sp,-48
    800015b0:	02113423          	sd	ra,40(sp)
    800015b4:	02813023          	sd	s0,32(sp)
    800015b8:	00913c23          	sd	s1,24(sp)
    800015bc:	01213823          	sd	s2,16(sp)
    800015c0:	01313423          	sd	s3,8(sp)
    800015c4:	01413023          	sd	s4,0(sp)
    800015c8:	03010413          	addi	s0,sp,48
    800015cc:	00050493          	mv	s1,a0
    800015d0:	00058913          	mv	s2,a1
    800015d4:	00060993          	mv	s3,a2
    800015d8:	00068a13          	mv	s4,a3
    _thread* ret = (_thread*)MemoryAllocator::mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800015dc:	00200513          	li	a0,2
    800015e0:	00001097          	auipc	ra,0x1
    800015e4:	364080e7          	jalr	868(ra) # 80002944 <_ZN15MemoryAllocator9mem_allocEm>
    if (ret == nullptr) return ret;
    800015e8:	04050663          	beqz	a0,80001634 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_+0x88>
    *handle = ret;
    800015ec:	00a4b023          	sd	a0,0(s1)
    (*handle)->body = body;
    800015f0:	01253023          	sd	s2,0(a0)
    (*handle)->stack = (uint64*)stack;
    800015f4:	0004b783          	ld	a5,0(s1)
    800015f8:	0137b423          	sd	s3,8(a5)
    (*handle)->timeSlice = TIME_SLICE;
    800015fc:	0004b783          	ld	a5,0(s1)
    80001600:	00200713          	li	a4,2
    80001604:	00e7b823          	sd	a4,16(a5)
    (*handle)->finished = false;
    80001608:	0004b783          	ld	a5,0(s1)
    8000160c:	00078c23          	sb	zero,24(a5)
    (*handle)->arg = arg;
    80001610:	0004b783          	ld	a5,0(s1)
    80001614:	0347b023          	sd	s4,32(a5)
    (*handle)->context = {
    80001618:	0004b783          	ld	a5,0(s1)
            body != nullptr ? (uint64) body : 0,
            stack != nullptr ? (uint64) &(*handle)->stack[STACK_SIZE]: 0
    8000161c:	02098c63          	beqz	s3,80001654 <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_+0xa8>
    80001620:	0087b703          	ld	a4,8(a5)
    80001624:	000086b7          	lui	a3,0x8
    80001628:	00d70733          	add	a4,a4,a3
    (*handle)->context = {
    8000162c:	0327b423          	sd	s2,40(a5)
    80001630:	02e7b823          	sd	a4,48(a5)
    };
    return ret;
}
    80001634:	02813083          	ld	ra,40(sp)
    80001638:	02013403          	ld	s0,32(sp)
    8000163c:	01813483          	ld	s1,24(sp)
    80001640:	01013903          	ld	s2,16(sp)
    80001644:	00813983          	ld	s3,8(sp)
    80001648:	00013a03          	ld	s4,0(sp)
    8000164c:	03010113          	addi	sp,sp,48
    80001650:	00008067          	ret
            stack != nullptr ? (uint64) &(*handle)->stack[STACK_SIZE]: 0
    80001654:	00000713          	li	a4,0
    80001658:	fd5ff06f          	j	8000162c <_ZN7_thread12createThreadEPPS_PFvPvES2_S2_+0x80>

000000008000165c <_ZN7_thread8dispatchEv>:
    Riscv::popRegisters();

}

void _thread::dispatch()
{
    8000165c:	fe010113          	addi	sp,sp,-32
    80001660:	00113c23          	sd	ra,24(sp)
    80001664:	00813823          	sd	s0,16(sp)
    80001668:	00913423          	sd	s1,8(sp)
    8000166c:	01213023          	sd	s2,0(sp)
    80001670:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001674:	00005917          	auipc	s2,0x5
    80001678:	99c93903          	ld	s2,-1636(s2) # 80006010 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    8000167c:	01894783          	lbu	a5,24(s2)
    if (!old->isFinished()) { Scheduler::put(old); }
    80001680:	04078863          	beqz	a5,800016d0 <_ZN7_thread8dispatchEv+0x74>
    running = Scheduler::get();
    80001684:	00001097          	auipc	ra,0x1
    80001688:	dc4080e7          	jalr	-572(ra) # 80002448 <_ZN9Scheduler3getEv>
    8000168c:	00050493          	mv	s1,a0
    80001690:	00005797          	auipc	a5,0x5
    80001694:	98a7b023          	sd	a0,-1664(a5) # 80006010 <_ZN7_thread7runningE>
    if (running->body == nullptr && Scheduler::head != nullptr){
    80001698:	00053783          	ld	a5,0(a0)
    8000169c:	04078263          	beqz	a5,800016e0 <_ZN7_thread8dispatchEv+0x84>
        _thread* tmp = running;
        running = Scheduler::get();
        Scheduler::put(tmp);
    }

    _thread::contextSwitch(&old->context, &running->context);
    800016a0:	00005597          	auipc	a1,0x5
    800016a4:	9705b583          	ld	a1,-1680(a1) # 80006010 <_ZN7_thread7runningE>
    800016a8:	02858593          	addi	a1,a1,40
    800016ac:	02890513          	addi	a0,s2,40
    800016b0:	00000097          	auipc	ra,0x0
    800016b4:	b78080e7          	jalr	-1160(ra) # 80001228 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    800016b8:	01813083          	ld	ra,24(sp)
    800016bc:	01013403          	ld	s0,16(sp)
    800016c0:	00813483          	ld	s1,8(sp)
    800016c4:	00013903          	ld	s2,0(sp)
    800016c8:	02010113          	addi	sp,sp,32
    800016cc:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    800016d0:	00090513          	mv	a0,s2
    800016d4:	00001097          	auipc	ra,0x1
    800016d8:	ddc080e7          	jalr	-548(ra) # 800024b0 <_ZN9Scheduler3putEP7_thread>
    800016dc:	fa9ff06f          	j	80001684 <_ZN7_thread8dispatchEv+0x28>
    if (running->body == nullptr && Scheduler::head != nullptr){
    800016e0:	00005797          	auipc	a5,0x5
    800016e4:	8c07b783          	ld	a5,-1856(a5) # 80005fa0 <_GLOBAL_OFFSET_TABLE_+0x18>
    800016e8:	0007b783          	ld	a5,0(a5)
    800016ec:	fa078ae3          	beqz	a5,800016a0 <_ZN7_thread8dispatchEv+0x44>
        running = Scheduler::get();
    800016f0:	00001097          	auipc	ra,0x1
    800016f4:	d58080e7          	jalr	-680(ra) # 80002448 <_ZN9Scheduler3getEv>
    800016f8:	00005797          	auipc	a5,0x5
    800016fc:	90a7bc23          	sd	a0,-1768(a5) # 80006010 <_ZN7_thread7runningE>
        Scheduler::put(tmp);
    80001700:	00048513          	mv	a0,s1
    80001704:	00001097          	auipc	ra,0x1
    80001708:	dac080e7          	jalr	-596(ra) # 800024b0 <_ZN9Scheduler3putEP7_thread>
    8000170c:	f95ff06f          	j	800016a0 <_ZN7_thread8dispatchEv+0x44>

0000000080001710 <_ZN7_thread5yieldEv>:
{
    80001710:	ff010113          	addi	sp,sp,-16
    80001714:	00113423          	sd	ra,8(sp)
    80001718:	00813023          	sd	s0,0(sp)
    8000171c:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80001720:	00000097          	auipc	ra,0x0
    80001724:	a10080e7          	jalr	-1520(ra) # 80001130 <_ZN5Riscv13pushRegistersEv>
    _thread::dispatch();
    80001728:	00000097          	auipc	ra,0x0
    8000172c:	f34080e7          	jalr	-204(ra) # 8000165c <_ZN7_thread8dispatchEv>
    Riscv::popRegisters();
    80001730:	00000097          	auipc	ra,0x0
    80001734:	a7c080e7          	jalr	-1412(ra) # 800011ac <_ZN5Riscv12popRegistersEv>
}
    80001738:	00813083          	ld	ra,8(sp)
    8000173c:	00013403          	ld	s0,0(sp)
    80001740:	01010113          	addi	sp,sp,16
    80001744:	00008067          	ret

0000000080001748 <_ZN7_thread5startEv>:

void _thread::start() {
    if ( this->body != nullptr) {Scheduler::put(this);}
    80001748:	00053783          	ld	a5,0(a0)
    8000174c:	02078663          	beqz	a5,80001778 <_ZN7_thread5startEv+0x30>
void _thread::start() {
    80001750:	ff010113          	addi	sp,sp,-16
    80001754:	00113423          	sd	ra,8(sp)
    80001758:	00813023          	sd	s0,0(sp)
    8000175c:	01010413          	addi	s0,sp,16
    if ( this->body != nullptr) {Scheduler::put(this);}
    80001760:	00001097          	auipc	ra,0x1
    80001764:	d50080e7          	jalr	-688(ra) # 800024b0 <_ZN9Scheduler3putEP7_thread>
}
    80001768:	00813083          	ld	ra,8(sp)
    8000176c:	00013403          	ld	s0,0(sp)
    80001770:	01010113          	addi	sp,sp,16
    80001774:	00008067          	ret
    80001778:	00008067          	ret

000000008000177c <_ZN7_thread13threadWrapperEv>:

void _thread::threadWrapper()
{
    8000177c:	fe010113          	addi	sp,sp,-32
    80001780:	00113c23          	sd	ra,24(sp)
    80001784:	00813823          	sd	s0,16(sp)
    80001788:	00913423          	sd	s1,8(sp)
    8000178c:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001790:	00001097          	auipc	ra,0x1
    80001794:	150080e7          	jalr	336(ra) # 800028e0 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    80001798:	00005497          	auipc	s1,0x5
    8000179c:	87848493          	addi	s1,s1,-1928 # 80006010 <_ZN7_thread7runningE>
    800017a0:	0004b783          	ld	a5,0(s1)
    800017a4:	0007b703          	ld	a4,0(a5)
    800017a8:	0207b503          	ld	a0,32(a5)
    800017ac:	000700e7          	jalr	a4
    running->setFinished(true);
    800017b0:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    800017b4:	00100713          	li	a4,1
    800017b8:	00e78c23          	sb	a4,24(a5)
    _thread::yield();
    800017bc:	00000097          	auipc	ra,0x0
    800017c0:	f54080e7          	jalr	-172(ra) # 80001710 <_ZN7_thread5yieldEv>
}
    800017c4:	01813083          	ld	ra,24(sp)
    800017c8:	01013403          	ld	s0,16(sp)
    800017cc:	00813483          	ld	s1,8(sp)
    800017d0:	02010113          	addi	sp,sp,32
    800017d4:	00008067          	ret

00000000800017d8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800017d8:	fe010113          	addi	sp,sp,-32
    800017dc:	00113c23          	sd	ra,24(sp)
    800017e0:	00813823          	sd	s0,16(sp)
    800017e4:	00913423          	sd	s1,8(sp)
    800017e8:	02010413          	addi	s0,sp,32
    800017ec:	00050493          	mv	s1,a0
    LOCK();
    800017f0:	00100613          	li	a2,1
    800017f4:	00000593          	li	a1,0
    800017f8:	00005517          	auipc	a0,0x5
    800017fc:	82850513          	addi	a0,a0,-2008 # 80006020 <lockPrint>
    80001800:	00000097          	auipc	ra,0x0
    80001804:	910080e7          	jalr	-1776(ra) # 80001110 <copy_and_swap>
    80001808:	fe0514e3          	bnez	a0,800017f0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    8000180c:	0004c503          	lbu	a0,0(s1)
    80001810:	00050a63          	beqz	a0,80001824 <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    80001814:	00003097          	auipc	ra,0x3
    80001818:	5a8080e7          	jalr	1448(ra) # 80004dbc <__putc>
        string++;
    8000181c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001820:	fedff06f          	j	8000180c <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001824:	00000613          	li	a2,0
    80001828:	00100593          	li	a1,1
    8000182c:	00004517          	auipc	a0,0x4
    80001830:	7f450513          	addi	a0,a0,2036 # 80006020 <lockPrint>
    80001834:	00000097          	auipc	ra,0x0
    80001838:	8dc080e7          	jalr	-1828(ra) # 80001110 <copy_and_swap>
    8000183c:	fe0514e3          	bnez	a0,80001824 <_Z11printStringPKc+0x4c>
}
    80001840:	01813083          	ld	ra,24(sp)
    80001844:	01013403          	ld	s0,16(sp)
    80001848:	00813483          	ld	s1,8(sp)
    8000184c:	02010113          	addi	sp,sp,32
    80001850:	00008067          	ret

0000000080001854 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001854:	fd010113          	addi	sp,sp,-48
    80001858:	02113423          	sd	ra,40(sp)
    8000185c:	02813023          	sd	s0,32(sp)
    80001860:	00913c23          	sd	s1,24(sp)
    80001864:	01213823          	sd	s2,16(sp)
    80001868:	01313423          	sd	s3,8(sp)
    8000186c:	01413023          	sd	s4,0(sp)
    80001870:	03010413          	addi	s0,sp,48
    80001874:	00050993          	mv	s3,a0
    80001878:	00058a13          	mv	s4,a1
    LOCK();
    8000187c:	00100613          	li	a2,1
    80001880:	00000593          	li	a1,0
    80001884:	00004517          	auipc	a0,0x4
    80001888:	79c50513          	addi	a0,a0,1948 # 80006020 <lockPrint>
    8000188c:	00000097          	auipc	ra,0x0
    80001890:	884080e7          	jalr	-1916(ra) # 80001110 <copy_and_swap>
    80001894:	fe0514e3          	bnez	a0,8000187c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80001898:	00000913          	li	s2,0
    8000189c:	00090493          	mv	s1,s2
    800018a0:	0019091b          	addiw	s2,s2,1
    800018a4:	03495a63          	bge	s2,s4,800018d8 <_Z9getStringPci+0x84>
        cc = __getc();
    800018a8:	00003097          	auipc	ra,0x3
    800018ac:	550080e7          	jalr	1360(ra) # 80004df8 <__getc>
        if(cc < 1)
    800018b0:	02050463          	beqz	a0,800018d8 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    800018b4:	009984b3          	add	s1,s3,s1
    800018b8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800018bc:	00a00793          	li	a5,10
    800018c0:	00f50a63          	beq	a0,a5,800018d4 <_Z9getStringPci+0x80>
    800018c4:	00d00793          	li	a5,13
    800018c8:	fcf51ae3          	bne	a0,a5,8000189c <_Z9getStringPci+0x48>
        buf[i++] = c;
    800018cc:	00090493          	mv	s1,s2
    800018d0:	0080006f          	j	800018d8 <_Z9getStringPci+0x84>
    800018d4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800018d8:	009984b3          	add	s1,s3,s1
    800018dc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800018e0:	00000613          	li	a2,0
    800018e4:	00100593          	li	a1,1
    800018e8:	00004517          	auipc	a0,0x4
    800018ec:	73850513          	addi	a0,a0,1848 # 80006020 <lockPrint>
    800018f0:	00000097          	auipc	ra,0x0
    800018f4:	820080e7          	jalr	-2016(ra) # 80001110 <copy_and_swap>
    800018f8:	fe0514e3          	bnez	a0,800018e0 <_Z9getStringPci+0x8c>
    return buf;
}
    800018fc:	00098513          	mv	a0,s3
    80001900:	02813083          	ld	ra,40(sp)
    80001904:	02013403          	ld	s0,32(sp)
    80001908:	01813483          	ld	s1,24(sp)
    8000190c:	01013903          	ld	s2,16(sp)
    80001910:	00813983          	ld	s3,8(sp)
    80001914:	00013a03          	ld	s4,0(sp)
    80001918:	03010113          	addi	sp,sp,48
    8000191c:	00008067          	ret

0000000080001920 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001920:	ff010113          	addi	sp,sp,-16
    80001924:	00813423          	sd	s0,8(sp)
    80001928:	01010413          	addi	s0,sp,16
    8000192c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001930:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001934:	0006c603          	lbu	a2,0(a3) # 8000 <_entry-0x7fff8000>
    80001938:	fd06071b          	addiw	a4,a2,-48
    8000193c:	0ff77713          	andi	a4,a4,255
    80001940:	00900793          	li	a5,9
    80001944:	02e7e063          	bltu	a5,a4,80001964 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001948:	0025179b          	slliw	a5,a0,0x2
    8000194c:	00a787bb          	addw	a5,a5,a0
    80001950:	0017979b          	slliw	a5,a5,0x1
    80001954:	00168693          	addi	a3,a3,1
    80001958:	00c787bb          	addw	a5,a5,a2
    8000195c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001960:	fd5ff06f          	j	80001934 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001964:	00813403          	ld	s0,8(sp)
    80001968:	01010113          	addi	sp,sp,16
    8000196c:	00008067          	ret

0000000080001970 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001970:	fc010113          	addi	sp,sp,-64
    80001974:	02113c23          	sd	ra,56(sp)
    80001978:	02813823          	sd	s0,48(sp)
    8000197c:	02913423          	sd	s1,40(sp)
    80001980:	03213023          	sd	s2,32(sp)
    80001984:	01313c23          	sd	s3,24(sp)
    80001988:	04010413          	addi	s0,sp,64
    8000198c:	00050493          	mv	s1,a0
    80001990:	00058913          	mv	s2,a1
    80001994:	00060993          	mv	s3,a2
    LOCK();
    80001998:	00100613          	li	a2,1
    8000199c:	00000593          	li	a1,0
    800019a0:	00004517          	auipc	a0,0x4
    800019a4:	68050513          	addi	a0,a0,1664 # 80006020 <lockPrint>
    800019a8:	fffff097          	auipc	ra,0xfffff
    800019ac:	768080e7          	jalr	1896(ra) # 80001110 <copy_and_swap>
    800019b0:	fe0514e3          	bnez	a0,80001998 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800019b4:	00098463          	beqz	s3,800019bc <_Z8printIntiii+0x4c>
    800019b8:	0804c463          	bltz	s1,80001a40 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800019bc:	0004851b          	sext.w	a0,s1
    neg = 0;
    800019c0:	00000593          	li	a1,0
    }

    i = 0;
    800019c4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800019c8:	0009079b          	sext.w	a5,s2
    800019cc:	0325773b          	remuw	a4,a0,s2
    800019d0:	00048613          	mv	a2,s1
    800019d4:	0014849b          	addiw	s1,s1,1
    800019d8:	02071693          	slli	a3,a4,0x20
    800019dc:	0206d693          	srli	a3,a3,0x20
    800019e0:	00004717          	auipc	a4,0x4
    800019e4:	4c070713          	addi	a4,a4,1216 # 80005ea0 <digits>
    800019e8:	00d70733          	add	a4,a4,a3
    800019ec:	00074683          	lbu	a3,0(a4)
    800019f0:	fd040713          	addi	a4,s0,-48
    800019f4:	00c70733          	add	a4,a4,a2
    800019f8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800019fc:	0005071b          	sext.w	a4,a0
    80001a00:	0325553b          	divuw	a0,a0,s2
    80001a04:	fcf772e3          	bgeu	a4,a5,800019c8 <_Z8printIntiii+0x58>
    if(neg)
    80001a08:	00058c63          	beqz	a1,80001a20 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001a0c:	fd040793          	addi	a5,s0,-48
    80001a10:	009784b3          	add	s1,a5,s1
    80001a14:	02d00793          	li	a5,45
    80001a18:	fef48823          	sb	a5,-16(s1)
    80001a1c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001a20:	fff4849b          	addiw	s1,s1,-1
    80001a24:	0204c463          	bltz	s1,80001a4c <_Z8printIntiii+0xdc>
        __putc(buf[i]);
    80001a28:	fd040793          	addi	a5,s0,-48
    80001a2c:	009787b3          	add	a5,a5,s1
    80001a30:	ff07c503          	lbu	a0,-16(a5)
    80001a34:	00003097          	auipc	ra,0x3
    80001a38:	388080e7          	jalr	904(ra) # 80004dbc <__putc>
    80001a3c:	fe5ff06f          	j	80001a20 <_Z8printIntiii+0xb0>
        x = -xx;
    80001a40:	4090053b          	negw	a0,s1
        neg = 1;
    80001a44:	00100593          	li	a1,1
        x = -xx;
    80001a48:	f7dff06f          	j	800019c4 <_Z8printIntiii+0x54>

    UNLOCK();
    80001a4c:	00000613          	li	a2,0
    80001a50:	00100593          	li	a1,1
    80001a54:	00004517          	auipc	a0,0x4
    80001a58:	5cc50513          	addi	a0,a0,1484 # 80006020 <lockPrint>
    80001a5c:	fffff097          	auipc	ra,0xfffff
    80001a60:	6b4080e7          	jalr	1716(ra) # 80001110 <copy_and_swap>
    80001a64:	fe0514e3          	bnez	a0,80001a4c <_Z8printIntiii+0xdc>
    80001a68:	03813083          	ld	ra,56(sp)
    80001a6c:	03013403          	ld	s0,48(sp)
    80001a70:	02813483          	ld	s1,40(sp)
    80001a74:	02013903          	ld	s2,32(sp)
    80001a78:	01813983          	ld	s3,24(sp)
    80001a7c:	04010113          	addi	sp,sp,64
    80001a80:	00008067          	ret

0000000080001a84 <_Z9fibonaccim>:
bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

uint64 fibonacci(uint64 n) {
    80001a84:	fe010113          	addi	sp,sp,-32
    80001a88:	00113c23          	sd	ra,24(sp)
    80001a8c:	00813823          	sd	s0,16(sp)
    80001a90:	00913423          	sd	s1,8(sp)
    80001a94:	01213023          	sd	s2,0(sp)
    80001a98:	02010413          	addi	s0,sp,32
    80001a9c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001aa0:	00100793          	li	a5,1
    80001aa4:	02a7f863          	bgeu	a5,a0,80001ad4 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80001aa8:	00a00793          	li	a5,10
    80001aac:	02f577b3          	remu	a5,a0,a5
    80001ab0:	02078e63          	beqz	a5,80001aec <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001ab4:	fff48513          	addi	a0,s1,-1
    80001ab8:	00000097          	auipc	ra,0x0
    80001abc:	fcc080e7          	jalr	-52(ra) # 80001a84 <_Z9fibonaccim>
    80001ac0:	00050913          	mv	s2,a0
    80001ac4:	ffe48513          	addi	a0,s1,-2
    80001ac8:	00000097          	auipc	ra,0x0
    80001acc:	fbc080e7          	jalr	-68(ra) # 80001a84 <_Z9fibonaccim>
    80001ad0:	00a90533          	add	a0,s2,a0
}
    80001ad4:	01813083          	ld	ra,24(sp)
    80001ad8:	01013403          	ld	s0,16(sp)
    80001adc:	00813483          	ld	s1,8(sp)
    80001ae0:	00013903          	ld	s2,0(sp)
    80001ae4:	02010113          	addi	sp,sp,32
    80001ae8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001aec:	00000097          	auipc	ra,0x0
    80001af0:	a50080e7          	jalr	-1456(ra) # 8000153c <_Z15thread_dispatchv>
    80001af4:	fc1ff06f          	j	80001ab4 <_Z9fibonaccim+0x30>

0000000080001af8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80001af8:	fe010113          	addi	sp,sp,-32
    80001afc:	00113c23          	sd	ra,24(sp)
    80001b00:	00813823          	sd	s0,16(sp)
    80001b04:	00913423          	sd	s1,8(sp)
    80001b08:	01213023          	sd	s2,0(sp)
    80001b0c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001b10:	00000913          	li	s2,0
    80001b14:	0380006f          	j	80001b4c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001b18:	00000097          	auipc	ra,0x0
    80001b1c:	a24080e7          	jalr	-1500(ra) # 8000153c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001b20:	00148493          	addi	s1,s1,1
    80001b24:	000027b7          	lui	a5,0x2
    80001b28:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001b2c:	0097ee63          	bltu	a5,s1,80001b48 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001b30:	00000713          	li	a4,0
    80001b34:	000077b7          	lui	a5,0x7
    80001b38:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001b3c:	fce7eee3          	bltu	a5,a4,80001b18 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80001b40:	00170713          	addi	a4,a4,1
    80001b44:	ff1ff06f          	j	80001b34 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80001b48:	00190913          	addi	s2,s2,1
    80001b4c:	00900793          	li	a5,9
    80001b50:	0527e063          	bltu	a5,s2,80001b90 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80001b54:	00003517          	auipc	a0,0x3
    80001b58:	51c50513          	addi	a0,a0,1308 # 80005070 <CONSOLE_STATUS+0x60>
    80001b5c:	00000097          	auipc	ra,0x0
    80001b60:	c7c080e7          	jalr	-900(ra) # 800017d8 <_Z11printStringPKc>
    80001b64:	00000613          	li	a2,0
    80001b68:	00a00593          	li	a1,10
    80001b6c:	0009051b          	sext.w	a0,s2
    80001b70:	00000097          	auipc	ra,0x0
    80001b74:	e00080e7          	jalr	-512(ra) # 80001970 <_Z8printIntiii>
    80001b78:	00003517          	auipc	a0,0x3
    80001b7c:	70050513          	addi	a0,a0,1792 # 80005278 <CONSOLE_STATUS+0x268>
    80001b80:	00000097          	auipc	ra,0x0
    80001b84:	c58080e7          	jalr	-936(ra) # 800017d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001b88:	00000493          	li	s1,0
    80001b8c:	f99ff06f          	j	80001b24 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80001b90:	00003517          	auipc	a0,0x3
    80001b94:	4e850513          	addi	a0,a0,1256 # 80005078 <CONSOLE_STATUS+0x68>
    80001b98:	00000097          	auipc	ra,0x0
    80001b9c:	c40080e7          	jalr	-960(ra) # 800017d8 <_Z11printStringPKc>
    finishedA = true;
    80001ba0:	00100793          	li	a5,1
    80001ba4:	00004717          	auipc	a4,0x4
    80001ba8:	48f70223          	sb	a5,1156(a4) # 80006028 <finishedA>
}
    80001bac:	01813083          	ld	ra,24(sp)
    80001bb0:	01013403          	ld	s0,16(sp)
    80001bb4:	00813483          	ld	s1,8(sp)
    80001bb8:	00013903          	ld	s2,0(sp)
    80001bbc:	02010113          	addi	sp,sp,32
    80001bc0:	00008067          	ret

0000000080001bc4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80001bc4:	fe010113          	addi	sp,sp,-32
    80001bc8:	00113c23          	sd	ra,24(sp)
    80001bcc:	00813823          	sd	s0,16(sp)
    80001bd0:	00913423          	sd	s1,8(sp)
    80001bd4:	01213023          	sd	s2,0(sp)
    80001bd8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001bdc:	00000913          	li	s2,0
    80001be0:	0380006f          	j	80001c18 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	958080e7          	jalr	-1704(ra) # 8000153c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001bec:	00148493          	addi	s1,s1,1
    80001bf0:	000027b7          	lui	a5,0x2
    80001bf4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001bf8:	0097ee63          	bltu	a5,s1,80001c14 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001bfc:	00000713          	li	a4,0
    80001c00:	000077b7          	lui	a5,0x7
    80001c04:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001c08:	fce7eee3          	bltu	a5,a4,80001be4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80001c0c:	00170713          	addi	a4,a4,1
    80001c10:	ff1ff06f          	j	80001c00 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80001c14:	00190913          	addi	s2,s2,1
    80001c18:	00f00793          	li	a5,15
    80001c1c:	0527e063          	bltu	a5,s2,80001c5c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80001c20:	00003517          	auipc	a0,0x3
    80001c24:	46850513          	addi	a0,a0,1128 # 80005088 <CONSOLE_STATUS+0x78>
    80001c28:	00000097          	auipc	ra,0x0
    80001c2c:	bb0080e7          	jalr	-1104(ra) # 800017d8 <_Z11printStringPKc>
    80001c30:	00000613          	li	a2,0
    80001c34:	00a00593          	li	a1,10
    80001c38:	0009051b          	sext.w	a0,s2
    80001c3c:	00000097          	auipc	ra,0x0
    80001c40:	d34080e7          	jalr	-716(ra) # 80001970 <_Z8printIntiii>
    80001c44:	00003517          	auipc	a0,0x3
    80001c48:	63450513          	addi	a0,a0,1588 # 80005278 <CONSOLE_STATUS+0x268>
    80001c4c:	00000097          	auipc	ra,0x0
    80001c50:	b8c080e7          	jalr	-1140(ra) # 800017d8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001c54:	00000493          	li	s1,0
    80001c58:	f99ff06f          	j	80001bf0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80001c5c:	00003517          	auipc	a0,0x3
    80001c60:	43450513          	addi	a0,a0,1076 # 80005090 <CONSOLE_STATUS+0x80>
    80001c64:	00000097          	auipc	ra,0x0
    80001c68:	b74080e7          	jalr	-1164(ra) # 800017d8 <_Z11printStringPKc>
    finishedB = true;
    80001c6c:	00100793          	li	a5,1
    80001c70:	00004717          	auipc	a4,0x4
    80001c74:	3af70ca3          	sb	a5,953(a4) # 80006029 <finishedB>
    thread_dispatch();
    80001c78:	00000097          	auipc	ra,0x0
    80001c7c:	8c4080e7          	jalr	-1852(ra) # 8000153c <_Z15thread_dispatchv>
}
    80001c80:	01813083          	ld	ra,24(sp)
    80001c84:	01013403          	ld	s0,16(sp)
    80001c88:	00813483          	ld	s1,8(sp)
    80001c8c:	00013903          	ld	s2,0(sp)
    80001c90:	02010113          	addi	sp,sp,32
    80001c94:	00008067          	ret

0000000080001c98 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80001c98:	fe010113          	addi	sp,sp,-32
    80001c9c:	00113c23          	sd	ra,24(sp)
    80001ca0:	00813823          	sd	s0,16(sp)
    80001ca4:	00913423          	sd	s1,8(sp)
    80001ca8:	01213023          	sd	s2,0(sp)
    80001cac:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001cb0:	00000493          	li	s1,0
    80001cb4:	0400006f          	j	80001cf4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001cb8:	00003517          	auipc	a0,0x3
    80001cbc:	3e850513          	addi	a0,a0,1000 # 800050a0 <CONSOLE_STATUS+0x90>
    80001cc0:	00000097          	auipc	ra,0x0
    80001cc4:	b18080e7          	jalr	-1256(ra) # 800017d8 <_Z11printStringPKc>
    80001cc8:	00000613          	li	a2,0
    80001ccc:	00a00593          	li	a1,10
    80001cd0:	00048513          	mv	a0,s1
    80001cd4:	00000097          	auipc	ra,0x0
    80001cd8:	c9c080e7          	jalr	-868(ra) # 80001970 <_Z8printIntiii>
    80001cdc:	00003517          	auipc	a0,0x3
    80001ce0:	59c50513          	addi	a0,a0,1436 # 80005278 <CONSOLE_STATUS+0x268>
    80001ce4:	00000097          	auipc	ra,0x0
    80001ce8:	af4080e7          	jalr	-1292(ra) # 800017d8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001cec:	0014849b          	addiw	s1,s1,1
    80001cf0:	0ff4f493          	andi	s1,s1,255
    80001cf4:	00200793          	li	a5,2
    80001cf8:	fc97f0e3          	bgeu	a5,s1,80001cb8 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80001cfc:	00003517          	auipc	a0,0x3
    80001d00:	3ac50513          	addi	a0,a0,940 # 800050a8 <CONSOLE_STATUS+0x98>
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	ad4080e7          	jalr	-1324(ra) # 800017d8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001d0c:	00700313          	li	t1,7
    thread_dispatch();
    80001d10:	00000097          	auipc	ra,0x0
    80001d14:	82c080e7          	jalr	-2004(ra) # 8000153c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001d18:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80001d1c:	00003517          	auipc	a0,0x3
    80001d20:	39c50513          	addi	a0,a0,924 # 800050b8 <CONSOLE_STATUS+0xa8>
    80001d24:	00000097          	auipc	ra,0x0
    80001d28:	ab4080e7          	jalr	-1356(ra) # 800017d8 <_Z11printStringPKc>
    80001d2c:	00000613          	li	a2,0
    80001d30:	00a00593          	li	a1,10
    80001d34:	0009051b          	sext.w	a0,s2
    80001d38:	00000097          	auipc	ra,0x0
    80001d3c:	c38080e7          	jalr	-968(ra) # 80001970 <_Z8printIntiii>
    80001d40:	00003517          	auipc	a0,0x3
    80001d44:	53850513          	addi	a0,a0,1336 # 80005278 <CONSOLE_STATUS+0x268>
    80001d48:	00000097          	auipc	ra,0x0
    80001d4c:	a90080e7          	jalr	-1392(ra) # 800017d8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001d50:	00c00513          	li	a0,12
    80001d54:	00000097          	auipc	ra,0x0
    80001d58:	d30080e7          	jalr	-720(ra) # 80001a84 <_Z9fibonaccim>
    80001d5c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80001d60:	00003517          	auipc	a0,0x3
    80001d64:	36050513          	addi	a0,a0,864 # 800050c0 <CONSOLE_STATUS+0xb0>
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	a70080e7          	jalr	-1424(ra) # 800017d8 <_Z11printStringPKc>
    80001d70:	00000613          	li	a2,0
    80001d74:	00a00593          	li	a1,10
    80001d78:	0009051b          	sext.w	a0,s2
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	bf4080e7          	jalr	-1036(ra) # 80001970 <_Z8printIntiii>
    80001d84:	00003517          	auipc	a0,0x3
    80001d88:	4f450513          	addi	a0,a0,1268 # 80005278 <CONSOLE_STATUS+0x268>
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	a4c080e7          	jalr	-1460(ra) # 800017d8 <_Z11printStringPKc>
    80001d94:	0400006f          	j	80001dd4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001d98:	00003517          	auipc	a0,0x3
    80001d9c:	30850513          	addi	a0,a0,776 # 800050a0 <CONSOLE_STATUS+0x90>
    80001da0:	00000097          	auipc	ra,0x0
    80001da4:	a38080e7          	jalr	-1480(ra) # 800017d8 <_Z11printStringPKc>
    80001da8:	00000613          	li	a2,0
    80001dac:	00a00593          	li	a1,10
    80001db0:	00048513          	mv	a0,s1
    80001db4:	00000097          	auipc	ra,0x0
    80001db8:	bbc080e7          	jalr	-1092(ra) # 80001970 <_Z8printIntiii>
    80001dbc:	00003517          	auipc	a0,0x3
    80001dc0:	4bc50513          	addi	a0,a0,1212 # 80005278 <CONSOLE_STATUS+0x268>
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	a14080e7          	jalr	-1516(ra) # 800017d8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80001dcc:	0014849b          	addiw	s1,s1,1
    80001dd0:	0ff4f493          	andi	s1,s1,255
    80001dd4:	00500793          	li	a5,5
    80001dd8:	fc97f0e3          	bgeu	a5,s1,80001d98 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80001ddc:	00003517          	auipc	a0,0x3
    80001de0:	29c50513          	addi	a0,a0,668 # 80005078 <CONSOLE_STATUS+0x68>
    80001de4:	00000097          	auipc	ra,0x0
    80001de8:	9f4080e7          	jalr	-1548(ra) # 800017d8 <_Z11printStringPKc>
    finishedC = true;
    80001dec:	00100793          	li	a5,1
    80001df0:	00004717          	auipc	a4,0x4
    80001df4:	22f70d23          	sb	a5,570(a4) # 8000602a <finishedC>
    thread_dispatch();
    80001df8:	fffff097          	auipc	ra,0xfffff
    80001dfc:	744080e7          	jalr	1860(ra) # 8000153c <_Z15thread_dispatchv>
}
    80001e00:	01813083          	ld	ra,24(sp)
    80001e04:	01013403          	ld	s0,16(sp)
    80001e08:	00813483          	ld	s1,8(sp)
    80001e0c:	00013903          	ld	s2,0(sp)
    80001e10:	02010113          	addi	sp,sp,32
    80001e14:	00008067          	ret

0000000080001e18 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80001e18:	fe010113          	addi	sp,sp,-32
    80001e1c:	00113c23          	sd	ra,24(sp)
    80001e20:	00813823          	sd	s0,16(sp)
    80001e24:	00913423          	sd	s1,8(sp)
    80001e28:	01213023          	sd	s2,0(sp)
    80001e2c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80001e30:	00a00493          	li	s1,10
    80001e34:	0400006f          	j	80001e74 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80001e38:	00003517          	auipc	a0,0x3
    80001e3c:	29850513          	addi	a0,a0,664 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001e40:	00000097          	auipc	ra,0x0
    80001e44:	998080e7          	jalr	-1640(ra) # 800017d8 <_Z11printStringPKc>
    80001e48:	00000613          	li	a2,0
    80001e4c:	00a00593          	li	a1,10
    80001e50:	00048513          	mv	a0,s1
    80001e54:	00000097          	auipc	ra,0x0
    80001e58:	b1c080e7          	jalr	-1252(ra) # 80001970 <_Z8printIntiii>
    80001e5c:	00003517          	auipc	a0,0x3
    80001e60:	41c50513          	addi	a0,a0,1052 # 80005278 <CONSOLE_STATUS+0x268>
    80001e64:	00000097          	auipc	ra,0x0
    80001e68:	974080e7          	jalr	-1676(ra) # 800017d8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80001e6c:	0014849b          	addiw	s1,s1,1
    80001e70:	0ff4f493          	andi	s1,s1,255
    80001e74:	00c00793          	li	a5,12
    80001e78:	fc97f0e3          	bgeu	a5,s1,80001e38 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80001e7c:	00003517          	auipc	a0,0x3
    80001e80:	25c50513          	addi	a0,a0,604 # 800050d8 <CONSOLE_STATUS+0xc8>
    80001e84:	00000097          	auipc	ra,0x0
    80001e88:	954080e7          	jalr	-1708(ra) # 800017d8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80001e8c:	00500313          	li	t1,5
    thread_dispatch();
    80001e90:	fffff097          	auipc	ra,0xfffff
    80001e94:	6ac080e7          	jalr	1708(ra) # 8000153c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80001e98:	01000513          	li	a0,16
    80001e9c:	00000097          	auipc	ra,0x0
    80001ea0:	be8080e7          	jalr	-1048(ra) # 80001a84 <_Z9fibonaccim>
    80001ea4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80001ea8:	00003517          	auipc	a0,0x3
    80001eac:	24050513          	addi	a0,a0,576 # 800050e8 <CONSOLE_STATUS+0xd8>
    80001eb0:	00000097          	auipc	ra,0x0
    80001eb4:	928080e7          	jalr	-1752(ra) # 800017d8 <_Z11printStringPKc>
    80001eb8:	00000613          	li	a2,0
    80001ebc:	00a00593          	li	a1,10
    80001ec0:	0009051b          	sext.w	a0,s2
    80001ec4:	00000097          	auipc	ra,0x0
    80001ec8:	aac080e7          	jalr	-1364(ra) # 80001970 <_Z8printIntiii>
    80001ecc:	00003517          	auipc	a0,0x3
    80001ed0:	3ac50513          	addi	a0,a0,940 # 80005278 <CONSOLE_STATUS+0x268>
    80001ed4:	00000097          	auipc	ra,0x0
    80001ed8:	904080e7          	jalr	-1788(ra) # 800017d8 <_Z11printStringPKc>
    80001edc:	0400006f          	j	80001f1c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80001ee0:	00003517          	auipc	a0,0x3
    80001ee4:	1f050513          	addi	a0,a0,496 # 800050d0 <CONSOLE_STATUS+0xc0>
    80001ee8:	00000097          	auipc	ra,0x0
    80001eec:	8f0080e7          	jalr	-1808(ra) # 800017d8 <_Z11printStringPKc>
    80001ef0:	00000613          	li	a2,0
    80001ef4:	00a00593          	li	a1,10
    80001ef8:	00048513          	mv	a0,s1
    80001efc:	00000097          	auipc	ra,0x0
    80001f00:	a74080e7          	jalr	-1420(ra) # 80001970 <_Z8printIntiii>
    80001f04:	00003517          	auipc	a0,0x3
    80001f08:	37450513          	addi	a0,a0,884 # 80005278 <CONSOLE_STATUS+0x268>
    80001f0c:	00000097          	auipc	ra,0x0
    80001f10:	8cc080e7          	jalr	-1844(ra) # 800017d8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80001f14:	0014849b          	addiw	s1,s1,1
    80001f18:	0ff4f493          	andi	s1,s1,255
    80001f1c:	00f00793          	li	a5,15
    80001f20:	fc97f0e3          	bgeu	a5,s1,80001ee0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80001f24:	00003517          	auipc	a0,0x3
    80001f28:	1d450513          	addi	a0,a0,468 # 800050f8 <CONSOLE_STATUS+0xe8>
    80001f2c:	00000097          	auipc	ra,0x0
    80001f30:	8ac080e7          	jalr	-1876(ra) # 800017d8 <_Z11printStringPKc>
    finishedD = true;
    80001f34:	00100793          	li	a5,1
    80001f38:	00004717          	auipc	a4,0x4
    80001f3c:	0ef709a3          	sb	a5,243(a4) # 8000602b <finishedD>
    thread_dispatch();
    80001f40:	fffff097          	auipc	ra,0xfffff
    80001f44:	5fc080e7          	jalr	1532(ra) # 8000153c <_Z15thread_dispatchv>
}
    80001f48:	01813083          	ld	ra,24(sp)
    80001f4c:	01013403          	ld	s0,16(sp)
    80001f50:	00813483          	ld	s1,8(sp)
    80001f54:	00013903          	ld	s2,0(sp)
    80001f58:	02010113          	addi	sp,sp,32
    80001f5c:	00008067          	ret

0000000080001f60 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80001f60:	fc010113          	addi	sp,sp,-64
    80001f64:	02113c23          	sd	ra,56(sp)
    80001f68:	02813823          	sd	s0,48(sp)
    80001f6c:	02913423          	sd	s1,40(sp)
    80001f70:	03213023          	sd	s2,32(sp)
    80001f74:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80001f78:	01000513          	li	a0,16
    80001f7c:	00001097          	auipc	ra,0x1
    80001f80:	924080e7          	jalr	-1756(ra) # 800028a0 <_ZN6ThreadnwEm>
    80001f84:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80001f88:	00001097          	auipc	ra,0x1
    80001f8c:	8d4080e7          	jalr	-1836(ra) # 8000285c <_ZN6ThreadC1Ev>
    80001f90:	00004797          	auipc	a5,0x4
    80001f94:	f3878793          	addi	a5,a5,-200 # 80005ec8 <_ZTV7WorkerA+0x10>
    80001f98:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80001f9c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80001fa0:	00003517          	auipc	a0,0x3
    80001fa4:	16850513          	addi	a0,a0,360 # 80005108 <CONSOLE_STATUS+0xf8>
    80001fa8:	00000097          	auipc	ra,0x0
    80001fac:	830080e7          	jalr	-2000(ra) # 800017d8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80001fb0:	01000513          	li	a0,16
    80001fb4:	00001097          	auipc	ra,0x1
    80001fb8:	8ec080e7          	jalr	-1812(ra) # 800028a0 <_ZN6ThreadnwEm>
    80001fbc:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80001fc0:	00001097          	auipc	ra,0x1
    80001fc4:	89c080e7          	jalr	-1892(ra) # 8000285c <_ZN6ThreadC1Ev>
    80001fc8:	00004797          	auipc	a5,0x4
    80001fcc:	f2878793          	addi	a5,a5,-216 # 80005ef0 <_ZTV7WorkerB+0x10>
    80001fd0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80001fd4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80001fd8:	00003517          	auipc	a0,0x3
    80001fdc:	14850513          	addi	a0,a0,328 # 80005120 <CONSOLE_STATUS+0x110>
    80001fe0:	fffff097          	auipc	ra,0xfffff
    80001fe4:	7f8080e7          	jalr	2040(ra) # 800017d8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80001fe8:	01000513          	li	a0,16
    80001fec:	00001097          	auipc	ra,0x1
    80001ff0:	8b4080e7          	jalr	-1868(ra) # 800028a0 <_ZN6ThreadnwEm>
    80001ff4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80001ff8:	00001097          	auipc	ra,0x1
    80001ffc:	864080e7          	jalr	-1948(ra) # 8000285c <_ZN6ThreadC1Ev>
    80002000:	00004797          	auipc	a5,0x4
    80002004:	f1878793          	addi	a5,a5,-232 # 80005f18 <_ZTV7WorkerC+0x10>
    80002008:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000200c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80002010:	00003517          	auipc	a0,0x3
    80002014:	12850513          	addi	a0,a0,296 # 80005138 <CONSOLE_STATUS+0x128>
    80002018:	fffff097          	auipc	ra,0xfffff
    8000201c:	7c0080e7          	jalr	1984(ra) # 800017d8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80002020:	01000513          	li	a0,16
    80002024:	00001097          	auipc	ra,0x1
    80002028:	87c080e7          	jalr	-1924(ra) # 800028a0 <_ZN6ThreadnwEm>
    8000202c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80002030:	00001097          	auipc	ra,0x1
    80002034:	82c080e7          	jalr	-2004(ra) # 8000285c <_ZN6ThreadC1Ev>
    80002038:	00004797          	auipc	a5,0x4
    8000203c:	f0878793          	addi	a5,a5,-248 # 80005f40 <_ZTV7WorkerD+0x10>
    80002040:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80002044:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80002048:	00003517          	auipc	a0,0x3
    8000204c:	10850513          	addi	a0,a0,264 # 80005150 <CONSOLE_STATUS+0x140>
    80002050:	fffff097          	auipc	ra,0xfffff
    80002054:	788080e7          	jalr	1928(ra) # 800017d8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80002058:	00000493          	li	s1,0
    8000205c:	00300793          	li	a5,3
    80002060:	0297c663          	blt	a5,s1,8000208c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80002064:	00349793          	slli	a5,s1,0x3
    80002068:	fe040713          	addi	a4,s0,-32
    8000206c:	00f707b3          	add	a5,a4,a5
    80002070:	fe07b503          	ld	a0,-32(a5)
    80002074:	00000097          	auipc	ra,0x0
    80002078:	788080e7          	jalr	1928(ra) # 800027fc <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000207c:	0014849b          	addiw	s1,s1,1
    80002080:	fddff06f          	j	8000205c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80002084:	00000097          	auipc	ra,0x0
    80002088:	794080e7          	jalr	1940(ra) # 80002818 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000208c:	00004797          	auipc	a5,0x4
    80002090:	f9c7c783          	lbu	a5,-100(a5) # 80006028 <finishedA>
    80002094:	fe0788e3          	beqz	a5,80002084 <_Z20Threads_CPP_API_testv+0x124>
    80002098:	00004797          	auipc	a5,0x4
    8000209c:	f917c783          	lbu	a5,-111(a5) # 80006029 <finishedB>
    800020a0:	fe0782e3          	beqz	a5,80002084 <_Z20Threads_CPP_API_testv+0x124>
    800020a4:	00004797          	auipc	a5,0x4
    800020a8:	f867c783          	lbu	a5,-122(a5) # 8000602a <finishedC>
    800020ac:	fc078ce3          	beqz	a5,80002084 <_Z20Threads_CPP_API_testv+0x124>
    800020b0:	00004797          	auipc	a5,0x4
    800020b4:	f7b7c783          	lbu	a5,-133(a5) # 8000602b <finishedD>
    800020b8:	fc0786e3          	beqz	a5,80002084 <_Z20Threads_CPP_API_testv+0x124>
    }

    for (auto thread: threads) { delete thread; }
    800020bc:	fc040493          	addi	s1,s0,-64
    800020c0:	0080006f          	j	800020c8 <_Z20Threads_CPP_API_testv+0x168>
    800020c4:	00848493          	addi	s1,s1,8
    800020c8:	fe040793          	addi	a5,s0,-32
    800020cc:	08f48663          	beq	s1,a5,80002158 <_Z20Threads_CPP_API_testv+0x1f8>
    800020d0:	0004b503          	ld	a0,0(s1)
    800020d4:	fe0508e3          	beqz	a0,800020c4 <_Z20Threads_CPP_API_testv+0x164>
    800020d8:	00053783          	ld	a5,0(a0)
    800020dc:	0087b783          	ld	a5,8(a5)
    800020e0:	000780e7          	jalr	a5
    800020e4:	fe1ff06f          	j	800020c4 <_Z20Threads_CPP_API_testv+0x164>
    800020e8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800020ec:	00048513          	mv	a0,s1
    800020f0:	00000097          	auipc	ra,0x0
    800020f4:	644080e7          	jalr	1604(ra) # 80002734 <_ZdlPv>
    800020f8:	00090513          	mv	a0,s2
    800020fc:	00005097          	auipc	ra,0x5
    80002100:	02c080e7          	jalr	44(ra) # 80007128 <_Unwind_Resume>
    80002104:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80002108:	00048513          	mv	a0,s1
    8000210c:	00000097          	auipc	ra,0x0
    80002110:	628080e7          	jalr	1576(ra) # 80002734 <_ZdlPv>
    80002114:	00090513          	mv	a0,s2
    80002118:	00005097          	auipc	ra,0x5
    8000211c:	010080e7          	jalr	16(ra) # 80007128 <_Unwind_Resume>
    80002120:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80002124:	00048513          	mv	a0,s1
    80002128:	00000097          	auipc	ra,0x0
    8000212c:	60c080e7          	jalr	1548(ra) # 80002734 <_ZdlPv>
    80002130:	00090513          	mv	a0,s2
    80002134:	00005097          	auipc	ra,0x5
    80002138:	ff4080e7          	jalr	-12(ra) # 80007128 <_Unwind_Resume>
    8000213c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80002140:	00048513          	mv	a0,s1
    80002144:	00000097          	auipc	ra,0x0
    80002148:	5f0080e7          	jalr	1520(ra) # 80002734 <_ZdlPv>
    8000214c:	00090513          	mv	a0,s2
    80002150:	00005097          	auipc	ra,0x5
    80002154:	fd8080e7          	jalr	-40(ra) # 80007128 <_Unwind_Resume>
}
    80002158:	03813083          	ld	ra,56(sp)
    8000215c:	03013403          	ld	s0,48(sp)
    80002160:	02813483          	ld	s1,40(sp)
    80002164:	02013903          	ld	s2,32(sp)
    80002168:	04010113          	addi	sp,sp,64
    8000216c:	00008067          	ret

0000000080002170 <_Z8userMainPv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain(void *) {
    80002170:	ff010113          	addi	sp,sp,-16
    80002174:	00113423          	sd	ra,8(sp)
    80002178:	00813023          	sd	s0,0(sp)
    8000217c:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta
    80002180:	00000097          	auipc	ra,0x0
    80002184:	de0080e7          	jalr	-544(ra) # 80001f60 <_Z20Threads_CPP_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
//    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

}
    80002188:	00813083          	ld	ra,8(sp)
    8000218c:	00013403          	ld	s0,0(sp)
    80002190:	01010113          	addi	sp,sp,16
    80002194:	00008067          	ret

0000000080002198 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80002198:	ff010113          	addi	sp,sp,-16
    8000219c:	00113423          	sd	ra,8(sp)
    800021a0:	00813023          	sd	s0,0(sp)
    800021a4:	01010413          	addi	s0,sp,16
    800021a8:	00004797          	auipc	a5,0x4
    800021ac:	d2078793          	addi	a5,a5,-736 # 80005ec8 <_ZTV7WorkerA+0x10>
    800021b0:	00f53023          	sd	a5,0(a0)
    800021b4:	00000097          	auipc	ra,0x0
    800021b8:	4fc080e7          	jalr	1276(ra) # 800026b0 <_ZN6ThreadD1Ev>
    800021bc:	00813083          	ld	ra,8(sp)
    800021c0:	00013403          	ld	s0,0(sp)
    800021c4:	01010113          	addi	sp,sp,16
    800021c8:	00008067          	ret

00000000800021cc <_ZN7WorkerAD0Ev>:
    800021cc:	fe010113          	addi	sp,sp,-32
    800021d0:	00113c23          	sd	ra,24(sp)
    800021d4:	00813823          	sd	s0,16(sp)
    800021d8:	00913423          	sd	s1,8(sp)
    800021dc:	02010413          	addi	s0,sp,32
    800021e0:	00050493          	mv	s1,a0
    800021e4:	00004797          	auipc	a5,0x4
    800021e8:	ce478793          	addi	a5,a5,-796 # 80005ec8 <_ZTV7WorkerA+0x10>
    800021ec:	00f53023          	sd	a5,0(a0)
    800021f0:	00000097          	auipc	ra,0x0
    800021f4:	4c0080e7          	jalr	1216(ra) # 800026b0 <_ZN6ThreadD1Ev>
    800021f8:	00048513          	mv	a0,s1
    800021fc:	00000097          	auipc	ra,0x0
    80002200:	538080e7          	jalr	1336(ra) # 80002734 <_ZdlPv>
    80002204:	01813083          	ld	ra,24(sp)
    80002208:	01013403          	ld	s0,16(sp)
    8000220c:	00813483          	ld	s1,8(sp)
    80002210:	02010113          	addi	sp,sp,32
    80002214:	00008067          	ret

0000000080002218 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80002218:	ff010113          	addi	sp,sp,-16
    8000221c:	00113423          	sd	ra,8(sp)
    80002220:	00813023          	sd	s0,0(sp)
    80002224:	01010413          	addi	s0,sp,16
    80002228:	00004797          	auipc	a5,0x4
    8000222c:	cc878793          	addi	a5,a5,-824 # 80005ef0 <_ZTV7WorkerB+0x10>
    80002230:	00f53023          	sd	a5,0(a0)
    80002234:	00000097          	auipc	ra,0x0
    80002238:	47c080e7          	jalr	1148(ra) # 800026b0 <_ZN6ThreadD1Ev>
    8000223c:	00813083          	ld	ra,8(sp)
    80002240:	00013403          	ld	s0,0(sp)
    80002244:	01010113          	addi	sp,sp,16
    80002248:	00008067          	ret

000000008000224c <_ZN7WorkerBD0Ev>:
    8000224c:	fe010113          	addi	sp,sp,-32
    80002250:	00113c23          	sd	ra,24(sp)
    80002254:	00813823          	sd	s0,16(sp)
    80002258:	00913423          	sd	s1,8(sp)
    8000225c:	02010413          	addi	s0,sp,32
    80002260:	00050493          	mv	s1,a0
    80002264:	00004797          	auipc	a5,0x4
    80002268:	c8c78793          	addi	a5,a5,-884 # 80005ef0 <_ZTV7WorkerB+0x10>
    8000226c:	00f53023          	sd	a5,0(a0)
    80002270:	00000097          	auipc	ra,0x0
    80002274:	440080e7          	jalr	1088(ra) # 800026b0 <_ZN6ThreadD1Ev>
    80002278:	00048513          	mv	a0,s1
    8000227c:	00000097          	auipc	ra,0x0
    80002280:	4b8080e7          	jalr	1208(ra) # 80002734 <_ZdlPv>
    80002284:	01813083          	ld	ra,24(sp)
    80002288:	01013403          	ld	s0,16(sp)
    8000228c:	00813483          	ld	s1,8(sp)
    80002290:	02010113          	addi	sp,sp,32
    80002294:	00008067          	ret

0000000080002298 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80002298:	ff010113          	addi	sp,sp,-16
    8000229c:	00113423          	sd	ra,8(sp)
    800022a0:	00813023          	sd	s0,0(sp)
    800022a4:	01010413          	addi	s0,sp,16
    800022a8:	00004797          	auipc	a5,0x4
    800022ac:	c7078793          	addi	a5,a5,-912 # 80005f18 <_ZTV7WorkerC+0x10>
    800022b0:	00f53023          	sd	a5,0(a0)
    800022b4:	00000097          	auipc	ra,0x0
    800022b8:	3fc080e7          	jalr	1020(ra) # 800026b0 <_ZN6ThreadD1Ev>
    800022bc:	00813083          	ld	ra,8(sp)
    800022c0:	00013403          	ld	s0,0(sp)
    800022c4:	01010113          	addi	sp,sp,16
    800022c8:	00008067          	ret

00000000800022cc <_ZN7WorkerCD0Ev>:
    800022cc:	fe010113          	addi	sp,sp,-32
    800022d0:	00113c23          	sd	ra,24(sp)
    800022d4:	00813823          	sd	s0,16(sp)
    800022d8:	00913423          	sd	s1,8(sp)
    800022dc:	02010413          	addi	s0,sp,32
    800022e0:	00050493          	mv	s1,a0
    800022e4:	00004797          	auipc	a5,0x4
    800022e8:	c3478793          	addi	a5,a5,-972 # 80005f18 <_ZTV7WorkerC+0x10>
    800022ec:	00f53023          	sd	a5,0(a0)
    800022f0:	00000097          	auipc	ra,0x0
    800022f4:	3c0080e7          	jalr	960(ra) # 800026b0 <_ZN6ThreadD1Ev>
    800022f8:	00048513          	mv	a0,s1
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	438080e7          	jalr	1080(ra) # 80002734 <_ZdlPv>
    80002304:	01813083          	ld	ra,24(sp)
    80002308:	01013403          	ld	s0,16(sp)
    8000230c:	00813483          	ld	s1,8(sp)
    80002310:	02010113          	addi	sp,sp,32
    80002314:	00008067          	ret

0000000080002318 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80002318:	ff010113          	addi	sp,sp,-16
    8000231c:	00113423          	sd	ra,8(sp)
    80002320:	00813023          	sd	s0,0(sp)
    80002324:	01010413          	addi	s0,sp,16
    80002328:	00004797          	auipc	a5,0x4
    8000232c:	c1878793          	addi	a5,a5,-1000 # 80005f40 <_ZTV7WorkerD+0x10>
    80002330:	00f53023          	sd	a5,0(a0)
    80002334:	00000097          	auipc	ra,0x0
    80002338:	37c080e7          	jalr	892(ra) # 800026b0 <_ZN6ThreadD1Ev>
    8000233c:	00813083          	ld	ra,8(sp)
    80002340:	00013403          	ld	s0,0(sp)
    80002344:	01010113          	addi	sp,sp,16
    80002348:	00008067          	ret

000000008000234c <_ZN7WorkerDD0Ev>:
    8000234c:	fe010113          	addi	sp,sp,-32
    80002350:	00113c23          	sd	ra,24(sp)
    80002354:	00813823          	sd	s0,16(sp)
    80002358:	00913423          	sd	s1,8(sp)
    8000235c:	02010413          	addi	s0,sp,32
    80002360:	00050493          	mv	s1,a0
    80002364:	00004797          	auipc	a5,0x4
    80002368:	bdc78793          	addi	a5,a5,-1060 # 80005f40 <_ZTV7WorkerD+0x10>
    8000236c:	00f53023          	sd	a5,0(a0)
    80002370:	00000097          	auipc	ra,0x0
    80002374:	340080e7          	jalr	832(ra) # 800026b0 <_ZN6ThreadD1Ev>
    80002378:	00048513          	mv	a0,s1
    8000237c:	00000097          	auipc	ra,0x0
    80002380:	3b8080e7          	jalr	952(ra) # 80002734 <_ZdlPv>
    80002384:	01813083          	ld	ra,24(sp)
    80002388:	01013403          	ld	s0,16(sp)
    8000238c:	00813483          	ld	s1,8(sp)
    80002390:	02010113          	addi	sp,sp,32
    80002394:	00008067          	ret

0000000080002398 <_ZN7WorkerA3runEv>:
    void run() override {
    80002398:	ff010113          	addi	sp,sp,-16
    8000239c:	00113423          	sd	ra,8(sp)
    800023a0:	00813023          	sd	s0,0(sp)
    800023a4:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    800023a8:	00000593          	li	a1,0
    800023ac:	fffff097          	auipc	ra,0xfffff
    800023b0:	74c080e7          	jalr	1868(ra) # 80001af8 <_ZN7WorkerA11workerBodyAEPv>
    }
    800023b4:	00813083          	ld	ra,8(sp)
    800023b8:	00013403          	ld	s0,0(sp)
    800023bc:	01010113          	addi	sp,sp,16
    800023c0:	00008067          	ret

00000000800023c4 <_ZN7WorkerB3runEv>:
    void run() override {
    800023c4:	ff010113          	addi	sp,sp,-16
    800023c8:	00113423          	sd	ra,8(sp)
    800023cc:	00813023          	sd	s0,0(sp)
    800023d0:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    800023d4:	00000593          	li	a1,0
    800023d8:	fffff097          	auipc	ra,0xfffff
    800023dc:	7ec080e7          	jalr	2028(ra) # 80001bc4 <_ZN7WorkerB11workerBodyBEPv>
    }
    800023e0:	00813083          	ld	ra,8(sp)
    800023e4:	00013403          	ld	s0,0(sp)
    800023e8:	01010113          	addi	sp,sp,16
    800023ec:	00008067          	ret

00000000800023f0 <_ZN7WorkerC3runEv>:
    void run() override {
    800023f0:	ff010113          	addi	sp,sp,-16
    800023f4:	00113423          	sd	ra,8(sp)
    800023f8:	00813023          	sd	s0,0(sp)
    800023fc:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80002400:	00000593          	li	a1,0
    80002404:	00000097          	auipc	ra,0x0
    80002408:	894080e7          	jalr	-1900(ra) # 80001c98 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000240c:	00813083          	ld	ra,8(sp)
    80002410:	00013403          	ld	s0,0(sp)
    80002414:	01010113          	addi	sp,sp,16
    80002418:	00008067          	ret

000000008000241c <_ZN7WorkerD3runEv>:
    void run() override {
    8000241c:	ff010113          	addi	sp,sp,-16
    80002420:	00113423          	sd	ra,8(sp)
    80002424:	00813023          	sd	s0,0(sp)
    80002428:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000242c:	00000593          	li	a1,0
    80002430:	00000097          	auipc	ra,0x0
    80002434:	9e8080e7          	jalr	-1560(ra) # 80001e18 <_ZN7WorkerD11workerBodyDEPv>
    }
    80002438:	00813083          	ld	ra,8(sp)
    8000243c:	00013403          	ld	s0,0(sp)
    80002440:	01010113          	addi	sp,sp,16
    80002444:	00008067          	ret

0000000080002448 <_ZN9Scheduler3getEv>:

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

_thread *Scheduler::get()
{
    80002448:	fe010113          	addi	sp,sp,-32
    8000244c:	00113c23          	sd	ra,24(sp)
    80002450:	00813823          	sd	s0,16(sp)
    80002454:	00913423          	sd	s1,8(sp)
    80002458:	02010413          	addi	s0,sp,32
    if (!head) return nullptr;
    8000245c:	00004517          	auipc	a0,0x4
    80002460:	bd453503          	ld	a0,-1068(a0) # 80006030 <_ZN9Scheduler4headE>
    80002464:	04050263          	beqz	a0,800024a8 <_ZN9Scheduler3getEv+0x60>

    Elem* elem = head;
    head = head->next;
    80002468:	01053783          	ld	a5,16(a0)
    8000246c:	00004717          	auipc	a4,0x4
    80002470:	bcf73223          	sd	a5,-1084(a4) # 80006030 <_ZN9Scheduler4headE>
    if (!head) tail = 0;
    80002474:	02078463          	beqz	a5,8000249c <_ZN9Scheduler3getEv+0x54>

    _thread *ret = elem->data;
    80002478:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    8000247c:	00000097          	auipc	ra,0x0
    80002480:	688080e7          	jalr	1672(ra) # 80002b04 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    80002484:	00048513          	mv	a0,s1
    80002488:	01813083          	ld	ra,24(sp)
    8000248c:	01013403          	ld	s0,16(sp)
    80002490:	00813483          	ld	s1,8(sp)
    80002494:	02010113          	addi	sp,sp,32
    80002498:	00008067          	ret
    if (!head) tail = 0;
    8000249c:	00004797          	auipc	a5,0x4
    800024a0:	b807be23          	sd	zero,-1124(a5) # 80006038 <_ZN9Scheduler4tailE>
    800024a4:	fd5ff06f          	j	80002478 <_ZN9Scheduler3getEv+0x30>
    if (!head) return nullptr;
    800024a8:	00050493          	mv	s1,a0
    800024ac:	fd9ff06f          	j	80002484 <_ZN9Scheduler3getEv+0x3c>

00000000800024b0 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(_thread *ccb)
{
    800024b0:	fe010113          	addi	sp,sp,-32
    800024b4:	00113c23          	sd	ra,24(sp)
    800024b8:	00813823          	sd	s0,16(sp)
    800024bc:	00913423          	sd	s1,8(sp)
    800024c0:	02010413          	addi	s0,sp,32
    800024c4:	00050493          	mv	s1,a0
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800024c8:	00100513          	li	a0,1
    800024cc:	00000097          	auipc	ra,0x0
    800024d0:	478080e7          	jalr	1144(ra) # 80002944 <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = ccb;
    800024d4:	00953023          	sd	s1,0(a0)
    elem->next = nullptr;
    800024d8:	00053823          	sd	zero,16(a0)
    if(tail){
    800024dc:	00004797          	auipc	a5,0x4
    800024e0:	b5c7b783          	ld	a5,-1188(a5) # 80006038 <_ZN9Scheduler4tailE>
    800024e4:	02078263          	beqz	a5,80002508 <_ZN9Scheduler3putEP7_thread+0x58>
        tail->next = elem;
    800024e8:	00a7b823          	sd	a0,16(a5)
        tail = elem;
    800024ec:	00004797          	auipc	a5,0x4
    800024f0:	b4a7b623          	sd	a0,-1204(a5) # 80006038 <_ZN9Scheduler4tailE>
    }else{
        head = tail = elem;
    }
    800024f4:	01813083          	ld	ra,24(sp)
    800024f8:	01013403          	ld	s0,16(sp)
    800024fc:	00813483          	ld	s1,8(sp)
    80002500:	02010113          	addi	sp,sp,32
    80002504:	00008067          	ret
        head = tail = elem;
    80002508:	00004797          	auipc	a5,0x4
    8000250c:	b2878793          	addi	a5,a5,-1240 # 80006030 <_ZN9Scheduler4headE>
    80002510:	00a7b423          	sd	a0,8(a5)
    80002514:	00a7b023          	sd	a0,0(a5)
    80002518:	fddff06f          	j	800024f4 <_ZN9Scheduler3putEP7_thread+0x44>

000000008000251c <_Z12checkNullptrPv>:
//}
//extern "C" void supervisorTrap();

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
    8000251c:	00050e63          	beqz	a0,80002538 <_Z12checkNullptrPv+0x1c>
        __putc('?');
        __putc('0' + x);
    }
    x++;
    80002520:	00004717          	auipc	a4,0x4
    80002524:	b2070713          	addi	a4,a4,-1248 # 80006040 <_ZZ12checkNullptrPvE1x>
    80002528:	00072783          	lw	a5,0(a4)
    8000252c:	0017879b          	addiw	a5,a5,1
    80002530:	00f72023          	sw	a5,0(a4)
    80002534:	00008067          	ret
void checkNullptr(void* p) {
    80002538:	ff010113          	addi	sp,sp,-16
    8000253c:	00113423          	sd	ra,8(sp)
    80002540:	00813023          	sd	s0,0(sp)
    80002544:	01010413          	addi	s0,sp,16
        __putc('?');
    80002548:	03f00513          	li	a0,63
    8000254c:	00003097          	auipc	ra,0x3
    80002550:	870080e7          	jalr	-1936(ra) # 80004dbc <__putc>
        __putc('0' + x);
    80002554:	00004517          	auipc	a0,0x4
    80002558:	aec52503          	lw	a0,-1300(a0) # 80006040 <_ZZ12checkNullptrPvE1x>
    8000255c:	0305051b          	addiw	a0,a0,48
    80002560:	0ff57513          	andi	a0,a0,255
    80002564:	00003097          	auipc	ra,0x3
    80002568:	858080e7          	jalr	-1960(ra) # 80004dbc <__putc>
    x++;
    8000256c:	00004717          	auipc	a4,0x4
    80002570:	ad470713          	addi	a4,a4,-1324 # 80006040 <_ZZ12checkNullptrPvE1x>
    80002574:	00072783          	lw	a5,0(a4)
    80002578:	0017879b          	addiw	a5,a5,1
    8000257c:	00f72023          	sw	a5,0(a4)
}
    80002580:	00813083          	ld	ra,8(sp)
    80002584:	00013403          	ld	s0,0(sp)
    80002588:	01010113          	addi	sp,sp,16
    8000258c:	00008067          	ret

0000000080002590 <_Z11checkStatusi>:

void checkStatus(int status) {
    static int y = 0;
    if(status) {
    80002590:	00051e63          	bnez	a0,800025ac <_Z11checkStatusi+0x1c>
        __putc('0' + y);
        __putc('?');
    }
    y++;
    80002594:	00004717          	auipc	a4,0x4
    80002598:	aac70713          	addi	a4,a4,-1364 # 80006040 <_ZZ12checkNullptrPvE1x>
    8000259c:	00472783          	lw	a5,4(a4)
    800025a0:	0017879b          	addiw	a5,a5,1
    800025a4:	00f72223          	sw	a5,4(a4)
    800025a8:	00008067          	ret
void checkStatus(int status) {
    800025ac:	ff010113          	addi	sp,sp,-16
    800025b0:	00113423          	sd	ra,8(sp)
    800025b4:	00813023          	sd	s0,0(sp)
    800025b8:	01010413          	addi	s0,sp,16
        __putc('0' + y);
    800025bc:	00004517          	auipc	a0,0x4
    800025c0:	a8852503          	lw	a0,-1400(a0) # 80006044 <_ZZ11checkStatusiE1y>
    800025c4:	0305051b          	addiw	a0,a0,48
    800025c8:	0ff57513          	andi	a0,a0,255
    800025cc:	00002097          	auipc	ra,0x2
    800025d0:	7f0080e7          	jalr	2032(ra) # 80004dbc <__putc>
        __putc('?');
    800025d4:	03f00513          	li	a0,63
    800025d8:	00002097          	auipc	ra,0x2
    800025dc:	7e4080e7          	jalr	2020(ra) # 80004dbc <__putc>
    y++;
    800025e0:	00004717          	auipc	a4,0x4
    800025e4:	a6070713          	addi	a4,a4,-1440 # 80006040 <_ZZ12checkNullptrPvE1x>
    800025e8:	00472783          	lw	a5,4(a4)
    800025ec:	0017879b          	addiw	a5,a5,1
    800025f0:	00f72223          	sw	a5,4(a4)
}
    800025f4:	00813083          	ld	ra,8(sp)
    800025f8:	00013403          	ld	s0,0(sp)
    800025fc:	01010113          	addi	sp,sp,16
    80002600:	00008067          	ret

0000000080002604 <main>:
extern "C" void trap();
void userMain(void *);

int main(){
    80002604:	fe010113          	addi	sp,sp,-32
    80002608:	00113c23          	sd	ra,24(sp)
    8000260c:	00813823          	sd	s0,16(sp)
    80002610:	02010413          	addi	s0,sp,32

    MemoryAllocator::getInstance();
    80002614:	00000097          	auipc	ra,0x0
    80002618:	470080e7          	jalr	1136(ra) # 80002a84 <_ZN15MemoryAllocator11getInstanceEv>
    __putc('c');
    8000261c:	06300513          	li	a0,99
    80002620:	00002097          	auipc	ra,0x2
    80002624:	79c080e7          	jalr	1948(ra) # 80004dbc <__putc>
    thread_t thr[2];
    thread_create(&thr[0], nullptr, nullptr);
    80002628:	00000613          	li	a2,0
    8000262c:	00000593          	li	a1,0
    80002630:	fe040513          	addi	a0,s0,-32
    80002634:	fffff097          	auipc	ra,0xfffff
    80002638:	e58080e7          	jalr	-424(ra) # 8000148c <_Z13thread_createPP7_threadPFvPvES2_>
    thread_create(&thr[1], userMain, nullptr);
    8000263c:	00000613          	li	a2,0
    80002640:	00004597          	auipc	a1,0x4
    80002644:	9705b583          	ld	a1,-1680(a1) # 80005fb0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002648:	fe840513          	addi	a0,s0,-24
    8000264c:	fffff097          	auipc	ra,0xfffff
    80002650:	e40080e7          	jalr	-448(ra) # 8000148c <_Z13thread_createPP7_threadPFvPvES2_>

    //Riscv::w_stvec((uint64) &trap);
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    _thread::running = thr[0];
    80002654:	fe043703          	ld	a4,-32(s0)
    80002658:	00004797          	auipc	a5,0x4
    8000265c:	9407b783          	ld	a5,-1728(a5) # 80005f98 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002660:	00e7b023          	sd	a4,0(a5)
    _thread::yield();
    80002664:	fffff097          	auipc	ra,0xfffff
    80002668:	0ac080e7          	jalr	172(ra) # 80001710 <_ZN7_thread5yieldEv>
    return 0;
}
    8000266c:	00000513          	li	a0,0
    80002670:	01813083          	ld	ra,24(sp)
    80002674:	01013403          	ld	s0,16(sp)
    80002678:	02010113          	addi	sp,sp,32
    8000267c:	00008067          	ret

0000000080002680 <_Z10wrapperRunPv>:

void *Thread::operator new(size_t sz) {
    return MemoryAllocator::mem_alloc(sz);
}

void wrapperRun(void* p){
    80002680:	ff010113          	addi	sp,sp,-16
    80002684:	00113423          	sd	ra,8(sp)
    80002688:	00813023          	sd	s0,0(sp)
    8000268c:	01010413          	addi	s0,sp,16
    p = (char*)0x80001af8;
    ((void(*)())(p))();
    80002690:	400017b7          	lui	a5,0x40001
    80002694:	00179793          	slli	a5,a5,0x1
    80002698:	af878793          	addi	a5,a5,-1288 # 40000af8 <_entry-0x3ffff508>
    8000269c:	000780e7          	jalr	a5
    //if(p == nullptr) return;

    800026a0:	00813083          	ld	ra,8(sp)
    800026a4:	00013403          	ld	s0,0(sp)
    800026a8:	01010113          	addi	sp,sp,16
    800026ac:	00008067          	ret

00000000800026b0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    800026b0:	ff010113          	addi	sp,sp,-16
    800026b4:	00113423          	sd	ra,8(sp)
    800026b8:	00813023          	sd	s0,0(sp)
    800026bc:	01010413          	addi	s0,sp,16
    800026c0:	00004797          	auipc	a5,0x4
    800026c4:	8b078793          	addi	a5,a5,-1872 # 80005f70 <_ZTV6Thread+0x10>
    800026c8:	00f53023          	sd	a5,0(a0)
    thread_exit();
    800026cc:	fffff097          	auipc	ra,0xfffff
    800026d0:	d80080e7          	jalr	-640(ra) # 8000144c <_Z11thread_exitv>
}
    800026d4:	00813083          	ld	ra,8(sp)
    800026d8:	00013403          	ld	s0,0(sp)
    800026dc:	01010113          	addi	sp,sp,16
    800026e0:	00008067          	ret

00000000800026e4 <_Znwm>:
void* operator new(size_t size){
    800026e4:	ff010113          	addi	sp,sp,-16
    800026e8:	00113423          	sd	ra,8(sp)
    800026ec:	00813023          	sd	s0,0(sp)
    800026f0:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    800026f4:	fffff097          	auipc	ra,0xfffff
    800026f8:	cc0080e7          	jalr	-832(ra) # 800013b4 <_Z9mem_allocm>
}
    800026fc:	00813083          	ld	ra,8(sp)
    80002700:	00013403          	ld	s0,0(sp)
    80002704:	01010113          	addi	sp,sp,16
    80002708:	00008067          	ret

000000008000270c <_Znam>:
void* operator new[](size_t size){
    8000270c:	ff010113          	addi	sp,sp,-16
    80002710:	00113423          	sd	ra,8(sp)
    80002714:	00813023          	sd	s0,0(sp)
    80002718:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    8000271c:	fffff097          	auipc	ra,0xfffff
    80002720:	c98080e7          	jalr	-872(ra) # 800013b4 <_Z9mem_allocm>
}
    80002724:	00813083          	ld	ra,8(sp)
    80002728:	00013403          	ld	s0,0(sp)
    8000272c:	01010113          	addi	sp,sp,16
    80002730:	00008067          	ret

0000000080002734 <_ZdlPv>:
void operator delete(void * p){
    80002734:	ff010113          	addi	sp,sp,-16
    80002738:	00113423          	sd	ra,8(sp)
    8000273c:	00813023          	sd	s0,0(sp)
    80002740:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002744:	fffff097          	auipc	ra,0xfffff
    80002748:	cc4080e7          	jalr	-828(ra) # 80001408 <_Z8mem_freePv>
}
    8000274c:	00813083          	ld	ra,8(sp)
    80002750:	00013403          	ld	s0,0(sp)
    80002754:	01010113          	addi	sp,sp,16
    80002758:	00008067          	ret

000000008000275c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    8000275c:	fe010113          	addi	sp,sp,-32
    80002760:	00113c23          	sd	ra,24(sp)
    80002764:	00813823          	sd	s0,16(sp)
    80002768:	00913423          	sd	s1,8(sp)
    8000276c:	02010413          	addi	s0,sp,32
    80002770:	00050493          	mv	s1,a0
}
    80002774:	00000097          	auipc	ra,0x0
    80002778:	f3c080e7          	jalr	-196(ra) # 800026b0 <_ZN6ThreadD1Ev>
    8000277c:	00048513          	mv	a0,s1
    80002780:	00000097          	auipc	ra,0x0
    80002784:	fb4080e7          	jalr	-76(ra) # 80002734 <_ZdlPv>
    80002788:	01813083          	ld	ra,24(sp)
    8000278c:	01013403          	ld	s0,16(sp)
    80002790:	00813483          	ld	s1,8(sp)
    80002794:	02010113          	addi	sp,sp,32
    80002798:	00008067          	ret

000000008000279c <_ZdaPv>:
void operator delete[](void * p){
    8000279c:	ff010113          	addi	sp,sp,-16
    800027a0:	00113423          	sd	ra,8(sp)
    800027a4:	00813023          	sd	s0,0(sp)
    800027a8:	01010413          	addi	s0,sp,16
    mem_free(p);
    800027ac:	fffff097          	auipc	ra,0xfffff
    800027b0:	c5c080e7          	jalr	-932(ra) # 80001408 <_Z8mem_freePv>
}
    800027b4:	00813083          	ld	ra,8(sp)
    800027b8:	00013403          	ld	s0,0(sp)
    800027bc:	01010113          	addi	sp,sp,16
    800027c0:	00008067          	ret

00000000800027c4 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800027c4:	ff010113          	addi	sp,sp,-16
    800027c8:	00113423          	sd	ra,8(sp)
    800027cc:	00813023          	sd	s0,0(sp)
    800027d0:	01010413          	addi	s0,sp,16
    800027d4:	00003797          	auipc	a5,0x3
    800027d8:	79c78793          	addi	a5,a5,1948 # 80005f70 <_ZTV6Thread+0x10>
    800027dc:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    800027e0:	00850513          	addi	a0,a0,8
    800027e4:	fffff097          	auipc	ra,0xfffff
    800027e8:	ca8080e7          	jalr	-856(ra) # 8000148c <_Z13thread_createPP7_threadPFvPvES2_>
}
    800027ec:	00813083          	ld	ra,8(sp)
    800027f0:	00013403          	ld	s0,0(sp)
    800027f4:	01010113          	addi	sp,sp,16
    800027f8:	00008067          	ret

00000000800027fc <_ZN6Thread5startEv>:
int Thread::start() {
    800027fc:	ff010113          	addi	sp,sp,-16
    80002800:	00813423          	sd	s0,8(sp)
    80002804:	01010413          	addi	s0,sp,16
}
    80002808:	00000513          	li	a0,0
    8000280c:	00813403          	ld	s0,8(sp)
    80002810:	01010113          	addi	sp,sp,16
    80002814:	00008067          	ret

0000000080002818 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002818:	ff010113          	addi	sp,sp,-16
    8000281c:	00113423          	sd	ra,8(sp)
    80002820:	00813023          	sd	s0,0(sp)
    80002824:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002828:	fffff097          	auipc	ra,0xfffff
    8000282c:	d14080e7          	jalr	-748(ra) # 8000153c <_Z15thread_dispatchv>
}
    80002830:	00813083          	ld	ra,8(sp)
    80002834:	00013403          	ld	s0,0(sp)
    80002838:	01010113          	addi	sp,sp,16
    8000283c:	00008067          	ret

0000000080002840 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80002840:	ff010113          	addi	sp,sp,-16
    80002844:	00813423          	sd	s0,8(sp)
    80002848:	01010413          	addi	s0,sp,16
}
    8000284c:	00000513          	li	a0,0
    80002850:	00813403          	ld	s0,8(sp)
    80002854:	01010113          	addi	sp,sp,16
    80002858:	00008067          	ret

000000008000285c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    8000285c:	ff010113          	addi	sp,sp,-16
    80002860:	00113423          	sd	ra,8(sp)
    80002864:	00813023          	sd	s0,0(sp)
    80002868:	01010413          	addi	s0,sp,16
    8000286c:	00003797          	auipc	a5,0x3
    80002870:	70478793          	addi	a5,a5,1796 # 80005f70 <_ZTV6Thread+0x10>
    80002874:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, &wrapperRun, a);
    80002878:	01100613          	li	a2,17
    8000287c:	00000597          	auipc	a1,0x0
    80002880:	e0458593          	addi	a1,a1,-508 # 80002680 <_Z10wrapperRunPv>
    80002884:	00850513          	addi	a0,a0,8
    80002888:	fffff097          	auipc	ra,0xfffff
    8000288c:	c04080e7          	jalr	-1020(ra) # 8000148c <_Z13thread_createPP7_threadPFvPvES2_>
}
    80002890:	00813083          	ld	ra,8(sp)
    80002894:	00013403          	ld	s0,0(sp)
    80002898:	01010113          	addi	sp,sp,16
    8000289c:	00008067          	ret

00000000800028a0 <_ZN6ThreadnwEm>:
void *Thread::operator new(size_t sz) {
    800028a0:	ff010113          	addi	sp,sp,-16
    800028a4:	00113423          	sd	ra,8(sp)
    800028a8:	00813023          	sd	s0,0(sp)
    800028ac:	01010413          	addi	s0,sp,16
    return MemoryAllocator::mem_alloc(sz);
    800028b0:	00000097          	auipc	ra,0x0
    800028b4:	094080e7          	jalr	148(ra) # 80002944 <_ZN15MemoryAllocator9mem_allocEm>
}
    800028b8:	00813083          	ld	ra,8(sp)
    800028bc:	00013403          	ld	s0,0(sp)
    800028c0:	01010113          	addi	sp,sp,16
    800028c4:	00008067          	ret

00000000800028c8 <_ZN6Thread3runEv>:

    void* operator new(size_t);
    friend void wrapperRun(void* p);
protected:
    Thread();
    virtual void run(){};
    800028c8:	ff010113          	addi	sp,sp,-16
    800028cc:	00813423          	sd	s0,8(sp)
    800028d0:	01010413          	addi	s0,sp,16
    800028d4:	00813403          	ld	s0,8(sp)
    800028d8:	01010113          	addi	sp,sp,16
    800028dc:	00008067          	ret

00000000800028e0 <_ZN5Riscv10popSppSpieEv>:
#include "../h/riscv.h"
//#include "../h/tcb.hpp"
#include "../lib/console.h"

void Riscv::popSppSpie()
{
    800028e0:	ff010113          	addi	sp,sp,-16
    800028e4:	00813423          	sd	s0,8(sp)
    800028e8:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    800028ec:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    800028f0:	10200073          	sret
}
    800028f4:	00813403          	ld	s0,8(sp)
    800028f8:	01010113          	addi	sp,sp,16
    800028fc:	00008067          	ret

0000000080002900 <_Z41__static_initialization_and_destruction_0ii>:
            if (cur) cur->next = newSeg;
            else fmem_head = newSeg;
            return 0;
        }
    }
}
    80002900:	ff010113          	addi	sp,sp,-16
    80002904:	00813423          	sd	s0,8(sp)
    80002908:	01010413          	addi	s0,sp,16
    8000290c:	00100793          	li	a5,1
    80002910:	00f50863          	beq	a0,a5,80002920 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002914:	00813403          	ld	s0,8(sp)
    80002918:	01010113          	addi	sp,sp,16
    8000291c:	00008067          	ret
    80002920:	000107b7          	lui	a5,0x10
    80002924:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002928:	fef596e3          	bne	a1,a5,80002914 <_Z41__static_initialization_and_destruction_0ii+0x14>
MemoryAllocator::FreeMem* MemoryAllocator::fmem_head = (MemoryAllocator::FreeMem*)HEAP_START_ADDR; //stavila onako
    8000292c:	00003797          	auipc	a5,0x3
    80002930:	6647b783          	ld	a5,1636(a5) # 80005f90 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002934:	0007b783          	ld	a5,0(a5)
    80002938:	00003717          	auipc	a4,0x3
    8000293c:	70f73823          	sd	a5,1808(a4) # 80006048 <_ZN15MemoryAllocator9fmem_headE>
}
    80002940:	fd5ff06f          	j	80002914 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002944 <_ZN15MemoryAllocator9mem_allocEm>:
void *MemoryAllocator::mem_alloc(size_t size) {
    80002944:	ff010113          	addi	sp,sp,-16
    80002948:	00813423          	sd	s0,8(sp)
    8000294c:	01010413          	addi	s0,sp,16
    if (size <=0) return nullptr;
    80002950:	12050663          	beqz	a0,80002a7c <_ZN15MemoryAllocator9mem_allocEm+0x138>
    80002954:	00050793          	mv	a5,a0
    FreeMem* cur = fmem_head;
    80002958:	00003517          	auipc	a0,0x3
    8000295c:	6f053503          	ld	a0,1776(a0) # 80006048 <_ZN15MemoryAllocator9fmem_headE>
    for(;cur !=0; cur = cur->next){
    80002960:	0e050e63          	beqz	a0,80002a5c <_ZN15MemoryAllocator9mem_allocEm+0x118>
        if(cur->size < (size)*MEM_BLOCK_SIZE) continue;
    80002964:	01053703          	ld	a4,16(a0)
    80002968:	00679693          	slli	a3,a5,0x6
    8000296c:	04d76c63          	bltu	a4,a3,800029c4 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(cur->size - (size)*MEM_BLOCK_SIZE < sizeof(FreeMem)){
    80002970:	40d70733          	sub	a4,a4,a3
    80002974:	01700793          	li	a5,23
    80002978:	06e7e263          	bltu	a5,a4,800029dc <_ZN15MemoryAllocator9mem_allocEm+0x98>
            if(cur->prev) cur->prev->next = cur->next;
    8000297c:	00853783          	ld	a5,8(a0)
    80002980:	04078663          	beqz	a5,800029cc <_ZN15MemoryAllocator9mem_allocEm+0x88>
    80002984:	00053703          	ld	a4,0(a0)
    80002988:	00e7b023          	sd	a4,0(a5)
            if(cur->next) cur->next->prev = cur->prev;
    8000298c:	00053783          	ld	a5,0(a0)
    80002990:	00078663          	beqz	a5,8000299c <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002994:	00853703          	ld	a4,8(a0)
    80002998:	00e7b423          	sd	a4,8(a5)
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    8000299c:	00003617          	auipc	a2,0x3
    800029a0:	6b463603          	ld	a2,1716(a2) # 80006050 <_ZN15MemoryAllocator9full_headE>
    800029a4:	08060063          	beqz	a2,80002a24 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
    800029a8:	08c56263          	bltu	a0,a2,80002a2c <_ZN15MemoryAllocator9mem_allocEm+0xe8>
            for (tmp = full_head; tmp->next != nullptr && (char *) cur > (char *) (tmp->next); tmp = tmp->next);
    800029ac:	00060793          	mv	a5,a2
    800029b0:	00078713          	mv	a4,a5
    800029b4:	0007b783          	ld	a5,0(a5)
    800029b8:	06078c63          	beqz	a5,80002a30 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    800029bc:	fea7eae3          	bltu	a5,a0,800029b0 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    800029c0:	0700006f          	j	80002a30 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    for(;cur !=0; cur = cur->next){
    800029c4:	00053503          	ld	a0,0(a0)
    800029c8:	f99ff06f          	j	80002960 <_ZN15MemoryAllocator9mem_allocEm+0x1c>
            else fmem_head = cur->next;
    800029cc:	00053783          	ld	a5,0(a0)
    800029d0:	00003717          	auipc	a4,0x3
    800029d4:	66f73c23          	sd	a5,1656(a4) # 80006048 <_ZN15MemoryAllocator9fmem_headE>
    800029d8:	fb5ff06f          	j	8000298c <_ZN15MemoryAllocator9mem_allocEm+0x48>
            FreeMem* newfrgm = (FreeMem*)((char*)cur + (size)*MEM_BLOCK_SIZE);
    800029dc:	00d507b3          	add	a5,a0,a3
            newfrgm->prev = cur->prev;
    800029e0:	00853703          	ld	a4,8(a0)
    800029e4:	00e7b423          	sd	a4,8(a5)
            newfrgm->next = cur->next;
    800029e8:	00053703          	ld	a4,0(a0)
    800029ec:	00e7b023          	sd	a4,0(a5)
            newfrgm->size = cur->size - (size)*MEM_BLOCK_SIZE;
    800029f0:	01053703          	ld	a4,16(a0)
    800029f4:	40d70733          	sub	a4,a4,a3
    800029f8:	00e7b823          	sd	a4,16(a5)
            if(cur->prev) cur->prev->next = newfrgm;
    800029fc:	00853703          	ld	a4,8(a0)
    80002a00:	00070c63          	beqz	a4,80002a18 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    80002a04:	00f73023          	sd	a5,0(a4)
            if(cur->next) cur->next->prev = newfrgm;
    80002a08:	00053703          	ld	a4,0(a0)
    80002a0c:	f80708e3          	beqz	a4,8000299c <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002a10:	00f73423          	sd	a5,8(a4)
    80002a14:	f89ff06f          	j	8000299c <_ZN15MemoryAllocator9mem_allocEm+0x58>
            else fmem_head = newfrgm;
    80002a18:	00003717          	auipc	a4,0x3
    80002a1c:	62f73823          	sd	a5,1584(a4) # 80006048 <_ZN15MemoryAllocator9fmem_headE>
    80002a20:	fe9ff06f          	j	80002a08 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    80002a24:	00060713          	mv	a4,a2
    80002a28:	0080006f          	j	80002a30 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    80002a2c:	00000713          	li	a4,0
        newSeg->size = (size)*MEM_BLOCK_SIZE ;
    80002a30:	00d53823          	sd	a3,16(a0)
        newSeg->prev = tmp;
    80002a34:	00e53423          	sd	a4,8(a0)
        if (tmp) newSeg->next = tmp->next;
    80002a38:	02070863          	beqz	a4,80002a68 <_ZN15MemoryAllocator9mem_allocEm+0x124>
    80002a3c:	00073783          	ld	a5,0(a4)
    80002a40:	00f53023          	sd	a5,0(a0)
        if(newSeg->next) newSeg->next->prev = newSeg;
    80002a44:	00053783          	ld	a5,0(a0)
    80002a48:	00078463          	beqz	a5,80002a50 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
    80002a4c:	00a7b423          	sd	a0,8(a5)
        if (tmp) tmp->next = newSeg;
    80002a50:	02070063          	beqz	a4,80002a70 <_ZN15MemoryAllocator9mem_allocEm+0x12c>
    80002a54:	00a73023          	sd	a0,0(a4)
        return (void*)((char*)cur+headSize);
    80002a58:	01850513          	addi	a0,a0,24
}
    80002a5c:	00813403          	ld	s0,8(sp)
    80002a60:	01010113          	addi	sp,sp,16
    80002a64:	00008067          	ret
        else newSeg->next = full_head;
    80002a68:	00c53023          	sd	a2,0(a0)
    80002a6c:	fd9ff06f          	j	80002a44 <_ZN15MemoryAllocator9mem_allocEm+0x100>
        else full_head = newSeg;
    80002a70:	00003797          	auipc	a5,0x3
    80002a74:	5ea7b023          	sd	a0,1504(a5) # 80006050 <_ZN15MemoryAllocator9full_headE>
    80002a78:	fe1ff06f          	j	80002a58 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    if (size <=0) return nullptr;
    80002a7c:	00000513          	li	a0,0
    80002a80:	fddff06f          	j	80002a5c <_ZN15MemoryAllocator9mem_allocEm+0x118>

0000000080002a84 <_ZN15MemoryAllocator11getInstanceEv>:
    if (memoryAllocator == nullptr) {
    80002a84:	00003797          	auipc	a5,0x3
    80002a88:	5d47b783          	ld	a5,1492(a5) # 80006058 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002a8c:	00078863          	beqz	a5,80002a9c <_ZN15MemoryAllocator11getInstanceEv+0x18>
}
    80002a90:	00003517          	auipc	a0,0x3
    80002a94:	5c853503          	ld	a0,1480(a0) # 80006058 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002a98:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80002a9c:	fe010113          	addi	sp,sp,-32
    80002aa0:	00113c23          	sd	ra,24(sp)
    80002aa4:	00813823          	sd	s0,16(sp)
    80002aa8:	00913423          	sd	s1,8(sp)
    80002aac:	02010413          	addi	s0,sp,32
        fmem_head = (FreeMem*)0x81000000;
    80002ab0:	00003497          	auipc	s1,0x3
    80002ab4:	59848493          	addi	s1,s1,1432 # 80006048 <_ZN15MemoryAllocator9fmem_headE>
    80002ab8:	08100793          	li	a5,129
    80002abc:	01879793          	slli	a5,a5,0x18
    80002ac0:	00f4b023          	sd	a5,0(s1)
        fmem_head->next = nullptr;
    80002ac4:	0007b023          	sd	zero,0(a5)
        fmem_head->prev = nullptr;
    80002ac8:	0004b783          	ld	a5,0(s1)
    80002acc:	0007b423          	sd	zero,8(a5)
        fmem_head->size = (size_t) (0x88000000) -(size_t )0x81000000;
    80002ad0:	07000737          	lui	a4,0x7000
    80002ad4:	00e7b823          	sd	a4,16(a5)
        memoryAllocator = (MemoryAllocator*)MemoryAllocator::mem_alloc((sizeof(MemoryAllocator)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80002ad8:	00100513          	li	a0,1
    80002adc:	00000097          	auipc	ra,0x0
    80002ae0:	e68080e7          	jalr	-408(ra) # 80002944 <_ZN15MemoryAllocator9mem_allocEm>
    80002ae4:	00a4b823          	sd	a0,16(s1)
}
    80002ae8:	00003517          	auipc	a0,0x3
    80002aec:	57053503          	ld	a0,1392(a0) # 80006058 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002af0:	01813083          	ld	ra,24(sp)
    80002af4:	01013403          	ld	s0,16(sp)
    80002af8:	00813483          	ld	s1,8(sp)
    80002afc:	02010113          	addi	sp,sp,32
    80002b00:	00008067          	ret

0000000080002b04 <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void *addr) {
    80002b04:	ff010113          	addi	sp,sp,-16
    80002b08:	00813423          	sd	s0,8(sp)
    80002b0c:	01010413          	addi	s0,sp,16
    if (addr == nullptr) return -2;
    80002b10:	1a050063          	beqz	a0,80002cb0 <_ZN15MemoryAllocator8mem_freeEPv+0x1ac>
    addr = (void*)((char*)addr-headSize);
    80002b14:	fe850713          	addi	a4,a0,-24
    FullMem* tmp = full_head;
    80002b18:	00003797          	auipc	a5,0x3
    80002b1c:	5387b783          	ld	a5,1336(a5) # 80006050 <_ZN15MemoryAllocator9full_headE>
    bool flag = false;
    80002b20:	0080006f          	j	80002b28 <_ZN15MemoryAllocator8mem_freeEPv+0x24>
    for(; tmp && dSeg>=tmp; tmp = tmp->next){
    80002b24:	0007b783          	ld	a5,0(a5)
    80002b28:	00078a63          	beqz	a5,80002b3c <_ZN15MemoryAllocator8mem_freeEPv+0x38>
    80002b2c:	08f76663          	bltu	a4,a5,80002bb8 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        if(tmp == dSeg) {
    80002b30:	fee79ae3          	bne	a5,a4,80002b24 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
            flag = true;
    80002b34:	00100693          	li	a3,1
    80002b38:	0080006f          	j	80002b40 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    bool flag = false;
    80002b3c:	00000693          	li	a3,0
    if (!flag) return -1;
    80002b40:	16068c63          	beqz	a3,80002cb8 <_ZN15MemoryAllocator8mem_freeEPv+0x1b4>
    if (tmp->prev) tmp->prev->next = tmp->next;
    80002b44:	0087b683          	ld	a3,8(a5)
    80002b48:	06068c63          	beqz	a3,80002bc0 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80002b4c:	0007b603          	ld	a2,0(a5)
    80002b50:	00c6b023          	sd	a2,0(a3)
    if (tmp->next) tmp->next->prev = tmp->prev;
    80002b54:	0007b683          	ld	a3,0(a5)
    80002b58:	00068663          	beqz	a3,80002b64 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
    80002b5c:	0087b603          	ld	a2,8(a5)
    80002b60:	00c6b423          	sd	a2,8(a3)
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002b64:	00003597          	auipc	a1,0x3
    80002b68:	4e45b583          	ld	a1,1252(a1) # 80006048 <_ZN15MemoryAllocator9fmem_headE>
    80002b6c:	08058263          	beqz	a1,80002bf0 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    80002b70:	08b76463          	bltu	a4,a1,80002bf8 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
        for (cur = fmem_head; cur->next != nullptr && (char*)addr>(char*)(cur->next); cur = cur->next);
    80002b74:	00058693          	mv	a3,a1
    80002b78:	00068613          	mv	a2,a3
    80002b7c:	0006b683          	ld	a3,0(a3)
    80002b80:	00068463          	beqz	a3,80002b88 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    80002b84:	fee6eae3          	bltu	a3,a4,80002b78 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if(cur && (char*)cur+cur->size == addr){
    80002b88:	06060a63          	beqz	a2,80002bfc <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002b8c:	01063803          	ld	a6,16(a2)
    80002b90:	010608b3          	add	a7,a2,a6
    80002b94:	06e89463          	bne	a7,a4,80002bfc <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
        cur->size += tmp->size;
    80002b98:	0107b783          	ld	a5,16(a5)
    80002b9c:	00f80833          	add	a6,a6,a5
    80002ba0:	01063823          	sd	a6,16(a2)
        if (cur->next && (char*)((char*)cur+ cur->size) == (char*)(cur->next)){
    80002ba4:	00068663          	beqz	a3,80002bb0 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002ba8:	010607b3          	add	a5,a2,a6
    80002bac:	02f68263          	beq	a3,a5,80002bd0 <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
        return 0;
    80002bb0:	00000513          	li	a0,0
    80002bb4:	0900006f          	j	80002c44 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    bool flag = false;
    80002bb8:	00000693          	li	a3,0
    80002bbc:	f85ff06f          	j	80002b40 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    else full_head = tmp->next;
    80002bc0:	0007b683          	ld	a3,0(a5)
    80002bc4:	00003617          	auipc	a2,0x3
    80002bc8:	48d63623          	sd	a3,1164(a2) # 80006050 <_ZN15MemoryAllocator9full_headE>
    80002bcc:	f89ff06f          	j	80002b54 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
            cur->size += cur->next->size;
    80002bd0:	0106b783          	ld	a5,16(a3)
    80002bd4:	00f80833          	add	a6,a6,a5
    80002bd8:	01063823          	sd	a6,16(a2)
            cur->next = cur->next->next;
    80002bdc:	0006b783          	ld	a5,0(a3)
    80002be0:	00f63023          	sd	a5,0(a2)
            if (cur->next) cur->next->prev = cur;
    80002be4:	fc0786e3          	beqz	a5,80002bb0 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002be8:	00c7b423          	sd	a2,8(a5)
    80002bec:	fc5ff06f          	j	80002bb0 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002bf0:	00058613          	mv	a2,a1
    80002bf4:	0080006f          	j	80002bfc <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002bf8:	00000613          	li	a2,0
        FreeMem* nxtSeg = cur?cur->next:fmem_head;
    80002bfc:	00060463          	beqz	a2,80002c04 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    80002c00:	00063583          	ld	a1,0(a2)
        if(nxtSeg && (char*)((char*)tmp + tmp->size) == (char*) nxtSeg){
    80002c04:	00058863          	beqz	a1,80002c14 <_ZN15MemoryAllocator8mem_freeEPv+0x110>
    80002c08:	0107b683          	ld	a3,16(a5)
    80002c0c:	00d78833          	add	a6,a5,a3
    80002c10:	04b80063          	beq	a6,a1,80002c50 <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
            newSeg->size = tmp->size;
    80002c14:	0107b783          	ld	a5,16(a5)
    80002c18:	fef53c23          	sd	a5,-8(a0)
            newSeg->prev = cur;
    80002c1c:	fec53823          	sd	a2,-16(a0)
            if(cur) newSeg->next = cur->next;
    80002c20:	06060a63          	beqz	a2,80002c94 <_ZN15MemoryAllocator8mem_freeEPv+0x190>
    80002c24:	00063783          	ld	a5,0(a2)
    80002c28:	fef53423          	sd	a5,-24(a0)
            if(newSeg->next) newSeg->next->prev = newSeg;
    80002c2c:	fe853783          	ld	a5,-24(a0)
    80002c30:	00078463          	beqz	a5,80002c38 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
    80002c34:	00e7b423          	sd	a4,8(a5)
            if (cur) cur->next = newSeg;
    80002c38:	06060663          	beqz	a2,80002ca4 <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
    80002c3c:	00e63023          	sd	a4,0(a2)
            return 0;
    80002c40:	00000513          	li	a0,0
}
    80002c44:	00813403          	ld	s0,8(sp)
    80002c48:	01010113          	addi	sp,sp,16
    80002c4c:	00008067          	ret
            newSeg->size = nxtSeg->size + tmp->size;
    80002c50:	0105b783          	ld	a5,16(a1)
    80002c54:	00f686b3          	add	a3,a3,a5
    80002c58:	fed53c23          	sd	a3,-8(a0)
            newSeg->prev = nxtSeg->prev;
    80002c5c:	0085b783          	ld	a5,8(a1)
    80002c60:	fef53823          	sd	a5,-16(a0)
            newSeg->next = nxtSeg->next;
    80002c64:	0005b783          	ld	a5,0(a1)
    80002c68:	fef53423          	sd	a5,-24(a0)
            if(nxtSeg->next) nxtSeg->next->prev = newSeg;
    80002c6c:	00078463          	beqz	a5,80002c74 <_ZN15MemoryAllocator8mem_freeEPv+0x170>
    80002c70:	00e7b423          	sd	a4,8(a5)
            if(nxtSeg->prev) nxtSeg->prev->next = newSeg;
    80002c74:	0085b783          	ld	a5,8(a1)
    80002c78:	00078863          	beqz	a5,80002c88 <_ZN15MemoryAllocator8mem_freeEPv+0x184>
    80002c7c:	00e7b023          	sd	a4,0(a5)
            return 0;
    80002c80:	00000513          	li	a0,0
    80002c84:	fc1ff06f          	j	80002c44 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
            else fmem_head = newSeg;
    80002c88:	00003797          	auipc	a5,0x3
    80002c8c:	3ce7b023          	sd	a4,960(a5) # 80006048 <_ZN15MemoryAllocator9fmem_headE>
    80002c90:	ff1ff06f          	j	80002c80 <_ZN15MemoryAllocator8mem_freeEPv+0x17c>
            else newSeg->next =fmem_head;
    80002c94:	00003797          	auipc	a5,0x3
    80002c98:	3b47b783          	ld	a5,948(a5) # 80006048 <_ZN15MemoryAllocator9fmem_headE>
    80002c9c:	fef53423          	sd	a5,-24(a0)
    80002ca0:	f8dff06f          	j	80002c2c <_ZN15MemoryAllocator8mem_freeEPv+0x128>
            else fmem_head = newSeg;
    80002ca4:	00003797          	auipc	a5,0x3
    80002ca8:	3ae7b223          	sd	a4,932(a5) # 80006048 <_ZN15MemoryAllocator9fmem_headE>
    80002cac:	f95ff06f          	j	80002c40 <_ZN15MemoryAllocator8mem_freeEPv+0x13c>
    if (addr == nullptr) return -2;
    80002cb0:	ffe00513          	li	a0,-2
    80002cb4:	f91ff06f          	j	80002c44 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    if (!flag) return -1;
    80002cb8:	fff00513          	li	a0,-1
    80002cbc:	f89ff06f          	j	80002c44 <_ZN15MemoryAllocator8mem_freeEPv+0x140>

0000000080002cc0 <_GLOBAL__sub_I__ZN15MemoryAllocator9fmem_headE>:
}
    80002cc0:	ff010113          	addi	sp,sp,-16
    80002cc4:	00113423          	sd	ra,8(sp)
    80002cc8:	00813023          	sd	s0,0(sp)
    80002ccc:	01010413          	addi	s0,sp,16
    80002cd0:	000105b7          	lui	a1,0x10
    80002cd4:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002cd8:	00100513          	li	a0,1
    80002cdc:	00000097          	auipc	ra,0x0
    80002ce0:	c24080e7          	jalr	-988(ra) # 80002900 <_Z41__static_initialization_and_destruction_0ii>
    80002ce4:	00813083          	ld	ra,8(sp)
    80002ce8:	00013403          	ld	s0,0(sp)
    80002cec:	01010113          	addi	sp,sp,16
    80002cf0:	00008067          	ret

0000000080002cf4 <start>:
    80002cf4:	ff010113          	addi	sp,sp,-16
    80002cf8:	00813423          	sd	s0,8(sp)
    80002cfc:	01010413          	addi	s0,sp,16
    80002d00:	300027f3          	csrr	a5,mstatus
    80002d04:	ffffe737          	lui	a4,0xffffe
    80002d08:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff753f>
    80002d0c:	00e7f7b3          	and	a5,a5,a4
    80002d10:	00001737          	lui	a4,0x1
    80002d14:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002d18:	00e7e7b3          	or	a5,a5,a4
    80002d1c:	30079073          	csrw	mstatus,a5
    80002d20:	00000797          	auipc	a5,0x0
    80002d24:	16078793          	addi	a5,a5,352 # 80002e80 <system_main>
    80002d28:	34179073          	csrw	mepc,a5
    80002d2c:	00000793          	li	a5,0
    80002d30:	18079073          	csrw	satp,a5
    80002d34:	000107b7          	lui	a5,0x10
    80002d38:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002d3c:	30279073          	csrw	medeleg,a5
    80002d40:	30379073          	csrw	mideleg,a5
    80002d44:	104027f3          	csrr	a5,sie
    80002d48:	2227e793          	ori	a5,a5,546
    80002d4c:	10479073          	csrw	sie,a5
    80002d50:	fff00793          	li	a5,-1
    80002d54:	00a7d793          	srli	a5,a5,0xa
    80002d58:	3b079073          	csrw	pmpaddr0,a5
    80002d5c:	00f00793          	li	a5,15
    80002d60:	3a079073          	csrw	pmpcfg0,a5
    80002d64:	f14027f3          	csrr	a5,mhartid
    80002d68:	0200c737          	lui	a4,0x200c
    80002d6c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002d70:	0007869b          	sext.w	a3,a5
    80002d74:	00269713          	slli	a4,a3,0x2
    80002d78:	000f4637          	lui	a2,0xf4
    80002d7c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002d80:	00d70733          	add	a4,a4,a3
    80002d84:	0037979b          	slliw	a5,a5,0x3
    80002d88:	020046b7          	lui	a3,0x2004
    80002d8c:	00d787b3          	add	a5,a5,a3
    80002d90:	00c585b3          	add	a1,a1,a2
    80002d94:	00371693          	slli	a3,a4,0x3
    80002d98:	00003717          	auipc	a4,0x3
    80002d9c:	2c870713          	addi	a4,a4,712 # 80006060 <timer_scratch>
    80002da0:	00b7b023          	sd	a1,0(a5)
    80002da4:	00d70733          	add	a4,a4,a3
    80002da8:	00f73c23          	sd	a5,24(a4)
    80002dac:	02c73023          	sd	a2,32(a4)
    80002db0:	34071073          	csrw	mscratch,a4
    80002db4:	00000797          	auipc	a5,0x0
    80002db8:	6ec78793          	addi	a5,a5,1772 # 800034a0 <timervec>
    80002dbc:	30579073          	csrw	mtvec,a5
    80002dc0:	300027f3          	csrr	a5,mstatus
    80002dc4:	0087e793          	ori	a5,a5,8
    80002dc8:	30079073          	csrw	mstatus,a5
    80002dcc:	304027f3          	csrr	a5,mie
    80002dd0:	0807e793          	ori	a5,a5,128
    80002dd4:	30479073          	csrw	mie,a5
    80002dd8:	f14027f3          	csrr	a5,mhartid
    80002ddc:	0007879b          	sext.w	a5,a5
    80002de0:	00078213          	mv	tp,a5
    80002de4:	30200073          	mret
    80002de8:	00813403          	ld	s0,8(sp)
    80002dec:	01010113          	addi	sp,sp,16
    80002df0:	00008067          	ret

0000000080002df4 <timerinit>:
    80002df4:	ff010113          	addi	sp,sp,-16
    80002df8:	00813423          	sd	s0,8(sp)
    80002dfc:	01010413          	addi	s0,sp,16
    80002e00:	f14027f3          	csrr	a5,mhartid
    80002e04:	0200c737          	lui	a4,0x200c
    80002e08:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002e0c:	0007869b          	sext.w	a3,a5
    80002e10:	00269713          	slli	a4,a3,0x2
    80002e14:	000f4637          	lui	a2,0xf4
    80002e18:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002e1c:	00d70733          	add	a4,a4,a3
    80002e20:	0037979b          	slliw	a5,a5,0x3
    80002e24:	020046b7          	lui	a3,0x2004
    80002e28:	00d787b3          	add	a5,a5,a3
    80002e2c:	00c585b3          	add	a1,a1,a2
    80002e30:	00371693          	slli	a3,a4,0x3
    80002e34:	00003717          	auipc	a4,0x3
    80002e38:	22c70713          	addi	a4,a4,556 # 80006060 <timer_scratch>
    80002e3c:	00b7b023          	sd	a1,0(a5)
    80002e40:	00d70733          	add	a4,a4,a3
    80002e44:	00f73c23          	sd	a5,24(a4)
    80002e48:	02c73023          	sd	a2,32(a4)
    80002e4c:	34071073          	csrw	mscratch,a4
    80002e50:	00000797          	auipc	a5,0x0
    80002e54:	65078793          	addi	a5,a5,1616 # 800034a0 <timervec>
    80002e58:	30579073          	csrw	mtvec,a5
    80002e5c:	300027f3          	csrr	a5,mstatus
    80002e60:	0087e793          	ori	a5,a5,8
    80002e64:	30079073          	csrw	mstatus,a5
    80002e68:	304027f3          	csrr	a5,mie
    80002e6c:	0807e793          	ori	a5,a5,128
    80002e70:	30479073          	csrw	mie,a5
    80002e74:	00813403          	ld	s0,8(sp)
    80002e78:	01010113          	addi	sp,sp,16
    80002e7c:	00008067          	ret

0000000080002e80 <system_main>:
    80002e80:	fe010113          	addi	sp,sp,-32
    80002e84:	00813823          	sd	s0,16(sp)
    80002e88:	00913423          	sd	s1,8(sp)
    80002e8c:	00113c23          	sd	ra,24(sp)
    80002e90:	02010413          	addi	s0,sp,32
    80002e94:	00000097          	auipc	ra,0x0
    80002e98:	0c4080e7          	jalr	196(ra) # 80002f58 <cpuid>
    80002e9c:	00003497          	auipc	s1,0x3
    80002ea0:	14448493          	addi	s1,s1,324 # 80005fe0 <started>
    80002ea4:	02050263          	beqz	a0,80002ec8 <system_main+0x48>
    80002ea8:	0004a783          	lw	a5,0(s1)
    80002eac:	0007879b          	sext.w	a5,a5
    80002eb0:	fe078ce3          	beqz	a5,80002ea8 <system_main+0x28>
    80002eb4:	0ff0000f          	fence
    80002eb8:	00002517          	auipc	a0,0x2
    80002ebc:	2e050513          	addi	a0,a0,736 # 80005198 <CONSOLE_STATUS+0x188>
    80002ec0:	00001097          	auipc	ra,0x1
    80002ec4:	a7c080e7          	jalr	-1412(ra) # 8000393c <panic>
    80002ec8:	00001097          	auipc	ra,0x1
    80002ecc:	9d0080e7          	jalr	-1584(ra) # 80003898 <consoleinit>
    80002ed0:	00001097          	auipc	ra,0x1
    80002ed4:	15c080e7          	jalr	348(ra) # 8000402c <printfinit>
    80002ed8:	00002517          	auipc	a0,0x2
    80002edc:	3a050513          	addi	a0,a0,928 # 80005278 <CONSOLE_STATUS+0x268>
    80002ee0:	00001097          	auipc	ra,0x1
    80002ee4:	ab8080e7          	jalr	-1352(ra) # 80003998 <__printf>
    80002ee8:	00002517          	auipc	a0,0x2
    80002eec:	28050513          	addi	a0,a0,640 # 80005168 <CONSOLE_STATUS+0x158>
    80002ef0:	00001097          	auipc	ra,0x1
    80002ef4:	aa8080e7          	jalr	-1368(ra) # 80003998 <__printf>
    80002ef8:	00002517          	auipc	a0,0x2
    80002efc:	38050513          	addi	a0,a0,896 # 80005278 <CONSOLE_STATUS+0x268>
    80002f00:	00001097          	auipc	ra,0x1
    80002f04:	a98080e7          	jalr	-1384(ra) # 80003998 <__printf>
    80002f08:	00001097          	auipc	ra,0x1
    80002f0c:	4b0080e7          	jalr	1200(ra) # 800043b8 <kinit>
    80002f10:	00000097          	auipc	ra,0x0
    80002f14:	148080e7          	jalr	328(ra) # 80003058 <trapinit>
    80002f18:	00000097          	auipc	ra,0x0
    80002f1c:	16c080e7          	jalr	364(ra) # 80003084 <trapinithart>
    80002f20:	00000097          	auipc	ra,0x0
    80002f24:	5c0080e7          	jalr	1472(ra) # 800034e0 <plicinit>
    80002f28:	00000097          	auipc	ra,0x0
    80002f2c:	5e0080e7          	jalr	1504(ra) # 80003508 <plicinithart>
    80002f30:	00000097          	auipc	ra,0x0
    80002f34:	078080e7          	jalr	120(ra) # 80002fa8 <userinit>
    80002f38:	0ff0000f          	fence
    80002f3c:	00100793          	li	a5,1
    80002f40:	00002517          	auipc	a0,0x2
    80002f44:	24050513          	addi	a0,a0,576 # 80005180 <CONSOLE_STATUS+0x170>
    80002f48:	00f4a023          	sw	a5,0(s1)
    80002f4c:	00001097          	auipc	ra,0x1
    80002f50:	a4c080e7          	jalr	-1460(ra) # 80003998 <__printf>
    80002f54:	0000006f          	j	80002f54 <system_main+0xd4>

0000000080002f58 <cpuid>:
    80002f58:	ff010113          	addi	sp,sp,-16
    80002f5c:	00813423          	sd	s0,8(sp)
    80002f60:	01010413          	addi	s0,sp,16
    80002f64:	00020513          	mv	a0,tp
    80002f68:	00813403          	ld	s0,8(sp)
    80002f6c:	0005051b          	sext.w	a0,a0
    80002f70:	01010113          	addi	sp,sp,16
    80002f74:	00008067          	ret

0000000080002f78 <mycpu>:
    80002f78:	ff010113          	addi	sp,sp,-16
    80002f7c:	00813423          	sd	s0,8(sp)
    80002f80:	01010413          	addi	s0,sp,16
    80002f84:	00020793          	mv	a5,tp
    80002f88:	00813403          	ld	s0,8(sp)
    80002f8c:	0007879b          	sext.w	a5,a5
    80002f90:	00779793          	slli	a5,a5,0x7
    80002f94:	00004517          	auipc	a0,0x4
    80002f98:	0fc50513          	addi	a0,a0,252 # 80007090 <cpus>
    80002f9c:	00f50533          	add	a0,a0,a5
    80002fa0:	01010113          	addi	sp,sp,16
    80002fa4:	00008067          	ret

0000000080002fa8 <userinit>:
    80002fa8:	ff010113          	addi	sp,sp,-16
    80002fac:	00813423          	sd	s0,8(sp)
    80002fb0:	01010413          	addi	s0,sp,16
    80002fb4:	00813403          	ld	s0,8(sp)
    80002fb8:	01010113          	addi	sp,sp,16
    80002fbc:	fffff317          	auipc	t1,0xfffff
    80002fc0:	64830067          	jr	1608(t1) # 80002604 <main>

0000000080002fc4 <either_copyout>:
    80002fc4:	ff010113          	addi	sp,sp,-16
    80002fc8:	00813023          	sd	s0,0(sp)
    80002fcc:	00113423          	sd	ra,8(sp)
    80002fd0:	01010413          	addi	s0,sp,16
    80002fd4:	02051663          	bnez	a0,80003000 <either_copyout+0x3c>
    80002fd8:	00058513          	mv	a0,a1
    80002fdc:	00060593          	mv	a1,a2
    80002fe0:	0006861b          	sext.w	a2,a3
    80002fe4:	00002097          	auipc	ra,0x2
    80002fe8:	c60080e7          	jalr	-928(ra) # 80004c44 <__memmove>
    80002fec:	00813083          	ld	ra,8(sp)
    80002ff0:	00013403          	ld	s0,0(sp)
    80002ff4:	00000513          	li	a0,0
    80002ff8:	01010113          	addi	sp,sp,16
    80002ffc:	00008067          	ret
    80003000:	00002517          	auipc	a0,0x2
    80003004:	1c050513          	addi	a0,a0,448 # 800051c0 <CONSOLE_STATUS+0x1b0>
    80003008:	00001097          	auipc	ra,0x1
    8000300c:	934080e7          	jalr	-1740(ra) # 8000393c <panic>

0000000080003010 <either_copyin>:
    80003010:	ff010113          	addi	sp,sp,-16
    80003014:	00813023          	sd	s0,0(sp)
    80003018:	00113423          	sd	ra,8(sp)
    8000301c:	01010413          	addi	s0,sp,16
    80003020:	02059463          	bnez	a1,80003048 <either_copyin+0x38>
    80003024:	00060593          	mv	a1,a2
    80003028:	0006861b          	sext.w	a2,a3
    8000302c:	00002097          	auipc	ra,0x2
    80003030:	c18080e7          	jalr	-1000(ra) # 80004c44 <__memmove>
    80003034:	00813083          	ld	ra,8(sp)
    80003038:	00013403          	ld	s0,0(sp)
    8000303c:	00000513          	li	a0,0
    80003040:	01010113          	addi	sp,sp,16
    80003044:	00008067          	ret
    80003048:	00002517          	auipc	a0,0x2
    8000304c:	1a050513          	addi	a0,a0,416 # 800051e8 <CONSOLE_STATUS+0x1d8>
    80003050:	00001097          	auipc	ra,0x1
    80003054:	8ec080e7          	jalr	-1812(ra) # 8000393c <panic>

0000000080003058 <trapinit>:
    80003058:	ff010113          	addi	sp,sp,-16
    8000305c:	00813423          	sd	s0,8(sp)
    80003060:	01010413          	addi	s0,sp,16
    80003064:	00813403          	ld	s0,8(sp)
    80003068:	00002597          	auipc	a1,0x2
    8000306c:	1a858593          	addi	a1,a1,424 # 80005210 <CONSOLE_STATUS+0x200>
    80003070:	00004517          	auipc	a0,0x4
    80003074:	0a050513          	addi	a0,a0,160 # 80007110 <tickslock>
    80003078:	01010113          	addi	sp,sp,16
    8000307c:	00001317          	auipc	t1,0x1
    80003080:	5cc30067          	jr	1484(t1) # 80004648 <initlock>

0000000080003084 <trapinithart>:
    80003084:	ff010113          	addi	sp,sp,-16
    80003088:	00813423          	sd	s0,8(sp)
    8000308c:	01010413          	addi	s0,sp,16
    80003090:	00000797          	auipc	a5,0x0
    80003094:	30078793          	addi	a5,a5,768 # 80003390 <kernelvec>
    80003098:	10579073          	csrw	stvec,a5
    8000309c:	00813403          	ld	s0,8(sp)
    800030a0:	01010113          	addi	sp,sp,16
    800030a4:	00008067          	ret

00000000800030a8 <usertrap>:
    800030a8:	ff010113          	addi	sp,sp,-16
    800030ac:	00813423          	sd	s0,8(sp)
    800030b0:	01010413          	addi	s0,sp,16
    800030b4:	00813403          	ld	s0,8(sp)
    800030b8:	01010113          	addi	sp,sp,16
    800030bc:	00008067          	ret

00000000800030c0 <usertrapret>:
    800030c0:	ff010113          	addi	sp,sp,-16
    800030c4:	00813423          	sd	s0,8(sp)
    800030c8:	01010413          	addi	s0,sp,16
    800030cc:	00813403          	ld	s0,8(sp)
    800030d0:	01010113          	addi	sp,sp,16
    800030d4:	00008067          	ret

00000000800030d8 <kerneltrap>:
    800030d8:	fe010113          	addi	sp,sp,-32
    800030dc:	00813823          	sd	s0,16(sp)
    800030e0:	00113c23          	sd	ra,24(sp)
    800030e4:	00913423          	sd	s1,8(sp)
    800030e8:	02010413          	addi	s0,sp,32
    800030ec:	142025f3          	csrr	a1,scause
    800030f0:	100027f3          	csrr	a5,sstatus
    800030f4:	0027f793          	andi	a5,a5,2
    800030f8:	10079c63          	bnez	a5,80003210 <kerneltrap+0x138>
    800030fc:	142027f3          	csrr	a5,scause
    80003100:	0207ce63          	bltz	a5,8000313c <kerneltrap+0x64>
    80003104:	00002517          	auipc	a0,0x2
    80003108:	15450513          	addi	a0,a0,340 # 80005258 <CONSOLE_STATUS+0x248>
    8000310c:	00001097          	auipc	ra,0x1
    80003110:	88c080e7          	jalr	-1908(ra) # 80003998 <__printf>
    80003114:	141025f3          	csrr	a1,sepc
    80003118:	14302673          	csrr	a2,stval
    8000311c:	00002517          	auipc	a0,0x2
    80003120:	14c50513          	addi	a0,a0,332 # 80005268 <CONSOLE_STATUS+0x258>
    80003124:	00001097          	auipc	ra,0x1
    80003128:	874080e7          	jalr	-1932(ra) # 80003998 <__printf>
    8000312c:	00002517          	auipc	a0,0x2
    80003130:	15450513          	addi	a0,a0,340 # 80005280 <CONSOLE_STATUS+0x270>
    80003134:	00001097          	auipc	ra,0x1
    80003138:	808080e7          	jalr	-2040(ra) # 8000393c <panic>
    8000313c:	0ff7f713          	andi	a4,a5,255
    80003140:	00900693          	li	a3,9
    80003144:	04d70063          	beq	a4,a3,80003184 <kerneltrap+0xac>
    80003148:	fff00713          	li	a4,-1
    8000314c:	03f71713          	slli	a4,a4,0x3f
    80003150:	00170713          	addi	a4,a4,1
    80003154:	fae798e3          	bne	a5,a4,80003104 <kerneltrap+0x2c>
    80003158:	00000097          	auipc	ra,0x0
    8000315c:	e00080e7          	jalr	-512(ra) # 80002f58 <cpuid>
    80003160:	06050663          	beqz	a0,800031cc <kerneltrap+0xf4>
    80003164:	144027f3          	csrr	a5,sip
    80003168:	ffd7f793          	andi	a5,a5,-3
    8000316c:	14479073          	csrw	sip,a5
    80003170:	01813083          	ld	ra,24(sp)
    80003174:	01013403          	ld	s0,16(sp)
    80003178:	00813483          	ld	s1,8(sp)
    8000317c:	02010113          	addi	sp,sp,32
    80003180:	00008067          	ret
    80003184:	00000097          	auipc	ra,0x0
    80003188:	3d0080e7          	jalr	976(ra) # 80003554 <plic_claim>
    8000318c:	00a00793          	li	a5,10
    80003190:	00050493          	mv	s1,a0
    80003194:	06f50863          	beq	a0,a5,80003204 <kerneltrap+0x12c>
    80003198:	fc050ce3          	beqz	a0,80003170 <kerneltrap+0x98>
    8000319c:	00050593          	mv	a1,a0
    800031a0:	00002517          	auipc	a0,0x2
    800031a4:	09850513          	addi	a0,a0,152 # 80005238 <CONSOLE_STATUS+0x228>
    800031a8:	00000097          	auipc	ra,0x0
    800031ac:	7f0080e7          	jalr	2032(ra) # 80003998 <__printf>
    800031b0:	01013403          	ld	s0,16(sp)
    800031b4:	01813083          	ld	ra,24(sp)
    800031b8:	00048513          	mv	a0,s1
    800031bc:	00813483          	ld	s1,8(sp)
    800031c0:	02010113          	addi	sp,sp,32
    800031c4:	00000317          	auipc	t1,0x0
    800031c8:	3c830067          	jr	968(t1) # 8000358c <plic_complete>
    800031cc:	00004517          	auipc	a0,0x4
    800031d0:	f4450513          	addi	a0,a0,-188 # 80007110 <tickslock>
    800031d4:	00001097          	auipc	ra,0x1
    800031d8:	498080e7          	jalr	1176(ra) # 8000466c <acquire>
    800031dc:	00003717          	auipc	a4,0x3
    800031e0:	e0870713          	addi	a4,a4,-504 # 80005fe4 <ticks>
    800031e4:	00072783          	lw	a5,0(a4)
    800031e8:	00004517          	auipc	a0,0x4
    800031ec:	f2850513          	addi	a0,a0,-216 # 80007110 <tickslock>
    800031f0:	0017879b          	addiw	a5,a5,1
    800031f4:	00f72023          	sw	a5,0(a4)
    800031f8:	00001097          	auipc	ra,0x1
    800031fc:	540080e7          	jalr	1344(ra) # 80004738 <release>
    80003200:	f65ff06f          	j	80003164 <kerneltrap+0x8c>
    80003204:	00001097          	auipc	ra,0x1
    80003208:	09c080e7          	jalr	156(ra) # 800042a0 <uartintr>
    8000320c:	fa5ff06f          	j	800031b0 <kerneltrap+0xd8>
    80003210:	00002517          	auipc	a0,0x2
    80003214:	00850513          	addi	a0,a0,8 # 80005218 <CONSOLE_STATUS+0x208>
    80003218:	00000097          	auipc	ra,0x0
    8000321c:	724080e7          	jalr	1828(ra) # 8000393c <panic>

0000000080003220 <clockintr>:
    80003220:	fe010113          	addi	sp,sp,-32
    80003224:	00813823          	sd	s0,16(sp)
    80003228:	00913423          	sd	s1,8(sp)
    8000322c:	00113c23          	sd	ra,24(sp)
    80003230:	02010413          	addi	s0,sp,32
    80003234:	00004497          	auipc	s1,0x4
    80003238:	edc48493          	addi	s1,s1,-292 # 80007110 <tickslock>
    8000323c:	00048513          	mv	a0,s1
    80003240:	00001097          	auipc	ra,0x1
    80003244:	42c080e7          	jalr	1068(ra) # 8000466c <acquire>
    80003248:	00003717          	auipc	a4,0x3
    8000324c:	d9c70713          	addi	a4,a4,-612 # 80005fe4 <ticks>
    80003250:	00072783          	lw	a5,0(a4)
    80003254:	01013403          	ld	s0,16(sp)
    80003258:	01813083          	ld	ra,24(sp)
    8000325c:	00048513          	mv	a0,s1
    80003260:	0017879b          	addiw	a5,a5,1
    80003264:	00813483          	ld	s1,8(sp)
    80003268:	00f72023          	sw	a5,0(a4)
    8000326c:	02010113          	addi	sp,sp,32
    80003270:	00001317          	auipc	t1,0x1
    80003274:	4c830067          	jr	1224(t1) # 80004738 <release>

0000000080003278 <devintr>:
    80003278:	142027f3          	csrr	a5,scause
    8000327c:	00000513          	li	a0,0
    80003280:	0007c463          	bltz	a5,80003288 <devintr+0x10>
    80003284:	00008067          	ret
    80003288:	fe010113          	addi	sp,sp,-32
    8000328c:	00813823          	sd	s0,16(sp)
    80003290:	00113c23          	sd	ra,24(sp)
    80003294:	00913423          	sd	s1,8(sp)
    80003298:	02010413          	addi	s0,sp,32
    8000329c:	0ff7f713          	andi	a4,a5,255
    800032a0:	00900693          	li	a3,9
    800032a4:	04d70c63          	beq	a4,a3,800032fc <devintr+0x84>
    800032a8:	fff00713          	li	a4,-1
    800032ac:	03f71713          	slli	a4,a4,0x3f
    800032b0:	00170713          	addi	a4,a4,1
    800032b4:	00e78c63          	beq	a5,a4,800032cc <devintr+0x54>
    800032b8:	01813083          	ld	ra,24(sp)
    800032bc:	01013403          	ld	s0,16(sp)
    800032c0:	00813483          	ld	s1,8(sp)
    800032c4:	02010113          	addi	sp,sp,32
    800032c8:	00008067          	ret
    800032cc:	00000097          	auipc	ra,0x0
    800032d0:	c8c080e7          	jalr	-884(ra) # 80002f58 <cpuid>
    800032d4:	06050663          	beqz	a0,80003340 <devintr+0xc8>
    800032d8:	144027f3          	csrr	a5,sip
    800032dc:	ffd7f793          	andi	a5,a5,-3
    800032e0:	14479073          	csrw	sip,a5
    800032e4:	01813083          	ld	ra,24(sp)
    800032e8:	01013403          	ld	s0,16(sp)
    800032ec:	00813483          	ld	s1,8(sp)
    800032f0:	00200513          	li	a0,2
    800032f4:	02010113          	addi	sp,sp,32
    800032f8:	00008067          	ret
    800032fc:	00000097          	auipc	ra,0x0
    80003300:	258080e7          	jalr	600(ra) # 80003554 <plic_claim>
    80003304:	00a00793          	li	a5,10
    80003308:	00050493          	mv	s1,a0
    8000330c:	06f50663          	beq	a0,a5,80003378 <devintr+0x100>
    80003310:	00100513          	li	a0,1
    80003314:	fa0482e3          	beqz	s1,800032b8 <devintr+0x40>
    80003318:	00048593          	mv	a1,s1
    8000331c:	00002517          	auipc	a0,0x2
    80003320:	f1c50513          	addi	a0,a0,-228 # 80005238 <CONSOLE_STATUS+0x228>
    80003324:	00000097          	auipc	ra,0x0
    80003328:	674080e7          	jalr	1652(ra) # 80003998 <__printf>
    8000332c:	00048513          	mv	a0,s1
    80003330:	00000097          	auipc	ra,0x0
    80003334:	25c080e7          	jalr	604(ra) # 8000358c <plic_complete>
    80003338:	00100513          	li	a0,1
    8000333c:	f7dff06f          	j	800032b8 <devintr+0x40>
    80003340:	00004517          	auipc	a0,0x4
    80003344:	dd050513          	addi	a0,a0,-560 # 80007110 <tickslock>
    80003348:	00001097          	auipc	ra,0x1
    8000334c:	324080e7          	jalr	804(ra) # 8000466c <acquire>
    80003350:	00003717          	auipc	a4,0x3
    80003354:	c9470713          	addi	a4,a4,-876 # 80005fe4 <ticks>
    80003358:	00072783          	lw	a5,0(a4)
    8000335c:	00004517          	auipc	a0,0x4
    80003360:	db450513          	addi	a0,a0,-588 # 80007110 <tickslock>
    80003364:	0017879b          	addiw	a5,a5,1
    80003368:	00f72023          	sw	a5,0(a4)
    8000336c:	00001097          	auipc	ra,0x1
    80003370:	3cc080e7          	jalr	972(ra) # 80004738 <release>
    80003374:	f65ff06f          	j	800032d8 <devintr+0x60>
    80003378:	00001097          	auipc	ra,0x1
    8000337c:	f28080e7          	jalr	-216(ra) # 800042a0 <uartintr>
    80003380:	fadff06f          	j	8000332c <devintr+0xb4>
	...

0000000080003390 <kernelvec>:
    80003390:	f0010113          	addi	sp,sp,-256
    80003394:	00113023          	sd	ra,0(sp)
    80003398:	00213423          	sd	sp,8(sp)
    8000339c:	00313823          	sd	gp,16(sp)
    800033a0:	00413c23          	sd	tp,24(sp)
    800033a4:	02513023          	sd	t0,32(sp)
    800033a8:	02613423          	sd	t1,40(sp)
    800033ac:	02713823          	sd	t2,48(sp)
    800033b0:	02813c23          	sd	s0,56(sp)
    800033b4:	04913023          	sd	s1,64(sp)
    800033b8:	04a13423          	sd	a0,72(sp)
    800033bc:	04b13823          	sd	a1,80(sp)
    800033c0:	04c13c23          	sd	a2,88(sp)
    800033c4:	06d13023          	sd	a3,96(sp)
    800033c8:	06e13423          	sd	a4,104(sp)
    800033cc:	06f13823          	sd	a5,112(sp)
    800033d0:	07013c23          	sd	a6,120(sp)
    800033d4:	09113023          	sd	a7,128(sp)
    800033d8:	09213423          	sd	s2,136(sp)
    800033dc:	09313823          	sd	s3,144(sp)
    800033e0:	09413c23          	sd	s4,152(sp)
    800033e4:	0b513023          	sd	s5,160(sp)
    800033e8:	0b613423          	sd	s6,168(sp)
    800033ec:	0b713823          	sd	s7,176(sp)
    800033f0:	0b813c23          	sd	s8,184(sp)
    800033f4:	0d913023          	sd	s9,192(sp)
    800033f8:	0da13423          	sd	s10,200(sp)
    800033fc:	0db13823          	sd	s11,208(sp)
    80003400:	0dc13c23          	sd	t3,216(sp)
    80003404:	0fd13023          	sd	t4,224(sp)
    80003408:	0fe13423          	sd	t5,232(sp)
    8000340c:	0ff13823          	sd	t6,240(sp)
    80003410:	cc9ff0ef          	jal	ra,800030d8 <kerneltrap>
    80003414:	00013083          	ld	ra,0(sp)
    80003418:	00813103          	ld	sp,8(sp)
    8000341c:	01013183          	ld	gp,16(sp)
    80003420:	02013283          	ld	t0,32(sp)
    80003424:	02813303          	ld	t1,40(sp)
    80003428:	03013383          	ld	t2,48(sp)
    8000342c:	03813403          	ld	s0,56(sp)
    80003430:	04013483          	ld	s1,64(sp)
    80003434:	04813503          	ld	a0,72(sp)
    80003438:	05013583          	ld	a1,80(sp)
    8000343c:	05813603          	ld	a2,88(sp)
    80003440:	06013683          	ld	a3,96(sp)
    80003444:	06813703          	ld	a4,104(sp)
    80003448:	07013783          	ld	a5,112(sp)
    8000344c:	07813803          	ld	a6,120(sp)
    80003450:	08013883          	ld	a7,128(sp)
    80003454:	08813903          	ld	s2,136(sp)
    80003458:	09013983          	ld	s3,144(sp)
    8000345c:	09813a03          	ld	s4,152(sp)
    80003460:	0a013a83          	ld	s5,160(sp)
    80003464:	0a813b03          	ld	s6,168(sp)
    80003468:	0b013b83          	ld	s7,176(sp)
    8000346c:	0b813c03          	ld	s8,184(sp)
    80003470:	0c013c83          	ld	s9,192(sp)
    80003474:	0c813d03          	ld	s10,200(sp)
    80003478:	0d013d83          	ld	s11,208(sp)
    8000347c:	0d813e03          	ld	t3,216(sp)
    80003480:	0e013e83          	ld	t4,224(sp)
    80003484:	0e813f03          	ld	t5,232(sp)
    80003488:	0f013f83          	ld	t6,240(sp)
    8000348c:	10010113          	addi	sp,sp,256
    80003490:	10200073          	sret
    80003494:	00000013          	nop
    80003498:	00000013          	nop
    8000349c:	00000013          	nop

00000000800034a0 <timervec>:
    800034a0:	34051573          	csrrw	a0,mscratch,a0
    800034a4:	00b53023          	sd	a1,0(a0)
    800034a8:	00c53423          	sd	a2,8(a0)
    800034ac:	00d53823          	sd	a3,16(a0)
    800034b0:	01853583          	ld	a1,24(a0)
    800034b4:	02053603          	ld	a2,32(a0)
    800034b8:	0005b683          	ld	a3,0(a1)
    800034bc:	00c686b3          	add	a3,a3,a2
    800034c0:	00d5b023          	sd	a3,0(a1)
    800034c4:	00200593          	li	a1,2
    800034c8:	14459073          	csrw	sip,a1
    800034cc:	01053683          	ld	a3,16(a0)
    800034d0:	00853603          	ld	a2,8(a0)
    800034d4:	00053583          	ld	a1,0(a0)
    800034d8:	34051573          	csrrw	a0,mscratch,a0
    800034dc:	30200073          	mret

00000000800034e0 <plicinit>:
    800034e0:	ff010113          	addi	sp,sp,-16
    800034e4:	00813423          	sd	s0,8(sp)
    800034e8:	01010413          	addi	s0,sp,16
    800034ec:	00813403          	ld	s0,8(sp)
    800034f0:	0c0007b7          	lui	a5,0xc000
    800034f4:	00100713          	li	a4,1
    800034f8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800034fc:	00e7a223          	sw	a4,4(a5)
    80003500:	01010113          	addi	sp,sp,16
    80003504:	00008067          	ret

0000000080003508 <plicinithart>:
    80003508:	ff010113          	addi	sp,sp,-16
    8000350c:	00813023          	sd	s0,0(sp)
    80003510:	00113423          	sd	ra,8(sp)
    80003514:	01010413          	addi	s0,sp,16
    80003518:	00000097          	auipc	ra,0x0
    8000351c:	a40080e7          	jalr	-1472(ra) # 80002f58 <cpuid>
    80003520:	0085171b          	slliw	a4,a0,0x8
    80003524:	0c0027b7          	lui	a5,0xc002
    80003528:	00e787b3          	add	a5,a5,a4
    8000352c:	40200713          	li	a4,1026
    80003530:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003534:	00813083          	ld	ra,8(sp)
    80003538:	00013403          	ld	s0,0(sp)
    8000353c:	00d5151b          	slliw	a0,a0,0xd
    80003540:	0c2017b7          	lui	a5,0xc201
    80003544:	00a78533          	add	a0,a5,a0
    80003548:	00052023          	sw	zero,0(a0)
    8000354c:	01010113          	addi	sp,sp,16
    80003550:	00008067          	ret

0000000080003554 <plic_claim>:
    80003554:	ff010113          	addi	sp,sp,-16
    80003558:	00813023          	sd	s0,0(sp)
    8000355c:	00113423          	sd	ra,8(sp)
    80003560:	01010413          	addi	s0,sp,16
    80003564:	00000097          	auipc	ra,0x0
    80003568:	9f4080e7          	jalr	-1548(ra) # 80002f58 <cpuid>
    8000356c:	00813083          	ld	ra,8(sp)
    80003570:	00013403          	ld	s0,0(sp)
    80003574:	00d5151b          	slliw	a0,a0,0xd
    80003578:	0c2017b7          	lui	a5,0xc201
    8000357c:	00a78533          	add	a0,a5,a0
    80003580:	00452503          	lw	a0,4(a0)
    80003584:	01010113          	addi	sp,sp,16
    80003588:	00008067          	ret

000000008000358c <plic_complete>:
    8000358c:	fe010113          	addi	sp,sp,-32
    80003590:	00813823          	sd	s0,16(sp)
    80003594:	00913423          	sd	s1,8(sp)
    80003598:	00113c23          	sd	ra,24(sp)
    8000359c:	02010413          	addi	s0,sp,32
    800035a0:	00050493          	mv	s1,a0
    800035a4:	00000097          	auipc	ra,0x0
    800035a8:	9b4080e7          	jalr	-1612(ra) # 80002f58 <cpuid>
    800035ac:	01813083          	ld	ra,24(sp)
    800035b0:	01013403          	ld	s0,16(sp)
    800035b4:	00d5179b          	slliw	a5,a0,0xd
    800035b8:	0c201737          	lui	a4,0xc201
    800035bc:	00f707b3          	add	a5,a4,a5
    800035c0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    800035c4:	00813483          	ld	s1,8(sp)
    800035c8:	02010113          	addi	sp,sp,32
    800035cc:	00008067          	ret

00000000800035d0 <consolewrite>:
    800035d0:	fb010113          	addi	sp,sp,-80
    800035d4:	04813023          	sd	s0,64(sp)
    800035d8:	04113423          	sd	ra,72(sp)
    800035dc:	02913c23          	sd	s1,56(sp)
    800035e0:	03213823          	sd	s2,48(sp)
    800035e4:	03313423          	sd	s3,40(sp)
    800035e8:	03413023          	sd	s4,32(sp)
    800035ec:	01513c23          	sd	s5,24(sp)
    800035f0:	05010413          	addi	s0,sp,80
    800035f4:	06c05c63          	blez	a2,8000366c <consolewrite+0x9c>
    800035f8:	00060993          	mv	s3,a2
    800035fc:	00050a13          	mv	s4,a0
    80003600:	00058493          	mv	s1,a1
    80003604:	00000913          	li	s2,0
    80003608:	fff00a93          	li	s5,-1
    8000360c:	01c0006f          	j	80003628 <consolewrite+0x58>
    80003610:	fbf44503          	lbu	a0,-65(s0)
    80003614:	0019091b          	addiw	s2,s2,1
    80003618:	00148493          	addi	s1,s1,1
    8000361c:	00001097          	auipc	ra,0x1
    80003620:	a9c080e7          	jalr	-1380(ra) # 800040b8 <uartputc>
    80003624:	03298063          	beq	s3,s2,80003644 <consolewrite+0x74>
    80003628:	00048613          	mv	a2,s1
    8000362c:	00100693          	li	a3,1
    80003630:	000a0593          	mv	a1,s4
    80003634:	fbf40513          	addi	a0,s0,-65
    80003638:	00000097          	auipc	ra,0x0
    8000363c:	9d8080e7          	jalr	-1576(ra) # 80003010 <either_copyin>
    80003640:	fd5518e3          	bne	a0,s5,80003610 <consolewrite+0x40>
    80003644:	04813083          	ld	ra,72(sp)
    80003648:	04013403          	ld	s0,64(sp)
    8000364c:	03813483          	ld	s1,56(sp)
    80003650:	02813983          	ld	s3,40(sp)
    80003654:	02013a03          	ld	s4,32(sp)
    80003658:	01813a83          	ld	s5,24(sp)
    8000365c:	00090513          	mv	a0,s2
    80003660:	03013903          	ld	s2,48(sp)
    80003664:	05010113          	addi	sp,sp,80
    80003668:	00008067          	ret
    8000366c:	00000913          	li	s2,0
    80003670:	fd5ff06f          	j	80003644 <consolewrite+0x74>

0000000080003674 <consoleread>:
    80003674:	f9010113          	addi	sp,sp,-112
    80003678:	06813023          	sd	s0,96(sp)
    8000367c:	04913c23          	sd	s1,88(sp)
    80003680:	05213823          	sd	s2,80(sp)
    80003684:	05313423          	sd	s3,72(sp)
    80003688:	05413023          	sd	s4,64(sp)
    8000368c:	03513c23          	sd	s5,56(sp)
    80003690:	03613823          	sd	s6,48(sp)
    80003694:	03713423          	sd	s7,40(sp)
    80003698:	03813023          	sd	s8,32(sp)
    8000369c:	06113423          	sd	ra,104(sp)
    800036a0:	01913c23          	sd	s9,24(sp)
    800036a4:	07010413          	addi	s0,sp,112
    800036a8:	00060b93          	mv	s7,a2
    800036ac:	00050913          	mv	s2,a0
    800036b0:	00058c13          	mv	s8,a1
    800036b4:	00060b1b          	sext.w	s6,a2
    800036b8:	00004497          	auipc	s1,0x4
    800036bc:	a8048493          	addi	s1,s1,-1408 # 80007138 <cons>
    800036c0:	00400993          	li	s3,4
    800036c4:	fff00a13          	li	s4,-1
    800036c8:	00a00a93          	li	s5,10
    800036cc:	05705e63          	blez	s7,80003728 <consoleread+0xb4>
    800036d0:	09c4a703          	lw	a4,156(s1)
    800036d4:	0984a783          	lw	a5,152(s1)
    800036d8:	0007071b          	sext.w	a4,a4
    800036dc:	08e78463          	beq	a5,a4,80003764 <consoleread+0xf0>
    800036e0:	07f7f713          	andi	a4,a5,127
    800036e4:	00e48733          	add	a4,s1,a4
    800036e8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800036ec:	0017869b          	addiw	a3,a5,1
    800036f0:	08d4ac23          	sw	a3,152(s1)
    800036f4:	00070c9b          	sext.w	s9,a4
    800036f8:	0b370663          	beq	a4,s3,800037a4 <consoleread+0x130>
    800036fc:	00100693          	li	a3,1
    80003700:	f9f40613          	addi	a2,s0,-97
    80003704:	000c0593          	mv	a1,s8
    80003708:	00090513          	mv	a0,s2
    8000370c:	f8e40fa3          	sb	a4,-97(s0)
    80003710:	00000097          	auipc	ra,0x0
    80003714:	8b4080e7          	jalr	-1868(ra) # 80002fc4 <either_copyout>
    80003718:	01450863          	beq	a0,s4,80003728 <consoleread+0xb4>
    8000371c:	001c0c13          	addi	s8,s8,1
    80003720:	fffb8b9b          	addiw	s7,s7,-1
    80003724:	fb5c94e3          	bne	s9,s5,800036cc <consoleread+0x58>
    80003728:	000b851b          	sext.w	a0,s7
    8000372c:	06813083          	ld	ra,104(sp)
    80003730:	06013403          	ld	s0,96(sp)
    80003734:	05813483          	ld	s1,88(sp)
    80003738:	05013903          	ld	s2,80(sp)
    8000373c:	04813983          	ld	s3,72(sp)
    80003740:	04013a03          	ld	s4,64(sp)
    80003744:	03813a83          	ld	s5,56(sp)
    80003748:	02813b83          	ld	s7,40(sp)
    8000374c:	02013c03          	ld	s8,32(sp)
    80003750:	01813c83          	ld	s9,24(sp)
    80003754:	40ab053b          	subw	a0,s6,a0
    80003758:	03013b03          	ld	s6,48(sp)
    8000375c:	07010113          	addi	sp,sp,112
    80003760:	00008067          	ret
    80003764:	00001097          	auipc	ra,0x1
    80003768:	1d8080e7          	jalr	472(ra) # 8000493c <push_on>
    8000376c:	0984a703          	lw	a4,152(s1)
    80003770:	09c4a783          	lw	a5,156(s1)
    80003774:	0007879b          	sext.w	a5,a5
    80003778:	fef70ce3          	beq	a4,a5,80003770 <consoleread+0xfc>
    8000377c:	00001097          	auipc	ra,0x1
    80003780:	234080e7          	jalr	564(ra) # 800049b0 <pop_on>
    80003784:	0984a783          	lw	a5,152(s1)
    80003788:	07f7f713          	andi	a4,a5,127
    8000378c:	00e48733          	add	a4,s1,a4
    80003790:	01874703          	lbu	a4,24(a4)
    80003794:	0017869b          	addiw	a3,a5,1
    80003798:	08d4ac23          	sw	a3,152(s1)
    8000379c:	00070c9b          	sext.w	s9,a4
    800037a0:	f5371ee3          	bne	a4,s3,800036fc <consoleread+0x88>
    800037a4:	000b851b          	sext.w	a0,s7
    800037a8:	f96bf2e3          	bgeu	s7,s6,8000372c <consoleread+0xb8>
    800037ac:	08f4ac23          	sw	a5,152(s1)
    800037b0:	f7dff06f          	j	8000372c <consoleread+0xb8>

00000000800037b4 <consputc>:
    800037b4:	10000793          	li	a5,256
    800037b8:	00f50663          	beq	a0,a5,800037c4 <consputc+0x10>
    800037bc:	00001317          	auipc	t1,0x1
    800037c0:	9f430067          	jr	-1548(t1) # 800041b0 <uartputc_sync>
    800037c4:	ff010113          	addi	sp,sp,-16
    800037c8:	00113423          	sd	ra,8(sp)
    800037cc:	00813023          	sd	s0,0(sp)
    800037d0:	01010413          	addi	s0,sp,16
    800037d4:	00800513          	li	a0,8
    800037d8:	00001097          	auipc	ra,0x1
    800037dc:	9d8080e7          	jalr	-1576(ra) # 800041b0 <uartputc_sync>
    800037e0:	02000513          	li	a0,32
    800037e4:	00001097          	auipc	ra,0x1
    800037e8:	9cc080e7          	jalr	-1588(ra) # 800041b0 <uartputc_sync>
    800037ec:	00013403          	ld	s0,0(sp)
    800037f0:	00813083          	ld	ra,8(sp)
    800037f4:	00800513          	li	a0,8
    800037f8:	01010113          	addi	sp,sp,16
    800037fc:	00001317          	auipc	t1,0x1
    80003800:	9b430067          	jr	-1612(t1) # 800041b0 <uartputc_sync>

0000000080003804 <consoleintr>:
    80003804:	fe010113          	addi	sp,sp,-32
    80003808:	00813823          	sd	s0,16(sp)
    8000380c:	00913423          	sd	s1,8(sp)
    80003810:	01213023          	sd	s2,0(sp)
    80003814:	00113c23          	sd	ra,24(sp)
    80003818:	02010413          	addi	s0,sp,32
    8000381c:	00004917          	auipc	s2,0x4
    80003820:	91c90913          	addi	s2,s2,-1764 # 80007138 <cons>
    80003824:	00050493          	mv	s1,a0
    80003828:	00090513          	mv	a0,s2
    8000382c:	00001097          	auipc	ra,0x1
    80003830:	e40080e7          	jalr	-448(ra) # 8000466c <acquire>
    80003834:	02048c63          	beqz	s1,8000386c <consoleintr+0x68>
    80003838:	0a092783          	lw	a5,160(s2)
    8000383c:	09892703          	lw	a4,152(s2)
    80003840:	07f00693          	li	a3,127
    80003844:	40e7873b          	subw	a4,a5,a4
    80003848:	02e6e263          	bltu	a3,a4,8000386c <consoleintr+0x68>
    8000384c:	00d00713          	li	a4,13
    80003850:	04e48063          	beq	s1,a4,80003890 <consoleintr+0x8c>
    80003854:	07f7f713          	andi	a4,a5,127
    80003858:	00e90733          	add	a4,s2,a4
    8000385c:	0017879b          	addiw	a5,a5,1
    80003860:	0af92023          	sw	a5,160(s2)
    80003864:	00970c23          	sb	s1,24(a4)
    80003868:	08f92e23          	sw	a5,156(s2)
    8000386c:	01013403          	ld	s0,16(sp)
    80003870:	01813083          	ld	ra,24(sp)
    80003874:	00813483          	ld	s1,8(sp)
    80003878:	00013903          	ld	s2,0(sp)
    8000387c:	00004517          	auipc	a0,0x4
    80003880:	8bc50513          	addi	a0,a0,-1860 # 80007138 <cons>
    80003884:	02010113          	addi	sp,sp,32
    80003888:	00001317          	auipc	t1,0x1
    8000388c:	eb030067          	jr	-336(t1) # 80004738 <release>
    80003890:	00a00493          	li	s1,10
    80003894:	fc1ff06f          	j	80003854 <consoleintr+0x50>

0000000080003898 <consoleinit>:
    80003898:	fe010113          	addi	sp,sp,-32
    8000389c:	00113c23          	sd	ra,24(sp)
    800038a0:	00813823          	sd	s0,16(sp)
    800038a4:	00913423          	sd	s1,8(sp)
    800038a8:	02010413          	addi	s0,sp,32
    800038ac:	00004497          	auipc	s1,0x4
    800038b0:	88c48493          	addi	s1,s1,-1908 # 80007138 <cons>
    800038b4:	00048513          	mv	a0,s1
    800038b8:	00002597          	auipc	a1,0x2
    800038bc:	9d858593          	addi	a1,a1,-1576 # 80005290 <CONSOLE_STATUS+0x280>
    800038c0:	00001097          	auipc	ra,0x1
    800038c4:	d88080e7          	jalr	-632(ra) # 80004648 <initlock>
    800038c8:	00000097          	auipc	ra,0x0
    800038cc:	7ac080e7          	jalr	1964(ra) # 80004074 <uartinit>
    800038d0:	01813083          	ld	ra,24(sp)
    800038d4:	01013403          	ld	s0,16(sp)
    800038d8:	00000797          	auipc	a5,0x0
    800038dc:	d9c78793          	addi	a5,a5,-612 # 80003674 <consoleread>
    800038e0:	0af4bc23          	sd	a5,184(s1)
    800038e4:	00000797          	auipc	a5,0x0
    800038e8:	cec78793          	addi	a5,a5,-788 # 800035d0 <consolewrite>
    800038ec:	0cf4b023          	sd	a5,192(s1)
    800038f0:	00813483          	ld	s1,8(sp)
    800038f4:	02010113          	addi	sp,sp,32
    800038f8:	00008067          	ret

00000000800038fc <console_read>:
    800038fc:	ff010113          	addi	sp,sp,-16
    80003900:	00813423          	sd	s0,8(sp)
    80003904:	01010413          	addi	s0,sp,16
    80003908:	00813403          	ld	s0,8(sp)
    8000390c:	00004317          	auipc	t1,0x4
    80003910:	8e433303          	ld	t1,-1820(t1) # 800071f0 <devsw+0x10>
    80003914:	01010113          	addi	sp,sp,16
    80003918:	00030067          	jr	t1

000000008000391c <console_write>:
    8000391c:	ff010113          	addi	sp,sp,-16
    80003920:	00813423          	sd	s0,8(sp)
    80003924:	01010413          	addi	s0,sp,16
    80003928:	00813403          	ld	s0,8(sp)
    8000392c:	00004317          	auipc	t1,0x4
    80003930:	8cc33303          	ld	t1,-1844(t1) # 800071f8 <devsw+0x18>
    80003934:	01010113          	addi	sp,sp,16
    80003938:	00030067          	jr	t1

000000008000393c <panic>:
    8000393c:	fe010113          	addi	sp,sp,-32
    80003940:	00113c23          	sd	ra,24(sp)
    80003944:	00813823          	sd	s0,16(sp)
    80003948:	00913423          	sd	s1,8(sp)
    8000394c:	02010413          	addi	s0,sp,32
    80003950:	00050493          	mv	s1,a0
    80003954:	00002517          	auipc	a0,0x2
    80003958:	94450513          	addi	a0,a0,-1724 # 80005298 <CONSOLE_STATUS+0x288>
    8000395c:	00004797          	auipc	a5,0x4
    80003960:	9207ae23          	sw	zero,-1732(a5) # 80007298 <pr+0x18>
    80003964:	00000097          	auipc	ra,0x0
    80003968:	034080e7          	jalr	52(ra) # 80003998 <__printf>
    8000396c:	00048513          	mv	a0,s1
    80003970:	00000097          	auipc	ra,0x0
    80003974:	028080e7          	jalr	40(ra) # 80003998 <__printf>
    80003978:	00002517          	auipc	a0,0x2
    8000397c:	90050513          	addi	a0,a0,-1792 # 80005278 <CONSOLE_STATUS+0x268>
    80003980:	00000097          	auipc	ra,0x0
    80003984:	018080e7          	jalr	24(ra) # 80003998 <__printf>
    80003988:	00100793          	li	a5,1
    8000398c:	00002717          	auipc	a4,0x2
    80003990:	64f72e23          	sw	a5,1628(a4) # 80005fe8 <panicked>
    80003994:	0000006f          	j	80003994 <panic+0x58>

0000000080003998 <__printf>:
    80003998:	f3010113          	addi	sp,sp,-208
    8000399c:	08813023          	sd	s0,128(sp)
    800039a0:	07313423          	sd	s3,104(sp)
    800039a4:	09010413          	addi	s0,sp,144
    800039a8:	05813023          	sd	s8,64(sp)
    800039ac:	08113423          	sd	ra,136(sp)
    800039b0:	06913c23          	sd	s1,120(sp)
    800039b4:	07213823          	sd	s2,112(sp)
    800039b8:	07413023          	sd	s4,96(sp)
    800039bc:	05513c23          	sd	s5,88(sp)
    800039c0:	05613823          	sd	s6,80(sp)
    800039c4:	05713423          	sd	s7,72(sp)
    800039c8:	03913c23          	sd	s9,56(sp)
    800039cc:	03a13823          	sd	s10,48(sp)
    800039d0:	03b13423          	sd	s11,40(sp)
    800039d4:	00004317          	auipc	t1,0x4
    800039d8:	8ac30313          	addi	t1,t1,-1876 # 80007280 <pr>
    800039dc:	01832c03          	lw	s8,24(t1)
    800039e0:	00b43423          	sd	a1,8(s0)
    800039e4:	00c43823          	sd	a2,16(s0)
    800039e8:	00d43c23          	sd	a3,24(s0)
    800039ec:	02e43023          	sd	a4,32(s0)
    800039f0:	02f43423          	sd	a5,40(s0)
    800039f4:	03043823          	sd	a6,48(s0)
    800039f8:	03143c23          	sd	a7,56(s0)
    800039fc:	00050993          	mv	s3,a0
    80003a00:	4a0c1663          	bnez	s8,80003eac <__printf+0x514>
    80003a04:	60098c63          	beqz	s3,8000401c <__printf+0x684>
    80003a08:	0009c503          	lbu	a0,0(s3)
    80003a0c:	00840793          	addi	a5,s0,8
    80003a10:	f6f43c23          	sd	a5,-136(s0)
    80003a14:	00000493          	li	s1,0
    80003a18:	22050063          	beqz	a0,80003c38 <__printf+0x2a0>
    80003a1c:	00002a37          	lui	s4,0x2
    80003a20:	00018ab7          	lui	s5,0x18
    80003a24:	000f4b37          	lui	s6,0xf4
    80003a28:	00989bb7          	lui	s7,0x989
    80003a2c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003a30:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003a34:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003a38:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003a3c:	00148c9b          	addiw	s9,s1,1
    80003a40:	02500793          	li	a5,37
    80003a44:	01998933          	add	s2,s3,s9
    80003a48:	38f51263          	bne	a0,a5,80003dcc <__printf+0x434>
    80003a4c:	00094783          	lbu	a5,0(s2)
    80003a50:	00078c9b          	sext.w	s9,a5
    80003a54:	1e078263          	beqz	a5,80003c38 <__printf+0x2a0>
    80003a58:	0024849b          	addiw	s1,s1,2
    80003a5c:	07000713          	li	a4,112
    80003a60:	00998933          	add	s2,s3,s1
    80003a64:	38e78a63          	beq	a5,a4,80003df8 <__printf+0x460>
    80003a68:	20f76863          	bltu	a4,a5,80003c78 <__printf+0x2e0>
    80003a6c:	42a78863          	beq	a5,a0,80003e9c <__printf+0x504>
    80003a70:	06400713          	li	a4,100
    80003a74:	40e79663          	bne	a5,a4,80003e80 <__printf+0x4e8>
    80003a78:	f7843783          	ld	a5,-136(s0)
    80003a7c:	0007a603          	lw	a2,0(a5)
    80003a80:	00878793          	addi	a5,a5,8
    80003a84:	f6f43c23          	sd	a5,-136(s0)
    80003a88:	42064a63          	bltz	a2,80003ebc <__printf+0x524>
    80003a8c:	00a00713          	li	a4,10
    80003a90:	02e677bb          	remuw	a5,a2,a4
    80003a94:	00002d97          	auipc	s11,0x2
    80003a98:	82cd8d93          	addi	s11,s11,-2004 # 800052c0 <digits>
    80003a9c:	00900593          	li	a1,9
    80003aa0:	0006051b          	sext.w	a0,a2
    80003aa4:	00000c93          	li	s9,0
    80003aa8:	02079793          	slli	a5,a5,0x20
    80003aac:	0207d793          	srli	a5,a5,0x20
    80003ab0:	00fd87b3          	add	a5,s11,a5
    80003ab4:	0007c783          	lbu	a5,0(a5)
    80003ab8:	02e656bb          	divuw	a3,a2,a4
    80003abc:	f8f40023          	sb	a5,-128(s0)
    80003ac0:	14c5d863          	bge	a1,a2,80003c10 <__printf+0x278>
    80003ac4:	06300593          	li	a1,99
    80003ac8:	00100c93          	li	s9,1
    80003acc:	02e6f7bb          	remuw	a5,a3,a4
    80003ad0:	02079793          	slli	a5,a5,0x20
    80003ad4:	0207d793          	srli	a5,a5,0x20
    80003ad8:	00fd87b3          	add	a5,s11,a5
    80003adc:	0007c783          	lbu	a5,0(a5)
    80003ae0:	02e6d73b          	divuw	a4,a3,a4
    80003ae4:	f8f400a3          	sb	a5,-127(s0)
    80003ae8:	12a5f463          	bgeu	a1,a0,80003c10 <__printf+0x278>
    80003aec:	00a00693          	li	a3,10
    80003af0:	00900593          	li	a1,9
    80003af4:	02d777bb          	remuw	a5,a4,a3
    80003af8:	02079793          	slli	a5,a5,0x20
    80003afc:	0207d793          	srli	a5,a5,0x20
    80003b00:	00fd87b3          	add	a5,s11,a5
    80003b04:	0007c503          	lbu	a0,0(a5)
    80003b08:	02d757bb          	divuw	a5,a4,a3
    80003b0c:	f8a40123          	sb	a0,-126(s0)
    80003b10:	48e5f263          	bgeu	a1,a4,80003f94 <__printf+0x5fc>
    80003b14:	06300513          	li	a0,99
    80003b18:	02d7f5bb          	remuw	a1,a5,a3
    80003b1c:	02059593          	slli	a1,a1,0x20
    80003b20:	0205d593          	srli	a1,a1,0x20
    80003b24:	00bd85b3          	add	a1,s11,a1
    80003b28:	0005c583          	lbu	a1,0(a1)
    80003b2c:	02d7d7bb          	divuw	a5,a5,a3
    80003b30:	f8b401a3          	sb	a1,-125(s0)
    80003b34:	48e57263          	bgeu	a0,a4,80003fb8 <__printf+0x620>
    80003b38:	3e700513          	li	a0,999
    80003b3c:	02d7f5bb          	remuw	a1,a5,a3
    80003b40:	02059593          	slli	a1,a1,0x20
    80003b44:	0205d593          	srli	a1,a1,0x20
    80003b48:	00bd85b3          	add	a1,s11,a1
    80003b4c:	0005c583          	lbu	a1,0(a1)
    80003b50:	02d7d7bb          	divuw	a5,a5,a3
    80003b54:	f8b40223          	sb	a1,-124(s0)
    80003b58:	46e57663          	bgeu	a0,a4,80003fc4 <__printf+0x62c>
    80003b5c:	02d7f5bb          	remuw	a1,a5,a3
    80003b60:	02059593          	slli	a1,a1,0x20
    80003b64:	0205d593          	srli	a1,a1,0x20
    80003b68:	00bd85b3          	add	a1,s11,a1
    80003b6c:	0005c583          	lbu	a1,0(a1)
    80003b70:	02d7d7bb          	divuw	a5,a5,a3
    80003b74:	f8b402a3          	sb	a1,-123(s0)
    80003b78:	46ea7863          	bgeu	s4,a4,80003fe8 <__printf+0x650>
    80003b7c:	02d7f5bb          	remuw	a1,a5,a3
    80003b80:	02059593          	slli	a1,a1,0x20
    80003b84:	0205d593          	srli	a1,a1,0x20
    80003b88:	00bd85b3          	add	a1,s11,a1
    80003b8c:	0005c583          	lbu	a1,0(a1)
    80003b90:	02d7d7bb          	divuw	a5,a5,a3
    80003b94:	f8b40323          	sb	a1,-122(s0)
    80003b98:	3eeaf863          	bgeu	s5,a4,80003f88 <__printf+0x5f0>
    80003b9c:	02d7f5bb          	remuw	a1,a5,a3
    80003ba0:	02059593          	slli	a1,a1,0x20
    80003ba4:	0205d593          	srli	a1,a1,0x20
    80003ba8:	00bd85b3          	add	a1,s11,a1
    80003bac:	0005c583          	lbu	a1,0(a1)
    80003bb0:	02d7d7bb          	divuw	a5,a5,a3
    80003bb4:	f8b403a3          	sb	a1,-121(s0)
    80003bb8:	42eb7e63          	bgeu	s6,a4,80003ff4 <__printf+0x65c>
    80003bbc:	02d7f5bb          	remuw	a1,a5,a3
    80003bc0:	02059593          	slli	a1,a1,0x20
    80003bc4:	0205d593          	srli	a1,a1,0x20
    80003bc8:	00bd85b3          	add	a1,s11,a1
    80003bcc:	0005c583          	lbu	a1,0(a1)
    80003bd0:	02d7d7bb          	divuw	a5,a5,a3
    80003bd4:	f8b40423          	sb	a1,-120(s0)
    80003bd8:	42ebfc63          	bgeu	s7,a4,80004010 <__printf+0x678>
    80003bdc:	02079793          	slli	a5,a5,0x20
    80003be0:	0207d793          	srli	a5,a5,0x20
    80003be4:	00fd8db3          	add	s11,s11,a5
    80003be8:	000dc703          	lbu	a4,0(s11)
    80003bec:	00a00793          	li	a5,10
    80003bf0:	00900c93          	li	s9,9
    80003bf4:	f8e404a3          	sb	a4,-119(s0)
    80003bf8:	00065c63          	bgez	a2,80003c10 <__printf+0x278>
    80003bfc:	f9040713          	addi	a4,s0,-112
    80003c00:	00f70733          	add	a4,a4,a5
    80003c04:	02d00693          	li	a3,45
    80003c08:	fed70823          	sb	a3,-16(a4)
    80003c0c:	00078c93          	mv	s9,a5
    80003c10:	f8040793          	addi	a5,s0,-128
    80003c14:	01978cb3          	add	s9,a5,s9
    80003c18:	f7f40d13          	addi	s10,s0,-129
    80003c1c:	000cc503          	lbu	a0,0(s9)
    80003c20:	fffc8c93          	addi	s9,s9,-1
    80003c24:	00000097          	auipc	ra,0x0
    80003c28:	b90080e7          	jalr	-1136(ra) # 800037b4 <consputc>
    80003c2c:	ffac98e3          	bne	s9,s10,80003c1c <__printf+0x284>
    80003c30:	00094503          	lbu	a0,0(s2)
    80003c34:	e00514e3          	bnez	a0,80003a3c <__printf+0xa4>
    80003c38:	1a0c1663          	bnez	s8,80003de4 <__printf+0x44c>
    80003c3c:	08813083          	ld	ra,136(sp)
    80003c40:	08013403          	ld	s0,128(sp)
    80003c44:	07813483          	ld	s1,120(sp)
    80003c48:	07013903          	ld	s2,112(sp)
    80003c4c:	06813983          	ld	s3,104(sp)
    80003c50:	06013a03          	ld	s4,96(sp)
    80003c54:	05813a83          	ld	s5,88(sp)
    80003c58:	05013b03          	ld	s6,80(sp)
    80003c5c:	04813b83          	ld	s7,72(sp)
    80003c60:	04013c03          	ld	s8,64(sp)
    80003c64:	03813c83          	ld	s9,56(sp)
    80003c68:	03013d03          	ld	s10,48(sp)
    80003c6c:	02813d83          	ld	s11,40(sp)
    80003c70:	0d010113          	addi	sp,sp,208
    80003c74:	00008067          	ret
    80003c78:	07300713          	li	a4,115
    80003c7c:	1ce78a63          	beq	a5,a4,80003e50 <__printf+0x4b8>
    80003c80:	07800713          	li	a4,120
    80003c84:	1ee79e63          	bne	a5,a4,80003e80 <__printf+0x4e8>
    80003c88:	f7843783          	ld	a5,-136(s0)
    80003c8c:	0007a703          	lw	a4,0(a5)
    80003c90:	00878793          	addi	a5,a5,8
    80003c94:	f6f43c23          	sd	a5,-136(s0)
    80003c98:	28074263          	bltz	a4,80003f1c <__printf+0x584>
    80003c9c:	00001d97          	auipc	s11,0x1
    80003ca0:	624d8d93          	addi	s11,s11,1572 # 800052c0 <digits>
    80003ca4:	00f77793          	andi	a5,a4,15
    80003ca8:	00fd87b3          	add	a5,s11,a5
    80003cac:	0007c683          	lbu	a3,0(a5)
    80003cb0:	00f00613          	li	a2,15
    80003cb4:	0007079b          	sext.w	a5,a4
    80003cb8:	f8d40023          	sb	a3,-128(s0)
    80003cbc:	0047559b          	srliw	a1,a4,0x4
    80003cc0:	0047569b          	srliw	a3,a4,0x4
    80003cc4:	00000c93          	li	s9,0
    80003cc8:	0ee65063          	bge	a2,a4,80003da8 <__printf+0x410>
    80003ccc:	00f6f693          	andi	a3,a3,15
    80003cd0:	00dd86b3          	add	a3,s11,a3
    80003cd4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003cd8:	0087d79b          	srliw	a5,a5,0x8
    80003cdc:	00100c93          	li	s9,1
    80003ce0:	f8d400a3          	sb	a3,-127(s0)
    80003ce4:	0cb67263          	bgeu	a2,a1,80003da8 <__printf+0x410>
    80003ce8:	00f7f693          	andi	a3,a5,15
    80003cec:	00dd86b3          	add	a3,s11,a3
    80003cf0:	0006c583          	lbu	a1,0(a3)
    80003cf4:	00f00613          	li	a2,15
    80003cf8:	0047d69b          	srliw	a3,a5,0x4
    80003cfc:	f8b40123          	sb	a1,-126(s0)
    80003d00:	0047d593          	srli	a1,a5,0x4
    80003d04:	28f67e63          	bgeu	a2,a5,80003fa0 <__printf+0x608>
    80003d08:	00f6f693          	andi	a3,a3,15
    80003d0c:	00dd86b3          	add	a3,s11,a3
    80003d10:	0006c503          	lbu	a0,0(a3)
    80003d14:	0087d813          	srli	a6,a5,0x8
    80003d18:	0087d69b          	srliw	a3,a5,0x8
    80003d1c:	f8a401a3          	sb	a0,-125(s0)
    80003d20:	28b67663          	bgeu	a2,a1,80003fac <__printf+0x614>
    80003d24:	00f6f693          	andi	a3,a3,15
    80003d28:	00dd86b3          	add	a3,s11,a3
    80003d2c:	0006c583          	lbu	a1,0(a3)
    80003d30:	00c7d513          	srli	a0,a5,0xc
    80003d34:	00c7d69b          	srliw	a3,a5,0xc
    80003d38:	f8b40223          	sb	a1,-124(s0)
    80003d3c:	29067a63          	bgeu	a2,a6,80003fd0 <__printf+0x638>
    80003d40:	00f6f693          	andi	a3,a3,15
    80003d44:	00dd86b3          	add	a3,s11,a3
    80003d48:	0006c583          	lbu	a1,0(a3)
    80003d4c:	0107d813          	srli	a6,a5,0x10
    80003d50:	0107d69b          	srliw	a3,a5,0x10
    80003d54:	f8b402a3          	sb	a1,-123(s0)
    80003d58:	28a67263          	bgeu	a2,a0,80003fdc <__printf+0x644>
    80003d5c:	00f6f693          	andi	a3,a3,15
    80003d60:	00dd86b3          	add	a3,s11,a3
    80003d64:	0006c683          	lbu	a3,0(a3)
    80003d68:	0147d79b          	srliw	a5,a5,0x14
    80003d6c:	f8d40323          	sb	a3,-122(s0)
    80003d70:	21067663          	bgeu	a2,a6,80003f7c <__printf+0x5e4>
    80003d74:	02079793          	slli	a5,a5,0x20
    80003d78:	0207d793          	srli	a5,a5,0x20
    80003d7c:	00fd8db3          	add	s11,s11,a5
    80003d80:	000dc683          	lbu	a3,0(s11)
    80003d84:	00800793          	li	a5,8
    80003d88:	00700c93          	li	s9,7
    80003d8c:	f8d403a3          	sb	a3,-121(s0)
    80003d90:	00075c63          	bgez	a4,80003da8 <__printf+0x410>
    80003d94:	f9040713          	addi	a4,s0,-112
    80003d98:	00f70733          	add	a4,a4,a5
    80003d9c:	02d00693          	li	a3,45
    80003da0:	fed70823          	sb	a3,-16(a4)
    80003da4:	00078c93          	mv	s9,a5
    80003da8:	f8040793          	addi	a5,s0,-128
    80003dac:	01978cb3          	add	s9,a5,s9
    80003db0:	f7f40d13          	addi	s10,s0,-129
    80003db4:	000cc503          	lbu	a0,0(s9)
    80003db8:	fffc8c93          	addi	s9,s9,-1
    80003dbc:	00000097          	auipc	ra,0x0
    80003dc0:	9f8080e7          	jalr	-1544(ra) # 800037b4 <consputc>
    80003dc4:	ff9d18e3          	bne	s10,s9,80003db4 <__printf+0x41c>
    80003dc8:	0100006f          	j	80003dd8 <__printf+0x440>
    80003dcc:	00000097          	auipc	ra,0x0
    80003dd0:	9e8080e7          	jalr	-1560(ra) # 800037b4 <consputc>
    80003dd4:	000c8493          	mv	s1,s9
    80003dd8:	00094503          	lbu	a0,0(s2)
    80003ddc:	c60510e3          	bnez	a0,80003a3c <__printf+0xa4>
    80003de0:	e40c0ee3          	beqz	s8,80003c3c <__printf+0x2a4>
    80003de4:	00003517          	auipc	a0,0x3
    80003de8:	49c50513          	addi	a0,a0,1180 # 80007280 <pr>
    80003dec:	00001097          	auipc	ra,0x1
    80003df0:	94c080e7          	jalr	-1716(ra) # 80004738 <release>
    80003df4:	e49ff06f          	j	80003c3c <__printf+0x2a4>
    80003df8:	f7843783          	ld	a5,-136(s0)
    80003dfc:	03000513          	li	a0,48
    80003e00:	01000d13          	li	s10,16
    80003e04:	00878713          	addi	a4,a5,8
    80003e08:	0007bc83          	ld	s9,0(a5)
    80003e0c:	f6e43c23          	sd	a4,-136(s0)
    80003e10:	00000097          	auipc	ra,0x0
    80003e14:	9a4080e7          	jalr	-1628(ra) # 800037b4 <consputc>
    80003e18:	07800513          	li	a0,120
    80003e1c:	00000097          	auipc	ra,0x0
    80003e20:	998080e7          	jalr	-1640(ra) # 800037b4 <consputc>
    80003e24:	00001d97          	auipc	s11,0x1
    80003e28:	49cd8d93          	addi	s11,s11,1180 # 800052c0 <digits>
    80003e2c:	03ccd793          	srli	a5,s9,0x3c
    80003e30:	00fd87b3          	add	a5,s11,a5
    80003e34:	0007c503          	lbu	a0,0(a5)
    80003e38:	fffd0d1b          	addiw	s10,s10,-1
    80003e3c:	004c9c93          	slli	s9,s9,0x4
    80003e40:	00000097          	auipc	ra,0x0
    80003e44:	974080e7          	jalr	-1676(ra) # 800037b4 <consputc>
    80003e48:	fe0d12e3          	bnez	s10,80003e2c <__printf+0x494>
    80003e4c:	f8dff06f          	j	80003dd8 <__printf+0x440>
    80003e50:	f7843783          	ld	a5,-136(s0)
    80003e54:	0007bc83          	ld	s9,0(a5)
    80003e58:	00878793          	addi	a5,a5,8
    80003e5c:	f6f43c23          	sd	a5,-136(s0)
    80003e60:	000c9a63          	bnez	s9,80003e74 <__printf+0x4dc>
    80003e64:	1080006f          	j	80003f6c <__printf+0x5d4>
    80003e68:	001c8c93          	addi	s9,s9,1
    80003e6c:	00000097          	auipc	ra,0x0
    80003e70:	948080e7          	jalr	-1720(ra) # 800037b4 <consputc>
    80003e74:	000cc503          	lbu	a0,0(s9)
    80003e78:	fe0518e3          	bnez	a0,80003e68 <__printf+0x4d0>
    80003e7c:	f5dff06f          	j	80003dd8 <__printf+0x440>
    80003e80:	02500513          	li	a0,37
    80003e84:	00000097          	auipc	ra,0x0
    80003e88:	930080e7          	jalr	-1744(ra) # 800037b4 <consputc>
    80003e8c:	000c8513          	mv	a0,s9
    80003e90:	00000097          	auipc	ra,0x0
    80003e94:	924080e7          	jalr	-1756(ra) # 800037b4 <consputc>
    80003e98:	f41ff06f          	j	80003dd8 <__printf+0x440>
    80003e9c:	02500513          	li	a0,37
    80003ea0:	00000097          	auipc	ra,0x0
    80003ea4:	914080e7          	jalr	-1772(ra) # 800037b4 <consputc>
    80003ea8:	f31ff06f          	j	80003dd8 <__printf+0x440>
    80003eac:	00030513          	mv	a0,t1
    80003eb0:	00000097          	auipc	ra,0x0
    80003eb4:	7bc080e7          	jalr	1980(ra) # 8000466c <acquire>
    80003eb8:	b4dff06f          	j	80003a04 <__printf+0x6c>
    80003ebc:	40c0053b          	negw	a0,a2
    80003ec0:	00a00713          	li	a4,10
    80003ec4:	02e576bb          	remuw	a3,a0,a4
    80003ec8:	00001d97          	auipc	s11,0x1
    80003ecc:	3f8d8d93          	addi	s11,s11,1016 # 800052c0 <digits>
    80003ed0:	ff700593          	li	a1,-9
    80003ed4:	02069693          	slli	a3,a3,0x20
    80003ed8:	0206d693          	srli	a3,a3,0x20
    80003edc:	00dd86b3          	add	a3,s11,a3
    80003ee0:	0006c683          	lbu	a3,0(a3)
    80003ee4:	02e557bb          	divuw	a5,a0,a4
    80003ee8:	f8d40023          	sb	a3,-128(s0)
    80003eec:	10b65e63          	bge	a2,a1,80004008 <__printf+0x670>
    80003ef0:	06300593          	li	a1,99
    80003ef4:	02e7f6bb          	remuw	a3,a5,a4
    80003ef8:	02069693          	slli	a3,a3,0x20
    80003efc:	0206d693          	srli	a3,a3,0x20
    80003f00:	00dd86b3          	add	a3,s11,a3
    80003f04:	0006c683          	lbu	a3,0(a3)
    80003f08:	02e7d73b          	divuw	a4,a5,a4
    80003f0c:	00200793          	li	a5,2
    80003f10:	f8d400a3          	sb	a3,-127(s0)
    80003f14:	bca5ece3          	bltu	a1,a0,80003aec <__printf+0x154>
    80003f18:	ce5ff06f          	j	80003bfc <__printf+0x264>
    80003f1c:	40e007bb          	negw	a5,a4
    80003f20:	00001d97          	auipc	s11,0x1
    80003f24:	3a0d8d93          	addi	s11,s11,928 # 800052c0 <digits>
    80003f28:	00f7f693          	andi	a3,a5,15
    80003f2c:	00dd86b3          	add	a3,s11,a3
    80003f30:	0006c583          	lbu	a1,0(a3)
    80003f34:	ff100613          	li	a2,-15
    80003f38:	0047d69b          	srliw	a3,a5,0x4
    80003f3c:	f8b40023          	sb	a1,-128(s0)
    80003f40:	0047d59b          	srliw	a1,a5,0x4
    80003f44:	0ac75e63          	bge	a4,a2,80004000 <__printf+0x668>
    80003f48:	00f6f693          	andi	a3,a3,15
    80003f4c:	00dd86b3          	add	a3,s11,a3
    80003f50:	0006c603          	lbu	a2,0(a3)
    80003f54:	00f00693          	li	a3,15
    80003f58:	0087d79b          	srliw	a5,a5,0x8
    80003f5c:	f8c400a3          	sb	a2,-127(s0)
    80003f60:	d8b6e4e3          	bltu	a3,a1,80003ce8 <__printf+0x350>
    80003f64:	00200793          	li	a5,2
    80003f68:	e2dff06f          	j	80003d94 <__printf+0x3fc>
    80003f6c:	00001c97          	auipc	s9,0x1
    80003f70:	334c8c93          	addi	s9,s9,820 # 800052a0 <CONSOLE_STATUS+0x290>
    80003f74:	02800513          	li	a0,40
    80003f78:	ef1ff06f          	j	80003e68 <__printf+0x4d0>
    80003f7c:	00700793          	li	a5,7
    80003f80:	00600c93          	li	s9,6
    80003f84:	e0dff06f          	j	80003d90 <__printf+0x3f8>
    80003f88:	00700793          	li	a5,7
    80003f8c:	00600c93          	li	s9,6
    80003f90:	c69ff06f          	j	80003bf8 <__printf+0x260>
    80003f94:	00300793          	li	a5,3
    80003f98:	00200c93          	li	s9,2
    80003f9c:	c5dff06f          	j	80003bf8 <__printf+0x260>
    80003fa0:	00300793          	li	a5,3
    80003fa4:	00200c93          	li	s9,2
    80003fa8:	de9ff06f          	j	80003d90 <__printf+0x3f8>
    80003fac:	00400793          	li	a5,4
    80003fb0:	00300c93          	li	s9,3
    80003fb4:	dddff06f          	j	80003d90 <__printf+0x3f8>
    80003fb8:	00400793          	li	a5,4
    80003fbc:	00300c93          	li	s9,3
    80003fc0:	c39ff06f          	j	80003bf8 <__printf+0x260>
    80003fc4:	00500793          	li	a5,5
    80003fc8:	00400c93          	li	s9,4
    80003fcc:	c2dff06f          	j	80003bf8 <__printf+0x260>
    80003fd0:	00500793          	li	a5,5
    80003fd4:	00400c93          	li	s9,4
    80003fd8:	db9ff06f          	j	80003d90 <__printf+0x3f8>
    80003fdc:	00600793          	li	a5,6
    80003fe0:	00500c93          	li	s9,5
    80003fe4:	dadff06f          	j	80003d90 <__printf+0x3f8>
    80003fe8:	00600793          	li	a5,6
    80003fec:	00500c93          	li	s9,5
    80003ff0:	c09ff06f          	j	80003bf8 <__printf+0x260>
    80003ff4:	00800793          	li	a5,8
    80003ff8:	00700c93          	li	s9,7
    80003ffc:	bfdff06f          	j	80003bf8 <__printf+0x260>
    80004000:	00100793          	li	a5,1
    80004004:	d91ff06f          	j	80003d94 <__printf+0x3fc>
    80004008:	00100793          	li	a5,1
    8000400c:	bf1ff06f          	j	80003bfc <__printf+0x264>
    80004010:	00900793          	li	a5,9
    80004014:	00800c93          	li	s9,8
    80004018:	be1ff06f          	j	80003bf8 <__printf+0x260>
    8000401c:	00001517          	auipc	a0,0x1
    80004020:	28c50513          	addi	a0,a0,652 # 800052a8 <CONSOLE_STATUS+0x298>
    80004024:	00000097          	auipc	ra,0x0
    80004028:	918080e7          	jalr	-1768(ra) # 8000393c <panic>

000000008000402c <printfinit>:
    8000402c:	fe010113          	addi	sp,sp,-32
    80004030:	00813823          	sd	s0,16(sp)
    80004034:	00913423          	sd	s1,8(sp)
    80004038:	00113c23          	sd	ra,24(sp)
    8000403c:	02010413          	addi	s0,sp,32
    80004040:	00003497          	auipc	s1,0x3
    80004044:	24048493          	addi	s1,s1,576 # 80007280 <pr>
    80004048:	00048513          	mv	a0,s1
    8000404c:	00001597          	auipc	a1,0x1
    80004050:	26c58593          	addi	a1,a1,620 # 800052b8 <CONSOLE_STATUS+0x2a8>
    80004054:	00000097          	auipc	ra,0x0
    80004058:	5f4080e7          	jalr	1524(ra) # 80004648 <initlock>
    8000405c:	01813083          	ld	ra,24(sp)
    80004060:	01013403          	ld	s0,16(sp)
    80004064:	0004ac23          	sw	zero,24(s1)
    80004068:	00813483          	ld	s1,8(sp)
    8000406c:	02010113          	addi	sp,sp,32
    80004070:	00008067          	ret

0000000080004074 <uartinit>:
    80004074:	ff010113          	addi	sp,sp,-16
    80004078:	00813423          	sd	s0,8(sp)
    8000407c:	01010413          	addi	s0,sp,16
    80004080:	100007b7          	lui	a5,0x10000
    80004084:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004088:	f8000713          	li	a4,-128
    8000408c:	00e781a3          	sb	a4,3(a5)
    80004090:	00300713          	li	a4,3
    80004094:	00e78023          	sb	a4,0(a5)
    80004098:	000780a3          	sb	zero,1(a5)
    8000409c:	00e781a3          	sb	a4,3(a5)
    800040a0:	00700693          	li	a3,7
    800040a4:	00d78123          	sb	a3,2(a5)
    800040a8:	00e780a3          	sb	a4,1(a5)
    800040ac:	00813403          	ld	s0,8(sp)
    800040b0:	01010113          	addi	sp,sp,16
    800040b4:	00008067          	ret

00000000800040b8 <uartputc>:
    800040b8:	00002797          	auipc	a5,0x2
    800040bc:	f307a783          	lw	a5,-208(a5) # 80005fe8 <panicked>
    800040c0:	00078463          	beqz	a5,800040c8 <uartputc+0x10>
    800040c4:	0000006f          	j	800040c4 <uartputc+0xc>
    800040c8:	fd010113          	addi	sp,sp,-48
    800040cc:	02813023          	sd	s0,32(sp)
    800040d0:	00913c23          	sd	s1,24(sp)
    800040d4:	01213823          	sd	s2,16(sp)
    800040d8:	01313423          	sd	s3,8(sp)
    800040dc:	02113423          	sd	ra,40(sp)
    800040e0:	03010413          	addi	s0,sp,48
    800040e4:	00002917          	auipc	s2,0x2
    800040e8:	f0c90913          	addi	s2,s2,-244 # 80005ff0 <uart_tx_r>
    800040ec:	00093783          	ld	a5,0(s2)
    800040f0:	00002497          	auipc	s1,0x2
    800040f4:	f0848493          	addi	s1,s1,-248 # 80005ff8 <uart_tx_w>
    800040f8:	0004b703          	ld	a4,0(s1)
    800040fc:	02078693          	addi	a3,a5,32
    80004100:	00050993          	mv	s3,a0
    80004104:	02e69c63          	bne	a3,a4,8000413c <uartputc+0x84>
    80004108:	00001097          	auipc	ra,0x1
    8000410c:	834080e7          	jalr	-1996(ra) # 8000493c <push_on>
    80004110:	00093783          	ld	a5,0(s2)
    80004114:	0004b703          	ld	a4,0(s1)
    80004118:	02078793          	addi	a5,a5,32
    8000411c:	00e79463          	bne	a5,a4,80004124 <uartputc+0x6c>
    80004120:	0000006f          	j	80004120 <uartputc+0x68>
    80004124:	00001097          	auipc	ra,0x1
    80004128:	88c080e7          	jalr	-1908(ra) # 800049b0 <pop_on>
    8000412c:	00093783          	ld	a5,0(s2)
    80004130:	0004b703          	ld	a4,0(s1)
    80004134:	02078693          	addi	a3,a5,32
    80004138:	fce688e3          	beq	a3,a4,80004108 <uartputc+0x50>
    8000413c:	01f77693          	andi	a3,a4,31
    80004140:	00003597          	auipc	a1,0x3
    80004144:	16058593          	addi	a1,a1,352 # 800072a0 <uart_tx_buf>
    80004148:	00d586b3          	add	a3,a1,a3
    8000414c:	00170713          	addi	a4,a4,1
    80004150:	01368023          	sb	s3,0(a3)
    80004154:	00e4b023          	sd	a4,0(s1)
    80004158:	10000637          	lui	a2,0x10000
    8000415c:	02f71063          	bne	a4,a5,8000417c <uartputc+0xc4>
    80004160:	0340006f          	j	80004194 <uartputc+0xdc>
    80004164:	00074703          	lbu	a4,0(a4)
    80004168:	00f93023          	sd	a5,0(s2)
    8000416c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004170:	00093783          	ld	a5,0(s2)
    80004174:	0004b703          	ld	a4,0(s1)
    80004178:	00f70e63          	beq	a4,a5,80004194 <uartputc+0xdc>
    8000417c:	00564683          	lbu	a3,5(a2)
    80004180:	01f7f713          	andi	a4,a5,31
    80004184:	00e58733          	add	a4,a1,a4
    80004188:	0206f693          	andi	a3,a3,32
    8000418c:	00178793          	addi	a5,a5,1
    80004190:	fc069ae3          	bnez	a3,80004164 <uartputc+0xac>
    80004194:	02813083          	ld	ra,40(sp)
    80004198:	02013403          	ld	s0,32(sp)
    8000419c:	01813483          	ld	s1,24(sp)
    800041a0:	01013903          	ld	s2,16(sp)
    800041a4:	00813983          	ld	s3,8(sp)
    800041a8:	03010113          	addi	sp,sp,48
    800041ac:	00008067          	ret

00000000800041b0 <uartputc_sync>:
    800041b0:	ff010113          	addi	sp,sp,-16
    800041b4:	00813423          	sd	s0,8(sp)
    800041b8:	01010413          	addi	s0,sp,16
    800041bc:	00002717          	auipc	a4,0x2
    800041c0:	e2c72703          	lw	a4,-468(a4) # 80005fe8 <panicked>
    800041c4:	02071663          	bnez	a4,800041f0 <uartputc_sync+0x40>
    800041c8:	00050793          	mv	a5,a0
    800041cc:	100006b7          	lui	a3,0x10000
    800041d0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800041d4:	02077713          	andi	a4,a4,32
    800041d8:	fe070ce3          	beqz	a4,800041d0 <uartputc_sync+0x20>
    800041dc:	0ff7f793          	andi	a5,a5,255
    800041e0:	00f68023          	sb	a5,0(a3)
    800041e4:	00813403          	ld	s0,8(sp)
    800041e8:	01010113          	addi	sp,sp,16
    800041ec:	00008067          	ret
    800041f0:	0000006f          	j	800041f0 <uartputc_sync+0x40>

00000000800041f4 <uartstart>:
    800041f4:	ff010113          	addi	sp,sp,-16
    800041f8:	00813423          	sd	s0,8(sp)
    800041fc:	01010413          	addi	s0,sp,16
    80004200:	00002617          	auipc	a2,0x2
    80004204:	df060613          	addi	a2,a2,-528 # 80005ff0 <uart_tx_r>
    80004208:	00002517          	auipc	a0,0x2
    8000420c:	df050513          	addi	a0,a0,-528 # 80005ff8 <uart_tx_w>
    80004210:	00063783          	ld	a5,0(a2)
    80004214:	00053703          	ld	a4,0(a0)
    80004218:	04f70263          	beq	a4,a5,8000425c <uartstart+0x68>
    8000421c:	100005b7          	lui	a1,0x10000
    80004220:	00003817          	auipc	a6,0x3
    80004224:	08080813          	addi	a6,a6,128 # 800072a0 <uart_tx_buf>
    80004228:	01c0006f          	j	80004244 <uartstart+0x50>
    8000422c:	0006c703          	lbu	a4,0(a3)
    80004230:	00f63023          	sd	a5,0(a2)
    80004234:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004238:	00063783          	ld	a5,0(a2)
    8000423c:	00053703          	ld	a4,0(a0)
    80004240:	00f70e63          	beq	a4,a5,8000425c <uartstart+0x68>
    80004244:	01f7f713          	andi	a4,a5,31
    80004248:	00e806b3          	add	a3,a6,a4
    8000424c:	0055c703          	lbu	a4,5(a1)
    80004250:	00178793          	addi	a5,a5,1
    80004254:	02077713          	andi	a4,a4,32
    80004258:	fc071ae3          	bnez	a4,8000422c <uartstart+0x38>
    8000425c:	00813403          	ld	s0,8(sp)
    80004260:	01010113          	addi	sp,sp,16
    80004264:	00008067          	ret

0000000080004268 <uartgetc>:
    80004268:	ff010113          	addi	sp,sp,-16
    8000426c:	00813423          	sd	s0,8(sp)
    80004270:	01010413          	addi	s0,sp,16
    80004274:	10000737          	lui	a4,0x10000
    80004278:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000427c:	0017f793          	andi	a5,a5,1
    80004280:	00078c63          	beqz	a5,80004298 <uartgetc+0x30>
    80004284:	00074503          	lbu	a0,0(a4)
    80004288:	0ff57513          	andi	a0,a0,255
    8000428c:	00813403          	ld	s0,8(sp)
    80004290:	01010113          	addi	sp,sp,16
    80004294:	00008067          	ret
    80004298:	fff00513          	li	a0,-1
    8000429c:	ff1ff06f          	j	8000428c <uartgetc+0x24>

00000000800042a0 <uartintr>:
    800042a0:	100007b7          	lui	a5,0x10000
    800042a4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800042a8:	0017f793          	andi	a5,a5,1
    800042ac:	0a078463          	beqz	a5,80004354 <uartintr+0xb4>
    800042b0:	fe010113          	addi	sp,sp,-32
    800042b4:	00813823          	sd	s0,16(sp)
    800042b8:	00913423          	sd	s1,8(sp)
    800042bc:	00113c23          	sd	ra,24(sp)
    800042c0:	02010413          	addi	s0,sp,32
    800042c4:	100004b7          	lui	s1,0x10000
    800042c8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800042cc:	0ff57513          	andi	a0,a0,255
    800042d0:	fffff097          	auipc	ra,0xfffff
    800042d4:	534080e7          	jalr	1332(ra) # 80003804 <consoleintr>
    800042d8:	0054c783          	lbu	a5,5(s1)
    800042dc:	0017f793          	andi	a5,a5,1
    800042e0:	fe0794e3          	bnez	a5,800042c8 <uartintr+0x28>
    800042e4:	00002617          	auipc	a2,0x2
    800042e8:	d0c60613          	addi	a2,a2,-756 # 80005ff0 <uart_tx_r>
    800042ec:	00002517          	auipc	a0,0x2
    800042f0:	d0c50513          	addi	a0,a0,-756 # 80005ff8 <uart_tx_w>
    800042f4:	00063783          	ld	a5,0(a2)
    800042f8:	00053703          	ld	a4,0(a0)
    800042fc:	04f70263          	beq	a4,a5,80004340 <uartintr+0xa0>
    80004300:	100005b7          	lui	a1,0x10000
    80004304:	00003817          	auipc	a6,0x3
    80004308:	f9c80813          	addi	a6,a6,-100 # 800072a0 <uart_tx_buf>
    8000430c:	01c0006f          	j	80004328 <uartintr+0x88>
    80004310:	0006c703          	lbu	a4,0(a3)
    80004314:	00f63023          	sd	a5,0(a2)
    80004318:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000431c:	00063783          	ld	a5,0(a2)
    80004320:	00053703          	ld	a4,0(a0)
    80004324:	00f70e63          	beq	a4,a5,80004340 <uartintr+0xa0>
    80004328:	01f7f713          	andi	a4,a5,31
    8000432c:	00e806b3          	add	a3,a6,a4
    80004330:	0055c703          	lbu	a4,5(a1)
    80004334:	00178793          	addi	a5,a5,1
    80004338:	02077713          	andi	a4,a4,32
    8000433c:	fc071ae3          	bnez	a4,80004310 <uartintr+0x70>
    80004340:	01813083          	ld	ra,24(sp)
    80004344:	01013403          	ld	s0,16(sp)
    80004348:	00813483          	ld	s1,8(sp)
    8000434c:	02010113          	addi	sp,sp,32
    80004350:	00008067          	ret
    80004354:	00002617          	auipc	a2,0x2
    80004358:	c9c60613          	addi	a2,a2,-868 # 80005ff0 <uart_tx_r>
    8000435c:	00002517          	auipc	a0,0x2
    80004360:	c9c50513          	addi	a0,a0,-868 # 80005ff8 <uart_tx_w>
    80004364:	00063783          	ld	a5,0(a2)
    80004368:	00053703          	ld	a4,0(a0)
    8000436c:	04f70263          	beq	a4,a5,800043b0 <uartintr+0x110>
    80004370:	100005b7          	lui	a1,0x10000
    80004374:	00003817          	auipc	a6,0x3
    80004378:	f2c80813          	addi	a6,a6,-212 # 800072a0 <uart_tx_buf>
    8000437c:	01c0006f          	j	80004398 <uartintr+0xf8>
    80004380:	0006c703          	lbu	a4,0(a3)
    80004384:	00f63023          	sd	a5,0(a2)
    80004388:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000438c:	00063783          	ld	a5,0(a2)
    80004390:	00053703          	ld	a4,0(a0)
    80004394:	02f70063          	beq	a4,a5,800043b4 <uartintr+0x114>
    80004398:	01f7f713          	andi	a4,a5,31
    8000439c:	00e806b3          	add	a3,a6,a4
    800043a0:	0055c703          	lbu	a4,5(a1)
    800043a4:	00178793          	addi	a5,a5,1
    800043a8:	02077713          	andi	a4,a4,32
    800043ac:	fc071ae3          	bnez	a4,80004380 <uartintr+0xe0>
    800043b0:	00008067          	ret
    800043b4:	00008067          	ret

00000000800043b8 <kinit>:
    800043b8:	fc010113          	addi	sp,sp,-64
    800043bc:	02913423          	sd	s1,40(sp)
    800043c0:	fffff7b7          	lui	a5,0xfffff
    800043c4:	00004497          	auipc	s1,0x4
    800043c8:	efb48493          	addi	s1,s1,-261 # 800082bf <end+0xfff>
    800043cc:	02813823          	sd	s0,48(sp)
    800043d0:	01313c23          	sd	s3,24(sp)
    800043d4:	00f4f4b3          	and	s1,s1,a5
    800043d8:	02113c23          	sd	ra,56(sp)
    800043dc:	03213023          	sd	s2,32(sp)
    800043e0:	01413823          	sd	s4,16(sp)
    800043e4:	01513423          	sd	s5,8(sp)
    800043e8:	04010413          	addi	s0,sp,64
    800043ec:	000017b7          	lui	a5,0x1
    800043f0:	01100993          	li	s3,17
    800043f4:	00f487b3          	add	a5,s1,a5
    800043f8:	01b99993          	slli	s3,s3,0x1b
    800043fc:	06f9e063          	bltu	s3,a5,8000445c <kinit+0xa4>
    80004400:	00003a97          	auipc	s5,0x3
    80004404:	ec0a8a93          	addi	s5,s5,-320 # 800072c0 <end>
    80004408:	0754ec63          	bltu	s1,s5,80004480 <kinit+0xc8>
    8000440c:	0734fa63          	bgeu	s1,s3,80004480 <kinit+0xc8>
    80004410:	00088a37          	lui	s4,0x88
    80004414:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004418:	00002917          	auipc	s2,0x2
    8000441c:	be890913          	addi	s2,s2,-1048 # 80006000 <kmem>
    80004420:	00ca1a13          	slli	s4,s4,0xc
    80004424:	0140006f          	j	80004438 <kinit+0x80>
    80004428:	000017b7          	lui	a5,0x1
    8000442c:	00f484b3          	add	s1,s1,a5
    80004430:	0554e863          	bltu	s1,s5,80004480 <kinit+0xc8>
    80004434:	0534f663          	bgeu	s1,s3,80004480 <kinit+0xc8>
    80004438:	00001637          	lui	a2,0x1
    8000443c:	00100593          	li	a1,1
    80004440:	00048513          	mv	a0,s1
    80004444:	00000097          	auipc	ra,0x0
    80004448:	5e4080e7          	jalr	1508(ra) # 80004a28 <__memset>
    8000444c:	00093783          	ld	a5,0(s2)
    80004450:	00f4b023          	sd	a5,0(s1)
    80004454:	00993023          	sd	s1,0(s2)
    80004458:	fd4498e3          	bne	s1,s4,80004428 <kinit+0x70>
    8000445c:	03813083          	ld	ra,56(sp)
    80004460:	03013403          	ld	s0,48(sp)
    80004464:	02813483          	ld	s1,40(sp)
    80004468:	02013903          	ld	s2,32(sp)
    8000446c:	01813983          	ld	s3,24(sp)
    80004470:	01013a03          	ld	s4,16(sp)
    80004474:	00813a83          	ld	s5,8(sp)
    80004478:	04010113          	addi	sp,sp,64
    8000447c:	00008067          	ret
    80004480:	00001517          	auipc	a0,0x1
    80004484:	e5850513          	addi	a0,a0,-424 # 800052d8 <digits+0x18>
    80004488:	fffff097          	auipc	ra,0xfffff
    8000448c:	4b4080e7          	jalr	1204(ra) # 8000393c <panic>

0000000080004490 <freerange>:
    80004490:	fc010113          	addi	sp,sp,-64
    80004494:	000017b7          	lui	a5,0x1
    80004498:	02913423          	sd	s1,40(sp)
    8000449c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800044a0:	009504b3          	add	s1,a0,s1
    800044a4:	fffff537          	lui	a0,0xfffff
    800044a8:	02813823          	sd	s0,48(sp)
    800044ac:	02113c23          	sd	ra,56(sp)
    800044b0:	03213023          	sd	s2,32(sp)
    800044b4:	01313c23          	sd	s3,24(sp)
    800044b8:	01413823          	sd	s4,16(sp)
    800044bc:	01513423          	sd	s5,8(sp)
    800044c0:	01613023          	sd	s6,0(sp)
    800044c4:	04010413          	addi	s0,sp,64
    800044c8:	00a4f4b3          	and	s1,s1,a0
    800044cc:	00f487b3          	add	a5,s1,a5
    800044d0:	06f5e463          	bltu	a1,a5,80004538 <freerange+0xa8>
    800044d4:	00003a97          	auipc	s5,0x3
    800044d8:	deca8a93          	addi	s5,s5,-532 # 800072c0 <end>
    800044dc:	0954e263          	bltu	s1,s5,80004560 <freerange+0xd0>
    800044e0:	01100993          	li	s3,17
    800044e4:	01b99993          	slli	s3,s3,0x1b
    800044e8:	0734fc63          	bgeu	s1,s3,80004560 <freerange+0xd0>
    800044ec:	00058a13          	mv	s4,a1
    800044f0:	00002917          	auipc	s2,0x2
    800044f4:	b1090913          	addi	s2,s2,-1264 # 80006000 <kmem>
    800044f8:	00002b37          	lui	s6,0x2
    800044fc:	0140006f          	j	80004510 <freerange+0x80>
    80004500:	000017b7          	lui	a5,0x1
    80004504:	00f484b3          	add	s1,s1,a5
    80004508:	0554ec63          	bltu	s1,s5,80004560 <freerange+0xd0>
    8000450c:	0534fa63          	bgeu	s1,s3,80004560 <freerange+0xd0>
    80004510:	00001637          	lui	a2,0x1
    80004514:	00100593          	li	a1,1
    80004518:	00048513          	mv	a0,s1
    8000451c:	00000097          	auipc	ra,0x0
    80004520:	50c080e7          	jalr	1292(ra) # 80004a28 <__memset>
    80004524:	00093703          	ld	a4,0(s2)
    80004528:	016487b3          	add	a5,s1,s6
    8000452c:	00e4b023          	sd	a4,0(s1)
    80004530:	00993023          	sd	s1,0(s2)
    80004534:	fcfa76e3          	bgeu	s4,a5,80004500 <freerange+0x70>
    80004538:	03813083          	ld	ra,56(sp)
    8000453c:	03013403          	ld	s0,48(sp)
    80004540:	02813483          	ld	s1,40(sp)
    80004544:	02013903          	ld	s2,32(sp)
    80004548:	01813983          	ld	s3,24(sp)
    8000454c:	01013a03          	ld	s4,16(sp)
    80004550:	00813a83          	ld	s5,8(sp)
    80004554:	00013b03          	ld	s6,0(sp)
    80004558:	04010113          	addi	sp,sp,64
    8000455c:	00008067          	ret
    80004560:	00001517          	auipc	a0,0x1
    80004564:	d7850513          	addi	a0,a0,-648 # 800052d8 <digits+0x18>
    80004568:	fffff097          	auipc	ra,0xfffff
    8000456c:	3d4080e7          	jalr	980(ra) # 8000393c <panic>

0000000080004570 <kfree>:
    80004570:	fe010113          	addi	sp,sp,-32
    80004574:	00813823          	sd	s0,16(sp)
    80004578:	00113c23          	sd	ra,24(sp)
    8000457c:	00913423          	sd	s1,8(sp)
    80004580:	02010413          	addi	s0,sp,32
    80004584:	03451793          	slli	a5,a0,0x34
    80004588:	04079c63          	bnez	a5,800045e0 <kfree+0x70>
    8000458c:	00003797          	auipc	a5,0x3
    80004590:	d3478793          	addi	a5,a5,-716 # 800072c0 <end>
    80004594:	00050493          	mv	s1,a0
    80004598:	04f56463          	bltu	a0,a5,800045e0 <kfree+0x70>
    8000459c:	01100793          	li	a5,17
    800045a0:	01b79793          	slli	a5,a5,0x1b
    800045a4:	02f57e63          	bgeu	a0,a5,800045e0 <kfree+0x70>
    800045a8:	00001637          	lui	a2,0x1
    800045ac:	00100593          	li	a1,1
    800045b0:	00000097          	auipc	ra,0x0
    800045b4:	478080e7          	jalr	1144(ra) # 80004a28 <__memset>
    800045b8:	00002797          	auipc	a5,0x2
    800045bc:	a4878793          	addi	a5,a5,-1464 # 80006000 <kmem>
    800045c0:	0007b703          	ld	a4,0(a5)
    800045c4:	01813083          	ld	ra,24(sp)
    800045c8:	01013403          	ld	s0,16(sp)
    800045cc:	00e4b023          	sd	a4,0(s1)
    800045d0:	0097b023          	sd	s1,0(a5)
    800045d4:	00813483          	ld	s1,8(sp)
    800045d8:	02010113          	addi	sp,sp,32
    800045dc:	00008067          	ret
    800045e0:	00001517          	auipc	a0,0x1
    800045e4:	cf850513          	addi	a0,a0,-776 # 800052d8 <digits+0x18>
    800045e8:	fffff097          	auipc	ra,0xfffff
    800045ec:	354080e7          	jalr	852(ra) # 8000393c <panic>

00000000800045f0 <kalloc>:
    800045f0:	fe010113          	addi	sp,sp,-32
    800045f4:	00813823          	sd	s0,16(sp)
    800045f8:	00913423          	sd	s1,8(sp)
    800045fc:	00113c23          	sd	ra,24(sp)
    80004600:	02010413          	addi	s0,sp,32
    80004604:	00002797          	auipc	a5,0x2
    80004608:	9fc78793          	addi	a5,a5,-1540 # 80006000 <kmem>
    8000460c:	0007b483          	ld	s1,0(a5)
    80004610:	02048063          	beqz	s1,80004630 <kalloc+0x40>
    80004614:	0004b703          	ld	a4,0(s1)
    80004618:	00001637          	lui	a2,0x1
    8000461c:	00500593          	li	a1,5
    80004620:	00048513          	mv	a0,s1
    80004624:	00e7b023          	sd	a4,0(a5)
    80004628:	00000097          	auipc	ra,0x0
    8000462c:	400080e7          	jalr	1024(ra) # 80004a28 <__memset>
    80004630:	01813083          	ld	ra,24(sp)
    80004634:	01013403          	ld	s0,16(sp)
    80004638:	00048513          	mv	a0,s1
    8000463c:	00813483          	ld	s1,8(sp)
    80004640:	02010113          	addi	sp,sp,32
    80004644:	00008067          	ret

0000000080004648 <initlock>:
    80004648:	ff010113          	addi	sp,sp,-16
    8000464c:	00813423          	sd	s0,8(sp)
    80004650:	01010413          	addi	s0,sp,16
    80004654:	00813403          	ld	s0,8(sp)
    80004658:	00b53423          	sd	a1,8(a0)
    8000465c:	00052023          	sw	zero,0(a0)
    80004660:	00053823          	sd	zero,16(a0)
    80004664:	01010113          	addi	sp,sp,16
    80004668:	00008067          	ret

000000008000466c <acquire>:
    8000466c:	fe010113          	addi	sp,sp,-32
    80004670:	00813823          	sd	s0,16(sp)
    80004674:	00913423          	sd	s1,8(sp)
    80004678:	00113c23          	sd	ra,24(sp)
    8000467c:	01213023          	sd	s2,0(sp)
    80004680:	02010413          	addi	s0,sp,32
    80004684:	00050493          	mv	s1,a0
    80004688:	10002973          	csrr	s2,sstatus
    8000468c:	100027f3          	csrr	a5,sstatus
    80004690:	ffd7f793          	andi	a5,a5,-3
    80004694:	10079073          	csrw	sstatus,a5
    80004698:	fffff097          	auipc	ra,0xfffff
    8000469c:	8e0080e7          	jalr	-1824(ra) # 80002f78 <mycpu>
    800046a0:	07852783          	lw	a5,120(a0)
    800046a4:	06078e63          	beqz	a5,80004720 <acquire+0xb4>
    800046a8:	fffff097          	auipc	ra,0xfffff
    800046ac:	8d0080e7          	jalr	-1840(ra) # 80002f78 <mycpu>
    800046b0:	07852783          	lw	a5,120(a0)
    800046b4:	0004a703          	lw	a4,0(s1)
    800046b8:	0017879b          	addiw	a5,a5,1
    800046bc:	06f52c23          	sw	a5,120(a0)
    800046c0:	04071063          	bnez	a4,80004700 <acquire+0x94>
    800046c4:	00100713          	li	a4,1
    800046c8:	00070793          	mv	a5,a4
    800046cc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800046d0:	0007879b          	sext.w	a5,a5
    800046d4:	fe079ae3          	bnez	a5,800046c8 <acquire+0x5c>
    800046d8:	0ff0000f          	fence
    800046dc:	fffff097          	auipc	ra,0xfffff
    800046e0:	89c080e7          	jalr	-1892(ra) # 80002f78 <mycpu>
    800046e4:	01813083          	ld	ra,24(sp)
    800046e8:	01013403          	ld	s0,16(sp)
    800046ec:	00a4b823          	sd	a0,16(s1)
    800046f0:	00013903          	ld	s2,0(sp)
    800046f4:	00813483          	ld	s1,8(sp)
    800046f8:	02010113          	addi	sp,sp,32
    800046fc:	00008067          	ret
    80004700:	0104b903          	ld	s2,16(s1)
    80004704:	fffff097          	auipc	ra,0xfffff
    80004708:	874080e7          	jalr	-1932(ra) # 80002f78 <mycpu>
    8000470c:	faa91ce3          	bne	s2,a0,800046c4 <acquire+0x58>
    80004710:	00001517          	auipc	a0,0x1
    80004714:	bd050513          	addi	a0,a0,-1072 # 800052e0 <digits+0x20>
    80004718:	fffff097          	auipc	ra,0xfffff
    8000471c:	224080e7          	jalr	548(ra) # 8000393c <panic>
    80004720:	00195913          	srli	s2,s2,0x1
    80004724:	fffff097          	auipc	ra,0xfffff
    80004728:	854080e7          	jalr	-1964(ra) # 80002f78 <mycpu>
    8000472c:	00197913          	andi	s2,s2,1
    80004730:	07252e23          	sw	s2,124(a0)
    80004734:	f75ff06f          	j	800046a8 <acquire+0x3c>

0000000080004738 <release>:
    80004738:	fe010113          	addi	sp,sp,-32
    8000473c:	00813823          	sd	s0,16(sp)
    80004740:	00113c23          	sd	ra,24(sp)
    80004744:	00913423          	sd	s1,8(sp)
    80004748:	01213023          	sd	s2,0(sp)
    8000474c:	02010413          	addi	s0,sp,32
    80004750:	00052783          	lw	a5,0(a0)
    80004754:	00079a63          	bnez	a5,80004768 <release+0x30>
    80004758:	00001517          	auipc	a0,0x1
    8000475c:	b9050513          	addi	a0,a0,-1136 # 800052e8 <digits+0x28>
    80004760:	fffff097          	auipc	ra,0xfffff
    80004764:	1dc080e7          	jalr	476(ra) # 8000393c <panic>
    80004768:	01053903          	ld	s2,16(a0)
    8000476c:	00050493          	mv	s1,a0
    80004770:	fffff097          	auipc	ra,0xfffff
    80004774:	808080e7          	jalr	-2040(ra) # 80002f78 <mycpu>
    80004778:	fea910e3          	bne	s2,a0,80004758 <release+0x20>
    8000477c:	0004b823          	sd	zero,16(s1)
    80004780:	0ff0000f          	fence
    80004784:	0f50000f          	fence	iorw,ow
    80004788:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000478c:	ffffe097          	auipc	ra,0xffffe
    80004790:	7ec080e7          	jalr	2028(ra) # 80002f78 <mycpu>
    80004794:	100027f3          	csrr	a5,sstatus
    80004798:	0027f793          	andi	a5,a5,2
    8000479c:	04079a63          	bnez	a5,800047f0 <release+0xb8>
    800047a0:	07852783          	lw	a5,120(a0)
    800047a4:	02f05e63          	blez	a5,800047e0 <release+0xa8>
    800047a8:	fff7871b          	addiw	a4,a5,-1
    800047ac:	06e52c23          	sw	a4,120(a0)
    800047b0:	00071c63          	bnez	a4,800047c8 <release+0x90>
    800047b4:	07c52783          	lw	a5,124(a0)
    800047b8:	00078863          	beqz	a5,800047c8 <release+0x90>
    800047bc:	100027f3          	csrr	a5,sstatus
    800047c0:	0027e793          	ori	a5,a5,2
    800047c4:	10079073          	csrw	sstatus,a5
    800047c8:	01813083          	ld	ra,24(sp)
    800047cc:	01013403          	ld	s0,16(sp)
    800047d0:	00813483          	ld	s1,8(sp)
    800047d4:	00013903          	ld	s2,0(sp)
    800047d8:	02010113          	addi	sp,sp,32
    800047dc:	00008067          	ret
    800047e0:	00001517          	auipc	a0,0x1
    800047e4:	b2850513          	addi	a0,a0,-1240 # 80005308 <digits+0x48>
    800047e8:	fffff097          	auipc	ra,0xfffff
    800047ec:	154080e7          	jalr	340(ra) # 8000393c <panic>
    800047f0:	00001517          	auipc	a0,0x1
    800047f4:	b0050513          	addi	a0,a0,-1280 # 800052f0 <digits+0x30>
    800047f8:	fffff097          	auipc	ra,0xfffff
    800047fc:	144080e7          	jalr	324(ra) # 8000393c <panic>

0000000080004800 <holding>:
    80004800:	00052783          	lw	a5,0(a0)
    80004804:	00079663          	bnez	a5,80004810 <holding+0x10>
    80004808:	00000513          	li	a0,0
    8000480c:	00008067          	ret
    80004810:	fe010113          	addi	sp,sp,-32
    80004814:	00813823          	sd	s0,16(sp)
    80004818:	00913423          	sd	s1,8(sp)
    8000481c:	00113c23          	sd	ra,24(sp)
    80004820:	02010413          	addi	s0,sp,32
    80004824:	01053483          	ld	s1,16(a0)
    80004828:	ffffe097          	auipc	ra,0xffffe
    8000482c:	750080e7          	jalr	1872(ra) # 80002f78 <mycpu>
    80004830:	01813083          	ld	ra,24(sp)
    80004834:	01013403          	ld	s0,16(sp)
    80004838:	40a48533          	sub	a0,s1,a0
    8000483c:	00153513          	seqz	a0,a0
    80004840:	00813483          	ld	s1,8(sp)
    80004844:	02010113          	addi	sp,sp,32
    80004848:	00008067          	ret

000000008000484c <push_off>:
    8000484c:	fe010113          	addi	sp,sp,-32
    80004850:	00813823          	sd	s0,16(sp)
    80004854:	00113c23          	sd	ra,24(sp)
    80004858:	00913423          	sd	s1,8(sp)
    8000485c:	02010413          	addi	s0,sp,32
    80004860:	100024f3          	csrr	s1,sstatus
    80004864:	100027f3          	csrr	a5,sstatus
    80004868:	ffd7f793          	andi	a5,a5,-3
    8000486c:	10079073          	csrw	sstatus,a5
    80004870:	ffffe097          	auipc	ra,0xffffe
    80004874:	708080e7          	jalr	1800(ra) # 80002f78 <mycpu>
    80004878:	07852783          	lw	a5,120(a0)
    8000487c:	02078663          	beqz	a5,800048a8 <push_off+0x5c>
    80004880:	ffffe097          	auipc	ra,0xffffe
    80004884:	6f8080e7          	jalr	1784(ra) # 80002f78 <mycpu>
    80004888:	07852783          	lw	a5,120(a0)
    8000488c:	01813083          	ld	ra,24(sp)
    80004890:	01013403          	ld	s0,16(sp)
    80004894:	0017879b          	addiw	a5,a5,1
    80004898:	06f52c23          	sw	a5,120(a0)
    8000489c:	00813483          	ld	s1,8(sp)
    800048a0:	02010113          	addi	sp,sp,32
    800048a4:	00008067          	ret
    800048a8:	0014d493          	srli	s1,s1,0x1
    800048ac:	ffffe097          	auipc	ra,0xffffe
    800048b0:	6cc080e7          	jalr	1740(ra) # 80002f78 <mycpu>
    800048b4:	0014f493          	andi	s1,s1,1
    800048b8:	06952e23          	sw	s1,124(a0)
    800048bc:	fc5ff06f          	j	80004880 <push_off+0x34>

00000000800048c0 <pop_off>:
    800048c0:	ff010113          	addi	sp,sp,-16
    800048c4:	00813023          	sd	s0,0(sp)
    800048c8:	00113423          	sd	ra,8(sp)
    800048cc:	01010413          	addi	s0,sp,16
    800048d0:	ffffe097          	auipc	ra,0xffffe
    800048d4:	6a8080e7          	jalr	1704(ra) # 80002f78 <mycpu>
    800048d8:	100027f3          	csrr	a5,sstatus
    800048dc:	0027f793          	andi	a5,a5,2
    800048e0:	04079663          	bnez	a5,8000492c <pop_off+0x6c>
    800048e4:	07852783          	lw	a5,120(a0)
    800048e8:	02f05a63          	blez	a5,8000491c <pop_off+0x5c>
    800048ec:	fff7871b          	addiw	a4,a5,-1
    800048f0:	06e52c23          	sw	a4,120(a0)
    800048f4:	00071c63          	bnez	a4,8000490c <pop_off+0x4c>
    800048f8:	07c52783          	lw	a5,124(a0)
    800048fc:	00078863          	beqz	a5,8000490c <pop_off+0x4c>
    80004900:	100027f3          	csrr	a5,sstatus
    80004904:	0027e793          	ori	a5,a5,2
    80004908:	10079073          	csrw	sstatus,a5
    8000490c:	00813083          	ld	ra,8(sp)
    80004910:	00013403          	ld	s0,0(sp)
    80004914:	01010113          	addi	sp,sp,16
    80004918:	00008067          	ret
    8000491c:	00001517          	auipc	a0,0x1
    80004920:	9ec50513          	addi	a0,a0,-1556 # 80005308 <digits+0x48>
    80004924:	fffff097          	auipc	ra,0xfffff
    80004928:	018080e7          	jalr	24(ra) # 8000393c <panic>
    8000492c:	00001517          	auipc	a0,0x1
    80004930:	9c450513          	addi	a0,a0,-1596 # 800052f0 <digits+0x30>
    80004934:	fffff097          	auipc	ra,0xfffff
    80004938:	008080e7          	jalr	8(ra) # 8000393c <panic>

000000008000493c <push_on>:
    8000493c:	fe010113          	addi	sp,sp,-32
    80004940:	00813823          	sd	s0,16(sp)
    80004944:	00113c23          	sd	ra,24(sp)
    80004948:	00913423          	sd	s1,8(sp)
    8000494c:	02010413          	addi	s0,sp,32
    80004950:	100024f3          	csrr	s1,sstatus
    80004954:	100027f3          	csrr	a5,sstatus
    80004958:	0027e793          	ori	a5,a5,2
    8000495c:	10079073          	csrw	sstatus,a5
    80004960:	ffffe097          	auipc	ra,0xffffe
    80004964:	618080e7          	jalr	1560(ra) # 80002f78 <mycpu>
    80004968:	07852783          	lw	a5,120(a0)
    8000496c:	02078663          	beqz	a5,80004998 <push_on+0x5c>
    80004970:	ffffe097          	auipc	ra,0xffffe
    80004974:	608080e7          	jalr	1544(ra) # 80002f78 <mycpu>
    80004978:	07852783          	lw	a5,120(a0)
    8000497c:	01813083          	ld	ra,24(sp)
    80004980:	01013403          	ld	s0,16(sp)
    80004984:	0017879b          	addiw	a5,a5,1
    80004988:	06f52c23          	sw	a5,120(a0)
    8000498c:	00813483          	ld	s1,8(sp)
    80004990:	02010113          	addi	sp,sp,32
    80004994:	00008067          	ret
    80004998:	0014d493          	srli	s1,s1,0x1
    8000499c:	ffffe097          	auipc	ra,0xffffe
    800049a0:	5dc080e7          	jalr	1500(ra) # 80002f78 <mycpu>
    800049a4:	0014f493          	andi	s1,s1,1
    800049a8:	06952e23          	sw	s1,124(a0)
    800049ac:	fc5ff06f          	j	80004970 <push_on+0x34>

00000000800049b0 <pop_on>:
    800049b0:	ff010113          	addi	sp,sp,-16
    800049b4:	00813023          	sd	s0,0(sp)
    800049b8:	00113423          	sd	ra,8(sp)
    800049bc:	01010413          	addi	s0,sp,16
    800049c0:	ffffe097          	auipc	ra,0xffffe
    800049c4:	5b8080e7          	jalr	1464(ra) # 80002f78 <mycpu>
    800049c8:	100027f3          	csrr	a5,sstatus
    800049cc:	0027f793          	andi	a5,a5,2
    800049d0:	04078463          	beqz	a5,80004a18 <pop_on+0x68>
    800049d4:	07852783          	lw	a5,120(a0)
    800049d8:	02f05863          	blez	a5,80004a08 <pop_on+0x58>
    800049dc:	fff7879b          	addiw	a5,a5,-1
    800049e0:	06f52c23          	sw	a5,120(a0)
    800049e4:	07853783          	ld	a5,120(a0)
    800049e8:	00079863          	bnez	a5,800049f8 <pop_on+0x48>
    800049ec:	100027f3          	csrr	a5,sstatus
    800049f0:	ffd7f793          	andi	a5,a5,-3
    800049f4:	10079073          	csrw	sstatus,a5
    800049f8:	00813083          	ld	ra,8(sp)
    800049fc:	00013403          	ld	s0,0(sp)
    80004a00:	01010113          	addi	sp,sp,16
    80004a04:	00008067          	ret
    80004a08:	00001517          	auipc	a0,0x1
    80004a0c:	92850513          	addi	a0,a0,-1752 # 80005330 <digits+0x70>
    80004a10:	fffff097          	auipc	ra,0xfffff
    80004a14:	f2c080e7          	jalr	-212(ra) # 8000393c <panic>
    80004a18:	00001517          	auipc	a0,0x1
    80004a1c:	8f850513          	addi	a0,a0,-1800 # 80005310 <digits+0x50>
    80004a20:	fffff097          	auipc	ra,0xfffff
    80004a24:	f1c080e7          	jalr	-228(ra) # 8000393c <panic>

0000000080004a28 <__memset>:
    80004a28:	ff010113          	addi	sp,sp,-16
    80004a2c:	00813423          	sd	s0,8(sp)
    80004a30:	01010413          	addi	s0,sp,16
    80004a34:	1a060e63          	beqz	a2,80004bf0 <__memset+0x1c8>
    80004a38:	40a007b3          	neg	a5,a0
    80004a3c:	0077f793          	andi	a5,a5,7
    80004a40:	00778693          	addi	a3,a5,7
    80004a44:	00b00813          	li	a6,11
    80004a48:	0ff5f593          	andi	a1,a1,255
    80004a4c:	fff6071b          	addiw	a4,a2,-1
    80004a50:	1b06e663          	bltu	a3,a6,80004bfc <__memset+0x1d4>
    80004a54:	1cd76463          	bltu	a4,a3,80004c1c <__memset+0x1f4>
    80004a58:	1a078e63          	beqz	a5,80004c14 <__memset+0x1ec>
    80004a5c:	00b50023          	sb	a1,0(a0)
    80004a60:	00100713          	li	a4,1
    80004a64:	1ae78463          	beq	a5,a4,80004c0c <__memset+0x1e4>
    80004a68:	00b500a3          	sb	a1,1(a0)
    80004a6c:	00200713          	li	a4,2
    80004a70:	1ae78a63          	beq	a5,a4,80004c24 <__memset+0x1fc>
    80004a74:	00b50123          	sb	a1,2(a0)
    80004a78:	00300713          	li	a4,3
    80004a7c:	18e78463          	beq	a5,a4,80004c04 <__memset+0x1dc>
    80004a80:	00b501a3          	sb	a1,3(a0)
    80004a84:	00400713          	li	a4,4
    80004a88:	1ae78263          	beq	a5,a4,80004c2c <__memset+0x204>
    80004a8c:	00b50223          	sb	a1,4(a0)
    80004a90:	00500713          	li	a4,5
    80004a94:	1ae78063          	beq	a5,a4,80004c34 <__memset+0x20c>
    80004a98:	00b502a3          	sb	a1,5(a0)
    80004a9c:	00700713          	li	a4,7
    80004aa0:	18e79e63          	bne	a5,a4,80004c3c <__memset+0x214>
    80004aa4:	00b50323          	sb	a1,6(a0)
    80004aa8:	00700e93          	li	t4,7
    80004aac:	00859713          	slli	a4,a1,0x8
    80004ab0:	00e5e733          	or	a4,a1,a4
    80004ab4:	01059e13          	slli	t3,a1,0x10
    80004ab8:	01c76e33          	or	t3,a4,t3
    80004abc:	01859313          	slli	t1,a1,0x18
    80004ac0:	006e6333          	or	t1,t3,t1
    80004ac4:	02059893          	slli	a7,a1,0x20
    80004ac8:	40f60e3b          	subw	t3,a2,a5
    80004acc:	011368b3          	or	a7,t1,a7
    80004ad0:	02859813          	slli	a6,a1,0x28
    80004ad4:	0108e833          	or	a6,a7,a6
    80004ad8:	03059693          	slli	a3,a1,0x30
    80004adc:	003e589b          	srliw	a7,t3,0x3
    80004ae0:	00d866b3          	or	a3,a6,a3
    80004ae4:	03859713          	slli	a4,a1,0x38
    80004ae8:	00389813          	slli	a6,a7,0x3
    80004aec:	00f507b3          	add	a5,a0,a5
    80004af0:	00e6e733          	or	a4,a3,a4
    80004af4:	000e089b          	sext.w	a7,t3
    80004af8:	00f806b3          	add	a3,a6,a5
    80004afc:	00e7b023          	sd	a4,0(a5)
    80004b00:	00878793          	addi	a5,a5,8
    80004b04:	fed79ce3          	bne	a5,a3,80004afc <__memset+0xd4>
    80004b08:	ff8e7793          	andi	a5,t3,-8
    80004b0c:	0007871b          	sext.w	a4,a5
    80004b10:	01d787bb          	addw	a5,a5,t4
    80004b14:	0ce88e63          	beq	a7,a4,80004bf0 <__memset+0x1c8>
    80004b18:	00f50733          	add	a4,a0,a5
    80004b1c:	00b70023          	sb	a1,0(a4)
    80004b20:	0017871b          	addiw	a4,a5,1
    80004b24:	0cc77663          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004b28:	00e50733          	add	a4,a0,a4
    80004b2c:	00b70023          	sb	a1,0(a4)
    80004b30:	0027871b          	addiw	a4,a5,2
    80004b34:	0ac77e63          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004b38:	00e50733          	add	a4,a0,a4
    80004b3c:	00b70023          	sb	a1,0(a4)
    80004b40:	0037871b          	addiw	a4,a5,3
    80004b44:	0ac77663          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004b48:	00e50733          	add	a4,a0,a4
    80004b4c:	00b70023          	sb	a1,0(a4)
    80004b50:	0047871b          	addiw	a4,a5,4
    80004b54:	08c77e63          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004b58:	00e50733          	add	a4,a0,a4
    80004b5c:	00b70023          	sb	a1,0(a4)
    80004b60:	0057871b          	addiw	a4,a5,5
    80004b64:	08c77663          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004b68:	00e50733          	add	a4,a0,a4
    80004b6c:	00b70023          	sb	a1,0(a4)
    80004b70:	0067871b          	addiw	a4,a5,6
    80004b74:	06c77e63          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004b78:	00e50733          	add	a4,a0,a4
    80004b7c:	00b70023          	sb	a1,0(a4)
    80004b80:	0077871b          	addiw	a4,a5,7
    80004b84:	06c77663          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004b88:	00e50733          	add	a4,a0,a4
    80004b8c:	00b70023          	sb	a1,0(a4)
    80004b90:	0087871b          	addiw	a4,a5,8
    80004b94:	04c77e63          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004b98:	00e50733          	add	a4,a0,a4
    80004b9c:	00b70023          	sb	a1,0(a4)
    80004ba0:	0097871b          	addiw	a4,a5,9
    80004ba4:	04c77663          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004ba8:	00e50733          	add	a4,a0,a4
    80004bac:	00b70023          	sb	a1,0(a4)
    80004bb0:	00a7871b          	addiw	a4,a5,10
    80004bb4:	02c77e63          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004bb8:	00e50733          	add	a4,a0,a4
    80004bbc:	00b70023          	sb	a1,0(a4)
    80004bc0:	00b7871b          	addiw	a4,a5,11
    80004bc4:	02c77663          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004bc8:	00e50733          	add	a4,a0,a4
    80004bcc:	00b70023          	sb	a1,0(a4)
    80004bd0:	00c7871b          	addiw	a4,a5,12
    80004bd4:	00c77e63          	bgeu	a4,a2,80004bf0 <__memset+0x1c8>
    80004bd8:	00e50733          	add	a4,a0,a4
    80004bdc:	00b70023          	sb	a1,0(a4)
    80004be0:	00d7879b          	addiw	a5,a5,13
    80004be4:	00c7f663          	bgeu	a5,a2,80004bf0 <__memset+0x1c8>
    80004be8:	00f507b3          	add	a5,a0,a5
    80004bec:	00b78023          	sb	a1,0(a5)
    80004bf0:	00813403          	ld	s0,8(sp)
    80004bf4:	01010113          	addi	sp,sp,16
    80004bf8:	00008067          	ret
    80004bfc:	00b00693          	li	a3,11
    80004c00:	e55ff06f          	j	80004a54 <__memset+0x2c>
    80004c04:	00300e93          	li	t4,3
    80004c08:	ea5ff06f          	j	80004aac <__memset+0x84>
    80004c0c:	00100e93          	li	t4,1
    80004c10:	e9dff06f          	j	80004aac <__memset+0x84>
    80004c14:	00000e93          	li	t4,0
    80004c18:	e95ff06f          	j	80004aac <__memset+0x84>
    80004c1c:	00000793          	li	a5,0
    80004c20:	ef9ff06f          	j	80004b18 <__memset+0xf0>
    80004c24:	00200e93          	li	t4,2
    80004c28:	e85ff06f          	j	80004aac <__memset+0x84>
    80004c2c:	00400e93          	li	t4,4
    80004c30:	e7dff06f          	j	80004aac <__memset+0x84>
    80004c34:	00500e93          	li	t4,5
    80004c38:	e75ff06f          	j	80004aac <__memset+0x84>
    80004c3c:	00600e93          	li	t4,6
    80004c40:	e6dff06f          	j	80004aac <__memset+0x84>

0000000080004c44 <__memmove>:
    80004c44:	ff010113          	addi	sp,sp,-16
    80004c48:	00813423          	sd	s0,8(sp)
    80004c4c:	01010413          	addi	s0,sp,16
    80004c50:	0e060863          	beqz	a2,80004d40 <__memmove+0xfc>
    80004c54:	fff6069b          	addiw	a3,a2,-1
    80004c58:	0006881b          	sext.w	a6,a3
    80004c5c:	0ea5e863          	bltu	a1,a0,80004d4c <__memmove+0x108>
    80004c60:	00758713          	addi	a4,a1,7
    80004c64:	00a5e7b3          	or	a5,a1,a0
    80004c68:	40a70733          	sub	a4,a4,a0
    80004c6c:	0077f793          	andi	a5,a5,7
    80004c70:	00f73713          	sltiu	a4,a4,15
    80004c74:	00174713          	xori	a4,a4,1
    80004c78:	0017b793          	seqz	a5,a5
    80004c7c:	00e7f7b3          	and	a5,a5,a4
    80004c80:	10078863          	beqz	a5,80004d90 <__memmove+0x14c>
    80004c84:	00900793          	li	a5,9
    80004c88:	1107f463          	bgeu	a5,a6,80004d90 <__memmove+0x14c>
    80004c8c:	0036581b          	srliw	a6,a2,0x3
    80004c90:	fff8081b          	addiw	a6,a6,-1
    80004c94:	02081813          	slli	a6,a6,0x20
    80004c98:	01d85893          	srli	a7,a6,0x1d
    80004c9c:	00858813          	addi	a6,a1,8
    80004ca0:	00058793          	mv	a5,a1
    80004ca4:	00050713          	mv	a4,a0
    80004ca8:	01088833          	add	a6,a7,a6
    80004cac:	0007b883          	ld	a7,0(a5)
    80004cb0:	00878793          	addi	a5,a5,8
    80004cb4:	00870713          	addi	a4,a4,8
    80004cb8:	ff173c23          	sd	a7,-8(a4)
    80004cbc:	ff0798e3          	bne	a5,a6,80004cac <__memmove+0x68>
    80004cc0:	ff867713          	andi	a4,a2,-8
    80004cc4:	02071793          	slli	a5,a4,0x20
    80004cc8:	0207d793          	srli	a5,a5,0x20
    80004ccc:	00f585b3          	add	a1,a1,a5
    80004cd0:	40e686bb          	subw	a3,a3,a4
    80004cd4:	00f507b3          	add	a5,a0,a5
    80004cd8:	06e60463          	beq	a2,a4,80004d40 <__memmove+0xfc>
    80004cdc:	0005c703          	lbu	a4,0(a1)
    80004ce0:	00e78023          	sb	a4,0(a5)
    80004ce4:	04068e63          	beqz	a3,80004d40 <__memmove+0xfc>
    80004ce8:	0015c603          	lbu	a2,1(a1)
    80004cec:	00100713          	li	a4,1
    80004cf0:	00c780a3          	sb	a2,1(a5)
    80004cf4:	04e68663          	beq	a3,a4,80004d40 <__memmove+0xfc>
    80004cf8:	0025c603          	lbu	a2,2(a1)
    80004cfc:	00200713          	li	a4,2
    80004d00:	00c78123          	sb	a2,2(a5)
    80004d04:	02e68e63          	beq	a3,a4,80004d40 <__memmove+0xfc>
    80004d08:	0035c603          	lbu	a2,3(a1)
    80004d0c:	00300713          	li	a4,3
    80004d10:	00c781a3          	sb	a2,3(a5)
    80004d14:	02e68663          	beq	a3,a4,80004d40 <__memmove+0xfc>
    80004d18:	0045c603          	lbu	a2,4(a1)
    80004d1c:	00400713          	li	a4,4
    80004d20:	00c78223          	sb	a2,4(a5)
    80004d24:	00e68e63          	beq	a3,a4,80004d40 <__memmove+0xfc>
    80004d28:	0055c603          	lbu	a2,5(a1)
    80004d2c:	00500713          	li	a4,5
    80004d30:	00c782a3          	sb	a2,5(a5)
    80004d34:	00e68663          	beq	a3,a4,80004d40 <__memmove+0xfc>
    80004d38:	0065c703          	lbu	a4,6(a1)
    80004d3c:	00e78323          	sb	a4,6(a5)
    80004d40:	00813403          	ld	s0,8(sp)
    80004d44:	01010113          	addi	sp,sp,16
    80004d48:	00008067          	ret
    80004d4c:	02061713          	slli	a4,a2,0x20
    80004d50:	02075713          	srli	a4,a4,0x20
    80004d54:	00e587b3          	add	a5,a1,a4
    80004d58:	f0f574e3          	bgeu	a0,a5,80004c60 <__memmove+0x1c>
    80004d5c:	02069613          	slli	a2,a3,0x20
    80004d60:	02065613          	srli	a2,a2,0x20
    80004d64:	fff64613          	not	a2,a2
    80004d68:	00e50733          	add	a4,a0,a4
    80004d6c:	00c78633          	add	a2,a5,a2
    80004d70:	fff7c683          	lbu	a3,-1(a5)
    80004d74:	fff78793          	addi	a5,a5,-1
    80004d78:	fff70713          	addi	a4,a4,-1
    80004d7c:	00d70023          	sb	a3,0(a4)
    80004d80:	fec798e3          	bne	a5,a2,80004d70 <__memmove+0x12c>
    80004d84:	00813403          	ld	s0,8(sp)
    80004d88:	01010113          	addi	sp,sp,16
    80004d8c:	00008067          	ret
    80004d90:	02069713          	slli	a4,a3,0x20
    80004d94:	02075713          	srli	a4,a4,0x20
    80004d98:	00170713          	addi	a4,a4,1
    80004d9c:	00e50733          	add	a4,a0,a4
    80004da0:	00050793          	mv	a5,a0
    80004da4:	0005c683          	lbu	a3,0(a1)
    80004da8:	00178793          	addi	a5,a5,1
    80004dac:	00158593          	addi	a1,a1,1
    80004db0:	fed78fa3          	sb	a3,-1(a5)
    80004db4:	fee798e3          	bne	a5,a4,80004da4 <__memmove+0x160>
    80004db8:	f89ff06f          	j	80004d40 <__memmove+0xfc>

0000000080004dbc <__putc>:
    80004dbc:	fe010113          	addi	sp,sp,-32
    80004dc0:	00813823          	sd	s0,16(sp)
    80004dc4:	00113c23          	sd	ra,24(sp)
    80004dc8:	02010413          	addi	s0,sp,32
    80004dcc:	00050793          	mv	a5,a0
    80004dd0:	fef40593          	addi	a1,s0,-17
    80004dd4:	00100613          	li	a2,1
    80004dd8:	00000513          	li	a0,0
    80004ddc:	fef407a3          	sb	a5,-17(s0)
    80004de0:	fffff097          	auipc	ra,0xfffff
    80004de4:	b3c080e7          	jalr	-1220(ra) # 8000391c <console_write>
    80004de8:	01813083          	ld	ra,24(sp)
    80004dec:	01013403          	ld	s0,16(sp)
    80004df0:	02010113          	addi	sp,sp,32
    80004df4:	00008067          	ret

0000000080004df8 <__getc>:
    80004df8:	fe010113          	addi	sp,sp,-32
    80004dfc:	00813823          	sd	s0,16(sp)
    80004e00:	00113c23          	sd	ra,24(sp)
    80004e04:	02010413          	addi	s0,sp,32
    80004e08:	fe840593          	addi	a1,s0,-24
    80004e0c:	00100613          	li	a2,1
    80004e10:	00000513          	li	a0,0
    80004e14:	fffff097          	auipc	ra,0xfffff
    80004e18:	ae8080e7          	jalr	-1304(ra) # 800038fc <console_read>
    80004e1c:	fe844503          	lbu	a0,-24(s0)
    80004e20:	01813083          	ld	ra,24(sp)
    80004e24:	01013403          	ld	s0,16(sp)
    80004e28:	02010113          	addi	sp,sp,32
    80004e2c:	00008067          	ret

0000000080004e30 <console_handler>:
    80004e30:	fe010113          	addi	sp,sp,-32
    80004e34:	00813823          	sd	s0,16(sp)
    80004e38:	00113c23          	sd	ra,24(sp)
    80004e3c:	00913423          	sd	s1,8(sp)
    80004e40:	02010413          	addi	s0,sp,32
    80004e44:	14202773          	csrr	a4,scause
    80004e48:	100027f3          	csrr	a5,sstatus
    80004e4c:	0027f793          	andi	a5,a5,2
    80004e50:	06079e63          	bnez	a5,80004ecc <console_handler+0x9c>
    80004e54:	00074c63          	bltz	a4,80004e6c <console_handler+0x3c>
    80004e58:	01813083          	ld	ra,24(sp)
    80004e5c:	01013403          	ld	s0,16(sp)
    80004e60:	00813483          	ld	s1,8(sp)
    80004e64:	02010113          	addi	sp,sp,32
    80004e68:	00008067          	ret
    80004e6c:	0ff77713          	andi	a4,a4,255
    80004e70:	00900793          	li	a5,9
    80004e74:	fef712e3          	bne	a4,a5,80004e58 <console_handler+0x28>
    80004e78:	ffffe097          	auipc	ra,0xffffe
    80004e7c:	6dc080e7          	jalr	1756(ra) # 80003554 <plic_claim>
    80004e80:	00a00793          	li	a5,10
    80004e84:	00050493          	mv	s1,a0
    80004e88:	02f50c63          	beq	a0,a5,80004ec0 <console_handler+0x90>
    80004e8c:	fc0506e3          	beqz	a0,80004e58 <console_handler+0x28>
    80004e90:	00050593          	mv	a1,a0
    80004e94:	00000517          	auipc	a0,0x0
    80004e98:	3a450513          	addi	a0,a0,932 # 80005238 <CONSOLE_STATUS+0x228>
    80004e9c:	fffff097          	auipc	ra,0xfffff
    80004ea0:	afc080e7          	jalr	-1284(ra) # 80003998 <__printf>
    80004ea4:	01013403          	ld	s0,16(sp)
    80004ea8:	01813083          	ld	ra,24(sp)
    80004eac:	00048513          	mv	a0,s1
    80004eb0:	00813483          	ld	s1,8(sp)
    80004eb4:	02010113          	addi	sp,sp,32
    80004eb8:	ffffe317          	auipc	t1,0xffffe
    80004ebc:	6d430067          	jr	1748(t1) # 8000358c <plic_complete>
    80004ec0:	fffff097          	auipc	ra,0xfffff
    80004ec4:	3e0080e7          	jalr	992(ra) # 800042a0 <uartintr>
    80004ec8:	fddff06f          	j	80004ea4 <console_handler+0x74>
    80004ecc:	00000517          	auipc	a0,0x0
    80004ed0:	46c50513          	addi	a0,a0,1132 # 80005338 <digits+0x78>
    80004ed4:	fffff097          	auipc	ra,0xfffff
    80004ed8:	a68080e7          	jalr	-1432(ra) # 8000393c <panic>
	...
