
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	0d813103          	ld	sp,216(sp) # 800070d8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	77d020ef          	jal	ra,80002f98 <start>

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
    THREAD_DISPATCH = 0x13,
    THREAD_CREATE_ONLY = 0x14,
    THREAD_START = 0x15
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

extern "C" void trap();

extern "C" void trapHandler(){
    80001274:	fc010113          	addi	sp,sp,-64
    80001278:	02113c23          	sd	ra,56(sp)
    8000127c:	02813823          	sd	s0,48(sp)
    80001280:	02913423          	sd	s1,40(sp)
    80001284:	04010413          	addi	s0,sp,64
};

inline uint64 Riscv::r_scause()
{
    uint64 scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80001288:	14202773          	csrr	a4,scause

    uint64 scause = Riscv::r_scause();
    if (scause == 0x0000000000000008UL || scause == 0x0000000000000009UL) {
    8000128c:	ff870693          	addi	a3,a4,-8
    80001290:	00100793          	li	a5,1
    80001294:	02d7f863          	bgeu	a5,a3,800012c4 <trapHandler+0x50>
    } /*else if(scause == 0x0000000000000009UL){
        __asm__ volatile("csrw sepc, %0" : : "r"(&userMain));
        Riscv::mc_sstatus(Riscv::SSTATUS_SPP);
        //__asm__ volatile("sret");
    }*/
    else if (scause == 0x8000000000000001UL)
    80001298:	fff00793          	li	a5,-1
    8000129c:	03f79793          	slli	a5,a5,0x3f
    800012a0:	00178793          	addi	a5,a5,1
    800012a4:	18f70263          	beq	a4,a5,80001428 <trapHandler+0x1b4>
    {
        Riscv::mc_sip(Riscv::SIP_SSIP);
    } else if (scause == 0x8000000000000009UL)
    800012a8:	fff00793          	li	a5,-1
    800012ac:	03f79793          	slli	a5,a5,0x3f
    800012b0:	00978793          	addi	a5,a5,9
    800012b4:	08f71863          	bne	a4,a5,80001344 <trapHandler+0xd0>
    {
        // interrupt: yes; cause code: supervisor external interrupt (PLIC; could be keyboard)
        console_handler();
    800012b8:	00004097          	auipc	ra,0x4
    800012bc:	e18080e7          	jalr	-488(ra) # 800050d0 <console_handler>
    800012c0:	0840006f          	j	80001344 <trapHandler+0xd0>
        uint64 volatile sepc = 0;
    800012c4:	fc043423          	sd	zero,-56(s0)
        __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800012c8:	141027f3          	csrr	a5,sepc
    800012cc:	fcf43423          	sd	a5,-56(s0)
        sepc +=4;
    800012d0:	fc843783          	ld	a5,-56(s0)
    800012d4:	00478793          	addi	a5,a5,4
    800012d8:	fcf43423          	sd	a5,-56(s0)
}

inline uint64 Riscv::r_sstatus()
{
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800012dc:	100027f3          	csrr	a5,sstatus
    800012e0:	fcf43c23          	sd	a5,-40(s0)
    return sstatus;
    800012e4:	fd843783          	ld	a5,-40(s0)
        uint64 volatile status = Riscv::r_sstatus();
    800012e8:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("mv %0, a0": "=r" (opCode));
    800012ec:	00050793          	mv	a5,a0
        switch (opCode) {
    800012f0:	01500713          	li	a4,21
    800012f4:	10f76e63          	bltu	a4,a5,80001410 <trapHandler+0x19c>
    800012f8:	00279793          	slli	a5,a5,0x2
    800012fc:	00005717          	auipc	a4,0x5
    80001300:	d2470713          	addi	a4,a4,-732 # 80006020 <CONSOLE_STATUS+0x10>
    80001304:	00e787b3          	add	a5,a5,a4
    80001308:	0007a783          	lw	a5,0(a5)
    8000130c:	00e787b3          	add	a5,a5,a4
    80001310:	00078067          	jr	a5
                __asm__ volatile("mv %0, a1": "=r"(size));
    80001314:	00058493          	mv	s1,a1
                void* ret = MemoryAllocator::getInstance()->mem_alloc(size);
    80001318:	00002097          	auipc	ra,0x2
    8000131c:	9fc080e7          	jalr	-1540(ra) # 80002d14 <_ZN15MemoryAllocator11getInstanceEv>
    80001320:	00048513          	mv	a0,s1
    80001324:	00002097          	auipc	ra,0x2
    80001328:	8b0080e7          	jalr	-1872(ra) # 80002bd4 <_ZN15MemoryAllocator9mem_allocEm>
                __asm__ volatile("sd a0, 10*8(fp)");
    8000132c:	04a43823          	sd	a0,80(s0)
                __asm__ volatile("mv a0, %0" : : "r"(ret));
    80001330:	00050513          	mv	a0,a0
        Riscv::w_sepc(sepc);
    80001334:	fc843783          	ld	a5,-56(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80001338:	14179073          	csrw	sepc,a5
        Riscv::w_sstatus(status);
    8000133c:	fd043783          	ld	a5,-48(s0)
}

inline void Riscv::w_sstatus(uint64 sstatus)
{
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80001340:	10079073          	csrw	sstatus,a5
    } else
    {
        // unexpected trap cause
    }
}
    80001344:	03813083          	ld	ra,56(sp)
    80001348:	03013403          	ld	s0,48(sp)
    8000134c:	02813483          	ld	s1,40(sp)
    80001350:	04010113          	addi	sp,sp,64
    80001354:	00008067          	ret
                __asm__ volatile("mv %0, a1": "=r"(p));
    80001358:	00058513          	mv	a0,a1
                MemoryAllocator::mem_free(p);
    8000135c:	00002097          	auipc	ra,0x2
    80001360:	a4c080e7          	jalr	-1460(ra) # 80002da8 <_ZN15MemoryAllocator8mem_freeEPv>
                break;}
    80001364:	fd1ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("ld s1, 11*8(fp)");
    80001368:	05843483          	ld	s1,88(s0)
                __asm__ volatile("ld s2, 12*8(fp)");
    8000136c:	06043903          	ld	s2,96(s0)
                __asm__ volatile("ld s3, 13*8(fp)");
    80001370:	06843983          	ld	s3,104(s0)
                __asm__ volatile("mv %0, s1": "=r"(handle));
    80001374:	00048493          	mv	s1,s1
                __asm__ volatile("mv %0, s2": "=r"(body));
    80001378:	00090513          	mv	a0,s2
                __asm__ volatile("mv %0, s3": "=r"(arg));
    8000137c:	00098593          	mv	a1,s3
                *handle = _thread::createThread(body,arg);
    80001380:	00000097          	auipc	ra,0x0
    80001384:	530080e7          	jalr	1328(ra) # 800018b0 <_ZN7_thread12createThreadEPFvPvES0_>
    80001388:	00a4b023          	sd	a0,0(s1)
                (*handle)->start();
    8000138c:	00000097          	auipc	ra,0x0
    80001390:	450080e7          	jalr	1104(ra) # 800017dc <_ZN7_thread5startEv>
                if (!handle) {ret = -1;}
    80001394:	00048863          	beqz	s1,800013a4 <trapHandler+0x130>
                int ret = 0;
    80001398:	00000793          	li	a5,0
                __asm__ volatile("mv %0, a0" : :"r"(ret));
    8000139c:	00050793          	mv	a5,a0
                break;
    800013a0:	f95ff06f          	j	80001334 <trapHandler+0xc0>
                if (!handle) {ret = -1;}
    800013a4:	fff00793          	li	a5,-1
    800013a8:	ff5ff06f          	j	8000139c <trapHandler+0x128>
                _thread::threadExit();
    800013ac:	00000097          	auipc	ra,0x0
    800013b0:	2b0080e7          	jalr	688(ra) # 8000165c <_ZN7_thread10threadExitEv>
                break;}
    800013b4:	f81ff06f          	j	80001334 <trapHandler+0xc0>
                _thread::dispatch();
    800013b8:	00000097          	auipc	ra,0x0
    800013bc:	2dc080e7          	jalr	732(ra) # 80001694 <_ZN7_thread8dispatchEv>
                break;
    800013c0:	f75ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("ld s1, 11*8(fp)");
    800013c4:	05843483          	ld	s1,88(s0)
                __asm__ volatile("ld s2, 12*8(fp)");
    800013c8:	06043903          	ld	s2,96(s0)
                __asm__ volatile("ld s3, 13*8(fp)");
    800013cc:	06843983          	ld	s3,104(s0)
                __asm__ volatile("mv %0, s1": "=r"(handle));
    800013d0:	00048493          	mv	s1,s1
                __asm__ volatile("mv %0, s2": "=r"(body));
    800013d4:	00090513          	mv	a0,s2
                __asm__ volatile("mv %0, s3": "=r"(arg));
    800013d8:	00098593          	mv	a1,s3
                *handle = _thread::createThread(body,arg);
    800013dc:	00000097          	auipc	ra,0x0
    800013e0:	4d4080e7          	jalr	1236(ra) # 800018b0 <_ZN7_thread12createThreadEPFvPvES0_>
    800013e4:	00a4b023          	sd	a0,0(s1)
                if (!handle) {ret = -1;}
    800013e8:	00048863          	beqz	s1,800013f8 <trapHandler+0x184>
                int ret = 0;
    800013ec:	00000793          	li	a5,0
                __asm__ volatile("mv %0, a0" : :"r"(ret));
    800013f0:	00050793          	mv	a5,a0
                break;}
    800013f4:	f41ff06f          	j	80001334 <trapHandler+0xc0>
                if (!handle) {ret = -1;}
    800013f8:	fff00793          	li	a5,-1
    800013fc:	ff5ff06f          	j	800013f0 <trapHandler+0x17c>
                __asm__ volatile("mv %0, a1": "=r"(handle));
    80001400:	00058513          	mv	a0,a1
                handle->start();
    80001404:	00000097          	auipc	ra,0x0
    80001408:	3d8080e7          	jalr	984(ra) # 800017dc <_ZN7_thread5startEv>
                break;}
    8000140c:	f29ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("csrw sepc, %0" : : "r"(&userMain));
    80001410:	00006797          	auipc	a5,0x6
    80001414:	cd07b783          	ld	a5,-816(a5) # 800070e0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001418:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    8000141c:	10000793          	li	a5,256
    80001420:	1007b073          	csrc	sstatus,a5
                return;
    80001424:	f21ff06f          	j	80001344 <trapHandler+0xd0>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001428:	00200793          	li	a5,2
    8000142c:	1447b073          	csrc	sip,a5
}
    80001430:	f15ff06f          	j	80001344 <trapHandler+0xd0>

0000000080001434 <_Z9mem_allocm>:

void* mem_alloc(size_t size){
    80001434:	ff010113          	addi	sp,sp,-16
    80001438:	00113423          	sd	ra,8(sp)
    8000143c:	00813023          	sd	s0,0(sp)
    80001440:	01010413          	addi	s0,sp,16

    //upis broja blokova
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
    80001444:	01850513          	addi	a0,a0,24
    80001448:	00655593          	srli	a1,a0,0x6
                         + ((size+sizeof(MemoryAllocator::FullMem))%MEM_BLOCK_SIZE?1:0);
    8000144c:	03f57513          	andi	a0,a0,63
    80001450:	00050463          	beqz	a0,80001458 <_Z9mem_allocm+0x24>
    80001454:	00100513          	li	a0,1

   // __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(MEM_ALLOC, numOfBlocks);
    80001458:	00a585b3          	add	a1,a1,a0
    8000145c:	00100513          	li	a0,1
    80001460:	00000097          	auipc	ra,0x0
    80001464:	ddc080e7          	jalr	-548(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    void* p = nullptr;
    __asm__ volatile("mv a0, %0": "=r"(p));
    80001468:	00050513          	mv	a0,a0
    return p;

}
    8000146c:	00813083          	ld	ra,8(sp)
    80001470:	00013403          	ld	s0,0(sp)
    80001474:	01010113          	addi	sp,sp,16
    80001478:	00008067          	ret

000000008000147c <_Z8mem_freePv>:

int mem_free(void *p){
    8000147c:	ff010113          	addi	sp,sp,-16
    80001480:	00113423          	sd	ra,8(sp)
    80001484:	00813023          	sd	s0,0(sp)
    80001488:	01010413          	addi	s0,sp,16
    8000148c:	00050593          	mv	a1,a0

    //__asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(MEM_FREE, p);
    80001490:	00200513          	li	a0,2
    80001494:	00000097          	auipc	ra,0x0
    80001498:	da8080e7          	jalr	-600(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    8000149c:	00050513          	mv	a0,a0
    return ret;
}
    800014a0:	0005051b          	sext.w	a0,a0
    800014a4:	00813083          	ld	ra,8(sp)
    800014a8:	00013403          	ld	s0,0(sp)
    800014ac:	01010113          	addi	sp,sp,16
    800014b0:	00008067          	ret

00000000800014b4 <_Z11thread_exitv>:

int thread_exit(){
    800014b4:	ff010113          	addi	sp,sp,-16
    800014b8:	00113423          	sd	ra,8(sp)
    800014bc:	00813023          	sd	s0,0(sp)
    800014c0:	01010413          	addi	s0,sp,16
    //__asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_EXIT);
    800014c4:	01200513          	li	a0,18
    800014c8:	00000097          	auipc	ra,0x0
    800014cc:	d74080e7          	jalr	-652(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    800014d0:	00050513          	mv	a0,a0
    return ret;
}
    800014d4:	0005051b          	sext.w	a0,a0
    800014d8:	00813083          	ld	ra,8(sp)
    800014dc:	00013403          	ld	s0,0(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    800014e8:	fd010113          	addi	sp,sp,-48
    800014ec:	02113423          	sd	ra,40(sp)
    800014f0:	02813023          	sd	s0,32(sp)
    800014f4:	00913c23          	sd	s1,24(sp)
    800014f8:	01213823          	sd	s2,16(sp)
    800014fc:	01313423          	sd	s3,8(sp)
    80001500:	03010413          	addi	s0,sp,48
    80001504:	00050493          	mv	s1,a0
    80001508:	00058913          	mv	s2,a1
    8000150c:	00060993          	mv	s3,a2
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80001510:	04100513          	li	a0,65
    80001514:	00001097          	auipc	ra,0x1
    80001518:	6c0080e7          	jalr	1728(ra) # 80002bd4 <_ZN15MemoryAllocator9mem_allocEm>
    if (!stack) return -1;
    8000151c:	06050463          	beqz	a0,80001584 <_Z13thread_createPP7_threadPFvPvES2_+0x9c>
    80001520:	00050713          	mv	a4,a0

    //__asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_CREATE, handle, start_routine, arg, stack);
    80001524:	00098693          	mv	a3,s3
    80001528:	00090613          	mv	a2,s2
    8000152c:	00048593          	mv	a1,s1
    80001530:	01100513          	li	a0,17
    80001534:	00000097          	auipc	ra,0x0
    80001538:	d08080e7          	jalr	-760(ra) # 8000123c <_Z11abi_invokeriz>

    if(_thread::running == nullptr) _thread::running = *handle;
    8000153c:	00006797          	auipc	a5,0x6
    80001540:	b8c7b783          	ld	a5,-1140(a5) # 800070c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001544:	0007b783          	ld	a5,0(a5)
    80001548:	02078463          	beqz	a5,80001570 <_Z13thread_createPP7_threadPFvPvES2_+0x88>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    8000154c:	00050513          	mv	a0,a0
    80001550:	0005051b          	sext.w	a0,a0
    return ret;
}
    80001554:	02813083          	ld	ra,40(sp)
    80001558:	02013403          	ld	s0,32(sp)
    8000155c:	01813483          	ld	s1,24(sp)
    80001560:	01013903          	ld	s2,16(sp)
    80001564:	00813983          	ld	s3,8(sp)
    80001568:	03010113          	addi	sp,sp,48
    8000156c:	00008067          	ret
    if(_thread::running == nullptr) _thread::running = *handle;
    80001570:	0004b703          	ld	a4,0(s1)
    80001574:	00006797          	auipc	a5,0x6
    80001578:	b547b783          	ld	a5,-1196(a5) # 800070c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000157c:	00e7b023          	sd	a4,0(a5)
    80001580:	fcdff06f          	j	8000154c <_Z13thread_createPP7_threadPFvPvES2_+0x64>
    if (!stack) return -1;
    80001584:	fff00513          	li	a0,-1
    80001588:	fcdff06f          	j	80001554 <_Z13thread_createPP7_threadPFvPvES2_+0x6c>

000000008000158c <_Z15thread_dispatchv>:

void thread_dispatch(){
    8000158c:	ff010113          	addi	sp,sp,-16
    80001590:	00113423          	sd	ra,8(sp)
    80001594:	00813023          	sd	s0,0(sp)
    80001598:	01010413          	addi	s0,sp,16
    //__asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_DISPATCH);
    8000159c:	01300513          	li	a0,19
    800015a0:	00000097          	auipc	ra,0x0
    800015a4:	c9c080e7          	jalr	-868(ra) # 8000123c <_Z11abi_invokeriz>
}
    800015a8:	00813083          	ld	ra,8(sp)
    800015ac:	00013403          	ld	s0,0(sp)
    800015b0:	01010113          	addi	sp,sp,16
    800015b4:	00008067          	ret

00000000800015b8 <_Z18thread_create_onlyPP7_threadPFvPvES2_>:

void thread_create_only(thread_t* handle,
                        void(*start_routine)(void*),
                        void* arg){
    800015b8:	fd010113          	addi	sp,sp,-48
    800015bc:	02113423          	sd	ra,40(sp)
    800015c0:	02813023          	sd	s0,32(sp)
    800015c4:	00913c23          	sd	s1,24(sp)
    800015c8:	01213823          	sd	s2,16(sp)
    800015cc:	01313423          	sd	s3,8(sp)
    800015d0:	03010413          	addi	s0,sp,48
    800015d4:	00050493          	mv	s1,a0
    800015d8:	00058913          	mv	s2,a1
    800015dc:	00060993          	mv	s3,a2
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800015e0:	04100513          	li	a0,65
    800015e4:	00001097          	auipc	ra,0x1
    800015e8:	5f0080e7          	jalr	1520(ra) # 80002bd4 <_ZN15MemoryAllocator9mem_allocEm>
    if (!stack) return ;
    800015ec:	02050263          	beqz	a0,80001610 <_Z18thread_create_onlyPP7_threadPFvPvES2_+0x58>
    800015f0:	00050713          	mv	a4,a0

    //__asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_CREATE_ONLY, handle, start_routine, arg, stack);
    800015f4:	00098693          	mv	a3,s3
    800015f8:	00090613          	mv	a2,s2
    800015fc:	00048593          	mv	a1,s1
    80001600:	01400513          	li	a0,20
    80001604:	00000097          	auipc	ra,0x0
    80001608:	c38080e7          	jalr	-968(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    8000160c:	00078513          	mv	a0,a5
}
    80001610:	02813083          	ld	ra,40(sp)
    80001614:	02013403          	ld	s0,32(sp)
    80001618:	01813483          	ld	s1,24(sp)
    8000161c:	01013903          	ld	s2,16(sp)
    80001620:	00813983          	ld	s3,8(sp)
    80001624:	03010113          	addi	sp,sp,48
    80001628:	00008067          	ret

000000008000162c <_Z12thread_startP7_thread>:

void thread_start(thread_t handle){
    8000162c:	ff010113          	addi	sp,sp,-16
    80001630:	00113423          	sd	ra,8(sp)
    80001634:	00813023          	sd	s0,0(sp)
    80001638:	01010413          	addi	s0,sp,16
    8000163c:	00050593          	mv	a1,a0
   // __asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_START, handle);
    80001640:	01500513          	li	a0,21
    80001644:	00000097          	auipc	ra,0x0
    80001648:	bf8080e7          	jalr	-1032(ra) # 8000123c <_Z11abi_invokeriz>
}
    8000164c:	00813083          	ld	ra,8(sp)
    80001650:	00013403          	ld	s0,0(sp)
    80001654:	01010113          	addi	sp,sp,16
    80001658:	00008067          	ret

000000008000165c <_ZN7_thread10threadExitEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

int _thread::threadExit(){
    8000165c:	ff010113          	addi	sp,sp,-16
    80001660:	00813423          	sd	s0,8(sp)
    80001664:	01010413          	addi	s0,sp,16
    if (_thread::running == nullptr ) return -1;
    80001668:	00006797          	auipc	a5,0x6
    8000166c:	ad87b783          	ld	a5,-1320(a5) # 80007140 <_ZN7_thread7runningE>
    80001670:	00078e63          	beqz	a5,8000168c <_ZN7_thread10threadExitEv+0x30>
public:
    ~_thread() { MemoryAllocator::mem_free((char*)stack-STACK_SIZE); }

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }
    80001674:	00100713          	li	a4,1
    80001678:	00e78c23          	sb	a4,24(a5)
    _thread::running->setFinished(true);
    return 0;
    8000167c:	00000513          	li	a0,0
}
    80001680:	00813403          	ld	s0,8(sp)
    80001684:	01010113          	addi	sp,sp,16
    80001688:	00008067          	ret
    if (_thread::running == nullptr ) return -1;
    8000168c:	fff00513          	li	a0,-1
    80001690:	ff1ff06f          	j	80001680 <_ZN7_thread10threadExitEv+0x24>

0000000080001694 <_ZN7_thread8dispatchEv>:
    //thread_dispatch();

}

void _thread::dispatch()
{
    80001694:	fe010113          	addi	sp,sp,-32
    80001698:	00113c23          	sd	ra,24(sp)
    8000169c:	00813823          	sd	s0,16(sp)
    800016a0:	00913423          	sd	s1,8(sp)
    800016a4:	01213023          	sd	s2,0(sp)
    800016a8:	02010413          	addi	s0,sp,32
    _thread *old = running;
    800016ac:	00006917          	auipc	s2,0x6
    800016b0:	a9493903          	ld	s2,-1388(s2) # 80007140 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    800016b4:	01894783          	lbu	a5,24(s2)
    if (!old->isFinished()) { Scheduler::put(old); }
    800016b8:	04078863          	beqz	a5,80001708 <_ZN7_thread8dispatchEv+0x74>
    running = Scheduler::get();
    800016bc:	00001097          	auipc	ra,0x1
    800016c0:	030080e7          	jalr	48(ra) # 800026ec <_ZN9Scheduler3getEv>
    800016c4:	00050493          	mv	s1,a0
    800016c8:	00006797          	auipc	a5,0x6
    800016cc:	a6a7bc23          	sd	a0,-1416(a5) # 80007140 <_ZN7_thread7runningE>
    if (running->body == nullptr && Scheduler::head != nullptr){
    800016d0:	00053783          	ld	a5,0(a0)
    800016d4:	04078263          	beqz	a5,80001718 <_ZN7_thread8dispatchEv+0x84>
        _thread* tmp = running;
        running = Scheduler::get();
        Scheduler::put(tmp);
    }

    _thread::contextSwitch(&old->context, &running->context);
    800016d8:	00006597          	auipc	a1,0x6
    800016dc:	a685b583          	ld	a1,-1432(a1) # 80007140 <_ZN7_thread7runningE>
    800016e0:	02858593          	addi	a1,a1,40
    800016e4:	02890513          	addi	a0,s2,40
    800016e8:	00000097          	auipc	ra,0x0
    800016ec:	b40080e7          	jalr	-1216(ra) # 80001228 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    800016f0:	01813083          	ld	ra,24(sp)
    800016f4:	01013403          	ld	s0,16(sp)
    800016f8:	00813483          	ld	s1,8(sp)
    800016fc:	00013903          	ld	s2,0(sp)
    80001700:	02010113          	addi	sp,sp,32
    80001704:	00008067          	ret
    if (!old->isFinished()) { Scheduler::put(old); }
    80001708:	00090513          	mv	a0,s2
    8000170c:	00001097          	auipc	ra,0x1
    80001710:	048080e7          	jalr	72(ra) # 80002754 <_ZN9Scheduler3putEP7_thread>
    80001714:	fa9ff06f          	j	800016bc <_ZN7_thread8dispatchEv+0x28>
    if (running->body == nullptr && Scheduler::head != nullptr){
    80001718:	00006797          	auipc	a5,0x6
    8000171c:	9b87b783          	ld	a5,-1608(a5) # 800070d0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001720:	0007b783          	ld	a5,0(a5)
    80001724:	fa078ae3          	beqz	a5,800016d8 <_ZN7_thread8dispatchEv+0x44>
        running = Scheduler::get();
    80001728:	00001097          	auipc	ra,0x1
    8000172c:	fc4080e7          	jalr	-60(ra) # 800026ec <_ZN9Scheduler3getEv>
    80001730:	00006797          	auipc	a5,0x6
    80001734:	a0a7b823          	sd	a0,-1520(a5) # 80007140 <_ZN7_thread7runningE>
        Scheduler::put(tmp);
    80001738:	00048513          	mv	a0,s1
    8000173c:	00001097          	auipc	ra,0x1
    80001740:	018080e7          	jalr	24(ra) # 80002754 <_ZN9Scheduler3putEP7_thread>
    80001744:	f95ff06f          	j	800016d8 <_ZN7_thread8dispatchEv+0x44>

0000000080001748 <_ZN7_thread5yieldEv>:
{
    80001748:	ff010113          	addi	sp,sp,-16
    8000174c:	00113423          	sd	ra,8(sp)
    80001750:	00813023          	sd	s0,0(sp)
    80001754:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	9d8080e7          	jalr	-1576(ra) # 80001130 <_ZN5Riscv13pushRegistersEv>
    _thread::dispatch();
    80001760:	00000097          	auipc	ra,0x0
    80001764:	f34080e7          	jalr	-204(ra) # 80001694 <_ZN7_thread8dispatchEv>
    Riscv::popRegisters();
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	a44080e7          	jalr	-1468(ra) # 800011ac <_ZN5Riscv12popRegistersEv>
}
    80001770:	00813083          	ld	ra,8(sp)
    80001774:	00013403          	ld	s0,0(sp)
    80001778:	01010113          	addi	sp,sp,16
    8000177c:	00008067          	ret

0000000080001780 <_ZN7_thread13threadWrapperEv>:
    if (running == nullptr) running = this;
    if ( this->body != nullptr) {Scheduler::put(this);}
}

void _thread::threadWrapper()
{
    80001780:	fe010113          	addi	sp,sp,-32
    80001784:	00113c23          	sd	ra,24(sp)
    80001788:	00813823          	sd	s0,16(sp)
    8000178c:	00913423          	sd	s1,8(sp)
    80001790:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    80001794:	00001097          	auipc	ra,0x1
    80001798:	3d4080e7          	jalr	980(ra) # 80002b68 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    8000179c:	00006497          	auipc	s1,0x6
    800017a0:	9a448493          	addi	s1,s1,-1628 # 80007140 <_ZN7_thread7runningE>
    800017a4:	0004b783          	ld	a5,0(s1)
    800017a8:	0007b703          	ld	a4,0(a5)
    800017ac:	0207b503          	ld	a0,32(a5)
    800017b0:	000700e7          	jalr	a4
    running->setFinished(true);
    800017b4:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    800017b8:	00100713          	li	a4,1
    800017bc:	00e78c23          	sb	a4,24(a5)
    _thread::yield();
    800017c0:	00000097          	auipc	ra,0x0
    800017c4:	f88080e7          	jalr	-120(ra) # 80001748 <_ZN7_thread5yieldEv>
}
    800017c8:	01813083          	ld	ra,24(sp)
    800017cc:	01013403          	ld	s0,16(sp)
    800017d0:	00813483          	ld	s1,8(sp)
    800017d4:	02010113          	addi	sp,sp,32
    800017d8:	00008067          	ret

00000000800017dc <_ZN7_thread5startEv>:
    if (running == nullptr) running = this;
    800017dc:	00006797          	auipc	a5,0x6
    800017e0:	9647b783          	ld	a5,-1692(a5) # 80007140 <_ZN7_thread7runningE>
    800017e4:	02078a63          	beqz	a5,80001818 <_ZN7_thread5startEv+0x3c>
    if ( this->body != nullptr) {Scheduler::put(this);}
    800017e8:	00053783          	ld	a5,0(a0)
    800017ec:	02078c63          	beqz	a5,80001824 <_ZN7_thread5startEv+0x48>
void _thread::start() {
    800017f0:	ff010113          	addi	sp,sp,-16
    800017f4:	00113423          	sd	ra,8(sp)
    800017f8:	00813023          	sd	s0,0(sp)
    800017fc:	01010413          	addi	s0,sp,16
    if ( this->body != nullptr) {Scheduler::put(this);}
    80001800:	00001097          	auipc	ra,0x1
    80001804:	f54080e7          	jalr	-172(ra) # 80002754 <_ZN9Scheduler3putEP7_thread>
}
    80001808:	00813083          	ld	ra,8(sp)
    8000180c:	00013403          	ld	s0,0(sp)
    80001810:	01010113          	addi	sp,sp,16
    80001814:	00008067          	ret
    if (running == nullptr) running = this;
    80001818:	00006797          	auipc	a5,0x6
    8000181c:	92a7b423          	sd	a0,-1752(a5) # 80007140 <_ZN7_thread7runningE>
    80001820:	fc9ff06f          	j	800017e8 <_ZN7_thread5startEv+0xc>
    80001824:	00008067          	ret

0000000080001828 <_ZN7_threadnwEm>:

void* _thread::operator new(size_t sz){
    80001828:	fe010113          	addi	sp,sp,-32
    8000182c:	00113c23          	sd	ra,24(sp)
    80001830:	00813823          	sd	s0,16(sp)
    80001834:	00913423          	sd	s1,8(sp)
    80001838:	02010413          	addi	s0,sp,32
    8000183c:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->mem_alloc((sz+
    80001840:	00001097          	auipc	ra,0x1
    80001844:	4d4080e7          	jalr	1236(ra) # 80002d14 <_ZN15MemoryAllocator11getInstanceEv>
    sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
    80001848:	05748513          	addi	a0,s1,87
    8000184c:	00655513          	srli	a0,a0,0x6
    80001850:	00001097          	auipc	ra,0x1
    80001854:	384080e7          	jalr	900(ra) # 80002bd4 <_ZN15MemoryAllocator9mem_allocEm>
}
    80001858:	01813083          	ld	ra,24(sp)
    8000185c:	01013403          	ld	s0,16(sp)
    80001860:	00813483          	ld	s1,8(sp)
    80001864:	02010113          	addi	sp,sp,32
    80001868:	00008067          	ret

000000008000186c <_ZN7_threadnaEm>:

void* _thread::operator new[](size_t sz){
    8000186c:	fe010113          	addi	sp,sp,-32
    80001870:	00113c23          	sd	ra,24(sp)
    80001874:	00813823          	sd	s0,16(sp)
    80001878:	00913423          	sd	s1,8(sp)
    8000187c:	02010413          	addi	s0,sp,32
    80001880:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->mem_alloc((sz+
    80001884:	00001097          	auipc	ra,0x1
    80001888:	490080e7          	jalr	1168(ra) # 80002d14 <_ZN15MemoryAllocator11getInstanceEv>
                                               sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
    8000188c:	05748513          	addi	a0,s1,87
    80001890:	00655513          	srli	a0,a0,0x6
    80001894:	00001097          	auipc	ra,0x1
    80001898:	340080e7          	jalr	832(ra) # 80002bd4 <_ZN15MemoryAllocator9mem_allocEm>
}
    8000189c:	01813083          	ld	ra,24(sp)
    800018a0:	01013403          	ld	s0,16(sp)
    800018a4:	00813483          	ld	s1,8(sp)
    800018a8:	02010113          	addi	sp,sp,32
    800018ac:	00008067          	ret

00000000800018b0 <_ZN7_thread12createThreadEPFvPvES0_>:
_thread *_thread::createThread(Body body, void* arg){
    800018b0:	fd010113          	addi	sp,sp,-48
    800018b4:	02113423          	sd	ra,40(sp)
    800018b8:	02813023          	sd	s0,32(sp)
    800018bc:	00913c23          	sd	s1,24(sp)
    800018c0:	01213823          	sd	s2,16(sp)
    800018c4:	01313423          	sd	s3,8(sp)
    800018c8:	03010413          	addi	s0,sp,48
    800018cc:	00050913          	mv	s2,a0
    800018d0:	00058993          	mv	s3,a1
    _thread* ret = (_thread*)MemoryAllocator::getInstance()->mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800018d4:	00001097          	auipc	ra,0x1
    800018d8:	440080e7          	jalr	1088(ra) # 80002d14 <_ZN15MemoryAllocator11getInstanceEv>
    800018dc:	00200513          	li	a0,2
    800018e0:	00001097          	auipc	ra,0x1
    800018e4:	2f4080e7          	jalr	756(ra) # 80002bd4 <_ZN15MemoryAllocator9mem_allocEm>
    800018e8:	00050493          	mv	s1,a0
    if (ret == nullptr) return ret;
    800018ec:	04050463          	beqz	a0,80001934 <_ZN7_thread12createThreadEPFvPvES0_+0x84>
    ret->body = body;
    800018f0:	01253023          	sd	s2,0(a0)
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE * sizeof(uint64)) : nullptr),
    800018f4:	06090063          	beqz	s2,80001954 <_ZN7_thread12createThreadEPFvPvES0_+0xa4>
    800018f8:	00008537          	lui	a0,0x8
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	f70080e7          	jalr	-144(ra) # 8000186c <_ZN7_threadnaEm>
    80001904:	00a4b423          	sd	a0,8(s1)
    ret->timeSlice = TIME_SLICE;
    80001908:	00200793          	li	a5,2
    8000190c:	00f4b823          	sd	a5,16(s1)
    ret->finished = false;
    80001910:	00048c23          	sb	zero,24(s1)
    ret->arg = arg;
    80001914:	0334b023          	sd	s3,32(s1)
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    80001918:	04050263          	beqz	a0,8000195c <_ZN7_thread12createThreadEPFvPvES0_+0xac>
    8000191c:	000087b7          	lui	a5,0x8
    80001920:	00f50533          	add	a0,a0,a5
    ret->context = {
    80001924:	00000797          	auipc	a5,0x0
    80001928:	e5c78793          	addi	a5,a5,-420 # 80001780 <_ZN7_thread13threadWrapperEv>
    8000192c:	02f4b423          	sd	a5,40(s1)
    80001930:	02a4b823          	sd	a0,48(s1)
}
    80001934:	00048513          	mv	a0,s1
    80001938:	02813083          	ld	ra,40(sp)
    8000193c:	02013403          	ld	s0,32(sp)
    80001940:	01813483          	ld	s1,24(sp)
    80001944:	01013903          	ld	s2,16(sp)
    80001948:	00813983          	ld	s3,8(sp)
    8000194c:	03010113          	addi	sp,sp,48
    80001950:	00008067          	ret
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE * sizeof(uint64)) : nullptr),
    80001954:	00000513          	li	a0,0
    80001958:	fadff06f          	j	80001904 <_ZN7_thread12createThreadEPFvPvES0_+0x54>
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    8000195c:	00000513          	li	a0,0
    80001960:	fc5ff06f          	j	80001924 <_ZN7_thread12createThreadEPFvPvES0_+0x74>

0000000080001964 <_ZN7_threaddlEPv>:
void _thread::operator delete(void* p){
    80001964:	fe010113          	addi	sp,sp,-32
    80001968:	00113c23          	sd	ra,24(sp)
    8000196c:	00813823          	sd	s0,16(sp)
    80001970:	00913423          	sd	s1,8(sp)
    80001974:	02010413          	addi	s0,sp,32
    80001978:	00050493          	mv	s1,a0
    MemoryAllocator::getInstance()->mem_free(p);
    8000197c:	00001097          	auipc	ra,0x1
    80001980:	398080e7          	jalr	920(ra) # 80002d14 <_ZN15MemoryAllocator11getInstanceEv>
    80001984:	00048513          	mv	a0,s1
    80001988:	00001097          	auipc	ra,0x1
    8000198c:	420080e7          	jalr	1056(ra) # 80002da8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001990:	01813083          	ld	ra,24(sp)
    80001994:	01013403          	ld	s0,16(sp)
    80001998:	00813483          	ld	s1,8(sp)
    8000199c:	02010113          	addi	sp,sp,32
    800019a0:	00008067          	ret

00000000800019a4 <_ZN7_threaddaEPv>:

void _thread::operator delete[](void* p){
    800019a4:	fe010113          	addi	sp,sp,-32
    800019a8:	00113c23          	sd	ra,24(sp)
    800019ac:	00813823          	sd	s0,16(sp)
    800019b0:	00913423          	sd	s1,8(sp)
    800019b4:	02010413          	addi	s0,sp,32
    800019b8:	00050493          	mv	s1,a0
    MemoryAllocator::getInstance()->mem_free(p);
    800019bc:	00001097          	auipc	ra,0x1
    800019c0:	358080e7          	jalr	856(ra) # 80002d14 <_ZN15MemoryAllocator11getInstanceEv>
    800019c4:	00048513          	mv	a0,s1
    800019c8:	00001097          	auipc	ra,0x1
    800019cc:	3e0080e7          	jalr	992(ra) # 80002da8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800019d0:	01813083          	ld	ra,24(sp)
    800019d4:	01013403          	ld	s0,16(sp)
    800019d8:	00813483          	ld	s1,8(sp)
    800019dc:	02010113          	addi	sp,sp,32
    800019e0:	00008067          	ret

00000000800019e4 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800019e4:	fe010113          	addi	sp,sp,-32
    800019e8:	00113c23          	sd	ra,24(sp)
    800019ec:	00813823          	sd	s0,16(sp)
    800019f0:	00913423          	sd	s1,8(sp)
    800019f4:	02010413          	addi	s0,sp,32
    800019f8:	00050493          	mv	s1,a0
    LOCK();
    800019fc:	00100613          	li	a2,1
    80001a00:	00000593          	li	a1,0
    80001a04:	00005517          	auipc	a0,0x5
    80001a08:	74c50513          	addi	a0,a0,1868 # 80007150 <lockPrint>
    80001a0c:	fffff097          	auipc	ra,0xfffff
    80001a10:	704080e7          	jalr	1796(ra) # 80001110 <copy_and_swap>
    80001a14:	fe0514e3          	bnez	a0,800019fc <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001a18:	0004c503          	lbu	a0,0(s1)
    80001a1c:	00050a63          	beqz	a0,80001a30 <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    80001a20:	00003097          	auipc	ra,0x3
    80001a24:	63c080e7          	jalr	1596(ra) # 8000505c <__putc>
        string++;
    80001a28:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001a2c:	fedff06f          	j	80001a18 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001a30:	00000613          	li	a2,0
    80001a34:	00100593          	li	a1,1
    80001a38:	00005517          	auipc	a0,0x5
    80001a3c:	71850513          	addi	a0,a0,1816 # 80007150 <lockPrint>
    80001a40:	fffff097          	auipc	ra,0xfffff
    80001a44:	6d0080e7          	jalr	1744(ra) # 80001110 <copy_and_swap>
    80001a48:	fe0514e3          	bnez	a0,80001a30 <_Z11printStringPKc+0x4c>
}
    80001a4c:	01813083          	ld	ra,24(sp)
    80001a50:	01013403          	ld	s0,16(sp)
    80001a54:	00813483          	ld	s1,8(sp)
    80001a58:	02010113          	addi	sp,sp,32
    80001a5c:	00008067          	ret

0000000080001a60 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001a60:	fd010113          	addi	sp,sp,-48
    80001a64:	02113423          	sd	ra,40(sp)
    80001a68:	02813023          	sd	s0,32(sp)
    80001a6c:	00913c23          	sd	s1,24(sp)
    80001a70:	01213823          	sd	s2,16(sp)
    80001a74:	01313423          	sd	s3,8(sp)
    80001a78:	01413023          	sd	s4,0(sp)
    80001a7c:	03010413          	addi	s0,sp,48
    80001a80:	00050993          	mv	s3,a0
    80001a84:	00058a13          	mv	s4,a1
    LOCK();
    80001a88:	00100613          	li	a2,1
    80001a8c:	00000593          	li	a1,0
    80001a90:	00005517          	auipc	a0,0x5
    80001a94:	6c050513          	addi	a0,a0,1728 # 80007150 <lockPrint>
    80001a98:	fffff097          	auipc	ra,0xfffff
    80001a9c:	678080e7          	jalr	1656(ra) # 80001110 <copy_and_swap>
    80001aa0:	fe0514e3          	bnez	a0,80001a88 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80001aa4:	00000913          	li	s2,0
    80001aa8:	00090493          	mv	s1,s2
    80001aac:	0019091b          	addiw	s2,s2,1
    80001ab0:	03495a63          	bge	s2,s4,80001ae4 <_Z9getStringPci+0x84>
        cc = __getc();
    80001ab4:	00003097          	auipc	ra,0x3
    80001ab8:	5e4080e7          	jalr	1508(ra) # 80005098 <__getc>
        if(cc < 1)
    80001abc:	02050463          	beqz	a0,80001ae4 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80001ac0:	009984b3          	add	s1,s3,s1
    80001ac4:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001ac8:	00a00793          	li	a5,10
    80001acc:	00f50a63          	beq	a0,a5,80001ae0 <_Z9getStringPci+0x80>
    80001ad0:	00d00793          	li	a5,13
    80001ad4:	fcf51ae3          	bne	a0,a5,80001aa8 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80001ad8:	00090493          	mv	s1,s2
    80001adc:	0080006f          	j	80001ae4 <_Z9getStringPci+0x84>
    80001ae0:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80001ae4:	009984b3          	add	s1,s3,s1
    80001ae8:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80001aec:	00000613          	li	a2,0
    80001af0:	00100593          	li	a1,1
    80001af4:	00005517          	auipc	a0,0x5
    80001af8:	65c50513          	addi	a0,a0,1628 # 80007150 <lockPrint>
    80001afc:	fffff097          	auipc	ra,0xfffff
    80001b00:	614080e7          	jalr	1556(ra) # 80001110 <copy_and_swap>
    80001b04:	fe0514e3          	bnez	a0,80001aec <_Z9getStringPci+0x8c>
    return buf;
}
    80001b08:	00098513          	mv	a0,s3
    80001b0c:	02813083          	ld	ra,40(sp)
    80001b10:	02013403          	ld	s0,32(sp)
    80001b14:	01813483          	ld	s1,24(sp)
    80001b18:	01013903          	ld	s2,16(sp)
    80001b1c:	00813983          	ld	s3,8(sp)
    80001b20:	00013a03          	ld	s4,0(sp)
    80001b24:	03010113          	addi	sp,sp,48
    80001b28:	00008067          	ret

0000000080001b2c <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001b2c:	ff010113          	addi	sp,sp,-16
    80001b30:	00813423          	sd	s0,8(sp)
    80001b34:	01010413          	addi	s0,sp,16
    80001b38:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001b3c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001b40:	0006c603          	lbu	a2,0(a3)
    80001b44:	fd06071b          	addiw	a4,a2,-48
    80001b48:	0ff77713          	andi	a4,a4,255
    80001b4c:	00900793          	li	a5,9
    80001b50:	02e7e063          	bltu	a5,a4,80001b70 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001b54:	0025179b          	slliw	a5,a0,0x2
    80001b58:	00a787bb          	addw	a5,a5,a0
    80001b5c:	0017979b          	slliw	a5,a5,0x1
    80001b60:	00168693          	addi	a3,a3,1
    80001b64:	00c787bb          	addw	a5,a5,a2
    80001b68:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001b6c:	fd5ff06f          	j	80001b40 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001b70:	00813403          	ld	s0,8(sp)
    80001b74:	01010113          	addi	sp,sp,16
    80001b78:	00008067          	ret

0000000080001b7c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001b7c:	fc010113          	addi	sp,sp,-64
    80001b80:	02113c23          	sd	ra,56(sp)
    80001b84:	02813823          	sd	s0,48(sp)
    80001b88:	02913423          	sd	s1,40(sp)
    80001b8c:	03213023          	sd	s2,32(sp)
    80001b90:	01313c23          	sd	s3,24(sp)
    80001b94:	04010413          	addi	s0,sp,64
    80001b98:	00050493          	mv	s1,a0
    80001b9c:	00058913          	mv	s2,a1
    80001ba0:	00060993          	mv	s3,a2
    LOCK();
    80001ba4:	00100613          	li	a2,1
    80001ba8:	00000593          	li	a1,0
    80001bac:	00005517          	auipc	a0,0x5
    80001bb0:	5a450513          	addi	a0,a0,1444 # 80007150 <lockPrint>
    80001bb4:	fffff097          	auipc	ra,0xfffff
    80001bb8:	55c080e7          	jalr	1372(ra) # 80001110 <copy_and_swap>
    80001bbc:	fe0514e3          	bnez	a0,80001ba4 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001bc0:	00098463          	beqz	s3,80001bc8 <_Z8printIntiii+0x4c>
    80001bc4:	0804c463          	bltz	s1,80001c4c <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001bc8:	0004851b          	sext.w	a0,s1
    neg = 0;
    80001bcc:	00000593          	li	a1,0
    }

    i = 0;
    80001bd0:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001bd4:	0009079b          	sext.w	a5,s2
    80001bd8:	0325773b          	remuw	a4,a0,s2
    80001bdc:	00048613          	mv	a2,s1
    80001be0:	0014849b          	addiw	s1,s1,1
    80001be4:	02071693          	slli	a3,a4,0x20
    80001be8:	0206d693          	srli	a3,a3,0x20
    80001bec:	00005717          	auipc	a4,0x5
    80001bf0:	3e470713          	addi	a4,a4,996 # 80006fd0 <digits>
    80001bf4:	00d70733          	add	a4,a4,a3
    80001bf8:	00074683          	lbu	a3,0(a4)
    80001bfc:	fd040713          	addi	a4,s0,-48
    80001c00:	00c70733          	add	a4,a4,a2
    80001c04:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001c08:	0005071b          	sext.w	a4,a0
    80001c0c:	0325553b          	divuw	a0,a0,s2
    80001c10:	fcf772e3          	bgeu	a4,a5,80001bd4 <_Z8printIntiii+0x58>
    if(neg)
    80001c14:	00058c63          	beqz	a1,80001c2c <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001c18:	fd040793          	addi	a5,s0,-48
    80001c1c:	009784b3          	add	s1,a5,s1
    80001c20:	02d00793          	li	a5,45
    80001c24:	fef48823          	sb	a5,-16(s1)
    80001c28:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001c2c:	fff4849b          	addiw	s1,s1,-1
    80001c30:	0204c463          	bltz	s1,80001c58 <_Z8printIntiii+0xdc>
        __putc(buf[i]);
    80001c34:	fd040793          	addi	a5,s0,-48
    80001c38:	009787b3          	add	a5,a5,s1
    80001c3c:	ff07c503          	lbu	a0,-16(a5)
    80001c40:	00003097          	auipc	ra,0x3
    80001c44:	41c080e7          	jalr	1052(ra) # 8000505c <__putc>
    80001c48:	fe5ff06f          	j	80001c2c <_Z8printIntiii+0xb0>
        x = -xx;
    80001c4c:	4090053b          	negw	a0,s1
        neg = 1;
    80001c50:	00100593          	li	a1,1
        x = -xx;
    80001c54:	f7dff06f          	j	80001bd0 <_Z8printIntiii+0x54>

    UNLOCK();
    80001c58:	00000613          	li	a2,0
    80001c5c:	00100593          	li	a1,1
    80001c60:	00005517          	auipc	a0,0x5
    80001c64:	4f050513          	addi	a0,a0,1264 # 80007150 <lockPrint>
    80001c68:	fffff097          	auipc	ra,0xfffff
    80001c6c:	4a8080e7          	jalr	1192(ra) # 80001110 <copy_and_swap>
    80001c70:	fe0514e3          	bnez	a0,80001c58 <_Z8printIntiii+0xdc>
    80001c74:	03813083          	ld	ra,56(sp)
    80001c78:	03013403          	ld	s0,48(sp)
    80001c7c:	02813483          	ld	s1,40(sp)
    80001c80:	02013903          	ld	s2,32(sp)
    80001c84:	01813983          	ld	s3,24(sp)
    80001c88:	04010113          	addi	sp,sp,64
    80001c8c:	00008067          	ret

0000000080001c90 <_Z9fibonaccim>:
bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

uint64 fibonacci(uint64 n) {
    80001c90:	fe010113          	addi	sp,sp,-32
    80001c94:	00113c23          	sd	ra,24(sp)
    80001c98:	00813823          	sd	s0,16(sp)
    80001c9c:	00913423          	sd	s1,8(sp)
    80001ca0:	01213023          	sd	s2,0(sp)
    80001ca4:	02010413          	addi	s0,sp,32
    80001ca8:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001cac:	00100793          	li	a5,1
    80001cb0:	02a7f863          	bgeu	a5,a0,80001ce0 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80001cb4:	00a00793          	li	a5,10
    80001cb8:	02f577b3          	remu	a5,a0,a5
    80001cbc:	02078e63          	beqz	a5,80001cf8 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001cc0:	fff48513          	addi	a0,s1,-1
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	fcc080e7          	jalr	-52(ra) # 80001c90 <_Z9fibonaccim>
    80001ccc:	00050913          	mv	s2,a0
    80001cd0:	ffe48513          	addi	a0,s1,-2
    80001cd4:	00000097          	auipc	ra,0x0
    80001cd8:	fbc080e7          	jalr	-68(ra) # 80001c90 <_Z9fibonaccim>
    80001cdc:	00a90533          	add	a0,s2,a0
}
    80001ce0:	01813083          	ld	ra,24(sp)
    80001ce4:	01013403          	ld	s0,16(sp)
    80001ce8:	00813483          	ld	s1,8(sp)
    80001cec:	00013903          	ld	s2,0(sp)
    80001cf0:	02010113          	addi	sp,sp,32
    80001cf4:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001cf8:	00000097          	auipc	ra,0x0
    80001cfc:	894080e7          	jalr	-1900(ra) # 8000158c <_Z15thread_dispatchv>
    80001d00:	fc1ff06f          	j	80001cc0 <_Z9fibonaccim+0x30>

0000000080001d04 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80001d04:	fe010113          	addi	sp,sp,-32
    80001d08:	00113c23          	sd	ra,24(sp)
    80001d0c:	00813823          	sd	s0,16(sp)
    80001d10:	00913423          	sd	s1,8(sp)
    80001d14:	01213023          	sd	s2,0(sp)
    80001d18:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001d1c:	00000913          	li	s2,0
    80001d20:	0380006f          	j	80001d58 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001d24:	00000097          	auipc	ra,0x0
    80001d28:	868080e7          	jalr	-1944(ra) # 8000158c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001d2c:	00148493          	addi	s1,s1,1
    80001d30:	000027b7          	lui	a5,0x2
    80001d34:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001d38:	0097ee63          	bltu	a5,s1,80001d54 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001d3c:	00000713          	li	a4,0
    80001d40:	000077b7          	lui	a5,0x7
    80001d44:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001d48:	fce7eee3          	bltu	a5,a4,80001d24 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80001d4c:	00170713          	addi	a4,a4,1
    80001d50:	ff1ff06f          	j	80001d40 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80001d54:	00190913          	addi	s2,s2,1
    80001d58:	00900793          	li	a5,9
    80001d5c:	0527e063          	bltu	a5,s2,80001d9c <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80001d60:	00004517          	auipc	a0,0x4
    80001d64:	31850513          	addi	a0,a0,792 # 80006078 <CONSOLE_STATUS+0x68>
    80001d68:	00000097          	auipc	ra,0x0
    80001d6c:	c7c080e7          	jalr	-900(ra) # 800019e4 <_Z11printStringPKc>
    80001d70:	00000613          	li	a2,0
    80001d74:	00a00593          	li	a1,10
    80001d78:	0009051b          	sext.w	a0,s2
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	e00080e7          	jalr	-512(ra) # 80001b7c <_Z8printIntiii>
    80001d84:	00004517          	auipc	a0,0x4
    80001d88:	50c50513          	addi	a0,a0,1292 # 80006290 <CONSOLE_STATUS+0x280>
    80001d8c:	00000097          	auipc	ra,0x0
    80001d90:	c58080e7          	jalr	-936(ra) # 800019e4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001d94:	00000493          	li	s1,0
    80001d98:	f99ff06f          	j	80001d30 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80001d9c:	00004517          	auipc	a0,0x4
    80001da0:	2e450513          	addi	a0,a0,740 # 80006080 <CONSOLE_STATUS+0x70>
    80001da4:	00000097          	auipc	ra,0x0
    80001da8:	c40080e7          	jalr	-960(ra) # 800019e4 <_Z11printStringPKc>
    finishedA = true;
    80001dac:	00100793          	li	a5,1
    80001db0:	00005717          	auipc	a4,0x5
    80001db4:	3af70423          	sb	a5,936(a4) # 80007158 <finishedA>
    thread_exit();
    80001db8:	fffff097          	auipc	ra,0xfffff
    80001dbc:	6fc080e7          	jalr	1788(ra) # 800014b4 <_Z11thread_exitv>
    thread_dispatch();
    80001dc0:	fffff097          	auipc	ra,0xfffff
    80001dc4:	7cc080e7          	jalr	1996(ra) # 8000158c <_Z15thread_dispatchv>
}
    80001dc8:	01813083          	ld	ra,24(sp)
    80001dcc:	01013403          	ld	s0,16(sp)
    80001dd0:	00813483          	ld	s1,8(sp)
    80001dd4:	00013903          	ld	s2,0(sp)
    80001dd8:	02010113          	addi	sp,sp,32
    80001ddc:	00008067          	ret

0000000080001de0 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80001de0:	fe010113          	addi	sp,sp,-32
    80001de4:	00113c23          	sd	ra,24(sp)
    80001de8:	00813823          	sd	s0,16(sp)
    80001dec:	00913423          	sd	s1,8(sp)
    80001df0:	01213023          	sd	s2,0(sp)
    80001df4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001df8:	00000913          	li	s2,0
    80001dfc:	0380006f          	j	80001e34 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001e00:	fffff097          	auipc	ra,0xfffff
    80001e04:	78c080e7          	jalr	1932(ra) # 8000158c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001e08:	00148493          	addi	s1,s1,1
    80001e0c:	000027b7          	lui	a5,0x2
    80001e10:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001e14:	0097ee63          	bltu	a5,s1,80001e30 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001e18:	00000713          	li	a4,0
    80001e1c:	000077b7          	lui	a5,0x7
    80001e20:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001e24:	fce7eee3          	bltu	a5,a4,80001e00 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80001e28:	00170713          	addi	a4,a4,1
    80001e2c:	ff1ff06f          	j	80001e1c <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80001e30:	00190913          	addi	s2,s2,1
    80001e34:	00f00793          	li	a5,15
    80001e38:	0527e063          	bltu	a5,s2,80001e78 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80001e3c:	00004517          	auipc	a0,0x4
    80001e40:	25450513          	addi	a0,a0,596 # 80006090 <CONSOLE_STATUS+0x80>
    80001e44:	00000097          	auipc	ra,0x0
    80001e48:	ba0080e7          	jalr	-1120(ra) # 800019e4 <_Z11printStringPKc>
    80001e4c:	00000613          	li	a2,0
    80001e50:	00a00593          	li	a1,10
    80001e54:	0009051b          	sext.w	a0,s2
    80001e58:	00000097          	auipc	ra,0x0
    80001e5c:	d24080e7          	jalr	-732(ra) # 80001b7c <_Z8printIntiii>
    80001e60:	00004517          	auipc	a0,0x4
    80001e64:	43050513          	addi	a0,a0,1072 # 80006290 <CONSOLE_STATUS+0x280>
    80001e68:	00000097          	auipc	ra,0x0
    80001e6c:	b7c080e7          	jalr	-1156(ra) # 800019e4 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001e70:	00000493          	li	s1,0
    80001e74:	f99ff06f          	j	80001e0c <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80001e78:	00004517          	auipc	a0,0x4
    80001e7c:	22050513          	addi	a0,a0,544 # 80006098 <CONSOLE_STATUS+0x88>
    80001e80:	00000097          	auipc	ra,0x0
    80001e84:	b64080e7          	jalr	-1180(ra) # 800019e4 <_Z11printStringPKc>
    finishedB = true;
    80001e88:	00100793          	li	a5,1
    80001e8c:	00005717          	auipc	a4,0x5
    80001e90:	2cf706a3          	sb	a5,717(a4) # 80007159 <finishedB>
    thread_exit();
    80001e94:	fffff097          	auipc	ra,0xfffff
    80001e98:	620080e7          	jalr	1568(ra) # 800014b4 <_Z11thread_exitv>
    thread_dispatch();
    80001e9c:	fffff097          	auipc	ra,0xfffff
    80001ea0:	6f0080e7          	jalr	1776(ra) # 8000158c <_Z15thread_dispatchv>
}
    80001ea4:	01813083          	ld	ra,24(sp)
    80001ea8:	01013403          	ld	s0,16(sp)
    80001eac:	00813483          	ld	s1,8(sp)
    80001eb0:	00013903          	ld	s2,0(sp)
    80001eb4:	02010113          	addi	sp,sp,32
    80001eb8:	00008067          	ret

0000000080001ebc <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80001ebc:	fe010113          	addi	sp,sp,-32
    80001ec0:	00113c23          	sd	ra,24(sp)
    80001ec4:	00813823          	sd	s0,16(sp)
    80001ec8:	00913423          	sd	s1,8(sp)
    80001ecc:	01213023          	sd	s2,0(sp)
    80001ed0:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001ed4:	00000493          	li	s1,0
    80001ed8:	0400006f          	j	80001f18 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001edc:	00004517          	auipc	a0,0x4
    80001ee0:	1cc50513          	addi	a0,a0,460 # 800060a8 <CONSOLE_STATUS+0x98>
    80001ee4:	00000097          	auipc	ra,0x0
    80001ee8:	b00080e7          	jalr	-1280(ra) # 800019e4 <_Z11printStringPKc>
    80001eec:	00000613          	li	a2,0
    80001ef0:	00a00593          	li	a1,10
    80001ef4:	00048513          	mv	a0,s1
    80001ef8:	00000097          	auipc	ra,0x0
    80001efc:	c84080e7          	jalr	-892(ra) # 80001b7c <_Z8printIntiii>
    80001f00:	00004517          	auipc	a0,0x4
    80001f04:	39050513          	addi	a0,a0,912 # 80006290 <CONSOLE_STATUS+0x280>
    80001f08:	00000097          	auipc	ra,0x0
    80001f0c:	adc080e7          	jalr	-1316(ra) # 800019e4 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001f10:	0014849b          	addiw	s1,s1,1
    80001f14:	0ff4f493          	andi	s1,s1,255
    80001f18:	00200793          	li	a5,2
    80001f1c:	fc97f0e3          	bgeu	a5,s1,80001edc <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80001f20:	00004517          	auipc	a0,0x4
    80001f24:	19050513          	addi	a0,a0,400 # 800060b0 <CONSOLE_STATUS+0xa0>
    80001f28:	00000097          	auipc	ra,0x0
    80001f2c:	abc080e7          	jalr	-1348(ra) # 800019e4 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001f30:	00700313          	li	t1,7
    thread_dispatch();
    80001f34:	fffff097          	auipc	ra,0xfffff
    80001f38:	658080e7          	jalr	1624(ra) # 8000158c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001f3c:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80001f40:	00004517          	auipc	a0,0x4
    80001f44:	18050513          	addi	a0,a0,384 # 800060c0 <CONSOLE_STATUS+0xb0>
    80001f48:	00000097          	auipc	ra,0x0
    80001f4c:	a9c080e7          	jalr	-1380(ra) # 800019e4 <_Z11printStringPKc>
    80001f50:	00000613          	li	a2,0
    80001f54:	00a00593          	li	a1,10
    80001f58:	0009051b          	sext.w	a0,s2
    80001f5c:	00000097          	auipc	ra,0x0
    80001f60:	c20080e7          	jalr	-992(ra) # 80001b7c <_Z8printIntiii>
    80001f64:	00004517          	auipc	a0,0x4
    80001f68:	32c50513          	addi	a0,a0,812 # 80006290 <CONSOLE_STATUS+0x280>
    80001f6c:	00000097          	auipc	ra,0x0
    80001f70:	a78080e7          	jalr	-1416(ra) # 800019e4 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001f74:	00c00513          	li	a0,12
    80001f78:	00000097          	auipc	ra,0x0
    80001f7c:	d18080e7          	jalr	-744(ra) # 80001c90 <_Z9fibonaccim>
    80001f80:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80001f84:	00004517          	auipc	a0,0x4
    80001f88:	14450513          	addi	a0,a0,324 # 800060c8 <CONSOLE_STATUS+0xb8>
    80001f8c:	00000097          	auipc	ra,0x0
    80001f90:	a58080e7          	jalr	-1448(ra) # 800019e4 <_Z11printStringPKc>
    80001f94:	00000613          	li	a2,0
    80001f98:	00a00593          	li	a1,10
    80001f9c:	0009051b          	sext.w	a0,s2
    80001fa0:	00000097          	auipc	ra,0x0
    80001fa4:	bdc080e7          	jalr	-1060(ra) # 80001b7c <_Z8printIntiii>
    80001fa8:	00004517          	auipc	a0,0x4
    80001fac:	2e850513          	addi	a0,a0,744 # 80006290 <CONSOLE_STATUS+0x280>
    80001fb0:	00000097          	auipc	ra,0x0
    80001fb4:	a34080e7          	jalr	-1484(ra) # 800019e4 <_Z11printStringPKc>
    80001fb8:	0400006f          	j	80001ff8 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001fbc:	00004517          	auipc	a0,0x4
    80001fc0:	0ec50513          	addi	a0,a0,236 # 800060a8 <CONSOLE_STATUS+0x98>
    80001fc4:	00000097          	auipc	ra,0x0
    80001fc8:	a20080e7          	jalr	-1504(ra) # 800019e4 <_Z11printStringPKc>
    80001fcc:	00000613          	li	a2,0
    80001fd0:	00a00593          	li	a1,10
    80001fd4:	00048513          	mv	a0,s1
    80001fd8:	00000097          	auipc	ra,0x0
    80001fdc:	ba4080e7          	jalr	-1116(ra) # 80001b7c <_Z8printIntiii>
    80001fe0:	00004517          	auipc	a0,0x4
    80001fe4:	2b050513          	addi	a0,a0,688 # 80006290 <CONSOLE_STATUS+0x280>
    80001fe8:	00000097          	auipc	ra,0x0
    80001fec:	9fc080e7          	jalr	-1540(ra) # 800019e4 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80001ff0:	0014849b          	addiw	s1,s1,1
    80001ff4:	0ff4f493          	andi	s1,s1,255
    80001ff8:	00500793          	li	a5,5
    80001ffc:	fc97f0e3          	bgeu	a5,s1,80001fbc <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    80002000:	00004517          	auipc	a0,0x4
    80002004:	0d850513          	addi	a0,a0,216 # 800060d8 <CONSOLE_STATUS+0xc8>
    80002008:	00000097          	auipc	ra,0x0
    8000200c:	9dc080e7          	jalr	-1572(ra) # 800019e4 <_Z11printStringPKc>
    finishedC = true;
    80002010:	00100793          	li	a5,1
    80002014:	00005717          	auipc	a4,0x5
    80002018:	14f70323          	sb	a5,326(a4) # 8000715a <finishedC>
    thread_exit();
    8000201c:	fffff097          	auipc	ra,0xfffff
    80002020:	498080e7          	jalr	1176(ra) # 800014b4 <_Z11thread_exitv>
    thread_dispatch();
    80002024:	fffff097          	auipc	ra,0xfffff
    80002028:	568080e7          	jalr	1384(ra) # 8000158c <_Z15thread_dispatchv>
}
    8000202c:	01813083          	ld	ra,24(sp)
    80002030:	01013403          	ld	s0,16(sp)
    80002034:	00813483          	ld	s1,8(sp)
    80002038:	00013903          	ld	s2,0(sp)
    8000203c:	02010113          	addi	sp,sp,32
    80002040:	00008067          	ret

0000000080002044 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80002044:	fe010113          	addi	sp,sp,-32
    80002048:	00113c23          	sd	ra,24(sp)
    8000204c:	00813823          	sd	s0,16(sp)
    80002050:	00913423          	sd	s1,8(sp)
    80002054:	01213023          	sd	s2,0(sp)
    80002058:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    8000205c:	00a00493          	li	s1,10
    80002060:	0400006f          	j	800020a0 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002064:	00004517          	auipc	a0,0x4
    80002068:	08450513          	addi	a0,a0,132 # 800060e8 <CONSOLE_STATUS+0xd8>
    8000206c:	00000097          	auipc	ra,0x0
    80002070:	978080e7          	jalr	-1672(ra) # 800019e4 <_Z11printStringPKc>
    80002074:	00000613          	li	a2,0
    80002078:	00a00593          	li	a1,10
    8000207c:	00048513          	mv	a0,s1
    80002080:	00000097          	auipc	ra,0x0
    80002084:	afc080e7          	jalr	-1284(ra) # 80001b7c <_Z8printIntiii>
    80002088:	00004517          	auipc	a0,0x4
    8000208c:	20850513          	addi	a0,a0,520 # 80006290 <CONSOLE_STATUS+0x280>
    80002090:	00000097          	auipc	ra,0x0
    80002094:	954080e7          	jalr	-1708(ra) # 800019e4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80002098:	0014849b          	addiw	s1,s1,1
    8000209c:	0ff4f493          	andi	s1,s1,255
    800020a0:	00c00793          	li	a5,12
    800020a4:	fc97f0e3          	bgeu	a5,s1,80002064 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    800020a8:	00004517          	auipc	a0,0x4
    800020ac:	04850513          	addi	a0,a0,72 # 800060f0 <CONSOLE_STATUS+0xe0>
    800020b0:	00000097          	auipc	ra,0x0
    800020b4:	934080e7          	jalr	-1740(ra) # 800019e4 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800020b8:	00500313          	li	t1,5
    thread_dispatch();
    800020bc:	fffff097          	auipc	ra,0xfffff
    800020c0:	4d0080e7          	jalr	1232(ra) # 8000158c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800020c4:	01000513          	li	a0,16
    800020c8:	00000097          	auipc	ra,0x0
    800020cc:	bc8080e7          	jalr	-1080(ra) # 80001c90 <_Z9fibonaccim>
    800020d0:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800020d4:	00004517          	auipc	a0,0x4
    800020d8:	02c50513          	addi	a0,a0,44 # 80006100 <CONSOLE_STATUS+0xf0>
    800020dc:	00000097          	auipc	ra,0x0
    800020e0:	908080e7          	jalr	-1784(ra) # 800019e4 <_Z11printStringPKc>
    800020e4:	00000613          	li	a2,0
    800020e8:	00a00593          	li	a1,10
    800020ec:	0009051b          	sext.w	a0,s2
    800020f0:	00000097          	auipc	ra,0x0
    800020f4:	a8c080e7          	jalr	-1396(ra) # 80001b7c <_Z8printIntiii>
    800020f8:	00004517          	auipc	a0,0x4
    800020fc:	19850513          	addi	a0,a0,408 # 80006290 <CONSOLE_STATUS+0x280>
    80002100:	00000097          	auipc	ra,0x0
    80002104:	8e4080e7          	jalr	-1820(ra) # 800019e4 <_Z11printStringPKc>
    80002108:	0400006f          	j	80002148 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000210c:	00004517          	auipc	a0,0x4
    80002110:	fdc50513          	addi	a0,a0,-36 # 800060e8 <CONSOLE_STATUS+0xd8>
    80002114:	00000097          	auipc	ra,0x0
    80002118:	8d0080e7          	jalr	-1840(ra) # 800019e4 <_Z11printStringPKc>
    8000211c:	00000613          	li	a2,0
    80002120:	00a00593          	li	a1,10
    80002124:	00048513          	mv	a0,s1
    80002128:	00000097          	auipc	ra,0x0
    8000212c:	a54080e7          	jalr	-1452(ra) # 80001b7c <_Z8printIntiii>
    80002130:	00004517          	auipc	a0,0x4
    80002134:	16050513          	addi	a0,a0,352 # 80006290 <CONSOLE_STATUS+0x280>
    80002138:	00000097          	auipc	ra,0x0
    8000213c:	8ac080e7          	jalr	-1876(ra) # 800019e4 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002140:	0014849b          	addiw	s1,s1,1
    80002144:	0ff4f493          	andi	s1,s1,255
    80002148:	00f00793          	li	a5,15
    8000214c:	fc97f0e3          	bgeu	a5,s1,8000210c <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80002150:	00004517          	auipc	a0,0x4
    80002154:	fc050513          	addi	a0,a0,-64 # 80006110 <CONSOLE_STATUS+0x100>
    80002158:	00000097          	auipc	ra,0x0
    8000215c:	88c080e7          	jalr	-1908(ra) # 800019e4 <_Z11printStringPKc>
    finishedD = true;
    80002160:	00100793          	li	a5,1
    80002164:	00005717          	auipc	a4,0x5
    80002168:	fef70ba3          	sb	a5,-9(a4) # 8000715b <finishedD>
    thread_exit();
    8000216c:	fffff097          	auipc	ra,0xfffff
    80002170:	348080e7          	jalr	840(ra) # 800014b4 <_Z11thread_exitv>
    thread_dispatch();
    80002174:	fffff097          	auipc	ra,0xfffff
    80002178:	418080e7          	jalr	1048(ra) # 8000158c <_Z15thread_dispatchv>
}
    8000217c:	01813083          	ld	ra,24(sp)
    80002180:	01013403          	ld	s0,16(sp)
    80002184:	00813483          	ld	s1,8(sp)
    80002188:	00013903          	ld	s2,0(sp)
    8000218c:	02010113          	addi	sp,sp,32
    80002190:	00008067          	ret

0000000080002194 <_Z4bodyPv>:
void body(void *p){
    80002194:	fe010113          	addi	sp,sp,-32
    80002198:	00113c23          	sd	ra,24(sp)
    8000219c:	00813823          	sd	s0,16(sp)
    800021a0:	00913423          	sd	s1,8(sp)
    800021a4:	02010413          	addi	s0,sp,32
    int i = 0;
    800021a8:	00000493          	li	s1,0
    800021ac:	03c0006f          	j	800021e8 <_Z4bodyPv+0x54>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800021b0:	00004517          	auipc	a0,0x4
    800021b4:	f3850513          	addi	a0,a0,-200 # 800060e8 <CONSOLE_STATUS+0xd8>
    800021b8:	00000097          	auipc	ra,0x0
    800021bc:	82c080e7          	jalr	-2004(ra) # 800019e4 <_Z11printStringPKc>
    800021c0:	00000613          	li	a2,0
    800021c4:	00a00593          	li	a1,10
    800021c8:	00048513          	mv	a0,s1
    800021cc:	00000097          	auipc	ra,0x0
    800021d0:	9b0080e7          	jalr	-1616(ra) # 80001b7c <_Z8printIntiii>
    800021d4:	00004517          	auipc	a0,0x4
    800021d8:	0bc50513          	addi	a0,a0,188 # 80006290 <CONSOLE_STATUS+0x280>
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	808080e7          	jalr	-2040(ra) # 800019e4 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800021e4:	0014849b          	addiw	s1,s1,1
    800021e8:	00c00793          	li	a5,12
    800021ec:	fc97d2e3          	bge	a5,s1,800021b0 <_Z4bodyPv+0x1c>
    }
}
    800021f0:	01813083          	ld	ra,24(sp)
    800021f4:	01013403          	ld	s0,16(sp)
    800021f8:	00813483          	ld	s1,8(sp)
    800021fc:	02010113          	addi	sp,sp,32
    80002200:	00008067          	ret

0000000080002204 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80002204:	fc010113          	addi	sp,sp,-64
    80002208:	02113c23          	sd	ra,56(sp)
    8000220c:	02813823          	sd	s0,48(sp)
    80002210:	02913423          	sd	s1,40(sp)
    80002214:	03213023          	sd	s2,32(sp)
    80002218:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    8000221c:	01000513          	li	a0,16
    80002220:	00000097          	auipc	ra,0x0
    80002224:	760080e7          	jalr	1888(ra) # 80002980 <_Znwm>
    80002228:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    8000222c:	00001097          	auipc	ra,0x1
    80002230:	8e0080e7          	jalr	-1824(ra) # 80002b0c <_ZN6ThreadC1Ev>
    80002234:	00005797          	auipc	a5,0x5
    80002238:	dc478793          	addi	a5,a5,-572 # 80006ff8 <_ZTV7WorkerA+0x10>
    8000223c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80002240:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80002244:	00004517          	auipc	a0,0x4
    80002248:	edc50513          	addi	a0,a0,-292 # 80006120 <CONSOLE_STATUS+0x110>
    8000224c:	fffff097          	auipc	ra,0xfffff
    80002250:	798080e7          	jalr	1944(ra) # 800019e4 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80002254:	01000513          	li	a0,16
    80002258:	00000097          	auipc	ra,0x0
    8000225c:	728080e7          	jalr	1832(ra) # 80002980 <_Znwm>
    80002260:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80002264:	00001097          	auipc	ra,0x1
    80002268:	8a8080e7          	jalr	-1880(ra) # 80002b0c <_ZN6ThreadC1Ev>
    8000226c:	00005797          	auipc	a5,0x5
    80002270:	db478793          	addi	a5,a5,-588 # 80007020 <_ZTV7WorkerB+0x10>
    80002274:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80002278:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000227c:	00004517          	auipc	a0,0x4
    80002280:	ebc50513          	addi	a0,a0,-324 # 80006138 <CONSOLE_STATUS+0x128>
    80002284:	fffff097          	auipc	ra,0xfffff
    80002288:	760080e7          	jalr	1888(ra) # 800019e4 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000228c:	01000513          	li	a0,16
    80002290:	00000097          	auipc	ra,0x0
    80002294:	6f0080e7          	jalr	1776(ra) # 80002980 <_Znwm>
    80002298:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000229c:	00001097          	auipc	ra,0x1
    800022a0:	870080e7          	jalr	-1936(ra) # 80002b0c <_ZN6ThreadC1Ev>
    800022a4:	00005797          	auipc	a5,0x5
    800022a8:	da478793          	addi	a5,a5,-604 # 80007048 <_ZTV7WorkerC+0x10>
    800022ac:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800022b0:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800022b4:	00004517          	auipc	a0,0x4
    800022b8:	e9c50513          	addi	a0,a0,-356 # 80006150 <CONSOLE_STATUS+0x140>
    800022bc:	fffff097          	auipc	ra,0xfffff
    800022c0:	728080e7          	jalr	1832(ra) # 800019e4 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800022c4:	01000513          	li	a0,16
    800022c8:	00000097          	auipc	ra,0x0
    800022cc:	6b8080e7          	jalr	1720(ra) # 80002980 <_Znwm>
    800022d0:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800022d4:	00001097          	auipc	ra,0x1
    800022d8:	838080e7          	jalr	-1992(ra) # 80002b0c <_ZN6ThreadC1Ev>
    800022dc:	00005797          	auipc	a5,0x5
    800022e0:	d9478793          	addi	a5,a5,-620 # 80007070 <_ZTV7WorkerD+0x10>
    800022e4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800022e8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800022ec:	00004517          	auipc	a0,0x4
    800022f0:	e7c50513          	addi	a0,a0,-388 # 80006168 <CONSOLE_STATUS+0x158>
    800022f4:	fffff097          	auipc	ra,0xfffff
    800022f8:	6f0080e7          	jalr	1776(ra) # 800019e4 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800022fc:	00000493          	li	s1,0
    80002300:	00300793          	li	a5,3
    80002304:	0297c663          	blt	a5,s1,80002330 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80002308:	00349793          	slli	a5,s1,0x3
    8000230c:	fe040713          	addi	a4,s0,-32
    80002310:	00f707b3          	add	a5,a4,a5
    80002314:	fe07b503          	ld	a0,-32(a5)
    80002318:	00000097          	auipc	ra,0x0
    8000231c:	780080e7          	jalr	1920(ra) # 80002a98 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80002320:	0014849b          	addiw	s1,s1,1
    80002324:	fddff06f          	j	80002300 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	7a0080e7          	jalr	1952(ra) # 80002ac8 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80002330:	00005797          	auipc	a5,0x5
    80002334:	e287c783          	lbu	a5,-472(a5) # 80007158 <finishedA>
    80002338:	fe0788e3          	beqz	a5,80002328 <_Z20Threads_CPP_API_testv+0x124>
    8000233c:	00005797          	auipc	a5,0x5
    80002340:	e1d7c783          	lbu	a5,-483(a5) # 80007159 <finishedB>
    80002344:	fe0782e3          	beqz	a5,80002328 <_Z20Threads_CPP_API_testv+0x124>
    80002348:	00005797          	auipc	a5,0x5
    8000234c:	e127c783          	lbu	a5,-494(a5) # 8000715a <finishedC>
    80002350:	fc078ce3          	beqz	a5,80002328 <_Z20Threads_CPP_API_testv+0x124>
    80002354:	00005797          	auipc	a5,0x5
    80002358:	e077c783          	lbu	a5,-505(a5) # 8000715b <finishedD>
    8000235c:	fc0786e3          	beqz	a5,80002328 <_Z20Threads_CPP_API_testv+0x124>
    }

    for (auto thread: threads) { delete thread; }
    80002360:	fc040493          	addi	s1,s0,-64
    80002364:	0080006f          	j	8000236c <_Z20Threads_CPP_API_testv+0x168>
    80002368:	00848493          	addi	s1,s1,8
    8000236c:	fe040793          	addi	a5,s0,-32
    80002370:	08f48663          	beq	s1,a5,800023fc <_Z20Threads_CPP_API_testv+0x1f8>
    80002374:	0004b503          	ld	a0,0(s1)
    80002378:	fe0508e3          	beqz	a0,80002368 <_Z20Threads_CPP_API_testv+0x164>
    8000237c:	00053783          	ld	a5,0(a0)
    80002380:	0087b783          	ld	a5,8(a5)
    80002384:	000780e7          	jalr	a5
    80002388:	fe1ff06f          	j	80002368 <_Z20Threads_CPP_API_testv+0x164>
    8000238c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80002390:	00048513          	mv	a0,s1
    80002394:	00000097          	auipc	ra,0x0
    80002398:	63c080e7          	jalr	1596(ra) # 800029d0 <_ZdlPv>
    8000239c:	00090513          	mv	a0,s2
    800023a0:	00006097          	auipc	ra,0x6
    800023a4:	eb8080e7          	jalr	-328(ra) # 80008258 <_Unwind_Resume>
    800023a8:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800023ac:	00048513          	mv	a0,s1
    800023b0:	00000097          	auipc	ra,0x0
    800023b4:	620080e7          	jalr	1568(ra) # 800029d0 <_ZdlPv>
    800023b8:	00090513          	mv	a0,s2
    800023bc:	00006097          	auipc	ra,0x6
    800023c0:	e9c080e7          	jalr	-356(ra) # 80008258 <_Unwind_Resume>
    800023c4:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800023c8:	00048513          	mv	a0,s1
    800023cc:	00000097          	auipc	ra,0x0
    800023d0:	604080e7          	jalr	1540(ra) # 800029d0 <_ZdlPv>
    800023d4:	00090513          	mv	a0,s2
    800023d8:	00006097          	auipc	ra,0x6
    800023dc:	e80080e7          	jalr	-384(ra) # 80008258 <_Unwind_Resume>
    800023e0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800023e4:	00048513          	mv	a0,s1
    800023e8:	00000097          	auipc	ra,0x0
    800023ec:	5e8080e7          	jalr	1512(ra) # 800029d0 <_ZdlPv>
    800023f0:	00090513          	mv	a0,s2
    800023f4:	00006097          	auipc	ra,0x6
    800023f8:	e64080e7          	jalr	-412(ra) # 80008258 <_Unwind_Resume>
}
    800023fc:	03813083          	ld	ra,56(sp)
    80002400:	03013403          	ld	s0,48(sp)
    80002404:	02813483          	ld	s1,40(sp)
    80002408:	02013903          	ld	s2,32(sp)
    8000240c:	04010113          	addi	sp,sp,64
    80002410:	00008067          	ret

0000000080002414 <_Z8userMainPv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain(void *) {
    80002414:	ff010113          	addi	sp,sp,-16
    80002418:	00113423          	sd	ra,8(sp)
    8000241c:	00813023          	sd	s0,0(sp)
    80002420:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta
    80002424:	00000097          	auipc	ra,0x0
    80002428:	de0080e7          	jalr	-544(ra) # 80002204 <_Z20Threads_CPP_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
//    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

}
    8000242c:	00813083          	ld	ra,8(sp)
    80002430:	00013403          	ld	s0,0(sp)
    80002434:	01010113          	addi	sp,sp,16
    80002438:	00008067          	ret

000000008000243c <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    8000243c:	ff010113          	addi	sp,sp,-16
    80002440:	00113423          	sd	ra,8(sp)
    80002444:	00813023          	sd	s0,0(sp)
    80002448:	01010413          	addi	s0,sp,16
    8000244c:	00005797          	auipc	a5,0x5
    80002450:	bac78793          	addi	a5,a5,-1108 # 80006ff8 <_ZTV7WorkerA+0x10>
    80002454:	00f53023          	sd	a5,0(a0)
    80002458:	00000097          	auipc	ra,0x0
    8000245c:	4f4080e7          	jalr	1268(ra) # 8000294c <_ZN6ThreadD1Ev>
    80002460:	00813083          	ld	ra,8(sp)
    80002464:	00013403          	ld	s0,0(sp)
    80002468:	01010113          	addi	sp,sp,16
    8000246c:	00008067          	ret

0000000080002470 <_ZN7WorkerAD0Ev>:
    80002470:	fe010113          	addi	sp,sp,-32
    80002474:	00113c23          	sd	ra,24(sp)
    80002478:	00813823          	sd	s0,16(sp)
    8000247c:	00913423          	sd	s1,8(sp)
    80002480:	02010413          	addi	s0,sp,32
    80002484:	00050493          	mv	s1,a0
    80002488:	00005797          	auipc	a5,0x5
    8000248c:	b7078793          	addi	a5,a5,-1168 # 80006ff8 <_ZTV7WorkerA+0x10>
    80002490:	00f53023          	sd	a5,0(a0)
    80002494:	00000097          	auipc	ra,0x0
    80002498:	4b8080e7          	jalr	1208(ra) # 8000294c <_ZN6ThreadD1Ev>
    8000249c:	00048513          	mv	a0,s1
    800024a0:	00000097          	auipc	ra,0x0
    800024a4:	530080e7          	jalr	1328(ra) # 800029d0 <_ZdlPv>
    800024a8:	01813083          	ld	ra,24(sp)
    800024ac:	01013403          	ld	s0,16(sp)
    800024b0:	00813483          	ld	s1,8(sp)
    800024b4:	02010113          	addi	sp,sp,32
    800024b8:	00008067          	ret

00000000800024bc <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800024bc:	ff010113          	addi	sp,sp,-16
    800024c0:	00113423          	sd	ra,8(sp)
    800024c4:	00813023          	sd	s0,0(sp)
    800024c8:	01010413          	addi	s0,sp,16
    800024cc:	00005797          	auipc	a5,0x5
    800024d0:	b5478793          	addi	a5,a5,-1196 # 80007020 <_ZTV7WorkerB+0x10>
    800024d4:	00f53023          	sd	a5,0(a0)
    800024d8:	00000097          	auipc	ra,0x0
    800024dc:	474080e7          	jalr	1140(ra) # 8000294c <_ZN6ThreadD1Ev>
    800024e0:	00813083          	ld	ra,8(sp)
    800024e4:	00013403          	ld	s0,0(sp)
    800024e8:	01010113          	addi	sp,sp,16
    800024ec:	00008067          	ret

00000000800024f0 <_ZN7WorkerBD0Ev>:
    800024f0:	fe010113          	addi	sp,sp,-32
    800024f4:	00113c23          	sd	ra,24(sp)
    800024f8:	00813823          	sd	s0,16(sp)
    800024fc:	00913423          	sd	s1,8(sp)
    80002500:	02010413          	addi	s0,sp,32
    80002504:	00050493          	mv	s1,a0
    80002508:	00005797          	auipc	a5,0x5
    8000250c:	b1878793          	addi	a5,a5,-1256 # 80007020 <_ZTV7WorkerB+0x10>
    80002510:	00f53023          	sd	a5,0(a0)
    80002514:	00000097          	auipc	ra,0x0
    80002518:	438080e7          	jalr	1080(ra) # 8000294c <_ZN6ThreadD1Ev>
    8000251c:	00048513          	mv	a0,s1
    80002520:	00000097          	auipc	ra,0x0
    80002524:	4b0080e7          	jalr	1200(ra) # 800029d0 <_ZdlPv>
    80002528:	01813083          	ld	ra,24(sp)
    8000252c:	01013403          	ld	s0,16(sp)
    80002530:	00813483          	ld	s1,8(sp)
    80002534:	02010113          	addi	sp,sp,32
    80002538:	00008067          	ret

000000008000253c <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    8000253c:	ff010113          	addi	sp,sp,-16
    80002540:	00113423          	sd	ra,8(sp)
    80002544:	00813023          	sd	s0,0(sp)
    80002548:	01010413          	addi	s0,sp,16
    8000254c:	00005797          	auipc	a5,0x5
    80002550:	afc78793          	addi	a5,a5,-1284 # 80007048 <_ZTV7WorkerC+0x10>
    80002554:	00f53023          	sd	a5,0(a0)
    80002558:	00000097          	auipc	ra,0x0
    8000255c:	3f4080e7          	jalr	1012(ra) # 8000294c <_ZN6ThreadD1Ev>
    80002560:	00813083          	ld	ra,8(sp)
    80002564:	00013403          	ld	s0,0(sp)
    80002568:	01010113          	addi	sp,sp,16
    8000256c:	00008067          	ret

0000000080002570 <_ZN7WorkerCD0Ev>:
    80002570:	fe010113          	addi	sp,sp,-32
    80002574:	00113c23          	sd	ra,24(sp)
    80002578:	00813823          	sd	s0,16(sp)
    8000257c:	00913423          	sd	s1,8(sp)
    80002580:	02010413          	addi	s0,sp,32
    80002584:	00050493          	mv	s1,a0
    80002588:	00005797          	auipc	a5,0x5
    8000258c:	ac078793          	addi	a5,a5,-1344 # 80007048 <_ZTV7WorkerC+0x10>
    80002590:	00f53023          	sd	a5,0(a0)
    80002594:	00000097          	auipc	ra,0x0
    80002598:	3b8080e7          	jalr	952(ra) # 8000294c <_ZN6ThreadD1Ev>
    8000259c:	00048513          	mv	a0,s1
    800025a0:	00000097          	auipc	ra,0x0
    800025a4:	430080e7          	jalr	1072(ra) # 800029d0 <_ZdlPv>
    800025a8:	01813083          	ld	ra,24(sp)
    800025ac:	01013403          	ld	s0,16(sp)
    800025b0:	00813483          	ld	s1,8(sp)
    800025b4:	02010113          	addi	sp,sp,32
    800025b8:	00008067          	ret

00000000800025bc <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800025bc:	ff010113          	addi	sp,sp,-16
    800025c0:	00113423          	sd	ra,8(sp)
    800025c4:	00813023          	sd	s0,0(sp)
    800025c8:	01010413          	addi	s0,sp,16
    800025cc:	00005797          	auipc	a5,0x5
    800025d0:	aa478793          	addi	a5,a5,-1372 # 80007070 <_ZTV7WorkerD+0x10>
    800025d4:	00f53023          	sd	a5,0(a0)
    800025d8:	00000097          	auipc	ra,0x0
    800025dc:	374080e7          	jalr	884(ra) # 8000294c <_ZN6ThreadD1Ev>
    800025e0:	00813083          	ld	ra,8(sp)
    800025e4:	00013403          	ld	s0,0(sp)
    800025e8:	01010113          	addi	sp,sp,16
    800025ec:	00008067          	ret

00000000800025f0 <_ZN7WorkerDD0Ev>:
    800025f0:	fe010113          	addi	sp,sp,-32
    800025f4:	00113c23          	sd	ra,24(sp)
    800025f8:	00813823          	sd	s0,16(sp)
    800025fc:	00913423          	sd	s1,8(sp)
    80002600:	02010413          	addi	s0,sp,32
    80002604:	00050493          	mv	s1,a0
    80002608:	00005797          	auipc	a5,0x5
    8000260c:	a6878793          	addi	a5,a5,-1432 # 80007070 <_ZTV7WorkerD+0x10>
    80002610:	00f53023          	sd	a5,0(a0)
    80002614:	00000097          	auipc	ra,0x0
    80002618:	338080e7          	jalr	824(ra) # 8000294c <_ZN6ThreadD1Ev>
    8000261c:	00048513          	mv	a0,s1
    80002620:	00000097          	auipc	ra,0x0
    80002624:	3b0080e7          	jalr	944(ra) # 800029d0 <_ZdlPv>
    80002628:	01813083          	ld	ra,24(sp)
    8000262c:	01013403          	ld	s0,16(sp)
    80002630:	00813483          	ld	s1,8(sp)
    80002634:	02010113          	addi	sp,sp,32
    80002638:	00008067          	ret

000000008000263c <_ZN7WorkerA3runEv>:
    void run() override {
    8000263c:	ff010113          	addi	sp,sp,-16
    80002640:	00113423          	sd	ra,8(sp)
    80002644:	00813023          	sd	s0,0(sp)
    80002648:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    8000264c:	00000593          	li	a1,0
    80002650:	fffff097          	auipc	ra,0xfffff
    80002654:	6b4080e7          	jalr	1716(ra) # 80001d04 <_ZN7WorkerA11workerBodyAEPv>
    }
    80002658:	00813083          	ld	ra,8(sp)
    8000265c:	00013403          	ld	s0,0(sp)
    80002660:	01010113          	addi	sp,sp,16
    80002664:	00008067          	ret

0000000080002668 <_ZN7WorkerB3runEv>:
    void run() override {
    80002668:	ff010113          	addi	sp,sp,-16
    8000266c:	00113423          	sd	ra,8(sp)
    80002670:	00813023          	sd	s0,0(sp)
    80002674:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80002678:	00000593          	li	a1,0
    8000267c:	fffff097          	auipc	ra,0xfffff
    80002680:	764080e7          	jalr	1892(ra) # 80001de0 <_ZN7WorkerB11workerBodyBEPv>
    }
    80002684:	00813083          	ld	ra,8(sp)
    80002688:	00013403          	ld	s0,0(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <_ZN7WorkerC3runEv>:
    void run() override {
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00113423          	sd	ra,8(sp)
    8000269c:	00813023          	sd	s0,0(sp)
    800026a0:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800026a4:	00000593          	li	a1,0
    800026a8:	00000097          	auipc	ra,0x0
    800026ac:	814080e7          	jalr	-2028(ra) # 80001ebc <_ZN7WorkerC11workerBodyCEPv>
    }
    800026b0:	00813083          	ld	ra,8(sp)
    800026b4:	00013403          	ld	s0,0(sp)
    800026b8:	01010113          	addi	sp,sp,16
    800026bc:	00008067          	ret

00000000800026c0 <_ZN7WorkerD3runEv>:
    void run() override {
    800026c0:	ff010113          	addi	sp,sp,-16
    800026c4:	00113423          	sd	ra,8(sp)
    800026c8:	00813023          	sd	s0,0(sp)
    800026cc:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800026d0:	00000593          	li	a1,0
    800026d4:	00000097          	auipc	ra,0x0
    800026d8:	970080e7          	jalr	-1680(ra) # 80002044 <_ZN7WorkerD11workerBodyDEPv>
    }
    800026dc:	00813083          	ld	ra,8(sp)
    800026e0:	00013403          	ld	s0,0(sp)
    800026e4:	01010113          	addi	sp,sp,16
    800026e8:	00008067          	ret

00000000800026ec <_ZN9Scheduler3getEv>:

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

_thread *Scheduler::get()
{
    800026ec:	fe010113          	addi	sp,sp,-32
    800026f0:	00113c23          	sd	ra,24(sp)
    800026f4:	00813823          	sd	s0,16(sp)
    800026f8:	00913423          	sd	s1,8(sp)
    800026fc:	02010413          	addi	s0,sp,32
    if (!head) return nullptr;
    80002700:	00005517          	auipc	a0,0x5
    80002704:	a6053503          	ld	a0,-1440(a0) # 80007160 <_ZN9Scheduler4headE>
    80002708:	04050263          	beqz	a0,8000274c <_ZN9Scheduler3getEv+0x60>

    Elem* elem = head;
    head = head->next;
    8000270c:	00853783          	ld	a5,8(a0)
    80002710:	00005717          	auipc	a4,0x5
    80002714:	a4f73823          	sd	a5,-1456(a4) # 80007160 <_ZN9Scheduler4headE>
    if (!head) tail = 0;
    80002718:	02078463          	beqz	a5,80002740 <_ZN9Scheduler3getEv+0x54>

    _thread *ret = elem->data;
    8000271c:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    80002720:	00000097          	auipc	ra,0x0
    80002724:	688080e7          	jalr	1672(ra) # 80002da8 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    80002728:	00048513          	mv	a0,s1
    8000272c:	01813083          	ld	ra,24(sp)
    80002730:	01013403          	ld	s0,16(sp)
    80002734:	00813483          	ld	s1,8(sp)
    80002738:	02010113          	addi	sp,sp,32
    8000273c:	00008067          	ret
    if (!head) tail = 0;
    80002740:	00005797          	auipc	a5,0x5
    80002744:	a207b423          	sd	zero,-1496(a5) # 80007168 <_ZN9Scheduler4tailE>
    80002748:	fd5ff06f          	j	8000271c <_ZN9Scheduler3getEv+0x30>
    if (!head) return nullptr;
    8000274c:	00050493          	mv	s1,a0
    80002750:	fd9ff06f          	j	80002728 <_ZN9Scheduler3getEv+0x3c>

0000000080002754 <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(_thread *ccb)
{
    80002754:	fe010113          	addi	sp,sp,-32
    80002758:	00113c23          	sd	ra,24(sp)
    8000275c:	00813823          	sd	s0,16(sp)
    80002760:	00913423          	sd	s1,8(sp)
    80002764:	02010413          	addi	s0,sp,32
    80002768:	00050493          	mv	s1,a0
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    8000276c:	00100513          	li	a0,1
    80002770:	00000097          	auipc	ra,0x0
    80002774:	464080e7          	jalr	1124(ra) # 80002bd4 <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = ccb;
    80002778:	00953023          	sd	s1,0(a0)
    elem->next = nullptr;
    8000277c:	00053423          	sd	zero,8(a0)
    if(tail){
    80002780:	00005797          	auipc	a5,0x5
    80002784:	9e87b783          	ld	a5,-1560(a5) # 80007168 <_ZN9Scheduler4tailE>
    80002788:	02078263          	beqz	a5,800027ac <_ZN9Scheduler3putEP7_thread+0x58>
        tail->next = elem;
    8000278c:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    80002790:	00005797          	auipc	a5,0x5
    80002794:	9ca7bc23          	sd	a0,-1576(a5) # 80007168 <_ZN9Scheduler4tailE>
    }else{
        head = tail = elem;
    }
    80002798:	01813083          	ld	ra,24(sp)
    8000279c:	01013403          	ld	s0,16(sp)
    800027a0:	00813483          	ld	s1,8(sp)
    800027a4:	02010113          	addi	sp,sp,32
    800027a8:	00008067          	ret
        head = tail = elem;
    800027ac:	00005797          	auipc	a5,0x5
    800027b0:	9b478793          	addi	a5,a5,-1612 # 80007160 <_ZN9Scheduler4headE>
    800027b4:	00a7b423          	sd	a0,8(a5)
    800027b8:	00a7b023          	sd	a0,0(a5)
    800027bc:	fddff06f          	j	80002798 <_ZN9Scheduler3putEP7_thread+0x44>

00000000800027c0 <_Z12checkNullptrPv>:
//}
//extern "C" void supervisorTrap();

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
    800027c0:	00050e63          	beqz	a0,800027dc <_Z12checkNullptrPv+0x1c>
        __putc('?');
        __putc('0' + x);
    }
    x++;
    800027c4:	00005717          	auipc	a4,0x5
    800027c8:	9ac70713          	addi	a4,a4,-1620 # 80007170 <_ZZ12checkNullptrPvE1x>
    800027cc:	00072783          	lw	a5,0(a4)
    800027d0:	0017879b          	addiw	a5,a5,1
    800027d4:	00f72023          	sw	a5,0(a4)
    800027d8:	00008067          	ret
void checkNullptr(void* p) {
    800027dc:	ff010113          	addi	sp,sp,-16
    800027e0:	00113423          	sd	ra,8(sp)
    800027e4:	00813023          	sd	s0,0(sp)
    800027e8:	01010413          	addi	s0,sp,16
        __putc('?');
    800027ec:	03f00513          	li	a0,63
    800027f0:	00003097          	auipc	ra,0x3
    800027f4:	86c080e7          	jalr	-1940(ra) # 8000505c <__putc>
        __putc('0' + x);
    800027f8:	00005517          	auipc	a0,0x5
    800027fc:	97852503          	lw	a0,-1672(a0) # 80007170 <_ZZ12checkNullptrPvE1x>
    80002800:	0305051b          	addiw	a0,a0,48
    80002804:	0ff57513          	andi	a0,a0,255
    80002808:	00003097          	auipc	ra,0x3
    8000280c:	854080e7          	jalr	-1964(ra) # 8000505c <__putc>
    x++;
    80002810:	00005717          	auipc	a4,0x5
    80002814:	96070713          	addi	a4,a4,-1696 # 80007170 <_ZZ12checkNullptrPvE1x>
    80002818:	00072783          	lw	a5,0(a4)
    8000281c:	0017879b          	addiw	a5,a5,1
    80002820:	00f72023          	sw	a5,0(a4)
}
    80002824:	00813083          	ld	ra,8(sp)
    80002828:	00013403          	ld	s0,0(sp)
    8000282c:	01010113          	addi	sp,sp,16
    80002830:	00008067          	ret

0000000080002834 <_Z11checkStatusi>:

void checkStatus(int status) {
    static int y = 0;
    if(status) {
    80002834:	00051e63          	bnez	a0,80002850 <_Z11checkStatusi+0x1c>
        __putc('0' + y);
        __putc('?');
    }
    y++;
    80002838:	00005717          	auipc	a4,0x5
    8000283c:	93870713          	addi	a4,a4,-1736 # 80007170 <_ZZ12checkNullptrPvE1x>
    80002840:	00472783          	lw	a5,4(a4)
    80002844:	0017879b          	addiw	a5,a5,1
    80002848:	00f72223          	sw	a5,4(a4)
    8000284c:	00008067          	ret
void checkStatus(int status) {
    80002850:	ff010113          	addi	sp,sp,-16
    80002854:	00113423          	sd	ra,8(sp)
    80002858:	00813023          	sd	s0,0(sp)
    8000285c:	01010413          	addi	s0,sp,16
        __putc('0' + y);
    80002860:	00005517          	auipc	a0,0x5
    80002864:	91452503          	lw	a0,-1772(a0) # 80007174 <_ZZ11checkStatusiE1y>
    80002868:	0305051b          	addiw	a0,a0,48
    8000286c:	0ff57513          	andi	a0,a0,255
    80002870:	00002097          	auipc	ra,0x2
    80002874:	7ec080e7          	jalr	2028(ra) # 8000505c <__putc>
        __putc('?');
    80002878:	03f00513          	li	a0,63
    8000287c:	00002097          	auipc	ra,0x2
    80002880:	7e0080e7          	jalr	2016(ra) # 8000505c <__putc>
    y++;
    80002884:	00005717          	auipc	a4,0x5
    80002888:	8ec70713          	addi	a4,a4,-1812 # 80007170 <_ZZ12checkNullptrPvE1x>
    8000288c:	00472783          	lw	a5,4(a4)
    80002890:	0017879b          	addiw	a5,a5,1
    80002894:	00f72223          	sw	a5,4(a4)
}
    80002898:	00813083          	ld	ra,8(sp)
    8000289c:	00013403          	ld	s0,0(sp)
    800028a0:	01010113          	addi	sp,sp,16
    800028a4:	00008067          	ret

00000000800028a8 <main>:
extern "C" void trap();
void userMain(void *);

int main(){
    800028a8:	fe010113          	addi	sp,sp,-32
    800028ac:	00113c23          	sd	ra,24(sp)
    800028b0:	00813823          	sd	s0,16(sp)
    800028b4:	00913423          	sd	s1,8(sp)
    800028b8:	02010413          	addi	s0,sp,32
    //Riscv::w_stvec((uint64) &trap);
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //_thread *threads[2];

    _thread *thread = _thread::createThread(nullptr, nullptr);
    800028bc:	00000593          	li	a1,0
    800028c0:	00000513          	li	a0,0
    800028c4:	fffff097          	auipc	ra,0xfffff
    800028c8:	fec080e7          	jalr	-20(ra) # 800018b0 <_ZN7_thread12createThreadEPFvPvES0_>
    800028cc:	00050493          	mv	s1,a0
    _thread::running = thread;
    800028d0:	00004797          	auipc	a5,0x4
    800028d4:	7f87b783          	ld	a5,2040(a5) # 800070c8 <_GLOBAL_OFFSET_TABLE_+0x10>
    800028d8:	00a7b023          	sd	a0,0(a5)

    //threads[1] = _thread::createThread(userMain, nullptr);

    Riscv::w_stvec((uint64) &trap);
    800028dc:	00005797          	auipc	a5,0x5
    800028e0:	80c7b783          	ld	a5,-2036(a5) # 800070e8 <_GLOBAL_OFFSET_TABLE_+0x30>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800028e4:	10579073          	csrw	stvec,a5
    __asm__ volatile("ecall");
    800028e8:	00000073          	ecall
    bool isFinished() const { return finished; }
    800028ec:	0184c783          	lbu	a5,24(s1)

    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);


    while (!(thread->isFinished()))
    800028f0:	00079863          	bnez	a5,80002900 <main+0x58>
    {
        _thread::yield();
    800028f4:	fffff097          	auipc	ra,0xfffff
    800028f8:	e54080e7          	jalr	-428(ra) # 80001748 <_ZN7_thread5yieldEv>
    while (!(thread->isFinished()))
    800028fc:	ff1ff06f          	j	800028ec <main+0x44>
    }
    return 0;
}
    80002900:	00000513          	li	a0,0
    80002904:	01813083          	ld	ra,24(sp)
    80002908:	01013403          	ld	s0,16(sp)
    8000290c:	00813483          	ld	s1,8(sp)
    80002910:	02010113          	addi	sp,sp,32
    80002914:	00008067          	ret

0000000080002918 <_Z10wrapperRunPv>:
struct Wrapper {
    ptrOnFun func;
};

void wrapperRun(void* p){
    if(p == nullptr) return;
    80002918:	02050863          	beqz	a0,80002948 <_Z10wrapperRunPv+0x30>
void wrapperRun(void* p){
    8000291c:	ff010113          	addi	sp,sp,-16
    80002920:	00113423          	sd	ra,8(sp)
    80002924:	00813023          	sd	s0,0(sp)
    80002928:	01010413          	addi	s0,sp,16
    ((Thread*)p)->run();
    8000292c:	00053783          	ld	a5,0(a0)
    80002930:	0107b783          	ld	a5,16(a5)
    80002934:	000780e7          	jalr	a5
}
    80002938:	00813083          	ld	ra,8(sp)
    8000293c:	00013403          	ld	s0,0(sp)
    80002940:	01010113          	addi	sp,sp,16
    80002944:	00008067          	ret
    80002948:	00008067          	ret

000000008000294c <_ZN6ThreadD1Ev>:

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    8000294c:	ff010113          	addi	sp,sp,-16
    80002950:	00113423          	sd	ra,8(sp)
    80002954:	00813023          	sd	s0,0(sp)
    80002958:	01010413          	addi	s0,sp,16
    8000295c:	00004797          	auipc	a5,0x4
    80002960:	74478793          	addi	a5,a5,1860 # 800070a0 <_ZTV6Thread+0x10>
    80002964:	00f53023          	sd	a5,0(a0)
    thread_exit();
    80002968:	fffff097          	auipc	ra,0xfffff
    8000296c:	b4c080e7          	jalr	-1204(ra) # 800014b4 <_Z11thread_exitv>
}
    80002970:	00813083          	ld	ra,8(sp)
    80002974:	00013403          	ld	s0,0(sp)
    80002978:	01010113          	addi	sp,sp,16
    8000297c:	00008067          	ret

0000000080002980 <_Znwm>:
void* operator new(size_t size){
    80002980:	ff010113          	addi	sp,sp,-16
    80002984:	00113423          	sd	ra,8(sp)
    80002988:	00813023          	sd	s0,0(sp)
    8000298c:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    80002990:	fffff097          	auipc	ra,0xfffff
    80002994:	aa4080e7          	jalr	-1372(ra) # 80001434 <_Z9mem_allocm>
}
    80002998:	00813083          	ld	ra,8(sp)
    8000299c:	00013403          	ld	s0,0(sp)
    800029a0:	01010113          	addi	sp,sp,16
    800029a4:	00008067          	ret

00000000800029a8 <_Znam>:
void* operator new[](size_t size){
    800029a8:	ff010113          	addi	sp,sp,-16
    800029ac:	00113423          	sd	ra,8(sp)
    800029b0:	00813023          	sd	s0,0(sp)
    800029b4:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    800029b8:	fffff097          	auipc	ra,0xfffff
    800029bc:	a7c080e7          	jalr	-1412(ra) # 80001434 <_Z9mem_allocm>
}
    800029c0:	00813083          	ld	ra,8(sp)
    800029c4:	00013403          	ld	s0,0(sp)
    800029c8:	01010113          	addi	sp,sp,16
    800029cc:	00008067          	ret

00000000800029d0 <_ZdlPv>:
void operator delete(void * p){
    800029d0:	ff010113          	addi	sp,sp,-16
    800029d4:	00113423          	sd	ra,8(sp)
    800029d8:	00813023          	sd	s0,0(sp)
    800029dc:	01010413          	addi	s0,sp,16
    mem_free(p);
    800029e0:	fffff097          	auipc	ra,0xfffff
    800029e4:	a9c080e7          	jalr	-1380(ra) # 8000147c <_Z8mem_freePv>
}
    800029e8:	00813083          	ld	ra,8(sp)
    800029ec:	00013403          	ld	s0,0(sp)
    800029f0:	01010113          	addi	sp,sp,16
    800029f4:	00008067          	ret

00000000800029f8 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800029f8:	fe010113          	addi	sp,sp,-32
    800029fc:	00113c23          	sd	ra,24(sp)
    80002a00:	00813823          	sd	s0,16(sp)
    80002a04:	00913423          	sd	s1,8(sp)
    80002a08:	02010413          	addi	s0,sp,32
    80002a0c:	00050493          	mv	s1,a0
}
    80002a10:	00000097          	auipc	ra,0x0
    80002a14:	f3c080e7          	jalr	-196(ra) # 8000294c <_ZN6ThreadD1Ev>
    80002a18:	00048513          	mv	a0,s1
    80002a1c:	00000097          	auipc	ra,0x0
    80002a20:	fb4080e7          	jalr	-76(ra) # 800029d0 <_ZdlPv>
    80002a24:	01813083          	ld	ra,24(sp)
    80002a28:	01013403          	ld	s0,16(sp)
    80002a2c:	00813483          	ld	s1,8(sp)
    80002a30:	02010113          	addi	sp,sp,32
    80002a34:	00008067          	ret

0000000080002a38 <_ZdaPv>:
void operator delete[](void * p){
    80002a38:	ff010113          	addi	sp,sp,-16
    80002a3c:	00113423          	sd	ra,8(sp)
    80002a40:	00813023          	sd	s0,0(sp)
    80002a44:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002a48:	fffff097          	auipc	ra,0xfffff
    80002a4c:	a34080e7          	jalr	-1484(ra) # 8000147c <_Z8mem_freePv>
}
    80002a50:	00813083          	ld	ra,8(sp)
    80002a54:	00013403          	ld	s0,0(sp)
    80002a58:	01010113          	addi	sp,sp,16
    80002a5c:	00008067          	ret

0000000080002a60 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002a60:	ff010113          	addi	sp,sp,-16
    80002a64:	00113423          	sd	ra,8(sp)
    80002a68:	00813023          	sd	s0,0(sp)
    80002a6c:	01010413          	addi	s0,sp,16
    80002a70:	00004797          	auipc	a5,0x4
    80002a74:	63078793          	addi	a5,a5,1584 # 800070a0 <_ZTV6Thread+0x10>
    80002a78:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80002a7c:	00850513          	addi	a0,a0,8
    80002a80:	fffff097          	auipc	ra,0xfffff
    80002a84:	a68080e7          	jalr	-1432(ra) # 800014e8 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80002a88:	00813083          	ld	ra,8(sp)
    80002a8c:	00013403          	ld	s0,0(sp)
    80002a90:	01010113          	addi	sp,sp,16
    80002a94:	00008067          	ret

0000000080002a98 <_ZN6Thread5startEv>:

int Thread::start() {
    80002a98:	ff010113          	addi	sp,sp,-16
    80002a9c:	00113423          	sd	ra,8(sp)
    80002aa0:	00813023          	sd	s0,0(sp)
    80002aa4:	01010413          	addi	s0,sp,16
    thread_start(myHandle);
    80002aa8:	00853503          	ld	a0,8(a0)
    80002aac:	fffff097          	auipc	ra,0xfffff
    80002ab0:	b80080e7          	jalr	-1152(ra) # 8000162c <_Z12thread_startP7_thread>
    return 0;
}
    80002ab4:	00000513          	li	a0,0
    80002ab8:	00813083          	ld	ra,8(sp)
    80002abc:	00013403          	ld	s0,0(sp)
    80002ac0:	01010113          	addi	sp,sp,16
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN6Thread8dispatchEv>:

void Thread::dispatch() {
    80002ac8:	ff010113          	addi	sp,sp,-16
    80002acc:	00113423          	sd	ra,8(sp)
    80002ad0:	00813023          	sd	s0,0(sp)
    80002ad4:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002ad8:	fffff097          	auipc	ra,0xfffff
    80002adc:	ab4080e7          	jalr	-1356(ra) # 8000158c <_Z15thread_dispatchv>
}
    80002ae0:	00813083          	ld	ra,8(sp)
    80002ae4:	00013403          	ld	s0,0(sp)
    80002ae8:	01010113          	addi	sp,sp,16
    80002aec:	00008067          	ret

0000000080002af0 <_ZN6Thread5sleepEm>:

int Thread::sleep(time_t) {
    80002af0:	ff010113          	addi	sp,sp,-16
    80002af4:	00813423          	sd	s0,8(sp)
    80002af8:	01010413          	addi	s0,sp,16
    return 0;
}
    80002afc:	00000513          	li	a0,0
    80002b00:	00813403          	ld	s0,8(sp)
    80002b04:	01010113          	addi	sp,sp,16
    80002b08:	00008067          	ret

0000000080002b0c <_ZN6ThreadC1Ev>:

Thread::Thread() {
    80002b0c:	ff010113          	addi	sp,sp,-16
    80002b10:	00113423          	sd	ra,8(sp)
    80002b14:	00813023          	sd	s0,0(sp)
    80002b18:	01010413          	addi	s0,sp,16
    80002b1c:	00004797          	auipc	a5,0x4
    80002b20:	58478793          	addi	a5,a5,1412 # 800070a0 <_ZTV6Thread+0x10>
    80002b24:	00f53023          	sd	a5,0(a0)

    thread_create_only(&myHandle,wrapperRun,this);
    80002b28:	00050613          	mv	a2,a0
    80002b2c:	00000597          	auipc	a1,0x0
    80002b30:	dec58593          	addi	a1,a1,-532 # 80002918 <_Z10wrapperRunPv>
    80002b34:	00850513          	addi	a0,a0,8
    80002b38:	fffff097          	auipc	ra,0xfffff
    80002b3c:	a80080e7          	jalr	-1408(ra) # 800015b8 <_Z18thread_create_onlyPP7_threadPFvPvES2_>
}
    80002b40:	00813083          	ld	ra,8(sp)
    80002b44:	00013403          	ld	s0,0(sp)
    80002b48:	01010113          	addi	sp,sp,16
    80002b4c:	00008067          	ret

0000000080002b50 <_ZN6Thread3runEv>:

   // void* operator new(size_t);
    friend void wrapperRun(void* p);
protected:
    Thread();
    virtual void run(){};
    80002b50:	ff010113          	addi	sp,sp,-16
    80002b54:	00813423          	sd	s0,8(sp)
    80002b58:	01010413          	addi	s0,sp,16
    80002b5c:	00813403          	ld	s0,8(sp)
    80002b60:	01010113          	addi	sp,sp,16
    80002b64:	00008067          	ret

0000000080002b68 <_ZN5Riscv10popSppSpieEv>:
#include "../h/riscv.h"
//#include "../h/tcb.hpp"
#include "../lib/console.h"

void Riscv::popSppSpie()
{
    80002b68:	ff010113          	addi	sp,sp,-16
    80002b6c:	00813423          	sd	s0,8(sp)
    80002b70:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002b74:	14109073          	csrw	sepc,ra
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002b78:	10000793          	li	a5,256
    80002b7c:	1007a073          	csrs	sstatus,a5
    ms_sstatus(SSTATUS_SPP);
    __asm__ volatile ("sret");
    80002b80:	10200073          	sret
}
    80002b84:	00813403          	ld	s0,8(sp)
    80002b88:	01010113          	addi	sp,sp,16
    80002b8c:	00008067          	ret

0000000080002b90 <_Z41__static_initialization_and_destruction_0ii>:
            if (cur) cur->next = newSeg;
            else fmem_head = newSeg;
            return 0;
        }
    }
}
    80002b90:	ff010113          	addi	sp,sp,-16
    80002b94:	00813423          	sd	s0,8(sp)
    80002b98:	01010413          	addi	s0,sp,16
    80002b9c:	00100793          	li	a5,1
    80002ba0:	00f50863          	beq	a0,a5,80002bb0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002ba4:	00813403          	ld	s0,8(sp)
    80002ba8:	01010113          	addi	sp,sp,16
    80002bac:	00008067          	ret
    80002bb0:	000107b7          	lui	a5,0x10
    80002bb4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002bb8:	fef596e3          	bne	a1,a5,80002ba4 <_Z41__static_initialization_and_destruction_0ii+0x14>
MemoryAllocator::FreeMem* MemoryAllocator::fmem_head = (MemoryAllocator::FreeMem*)HEAP_START_ADDR; //stavila onako
    80002bbc:	00004797          	auipc	a5,0x4
    80002bc0:	5047b783          	ld	a5,1284(a5) # 800070c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002bc4:	0007b783          	ld	a5,0(a5)
    80002bc8:	00004717          	auipc	a4,0x4
    80002bcc:	5af73823          	sd	a5,1456(a4) # 80007178 <_ZN15MemoryAllocator9fmem_headE>
}
    80002bd0:	fd5ff06f          	j	80002ba4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002bd4 <_ZN15MemoryAllocator9mem_allocEm>:
void *MemoryAllocator::mem_alloc(size_t size) {
    80002bd4:	ff010113          	addi	sp,sp,-16
    80002bd8:	00813423          	sd	s0,8(sp)
    80002bdc:	01010413          	addi	s0,sp,16
    if (size <=0) return nullptr;
    80002be0:	12050663          	beqz	a0,80002d0c <_ZN15MemoryAllocator9mem_allocEm+0x138>
    80002be4:	00050793          	mv	a5,a0
    FreeMem* cur = fmem_head;
    80002be8:	00004517          	auipc	a0,0x4
    80002bec:	59053503          	ld	a0,1424(a0) # 80007178 <_ZN15MemoryAllocator9fmem_headE>
    for(;cur !=0; cur = cur->next){
    80002bf0:	0e050e63          	beqz	a0,80002cec <_ZN15MemoryAllocator9mem_allocEm+0x118>
        if(cur->size < (size)*MEM_BLOCK_SIZE) continue;
    80002bf4:	01053703          	ld	a4,16(a0)
    80002bf8:	00679693          	slli	a3,a5,0x6
    80002bfc:	04d76c63          	bltu	a4,a3,80002c54 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(cur->size - (size)*MEM_BLOCK_SIZE < sizeof(FreeMem)){
    80002c00:	40d70733          	sub	a4,a4,a3
    80002c04:	01700793          	li	a5,23
    80002c08:	06e7e263          	bltu	a5,a4,80002c6c <_ZN15MemoryAllocator9mem_allocEm+0x98>
            if(cur->prev) cur->prev->next = cur->next;
    80002c0c:	00853783          	ld	a5,8(a0)
    80002c10:	04078663          	beqz	a5,80002c5c <_ZN15MemoryAllocator9mem_allocEm+0x88>
    80002c14:	00053703          	ld	a4,0(a0)
    80002c18:	00e7b023          	sd	a4,0(a5)
            if(cur->next) cur->next->prev = cur->prev;
    80002c1c:	00053783          	ld	a5,0(a0)
    80002c20:	00078663          	beqz	a5,80002c2c <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002c24:	00853703          	ld	a4,8(a0)
    80002c28:	00e7b423          	sd	a4,8(a5)
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    80002c2c:	00004617          	auipc	a2,0x4
    80002c30:	55463603          	ld	a2,1364(a2) # 80007180 <_ZN15MemoryAllocator9full_headE>
    80002c34:	08060063          	beqz	a2,80002cb4 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
    80002c38:	08c56263          	bltu	a0,a2,80002cbc <_ZN15MemoryAllocator9mem_allocEm+0xe8>
            for (tmp = full_head; tmp->next != nullptr && (char *) cur > (char *) (tmp->next); tmp = tmp->next);
    80002c3c:	00060793          	mv	a5,a2
    80002c40:	00078713          	mv	a4,a5
    80002c44:	0007b783          	ld	a5,0(a5)
    80002c48:	06078c63          	beqz	a5,80002cc0 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    80002c4c:	fea7eae3          	bltu	a5,a0,80002c40 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    80002c50:	0700006f          	j	80002cc0 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    for(;cur !=0; cur = cur->next){
    80002c54:	00053503          	ld	a0,0(a0)
    80002c58:	f99ff06f          	j	80002bf0 <_ZN15MemoryAllocator9mem_allocEm+0x1c>
            else fmem_head = cur->next;
    80002c5c:	00053783          	ld	a5,0(a0)
    80002c60:	00004717          	auipc	a4,0x4
    80002c64:	50f73c23          	sd	a5,1304(a4) # 80007178 <_ZN15MemoryAllocator9fmem_headE>
    80002c68:	fb5ff06f          	j	80002c1c <_ZN15MemoryAllocator9mem_allocEm+0x48>
            FreeMem* newfrgm = (FreeMem*)((char*)cur + (size)*MEM_BLOCK_SIZE);
    80002c6c:	00d507b3          	add	a5,a0,a3
            newfrgm->prev = cur->prev;
    80002c70:	00853703          	ld	a4,8(a0)
    80002c74:	00e7b423          	sd	a4,8(a5)
            newfrgm->next = cur->next;
    80002c78:	00053703          	ld	a4,0(a0)
    80002c7c:	00e7b023          	sd	a4,0(a5)
            newfrgm->size = cur->size - (size)*MEM_BLOCK_SIZE;
    80002c80:	01053703          	ld	a4,16(a0)
    80002c84:	40d70733          	sub	a4,a4,a3
    80002c88:	00e7b823          	sd	a4,16(a5)
            if(cur->prev) cur->prev->next = newfrgm;
    80002c8c:	00853703          	ld	a4,8(a0)
    80002c90:	00070c63          	beqz	a4,80002ca8 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    80002c94:	00f73023          	sd	a5,0(a4)
            if(cur->next) cur->next->prev = newfrgm;
    80002c98:	00053703          	ld	a4,0(a0)
    80002c9c:	f80708e3          	beqz	a4,80002c2c <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002ca0:	00f73423          	sd	a5,8(a4)
    80002ca4:	f89ff06f          	j	80002c2c <_ZN15MemoryAllocator9mem_allocEm+0x58>
            else fmem_head = newfrgm;
    80002ca8:	00004717          	auipc	a4,0x4
    80002cac:	4cf73823          	sd	a5,1232(a4) # 80007178 <_ZN15MemoryAllocator9fmem_headE>
    80002cb0:	fe9ff06f          	j	80002c98 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    80002cb4:	00060713          	mv	a4,a2
    80002cb8:	0080006f          	j	80002cc0 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    80002cbc:	00000713          	li	a4,0
        newSeg->size = (size)*MEM_BLOCK_SIZE ;
    80002cc0:	00d53823          	sd	a3,16(a0)
        newSeg->prev = tmp;
    80002cc4:	00e53423          	sd	a4,8(a0)
        if (tmp) newSeg->next = tmp->next;
    80002cc8:	02070863          	beqz	a4,80002cf8 <_ZN15MemoryAllocator9mem_allocEm+0x124>
    80002ccc:	00073783          	ld	a5,0(a4)
    80002cd0:	00f53023          	sd	a5,0(a0)
        if(newSeg->next) newSeg->next->prev = newSeg;
    80002cd4:	00053783          	ld	a5,0(a0)
    80002cd8:	00078463          	beqz	a5,80002ce0 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
    80002cdc:	00a7b423          	sd	a0,8(a5)
        if (tmp) tmp->next = newSeg;
    80002ce0:	02070063          	beqz	a4,80002d00 <_ZN15MemoryAllocator9mem_allocEm+0x12c>
    80002ce4:	00a73023          	sd	a0,0(a4)
        return (void*)((char*)cur+headSize);
    80002ce8:	01850513          	addi	a0,a0,24
}
    80002cec:	00813403          	ld	s0,8(sp)
    80002cf0:	01010113          	addi	sp,sp,16
    80002cf4:	00008067          	ret
        else newSeg->next = full_head;
    80002cf8:	00c53023          	sd	a2,0(a0)
    80002cfc:	fd9ff06f          	j	80002cd4 <_ZN15MemoryAllocator9mem_allocEm+0x100>
        else full_head = newSeg;
    80002d00:	00004797          	auipc	a5,0x4
    80002d04:	48a7b023          	sd	a0,1152(a5) # 80007180 <_ZN15MemoryAllocator9full_headE>
    80002d08:	fe1ff06f          	j	80002ce8 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    if (size <=0) return nullptr;
    80002d0c:	00000513          	li	a0,0
    80002d10:	fddff06f          	j	80002cec <_ZN15MemoryAllocator9mem_allocEm+0x118>

0000000080002d14 <_ZN15MemoryAllocator11getInstanceEv>:
    if (memoryAllocator == nullptr) {
    80002d14:	00004797          	auipc	a5,0x4
    80002d18:	4747b783          	ld	a5,1140(a5) # 80007188 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002d1c:	00078863          	beqz	a5,80002d2c <_ZN15MemoryAllocator11getInstanceEv+0x18>
}
    80002d20:	00004517          	auipc	a0,0x4
    80002d24:	46853503          	ld	a0,1128(a0) # 80007188 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002d28:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80002d2c:	fe010113          	addi	sp,sp,-32
    80002d30:	00113c23          	sd	ra,24(sp)
    80002d34:	00813823          	sd	s0,16(sp)
    80002d38:	00913423          	sd	s1,8(sp)
    80002d3c:	02010413          	addi	s0,sp,32
        fmem_head = (FreeMem*)HEAP_START_ADDR;
    80002d40:	00004697          	auipc	a3,0x4
    80002d44:	3806b683          	ld	a3,896(a3) # 800070c0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002d48:	0006b783          	ld	a5,0(a3)
    80002d4c:	00004497          	auipc	s1,0x4
    80002d50:	42c48493          	addi	s1,s1,1068 # 80007178 <_ZN15MemoryAllocator9fmem_headE>
    80002d54:	00f4b023          	sd	a5,0(s1)
        fmem_head->next = nullptr;
    80002d58:	0007b023          	sd	zero,0(a5)
        fmem_head->prev = nullptr;
    80002d5c:	0004b703          	ld	a4,0(s1)
    80002d60:	00073423          	sd	zero,8(a4)
        fmem_head->size = (size_t)HEAP_END_ADDR -(size_t )HEAP_START_ADDR;
    80002d64:	00004797          	auipc	a5,0x4
    80002d68:	38c7b783          	ld	a5,908(a5) # 800070f0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002d6c:	0007b783          	ld	a5,0(a5)
    80002d70:	0006b683          	ld	a3,0(a3)
    80002d74:	40d787b3          	sub	a5,a5,a3
    80002d78:	00f73823          	sd	a5,16(a4)
        memoryAllocator = (MemoryAllocator*)MemoryAllocator::mem_alloc((sizeof(MemoryAllocator)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80002d7c:	00100513          	li	a0,1
    80002d80:	00000097          	auipc	ra,0x0
    80002d84:	e54080e7          	jalr	-428(ra) # 80002bd4 <_ZN15MemoryAllocator9mem_allocEm>
    80002d88:	00a4b823          	sd	a0,16(s1)
}
    80002d8c:	00004517          	auipc	a0,0x4
    80002d90:	3fc53503          	ld	a0,1020(a0) # 80007188 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002d94:	01813083          	ld	ra,24(sp)
    80002d98:	01013403          	ld	s0,16(sp)
    80002d9c:	00813483          	ld	s1,8(sp)
    80002da0:	02010113          	addi	sp,sp,32
    80002da4:	00008067          	ret

0000000080002da8 <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void *addr) {
    80002da8:	ff010113          	addi	sp,sp,-16
    80002dac:	00813423          	sd	s0,8(sp)
    80002db0:	01010413          	addi	s0,sp,16
    if (addr == nullptr) return -2;
    80002db4:	1a050063          	beqz	a0,80002f54 <_ZN15MemoryAllocator8mem_freeEPv+0x1ac>
    addr = (void*)((char*)addr-headSize);
    80002db8:	fe850713          	addi	a4,a0,-24
    FullMem* tmp = full_head;
    80002dbc:	00004797          	auipc	a5,0x4
    80002dc0:	3c47b783          	ld	a5,964(a5) # 80007180 <_ZN15MemoryAllocator9full_headE>
    bool flag = false;
    80002dc4:	0080006f          	j	80002dcc <_ZN15MemoryAllocator8mem_freeEPv+0x24>
    for(; tmp && dSeg>=tmp; tmp = tmp->next){
    80002dc8:	0007b783          	ld	a5,0(a5)
    80002dcc:	00078a63          	beqz	a5,80002de0 <_ZN15MemoryAllocator8mem_freeEPv+0x38>
    80002dd0:	08f76663          	bltu	a4,a5,80002e5c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        if(tmp == dSeg) {
    80002dd4:	fee79ae3          	bne	a5,a4,80002dc8 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
            flag = true;
    80002dd8:	00100693          	li	a3,1
    80002ddc:	0080006f          	j	80002de4 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    bool flag = false;
    80002de0:	00000693          	li	a3,0
    if (!flag) return -1;
    80002de4:	16068c63          	beqz	a3,80002f5c <_ZN15MemoryAllocator8mem_freeEPv+0x1b4>
    if (tmp->prev) tmp->prev->next = tmp->next;
    80002de8:	0087b683          	ld	a3,8(a5)
    80002dec:	06068c63          	beqz	a3,80002e64 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80002df0:	0007b603          	ld	a2,0(a5)
    80002df4:	00c6b023          	sd	a2,0(a3)
    if (tmp->next) tmp->next->prev = tmp->prev;
    80002df8:	0007b683          	ld	a3,0(a5)
    80002dfc:	00068663          	beqz	a3,80002e08 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
    80002e00:	0087b603          	ld	a2,8(a5)
    80002e04:	00c6b423          	sd	a2,8(a3)
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002e08:	00004597          	auipc	a1,0x4
    80002e0c:	3705b583          	ld	a1,880(a1) # 80007178 <_ZN15MemoryAllocator9fmem_headE>
    80002e10:	08058263          	beqz	a1,80002e94 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    80002e14:	08b76463          	bltu	a4,a1,80002e9c <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
        for (cur = fmem_head; cur->next != nullptr && (char*)addr>(char*)(cur->next); cur = cur->next);
    80002e18:	00058693          	mv	a3,a1
    80002e1c:	00068613          	mv	a2,a3
    80002e20:	0006b683          	ld	a3,0(a3)
    80002e24:	00068463          	beqz	a3,80002e2c <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    80002e28:	fee6eae3          	bltu	a3,a4,80002e1c <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if(cur && (char*)cur+cur->size == addr){
    80002e2c:	06060a63          	beqz	a2,80002ea0 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002e30:	01063803          	ld	a6,16(a2)
    80002e34:	010608b3          	add	a7,a2,a6
    80002e38:	06e89463          	bne	a7,a4,80002ea0 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
        cur->size += tmp->size;
    80002e3c:	0107b783          	ld	a5,16(a5)
    80002e40:	00f80833          	add	a6,a6,a5
    80002e44:	01063823          	sd	a6,16(a2)
        if (cur->next && (char*)((char*)cur+ cur->size) == (char*)(cur->next)){
    80002e48:	00068663          	beqz	a3,80002e54 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002e4c:	010607b3          	add	a5,a2,a6
    80002e50:	02f68263          	beq	a3,a5,80002e74 <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
        return 0;
    80002e54:	00000513          	li	a0,0
    80002e58:	0900006f          	j	80002ee8 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    bool flag = false;
    80002e5c:	00000693          	li	a3,0
    80002e60:	f85ff06f          	j	80002de4 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    else full_head = tmp->next;
    80002e64:	0007b683          	ld	a3,0(a5)
    80002e68:	00004617          	auipc	a2,0x4
    80002e6c:	30d63c23          	sd	a3,792(a2) # 80007180 <_ZN15MemoryAllocator9full_headE>
    80002e70:	f89ff06f          	j	80002df8 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
            cur->size += cur->next->size;
    80002e74:	0106b783          	ld	a5,16(a3)
    80002e78:	00f80833          	add	a6,a6,a5
    80002e7c:	01063823          	sd	a6,16(a2)
            cur->next = cur->next->next;
    80002e80:	0006b783          	ld	a5,0(a3)
    80002e84:	00f63023          	sd	a5,0(a2)
            if (cur->next) cur->next->prev = cur;
    80002e88:	fc0786e3          	beqz	a5,80002e54 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002e8c:	00c7b423          	sd	a2,8(a5)
    80002e90:	fc5ff06f          	j	80002e54 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002e94:	00058613          	mv	a2,a1
    80002e98:	0080006f          	j	80002ea0 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002e9c:	00000613          	li	a2,0
        FreeMem* nxtSeg = cur?cur->next:fmem_head;
    80002ea0:	00060463          	beqz	a2,80002ea8 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    80002ea4:	00063583          	ld	a1,0(a2)
        if(nxtSeg && (char*)((char*)tmp + tmp->size) == (char*) nxtSeg){
    80002ea8:	00058863          	beqz	a1,80002eb8 <_ZN15MemoryAllocator8mem_freeEPv+0x110>
    80002eac:	0107b683          	ld	a3,16(a5)
    80002eb0:	00d78833          	add	a6,a5,a3
    80002eb4:	04b80063          	beq	a6,a1,80002ef4 <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
            newSeg->size = tmp->size;
    80002eb8:	0107b783          	ld	a5,16(a5)
    80002ebc:	fef53c23          	sd	a5,-8(a0)
            newSeg->prev = cur;
    80002ec0:	fec53823          	sd	a2,-16(a0)
            if(cur) newSeg->next = cur->next;
    80002ec4:	06060a63          	beqz	a2,80002f38 <_ZN15MemoryAllocator8mem_freeEPv+0x190>
    80002ec8:	00063783          	ld	a5,0(a2)
    80002ecc:	fef53423          	sd	a5,-24(a0)
            if(newSeg->next) newSeg->next->prev = newSeg;
    80002ed0:	fe853783          	ld	a5,-24(a0)
    80002ed4:	00078463          	beqz	a5,80002edc <_ZN15MemoryAllocator8mem_freeEPv+0x134>
    80002ed8:	00e7b423          	sd	a4,8(a5)
            if (cur) cur->next = newSeg;
    80002edc:	06060663          	beqz	a2,80002f48 <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
    80002ee0:	00e63023          	sd	a4,0(a2)
            return 0;
    80002ee4:	00000513          	li	a0,0
}
    80002ee8:	00813403          	ld	s0,8(sp)
    80002eec:	01010113          	addi	sp,sp,16
    80002ef0:	00008067          	ret
            newSeg->size = nxtSeg->size + tmp->size;
    80002ef4:	0105b783          	ld	a5,16(a1)
    80002ef8:	00f686b3          	add	a3,a3,a5
    80002efc:	fed53c23          	sd	a3,-8(a0)
            newSeg->prev = nxtSeg->prev;
    80002f00:	0085b783          	ld	a5,8(a1)
    80002f04:	fef53823          	sd	a5,-16(a0)
            newSeg->next = nxtSeg->next;
    80002f08:	0005b783          	ld	a5,0(a1)
    80002f0c:	fef53423          	sd	a5,-24(a0)
            if(nxtSeg->next) nxtSeg->next->prev = newSeg;
    80002f10:	00078463          	beqz	a5,80002f18 <_ZN15MemoryAllocator8mem_freeEPv+0x170>
    80002f14:	00e7b423          	sd	a4,8(a5)
            if(nxtSeg->prev) nxtSeg->prev->next = newSeg;
    80002f18:	0085b783          	ld	a5,8(a1)
    80002f1c:	00078863          	beqz	a5,80002f2c <_ZN15MemoryAllocator8mem_freeEPv+0x184>
    80002f20:	00e7b023          	sd	a4,0(a5)
            return 0;
    80002f24:	00000513          	li	a0,0
    80002f28:	fc1ff06f          	j	80002ee8 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
            else fmem_head = newSeg;
    80002f2c:	00004797          	auipc	a5,0x4
    80002f30:	24e7b623          	sd	a4,588(a5) # 80007178 <_ZN15MemoryAllocator9fmem_headE>
    80002f34:	ff1ff06f          	j	80002f24 <_ZN15MemoryAllocator8mem_freeEPv+0x17c>
            else newSeg->next =fmem_head;
    80002f38:	00004797          	auipc	a5,0x4
    80002f3c:	2407b783          	ld	a5,576(a5) # 80007178 <_ZN15MemoryAllocator9fmem_headE>
    80002f40:	fef53423          	sd	a5,-24(a0)
    80002f44:	f8dff06f          	j	80002ed0 <_ZN15MemoryAllocator8mem_freeEPv+0x128>
            else fmem_head = newSeg;
    80002f48:	00004797          	auipc	a5,0x4
    80002f4c:	22e7b823          	sd	a4,560(a5) # 80007178 <_ZN15MemoryAllocator9fmem_headE>
    80002f50:	f95ff06f          	j	80002ee4 <_ZN15MemoryAllocator8mem_freeEPv+0x13c>
    if (addr == nullptr) return -2;
    80002f54:	ffe00513          	li	a0,-2
    80002f58:	f91ff06f          	j	80002ee8 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    if (!flag) return -1;
    80002f5c:	fff00513          	li	a0,-1
    80002f60:	f89ff06f          	j	80002ee8 <_ZN15MemoryAllocator8mem_freeEPv+0x140>

0000000080002f64 <_GLOBAL__sub_I__ZN15MemoryAllocator9fmem_headE>:
}
    80002f64:	ff010113          	addi	sp,sp,-16
    80002f68:	00113423          	sd	ra,8(sp)
    80002f6c:	00813023          	sd	s0,0(sp)
    80002f70:	01010413          	addi	s0,sp,16
    80002f74:	000105b7          	lui	a1,0x10
    80002f78:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002f7c:	00100513          	li	a0,1
    80002f80:	00000097          	auipc	ra,0x0
    80002f84:	c10080e7          	jalr	-1008(ra) # 80002b90 <_Z41__static_initialization_and_destruction_0ii>
    80002f88:	00813083          	ld	ra,8(sp)
    80002f8c:	00013403          	ld	s0,0(sp)
    80002f90:	01010113          	addi	sp,sp,16
    80002f94:	00008067          	ret

0000000080002f98 <start>:
    80002f98:	ff010113          	addi	sp,sp,-16
    80002f9c:	00813423          	sd	s0,8(sp)
    80002fa0:	01010413          	addi	s0,sp,16
    80002fa4:	300027f3          	csrr	a5,mstatus
    80002fa8:	ffffe737          	lui	a4,0xffffe
    80002fac:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff640f>
    80002fb0:	00e7f7b3          	and	a5,a5,a4
    80002fb4:	00001737          	lui	a4,0x1
    80002fb8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002fbc:	00e7e7b3          	or	a5,a5,a4
    80002fc0:	30079073          	csrw	mstatus,a5
    80002fc4:	00000797          	auipc	a5,0x0
    80002fc8:	16078793          	addi	a5,a5,352 # 80003124 <system_main>
    80002fcc:	34179073          	csrw	mepc,a5
    80002fd0:	00000793          	li	a5,0
    80002fd4:	18079073          	csrw	satp,a5
    80002fd8:	000107b7          	lui	a5,0x10
    80002fdc:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002fe0:	30279073          	csrw	medeleg,a5
    80002fe4:	30379073          	csrw	mideleg,a5
    80002fe8:	104027f3          	csrr	a5,sie
    80002fec:	2227e793          	ori	a5,a5,546
    80002ff0:	10479073          	csrw	sie,a5
    80002ff4:	fff00793          	li	a5,-1
    80002ff8:	00a7d793          	srli	a5,a5,0xa
    80002ffc:	3b079073          	csrw	pmpaddr0,a5
    80003000:	00f00793          	li	a5,15
    80003004:	3a079073          	csrw	pmpcfg0,a5
    80003008:	f14027f3          	csrr	a5,mhartid
    8000300c:	0200c737          	lui	a4,0x200c
    80003010:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003014:	0007869b          	sext.w	a3,a5
    80003018:	00269713          	slli	a4,a3,0x2
    8000301c:	000f4637          	lui	a2,0xf4
    80003020:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003024:	00d70733          	add	a4,a4,a3
    80003028:	0037979b          	slliw	a5,a5,0x3
    8000302c:	020046b7          	lui	a3,0x2004
    80003030:	00d787b3          	add	a5,a5,a3
    80003034:	00c585b3          	add	a1,a1,a2
    80003038:	00371693          	slli	a3,a4,0x3
    8000303c:	00004717          	auipc	a4,0x4
    80003040:	15470713          	addi	a4,a4,340 # 80007190 <timer_scratch>
    80003044:	00b7b023          	sd	a1,0(a5)
    80003048:	00d70733          	add	a4,a4,a3
    8000304c:	00f73c23          	sd	a5,24(a4)
    80003050:	02c73023          	sd	a2,32(a4)
    80003054:	34071073          	csrw	mscratch,a4
    80003058:	00000797          	auipc	a5,0x0
    8000305c:	6e878793          	addi	a5,a5,1768 # 80003740 <timervec>
    80003060:	30579073          	csrw	mtvec,a5
    80003064:	300027f3          	csrr	a5,mstatus
    80003068:	0087e793          	ori	a5,a5,8
    8000306c:	30079073          	csrw	mstatus,a5
    80003070:	304027f3          	csrr	a5,mie
    80003074:	0807e793          	ori	a5,a5,128
    80003078:	30479073          	csrw	mie,a5
    8000307c:	f14027f3          	csrr	a5,mhartid
    80003080:	0007879b          	sext.w	a5,a5
    80003084:	00078213          	mv	tp,a5
    80003088:	30200073          	mret
    8000308c:	00813403          	ld	s0,8(sp)
    80003090:	01010113          	addi	sp,sp,16
    80003094:	00008067          	ret

0000000080003098 <timerinit>:
    80003098:	ff010113          	addi	sp,sp,-16
    8000309c:	00813423          	sd	s0,8(sp)
    800030a0:	01010413          	addi	s0,sp,16
    800030a4:	f14027f3          	csrr	a5,mhartid
    800030a8:	0200c737          	lui	a4,0x200c
    800030ac:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800030b0:	0007869b          	sext.w	a3,a5
    800030b4:	00269713          	slli	a4,a3,0x2
    800030b8:	000f4637          	lui	a2,0xf4
    800030bc:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800030c0:	00d70733          	add	a4,a4,a3
    800030c4:	0037979b          	slliw	a5,a5,0x3
    800030c8:	020046b7          	lui	a3,0x2004
    800030cc:	00d787b3          	add	a5,a5,a3
    800030d0:	00c585b3          	add	a1,a1,a2
    800030d4:	00371693          	slli	a3,a4,0x3
    800030d8:	00004717          	auipc	a4,0x4
    800030dc:	0b870713          	addi	a4,a4,184 # 80007190 <timer_scratch>
    800030e0:	00b7b023          	sd	a1,0(a5)
    800030e4:	00d70733          	add	a4,a4,a3
    800030e8:	00f73c23          	sd	a5,24(a4)
    800030ec:	02c73023          	sd	a2,32(a4)
    800030f0:	34071073          	csrw	mscratch,a4
    800030f4:	00000797          	auipc	a5,0x0
    800030f8:	64c78793          	addi	a5,a5,1612 # 80003740 <timervec>
    800030fc:	30579073          	csrw	mtvec,a5
    80003100:	300027f3          	csrr	a5,mstatus
    80003104:	0087e793          	ori	a5,a5,8
    80003108:	30079073          	csrw	mstatus,a5
    8000310c:	304027f3          	csrr	a5,mie
    80003110:	0807e793          	ori	a5,a5,128
    80003114:	30479073          	csrw	mie,a5
    80003118:	00813403          	ld	s0,8(sp)
    8000311c:	01010113          	addi	sp,sp,16
    80003120:	00008067          	ret

0000000080003124 <system_main>:
    80003124:	fe010113          	addi	sp,sp,-32
    80003128:	00813823          	sd	s0,16(sp)
    8000312c:	00913423          	sd	s1,8(sp)
    80003130:	00113c23          	sd	ra,24(sp)
    80003134:	02010413          	addi	s0,sp,32
    80003138:	00000097          	auipc	ra,0x0
    8000313c:	0c4080e7          	jalr	196(ra) # 800031fc <cpuid>
    80003140:	00004497          	auipc	s1,0x4
    80003144:	fd048493          	addi	s1,s1,-48 # 80007110 <started>
    80003148:	02050263          	beqz	a0,8000316c <system_main+0x48>
    8000314c:	0004a783          	lw	a5,0(s1)
    80003150:	0007879b          	sext.w	a5,a5
    80003154:	fe078ce3          	beqz	a5,8000314c <system_main+0x28>
    80003158:	0ff0000f          	fence
    8000315c:	00003517          	auipc	a0,0x3
    80003160:	05450513          	addi	a0,a0,84 # 800061b0 <CONSOLE_STATUS+0x1a0>
    80003164:	00001097          	auipc	ra,0x1
    80003168:	a78080e7          	jalr	-1416(ra) # 80003bdc <panic>
    8000316c:	00001097          	auipc	ra,0x1
    80003170:	9cc080e7          	jalr	-1588(ra) # 80003b38 <consoleinit>
    80003174:	00001097          	auipc	ra,0x1
    80003178:	158080e7          	jalr	344(ra) # 800042cc <printfinit>
    8000317c:	00003517          	auipc	a0,0x3
    80003180:	11450513          	addi	a0,a0,276 # 80006290 <CONSOLE_STATUS+0x280>
    80003184:	00001097          	auipc	ra,0x1
    80003188:	ab4080e7          	jalr	-1356(ra) # 80003c38 <__printf>
    8000318c:	00003517          	auipc	a0,0x3
    80003190:	ff450513          	addi	a0,a0,-12 # 80006180 <CONSOLE_STATUS+0x170>
    80003194:	00001097          	auipc	ra,0x1
    80003198:	aa4080e7          	jalr	-1372(ra) # 80003c38 <__printf>
    8000319c:	00003517          	auipc	a0,0x3
    800031a0:	0f450513          	addi	a0,a0,244 # 80006290 <CONSOLE_STATUS+0x280>
    800031a4:	00001097          	auipc	ra,0x1
    800031a8:	a94080e7          	jalr	-1388(ra) # 80003c38 <__printf>
    800031ac:	00001097          	auipc	ra,0x1
    800031b0:	4ac080e7          	jalr	1196(ra) # 80004658 <kinit>
    800031b4:	00000097          	auipc	ra,0x0
    800031b8:	148080e7          	jalr	328(ra) # 800032fc <trapinit>
    800031bc:	00000097          	auipc	ra,0x0
    800031c0:	16c080e7          	jalr	364(ra) # 80003328 <trapinithart>
    800031c4:	00000097          	auipc	ra,0x0
    800031c8:	5bc080e7          	jalr	1468(ra) # 80003780 <plicinit>
    800031cc:	00000097          	auipc	ra,0x0
    800031d0:	5dc080e7          	jalr	1500(ra) # 800037a8 <plicinithart>
    800031d4:	00000097          	auipc	ra,0x0
    800031d8:	078080e7          	jalr	120(ra) # 8000324c <userinit>
    800031dc:	0ff0000f          	fence
    800031e0:	00100793          	li	a5,1
    800031e4:	00003517          	auipc	a0,0x3
    800031e8:	fb450513          	addi	a0,a0,-76 # 80006198 <CONSOLE_STATUS+0x188>
    800031ec:	00f4a023          	sw	a5,0(s1)
    800031f0:	00001097          	auipc	ra,0x1
    800031f4:	a48080e7          	jalr	-1464(ra) # 80003c38 <__printf>
    800031f8:	0000006f          	j	800031f8 <system_main+0xd4>

00000000800031fc <cpuid>:
    800031fc:	ff010113          	addi	sp,sp,-16
    80003200:	00813423          	sd	s0,8(sp)
    80003204:	01010413          	addi	s0,sp,16
    80003208:	00020513          	mv	a0,tp
    8000320c:	00813403          	ld	s0,8(sp)
    80003210:	0005051b          	sext.w	a0,a0
    80003214:	01010113          	addi	sp,sp,16
    80003218:	00008067          	ret

000000008000321c <mycpu>:
    8000321c:	ff010113          	addi	sp,sp,-16
    80003220:	00813423          	sd	s0,8(sp)
    80003224:	01010413          	addi	s0,sp,16
    80003228:	00020793          	mv	a5,tp
    8000322c:	00813403          	ld	s0,8(sp)
    80003230:	0007879b          	sext.w	a5,a5
    80003234:	00779793          	slli	a5,a5,0x7
    80003238:	00005517          	auipc	a0,0x5
    8000323c:	f8850513          	addi	a0,a0,-120 # 800081c0 <cpus>
    80003240:	00f50533          	add	a0,a0,a5
    80003244:	01010113          	addi	sp,sp,16
    80003248:	00008067          	ret

000000008000324c <userinit>:
    8000324c:	ff010113          	addi	sp,sp,-16
    80003250:	00813423          	sd	s0,8(sp)
    80003254:	01010413          	addi	s0,sp,16
    80003258:	00813403          	ld	s0,8(sp)
    8000325c:	01010113          	addi	sp,sp,16
    80003260:	fffff317          	auipc	t1,0xfffff
    80003264:	64830067          	jr	1608(t1) # 800028a8 <main>

0000000080003268 <either_copyout>:
    80003268:	ff010113          	addi	sp,sp,-16
    8000326c:	00813023          	sd	s0,0(sp)
    80003270:	00113423          	sd	ra,8(sp)
    80003274:	01010413          	addi	s0,sp,16
    80003278:	02051663          	bnez	a0,800032a4 <either_copyout+0x3c>
    8000327c:	00058513          	mv	a0,a1
    80003280:	00060593          	mv	a1,a2
    80003284:	0006861b          	sext.w	a2,a3
    80003288:	00002097          	auipc	ra,0x2
    8000328c:	c5c080e7          	jalr	-932(ra) # 80004ee4 <__memmove>
    80003290:	00813083          	ld	ra,8(sp)
    80003294:	00013403          	ld	s0,0(sp)
    80003298:	00000513          	li	a0,0
    8000329c:	01010113          	addi	sp,sp,16
    800032a0:	00008067          	ret
    800032a4:	00003517          	auipc	a0,0x3
    800032a8:	f3450513          	addi	a0,a0,-204 # 800061d8 <CONSOLE_STATUS+0x1c8>
    800032ac:	00001097          	auipc	ra,0x1
    800032b0:	930080e7          	jalr	-1744(ra) # 80003bdc <panic>

00000000800032b4 <either_copyin>:
    800032b4:	ff010113          	addi	sp,sp,-16
    800032b8:	00813023          	sd	s0,0(sp)
    800032bc:	00113423          	sd	ra,8(sp)
    800032c0:	01010413          	addi	s0,sp,16
    800032c4:	02059463          	bnez	a1,800032ec <either_copyin+0x38>
    800032c8:	00060593          	mv	a1,a2
    800032cc:	0006861b          	sext.w	a2,a3
    800032d0:	00002097          	auipc	ra,0x2
    800032d4:	c14080e7          	jalr	-1004(ra) # 80004ee4 <__memmove>
    800032d8:	00813083          	ld	ra,8(sp)
    800032dc:	00013403          	ld	s0,0(sp)
    800032e0:	00000513          	li	a0,0
    800032e4:	01010113          	addi	sp,sp,16
    800032e8:	00008067          	ret
    800032ec:	00003517          	auipc	a0,0x3
    800032f0:	f1450513          	addi	a0,a0,-236 # 80006200 <CONSOLE_STATUS+0x1f0>
    800032f4:	00001097          	auipc	ra,0x1
    800032f8:	8e8080e7          	jalr	-1816(ra) # 80003bdc <panic>

00000000800032fc <trapinit>:
    800032fc:	ff010113          	addi	sp,sp,-16
    80003300:	00813423          	sd	s0,8(sp)
    80003304:	01010413          	addi	s0,sp,16
    80003308:	00813403          	ld	s0,8(sp)
    8000330c:	00003597          	auipc	a1,0x3
    80003310:	f1c58593          	addi	a1,a1,-228 # 80006228 <CONSOLE_STATUS+0x218>
    80003314:	00005517          	auipc	a0,0x5
    80003318:	f2c50513          	addi	a0,a0,-212 # 80008240 <tickslock>
    8000331c:	01010113          	addi	sp,sp,16
    80003320:	00001317          	auipc	t1,0x1
    80003324:	5c830067          	jr	1480(t1) # 800048e8 <initlock>

0000000080003328 <trapinithart>:
    80003328:	ff010113          	addi	sp,sp,-16
    8000332c:	00813423          	sd	s0,8(sp)
    80003330:	01010413          	addi	s0,sp,16
    80003334:	00000797          	auipc	a5,0x0
    80003338:	2fc78793          	addi	a5,a5,764 # 80003630 <kernelvec>
    8000333c:	10579073          	csrw	stvec,a5
    80003340:	00813403          	ld	s0,8(sp)
    80003344:	01010113          	addi	sp,sp,16
    80003348:	00008067          	ret

000000008000334c <usertrap>:
    8000334c:	ff010113          	addi	sp,sp,-16
    80003350:	00813423          	sd	s0,8(sp)
    80003354:	01010413          	addi	s0,sp,16
    80003358:	00813403          	ld	s0,8(sp)
    8000335c:	01010113          	addi	sp,sp,16
    80003360:	00008067          	ret

0000000080003364 <usertrapret>:
    80003364:	ff010113          	addi	sp,sp,-16
    80003368:	00813423          	sd	s0,8(sp)
    8000336c:	01010413          	addi	s0,sp,16
    80003370:	00813403          	ld	s0,8(sp)
    80003374:	01010113          	addi	sp,sp,16
    80003378:	00008067          	ret

000000008000337c <kerneltrap>:
    8000337c:	fe010113          	addi	sp,sp,-32
    80003380:	00813823          	sd	s0,16(sp)
    80003384:	00113c23          	sd	ra,24(sp)
    80003388:	00913423          	sd	s1,8(sp)
    8000338c:	02010413          	addi	s0,sp,32
    80003390:	142025f3          	csrr	a1,scause
    80003394:	100027f3          	csrr	a5,sstatus
    80003398:	0027f793          	andi	a5,a5,2
    8000339c:	10079c63          	bnez	a5,800034b4 <kerneltrap+0x138>
    800033a0:	142027f3          	csrr	a5,scause
    800033a4:	0207ce63          	bltz	a5,800033e0 <kerneltrap+0x64>
    800033a8:	00003517          	auipc	a0,0x3
    800033ac:	ec850513          	addi	a0,a0,-312 # 80006270 <CONSOLE_STATUS+0x260>
    800033b0:	00001097          	auipc	ra,0x1
    800033b4:	888080e7          	jalr	-1912(ra) # 80003c38 <__printf>
    800033b8:	141025f3          	csrr	a1,sepc
    800033bc:	14302673          	csrr	a2,stval
    800033c0:	00003517          	auipc	a0,0x3
    800033c4:	ec050513          	addi	a0,a0,-320 # 80006280 <CONSOLE_STATUS+0x270>
    800033c8:	00001097          	auipc	ra,0x1
    800033cc:	870080e7          	jalr	-1936(ra) # 80003c38 <__printf>
    800033d0:	00003517          	auipc	a0,0x3
    800033d4:	ec850513          	addi	a0,a0,-312 # 80006298 <CONSOLE_STATUS+0x288>
    800033d8:	00001097          	auipc	ra,0x1
    800033dc:	804080e7          	jalr	-2044(ra) # 80003bdc <panic>
    800033e0:	0ff7f713          	andi	a4,a5,255
    800033e4:	00900693          	li	a3,9
    800033e8:	04d70063          	beq	a4,a3,80003428 <kerneltrap+0xac>
    800033ec:	fff00713          	li	a4,-1
    800033f0:	03f71713          	slli	a4,a4,0x3f
    800033f4:	00170713          	addi	a4,a4,1
    800033f8:	fae798e3          	bne	a5,a4,800033a8 <kerneltrap+0x2c>
    800033fc:	00000097          	auipc	ra,0x0
    80003400:	e00080e7          	jalr	-512(ra) # 800031fc <cpuid>
    80003404:	06050663          	beqz	a0,80003470 <kerneltrap+0xf4>
    80003408:	144027f3          	csrr	a5,sip
    8000340c:	ffd7f793          	andi	a5,a5,-3
    80003410:	14479073          	csrw	sip,a5
    80003414:	01813083          	ld	ra,24(sp)
    80003418:	01013403          	ld	s0,16(sp)
    8000341c:	00813483          	ld	s1,8(sp)
    80003420:	02010113          	addi	sp,sp,32
    80003424:	00008067          	ret
    80003428:	00000097          	auipc	ra,0x0
    8000342c:	3cc080e7          	jalr	972(ra) # 800037f4 <plic_claim>
    80003430:	00a00793          	li	a5,10
    80003434:	00050493          	mv	s1,a0
    80003438:	06f50863          	beq	a0,a5,800034a8 <kerneltrap+0x12c>
    8000343c:	fc050ce3          	beqz	a0,80003414 <kerneltrap+0x98>
    80003440:	00050593          	mv	a1,a0
    80003444:	00003517          	auipc	a0,0x3
    80003448:	e0c50513          	addi	a0,a0,-500 # 80006250 <CONSOLE_STATUS+0x240>
    8000344c:	00000097          	auipc	ra,0x0
    80003450:	7ec080e7          	jalr	2028(ra) # 80003c38 <__printf>
    80003454:	01013403          	ld	s0,16(sp)
    80003458:	01813083          	ld	ra,24(sp)
    8000345c:	00048513          	mv	a0,s1
    80003460:	00813483          	ld	s1,8(sp)
    80003464:	02010113          	addi	sp,sp,32
    80003468:	00000317          	auipc	t1,0x0
    8000346c:	3c430067          	jr	964(t1) # 8000382c <plic_complete>
    80003470:	00005517          	auipc	a0,0x5
    80003474:	dd050513          	addi	a0,a0,-560 # 80008240 <tickslock>
    80003478:	00001097          	auipc	ra,0x1
    8000347c:	494080e7          	jalr	1172(ra) # 8000490c <acquire>
    80003480:	00004717          	auipc	a4,0x4
    80003484:	c9470713          	addi	a4,a4,-876 # 80007114 <ticks>
    80003488:	00072783          	lw	a5,0(a4)
    8000348c:	00005517          	auipc	a0,0x5
    80003490:	db450513          	addi	a0,a0,-588 # 80008240 <tickslock>
    80003494:	0017879b          	addiw	a5,a5,1
    80003498:	00f72023          	sw	a5,0(a4)
    8000349c:	00001097          	auipc	ra,0x1
    800034a0:	53c080e7          	jalr	1340(ra) # 800049d8 <release>
    800034a4:	f65ff06f          	j	80003408 <kerneltrap+0x8c>
    800034a8:	00001097          	auipc	ra,0x1
    800034ac:	098080e7          	jalr	152(ra) # 80004540 <uartintr>
    800034b0:	fa5ff06f          	j	80003454 <kerneltrap+0xd8>
    800034b4:	00003517          	auipc	a0,0x3
    800034b8:	d7c50513          	addi	a0,a0,-644 # 80006230 <CONSOLE_STATUS+0x220>
    800034bc:	00000097          	auipc	ra,0x0
    800034c0:	720080e7          	jalr	1824(ra) # 80003bdc <panic>

00000000800034c4 <clockintr>:
    800034c4:	fe010113          	addi	sp,sp,-32
    800034c8:	00813823          	sd	s0,16(sp)
    800034cc:	00913423          	sd	s1,8(sp)
    800034d0:	00113c23          	sd	ra,24(sp)
    800034d4:	02010413          	addi	s0,sp,32
    800034d8:	00005497          	auipc	s1,0x5
    800034dc:	d6848493          	addi	s1,s1,-664 # 80008240 <tickslock>
    800034e0:	00048513          	mv	a0,s1
    800034e4:	00001097          	auipc	ra,0x1
    800034e8:	428080e7          	jalr	1064(ra) # 8000490c <acquire>
    800034ec:	00004717          	auipc	a4,0x4
    800034f0:	c2870713          	addi	a4,a4,-984 # 80007114 <ticks>
    800034f4:	00072783          	lw	a5,0(a4)
    800034f8:	01013403          	ld	s0,16(sp)
    800034fc:	01813083          	ld	ra,24(sp)
    80003500:	00048513          	mv	a0,s1
    80003504:	0017879b          	addiw	a5,a5,1
    80003508:	00813483          	ld	s1,8(sp)
    8000350c:	00f72023          	sw	a5,0(a4)
    80003510:	02010113          	addi	sp,sp,32
    80003514:	00001317          	auipc	t1,0x1
    80003518:	4c430067          	jr	1220(t1) # 800049d8 <release>

000000008000351c <devintr>:
    8000351c:	142027f3          	csrr	a5,scause
    80003520:	00000513          	li	a0,0
    80003524:	0007c463          	bltz	a5,8000352c <devintr+0x10>
    80003528:	00008067          	ret
    8000352c:	fe010113          	addi	sp,sp,-32
    80003530:	00813823          	sd	s0,16(sp)
    80003534:	00113c23          	sd	ra,24(sp)
    80003538:	00913423          	sd	s1,8(sp)
    8000353c:	02010413          	addi	s0,sp,32
    80003540:	0ff7f713          	andi	a4,a5,255
    80003544:	00900693          	li	a3,9
    80003548:	04d70c63          	beq	a4,a3,800035a0 <devintr+0x84>
    8000354c:	fff00713          	li	a4,-1
    80003550:	03f71713          	slli	a4,a4,0x3f
    80003554:	00170713          	addi	a4,a4,1
    80003558:	00e78c63          	beq	a5,a4,80003570 <devintr+0x54>
    8000355c:	01813083          	ld	ra,24(sp)
    80003560:	01013403          	ld	s0,16(sp)
    80003564:	00813483          	ld	s1,8(sp)
    80003568:	02010113          	addi	sp,sp,32
    8000356c:	00008067          	ret
    80003570:	00000097          	auipc	ra,0x0
    80003574:	c8c080e7          	jalr	-884(ra) # 800031fc <cpuid>
    80003578:	06050663          	beqz	a0,800035e4 <devintr+0xc8>
    8000357c:	144027f3          	csrr	a5,sip
    80003580:	ffd7f793          	andi	a5,a5,-3
    80003584:	14479073          	csrw	sip,a5
    80003588:	01813083          	ld	ra,24(sp)
    8000358c:	01013403          	ld	s0,16(sp)
    80003590:	00813483          	ld	s1,8(sp)
    80003594:	00200513          	li	a0,2
    80003598:	02010113          	addi	sp,sp,32
    8000359c:	00008067          	ret
    800035a0:	00000097          	auipc	ra,0x0
    800035a4:	254080e7          	jalr	596(ra) # 800037f4 <plic_claim>
    800035a8:	00a00793          	li	a5,10
    800035ac:	00050493          	mv	s1,a0
    800035b0:	06f50663          	beq	a0,a5,8000361c <devintr+0x100>
    800035b4:	00100513          	li	a0,1
    800035b8:	fa0482e3          	beqz	s1,8000355c <devintr+0x40>
    800035bc:	00048593          	mv	a1,s1
    800035c0:	00003517          	auipc	a0,0x3
    800035c4:	c9050513          	addi	a0,a0,-880 # 80006250 <CONSOLE_STATUS+0x240>
    800035c8:	00000097          	auipc	ra,0x0
    800035cc:	670080e7          	jalr	1648(ra) # 80003c38 <__printf>
    800035d0:	00048513          	mv	a0,s1
    800035d4:	00000097          	auipc	ra,0x0
    800035d8:	258080e7          	jalr	600(ra) # 8000382c <plic_complete>
    800035dc:	00100513          	li	a0,1
    800035e0:	f7dff06f          	j	8000355c <devintr+0x40>
    800035e4:	00005517          	auipc	a0,0x5
    800035e8:	c5c50513          	addi	a0,a0,-932 # 80008240 <tickslock>
    800035ec:	00001097          	auipc	ra,0x1
    800035f0:	320080e7          	jalr	800(ra) # 8000490c <acquire>
    800035f4:	00004717          	auipc	a4,0x4
    800035f8:	b2070713          	addi	a4,a4,-1248 # 80007114 <ticks>
    800035fc:	00072783          	lw	a5,0(a4)
    80003600:	00005517          	auipc	a0,0x5
    80003604:	c4050513          	addi	a0,a0,-960 # 80008240 <tickslock>
    80003608:	0017879b          	addiw	a5,a5,1
    8000360c:	00f72023          	sw	a5,0(a4)
    80003610:	00001097          	auipc	ra,0x1
    80003614:	3c8080e7          	jalr	968(ra) # 800049d8 <release>
    80003618:	f65ff06f          	j	8000357c <devintr+0x60>
    8000361c:	00001097          	auipc	ra,0x1
    80003620:	f24080e7          	jalr	-220(ra) # 80004540 <uartintr>
    80003624:	fadff06f          	j	800035d0 <devintr+0xb4>
	...

0000000080003630 <kernelvec>:
    80003630:	f0010113          	addi	sp,sp,-256
    80003634:	00113023          	sd	ra,0(sp)
    80003638:	00213423          	sd	sp,8(sp)
    8000363c:	00313823          	sd	gp,16(sp)
    80003640:	00413c23          	sd	tp,24(sp)
    80003644:	02513023          	sd	t0,32(sp)
    80003648:	02613423          	sd	t1,40(sp)
    8000364c:	02713823          	sd	t2,48(sp)
    80003650:	02813c23          	sd	s0,56(sp)
    80003654:	04913023          	sd	s1,64(sp)
    80003658:	04a13423          	sd	a0,72(sp)
    8000365c:	04b13823          	sd	a1,80(sp)
    80003660:	04c13c23          	sd	a2,88(sp)
    80003664:	06d13023          	sd	a3,96(sp)
    80003668:	06e13423          	sd	a4,104(sp)
    8000366c:	06f13823          	sd	a5,112(sp)
    80003670:	07013c23          	sd	a6,120(sp)
    80003674:	09113023          	sd	a7,128(sp)
    80003678:	09213423          	sd	s2,136(sp)
    8000367c:	09313823          	sd	s3,144(sp)
    80003680:	09413c23          	sd	s4,152(sp)
    80003684:	0b513023          	sd	s5,160(sp)
    80003688:	0b613423          	sd	s6,168(sp)
    8000368c:	0b713823          	sd	s7,176(sp)
    80003690:	0b813c23          	sd	s8,184(sp)
    80003694:	0d913023          	sd	s9,192(sp)
    80003698:	0da13423          	sd	s10,200(sp)
    8000369c:	0db13823          	sd	s11,208(sp)
    800036a0:	0dc13c23          	sd	t3,216(sp)
    800036a4:	0fd13023          	sd	t4,224(sp)
    800036a8:	0fe13423          	sd	t5,232(sp)
    800036ac:	0ff13823          	sd	t6,240(sp)
    800036b0:	ccdff0ef          	jal	ra,8000337c <kerneltrap>
    800036b4:	00013083          	ld	ra,0(sp)
    800036b8:	00813103          	ld	sp,8(sp)
    800036bc:	01013183          	ld	gp,16(sp)
    800036c0:	02013283          	ld	t0,32(sp)
    800036c4:	02813303          	ld	t1,40(sp)
    800036c8:	03013383          	ld	t2,48(sp)
    800036cc:	03813403          	ld	s0,56(sp)
    800036d0:	04013483          	ld	s1,64(sp)
    800036d4:	04813503          	ld	a0,72(sp)
    800036d8:	05013583          	ld	a1,80(sp)
    800036dc:	05813603          	ld	a2,88(sp)
    800036e0:	06013683          	ld	a3,96(sp)
    800036e4:	06813703          	ld	a4,104(sp)
    800036e8:	07013783          	ld	a5,112(sp)
    800036ec:	07813803          	ld	a6,120(sp)
    800036f0:	08013883          	ld	a7,128(sp)
    800036f4:	08813903          	ld	s2,136(sp)
    800036f8:	09013983          	ld	s3,144(sp)
    800036fc:	09813a03          	ld	s4,152(sp)
    80003700:	0a013a83          	ld	s5,160(sp)
    80003704:	0a813b03          	ld	s6,168(sp)
    80003708:	0b013b83          	ld	s7,176(sp)
    8000370c:	0b813c03          	ld	s8,184(sp)
    80003710:	0c013c83          	ld	s9,192(sp)
    80003714:	0c813d03          	ld	s10,200(sp)
    80003718:	0d013d83          	ld	s11,208(sp)
    8000371c:	0d813e03          	ld	t3,216(sp)
    80003720:	0e013e83          	ld	t4,224(sp)
    80003724:	0e813f03          	ld	t5,232(sp)
    80003728:	0f013f83          	ld	t6,240(sp)
    8000372c:	10010113          	addi	sp,sp,256
    80003730:	10200073          	sret
    80003734:	00000013          	nop
    80003738:	00000013          	nop
    8000373c:	00000013          	nop

0000000080003740 <timervec>:
    80003740:	34051573          	csrrw	a0,mscratch,a0
    80003744:	00b53023          	sd	a1,0(a0)
    80003748:	00c53423          	sd	a2,8(a0)
    8000374c:	00d53823          	sd	a3,16(a0)
    80003750:	01853583          	ld	a1,24(a0)
    80003754:	02053603          	ld	a2,32(a0)
    80003758:	0005b683          	ld	a3,0(a1)
    8000375c:	00c686b3          	add	a3,a3,a2
    80003760:	00d5b023          	sd	a3,0(a1)
    80003764:	00200593          	li	a1,2
    80003768:	14459073          	csrw	sip,a1
    8000376c:	01053683          	ld	a3,16(a0)
    80003770:	00853603          	ld	a2,8(a0)
    80003774:	00053583          	ld	a1,0(a0)
    80003778:	34051573          	csrrw	a0,mscratch,a0
    8000377c:	30200073          	mret

0000000080003780 <plicinit>:
    80003780:	ff010113          	addi	sp,sp,-16
    80003784:	00813423          	sd	s0,8(sp)
    80003788:	01010413          	addi	s0,sp,16
    8000378c:	00813403          	ld	s0,8(sp)
    80003790:	0c0007b7          	lui	a5,0xc000
    80003794:	00100713          	li	a4,1
    80003798:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000379c:	00e7a223          	sw	a4,4(a5)
    800037a0:	01010113          	addi	sp,sp,16
    800037a4:	00008067          	ret

00000000800037a8 <plicinithart>:
    800037a8:	ff010113          	addi	sp,sp,-16
    800037ac:	00813023          	sd	s0,0(sp)
    800037b0:	00113423          	sd	ra,8(sp)
    800037b4:	01010413          	addi	s0,sp,16
    800037b8:	00000097          	auipc	ra,0x0
    800037bc:	a44080e7          	jalr	-1468(ra) # 800031fc <cpuid>
    800037c0:	0085171b          	slliw	a4,a0,0x8
    800037c4:	0c0027b7          	lui	a5,0xc002
    800037c8:	00e787b3          	add	a5,a5,a4
    800037cc:	40200713          	li	a4,1026
    800037d0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    800037d4:	00813083          	ld	ra,8(sp)
    800037d8:	00013403          	ld	s0,0(sp)
    800037dc:	00d5151b          	slliw	a0,a0,0xd
    800037e0:	0c2017b7          	lui	a5,0xc201
    800037e4:	00a78533          	add	a0,a5,a0
    800037e8:	00052023          	sw	zero,0(a0)
    800037ec:	01010113          	addi	sp,sp,16
    800037f0:	00008067          	ret

00000000800037f4 <plic_claim>:
    800037f4:	ff010113          	addi	sp,sp,-16
    800037f8:	00813023          	sd	s0,0(sp)
    800037fc:	00113423          	sd	ra,8(sp)
    80003800:	01010413          	addi	s0,sp,16
    80003804:	00000097          	auipc	ra,0x0
    80003808:	9f8080e7          	jalr	-1544(ra) # 800031fc <cpuid>
    8000380c:	00813083          	ld	ra,8(sp)
    80003810:	00013403          	ld	s0,0(sp)
    80003814:	00d5151b          	slliw	a0,a0,0xd
    80003818:	0c2017b7          	lui	a5,0xc201
    8000381c:	00a78533          	add	a0,a5,a0
    80003820:	00452503          	lw	a0,4(a0)
    80003824:	01010113          	addi	sp,sp,16
    80003828:	00008067          	ret

000000008000382c <plic_complete>:
    8000382c:	fe010113          	addi	sp,sp,-32
    80003830:	00813823          	sd	s0,16(sp)
    80003834:	00913423          	sd	s1,8(sp)
    80003838:	00113c23          	sd	ra,24(sp)
    8000383c:	02010413          	addi	s0,sp,32
    80003840:	00050493          	mv	s1,a0
    80003844:	00000097          	auipc	ra,0x0
    80003848:	9b8080e7          	jalr	-1608(ra) # 800031fc <cpuid>
    8000384c:	01813083          	ld	ra,24(sp)
    80003850:	01013403          	ld	s0,16(sp)
    80003854:	00d5179b          	slliw	a5,a0,0xd
    80003858:	0c201737          	lui	a4,0xc201
    8000385c:	00f707b3          	add	a5,a4,a5
    80003860:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003864:	00813483          	ld	s1,8(sp)
    80003868:	02010113          	addi	sp,sp,32
    8000386c:	00008067          	ret

0000000080003870 <consolewrite>:
    80003870:	fb010113          	addi	sp,sp,-80
    80003874:	04813023          	sd	s0,64(sp)
    80003878:	04113423          	sd	ra,72(sp)
    8000387c:	02913c23          	sd	s1,56(sp)
    80003880:	03213823          	sd	s2,48(sp)
    80003884:	03313423          	sd	s3,40(sp)
    80003888:	03413023          	sd	s4,32(sp)
    8000388c:	01513c23          	sd	s5,24(sp)
    80003890:	05010413          	addi	s0,sp,80
    80003894:	06c05c63          	blez	a2,8000390c <consolewrite+0x9c>
    80003898:	00060993          	mv	s3,a2
    8000389c:	00050a13          	mv	s4,a0
    800038a0:	00058493          	mv	s1,a1
    800038a4:	00000913          	li	s2,0
    800038a8:	fff00a93          	li	s5,-1
    800038ac:	01c0006f          	j	800038c8 <consolewrite+0x58>
    800038b0:	fbf44503          	lbu	a0,-65(s0)
    800038b4:	0019091b          	addiw	s2,s2,1
    800038b8:	00148493          	addi	s1,s1,1
    800038bc:	00001097          	auipc	ra,0x1
    800038c0:	a9c080e7          	jalr	-1380(ra) # 80004358 <uartputc>
    800038c4:	03298063          	beq	s3,s2,800038e4 <consolewrite+0x74>
    800038c8:	00048613          	mv	a2,s1
    800038cc:	00100693          	li	a3,1
    800038d0:	000a0593          	mv	a1,s4
    800038d4:	fbf40513          	addi	a0,s0,-65
    800038d8:	00000097          	auipc	ra,0x0
    800038dc:	9dc080e7          	jalr	-1572(ra) # 800032b4 <either_copyin>
    800038e0:	fd5518e3          	bne	a0,s5,800038b0 <consolewrite+0x40>
    800038e4:	04813083          	ld	ra,72(sp)
    800038e8:	04013403          	ld	s0,64(sp)
    800038ec:	03813483          	ld	s1,56(sp)
    800038f0:	02813983          	ld	s3,40(sp)
    800038f4:	02013a03          	ld	s4,32(sp)
    800038f8:	01813a83          	ld	s5,24(sp)
    800038fc:	00090513          	mv	a0,s2
    80003900:	03013903          	ld	s2,48(sp)
    80003904:	05010113          	addi	sp,sp,80
    80003908:	00008067          	ret
    8000390c:	00000913          	li	s2,0
    80003910:	fd5ff06f          	j	800038e4 <consolewrite+0x74>

0000000080003914 <consoleread>:
    80003914:	f9010113          	addi	sp,sp,-112
    80003918:	06813023          	sd	s0,96(sp)
    8000391c:	04913c23          	sd	s1,88(sp)
    80003920:	05213823          	sd	s2,80(sp)
    80003924:	05313423          	sd	s3,72(sp)
    80003928:	05413023          	sd	s4,64(sp)
    8000392c:	03513c23          	sd	s5,56(sp)
    80003930:	03613823          	sd	s6,48(sp)
    80003934:	03713423          	sd	s7,40(sp)
    80003938:	03813023          	sd	s8,32(sp)
    8000393c:	06113423          	sd	ra,104(sp)
    80003940:	01913c23          	sd	s9,24(sp)
    80003944:	07010413          	addi	s0,sp,112
    80003948:	00060b93          	mv	s7,a2
    8000394c:	00050913          	mv	s2,a0
    80003950:	00058c13          	mv	s8,a1
    80003954:	00060b1b          	sext.w	s6,a2
    80003958:	00005497          	auipc	s1,0x5
    8000395c:	91048493          	addi	s1,s1,-1776 # 80008268 <cons>
    80003960:	00400993          	li	s3,4
    80003964:	fff00a13          	li	s4,-1
    80003968:	00a00a93          	li	s5,10
    8000396c:	05705e63          	blez	s7,800039c8 <consoleread+0xb4>
    80003970:	09c4a703          	lw	a4,156(s1)
    80003974:	0984a783          	lw	a5,152(s1)
    80003978:	0007071b          	sext.w	a4,a4
    8000397c:	08e78463          	beq	a5,a4,80003a04 <consoleread+0xf0>
    80003980:	07f7f713          	andi	a4,a5,127
    80003984:	00e48733          	add	a4,s1,a4
    80003988:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000398c:	0017869b          	addiw	a3,a5,1
    80003990:	08d4ac23          	sw	a3,152(s1)
    80003994:	00070c9b          	sext.w	s9,a4
    80003998:	0b370663          	beq	a4,s3,80003a44 <consoleread+0x130>
    8000399c:	00100693          	li	a3,1
    800039a0:	f9f40613          	addi	a2,s0,-97
    800039a4:	000c0593          	mv	a1,s8
    800039a8:	00090513          	mv	a0,s2
    800039ac:	f8e40fa3          	sb	a4,-97(s0)
    800039b0:	00000097          	auipc	ra,0x0
    800039b4:	8b8080e7          	jalr	-1864(ra) # 80003268 <either_copyout>
    800039b8:	01450863          	beq	a0,s4,800039c8 <consoleread+0xb4>
    800039bc:	001c0c13          	addi	s8,s8,1
    800039c0:	fffb8b9b          	addiw	s7,s7,-1
    800039c4:	fb5c94e3          	bne	s9,s5,8000396c <consoleread+0x58>
    800039c8:	000b851b          	sext.w	a0,s7
    800039cc:	06813083          	ld	ra,104(sp)
    800039d0:	06013403          	ld	s0,96(sp)
    800039d4:	05813483          	ld	s1,88(sp)
    800039d8:	05013903          	ld	s2,80(sp)
    800039dc:	04813983          	ld	s3,72(sp)
    800039e0:	04013a03          	ld	s4,64(sp)
    800039e4:	03813a83          	ld	s5,56(sp)
    800039e8:	02813b83          	ld	s7,40(sp)
    800039ec:	02013c03          	ld	s8,32(sp)
    800039f0:	01813c83          	ld	s9,24(sp)
    800039f4:	40ab053b          	subw	a0,s6,a0
    800039f8:	03013b03          	ld	s6,48(sp)
    800039fc:	07010113          	addi	sp,sp,112
    80003a00:	00008067          	ret
    80003a04:	00001097          	auipc	ra,0x1
    80003a08:	1d8080e7          	jalr	472(ra) # 80004bdc <push_on>
    80003a0c:	0984a703          	lw	a4,152(s1)
    80003a10:	09c4a783          	lw	a5,156(s1)
    80003a14:	0007879b          	sext.w	a5,a5
    80003a18:	fef70ce3          	beq	a4,a5,80003a10 <consoleread+0xfc>
    80003a1c:	00001097          	auipc	ra,0x1
    80003a20:	234080e7          	jalr	564(ra) # 80004c50 <pop_on>
    80003a24:	0984a783          	lw	a5,152(s1)
    80003a28:	07f7f713          	andi	a4,a5,127
    80003a2c:	00e48733          	add	a4,s1,a4
    80003a30:	01874703          	lbu	a4,24(a4)
    80003a34:	0017869b          	addiw	a3,a5,1
    80003a38:	08d4ac23          	sw	a3,152(s1)
    80003a3c:	00070c9b          	sext.w	s9,a4
    80003a40:	f5371ee3          	bne	a4,s3,8000399c <consoleread+0x88>
    80003a44:	000b851b          	sext.w	a0,s7
    80003a48:	f96bf2e3          	bgeu	s7,s6,800039cc <consoleread+0xb8>
    80003a4c:	08f4ac23          	sw	a5,152(s1)
    80003a50:	f7dff06f          	j	800039cc <consoleread+0xb8>

0000000080003a54 <consputc>:
    80003a54:	10000793          	li	a5,256
    80003a58:	00f50663          	beq	a0,a5,80003a64 <consputc+0x10>
    80003a5c:	00001317          	auipc	t1,0x1
    80003a60:	9f430067          	jr	-1548(t1) # 80004450 <uartputc_sync>
    80003a64:	ff010113          	addi	sp,sp,-16
    80003a68:	00113423          	sd	ra,8(sp)
    80003a6c:	00813023          	sd	s0,0(sp)
    80003a70:	01010413          	addi	s0,sp,16
    80003a74:	00800513          	li	a0,8
    80003a78:	00001097          	auipc	ra,0x1
    80003a7c:	9d8080e7          	jalr	-1576(ra) # 80004450 <uartputc_sync>
    80003a80:	02000513          	li	a0,32
    80003a84:	00001097          	auipc	ra,0x1
    80003a88:	9cc080e7          	jalr	-1588(ra) # 80004450 <uartputc_sync>
    80003a8c:	00013403          	ld	s0,0(sp)
    80003a90:	00813083          	ld	ra,8(sp)
    80003a94:	00800513          	li	a0,8
    80003a98:	01010113          	addi	sp,sp,16
    80003a9c:	00001317          	auipc	t1,0x1
    80003aa0:	9b430067          	jr	-1612(t1) # 80004450 <uartputc_sync>

0000000080003aa4 <consoleintr>:
    80003aa4:	fe010113          	addi	sp,sp,-32
    80003aa8:	00813823          	sd	s0,16(sp)
    80003aac:	00913423          	sd	s1,8(sp)
    80003ab0:	01213023          	sd	s2,0(sp)
    80003ab4:	00113c23          	sd	ra,24(sp)
    80003ab8:	02010413          	addi	s0,sp,32
    80003abc:	00004917          	auipc	s2,0x4
    80003ac0:	7ac90913          	addi	s2,s2,1964 # 80008268 <cons>
    80003ac4:	00050493          	mv	s1,a0
    80003ac8:	00090513          	mv	a0,s2
    80003acc:	00001097          	auipc	ra,0x1
    80003ad0:	e40080e7          	jalr	-448(ra) # 8000490c <acquire>
    80003ad4:	02048c63          	beqz	s1,80003b0c <consoleintr+0x68>
    80003ad8:	0a092783          	lw	a5,160(s2)
    80003adc:	09892703          	lw	a4,152(s2)
    80003ae0:	07f00693          	li	a3,127
    80003ae4:	40e7873b          	subw	a4,a5,a4
    80003ae8:	02e6e263          	bltu	a3,a4,80003b0c <consoleintr+0x68>
    80003aec:	00d00713          	li	a4,13
    80003af0:	04e48063          	beq	s1,a4,80003b30 <consoleintr+0x8c>
    80003af4:	07f7f713          	andi	a4,a5,127
    80003af8:	00e90733          	add	a4,s2,a4
    80003afc:	0017879b          	addiw	a5,a5,1
    80003b00:	0af92023          	sw	a5,160(s2)
    80003b04:	00970c23          	sb	s1,24(a4)
    80003b08:	08f92e23          	sw	a5,156(s2)
    80003b0c:	01013403          	ld	s0,16(sp)
    80003b10:	01813083          	ld	ra,24(sp)
    80003b14:	00813483          	ld	s1,8(sp)
    80003b18:	00013903          	ld	s2,0(sp)
    80003b1c:	00004517          	auipc	a0,0x4
    80003b20:	74c50513          	addi	a0,a0,1868 # 80008268 <cons>
    80003b24:	02010113          	addi	sp,sp,32
    80003b28:	00001317          	auipc	t1,0x1
    80003b2c:	eb030067          	jr	-336(t1) # 800049d8 <release>
    80003b30:	00a00493          	li	s1,10
    80003b34:	fc1ff06f          	j	80003af4 <consoleintr+0x50>

0000000080003b38 <consoleinit>:
    80003b38:	fe010113          	addi	sp,sp,-32
    80003b3c:	00113c23          	sd	ra,24(sp)
    80003b40:	00813823          	sd	s0,16(sp)
    80003b44:	00913423          	sd	s1,8(sp)
    80003b48:	02010413          	addi	s0,sp,32
    80003b4c:	00004497          	auipc	s1,0x4
    80003b50:	71c48493          	addi	s1,s1,1820 # 80008268 <cons>
    80003b54:	00048513          	mv	a0,s1
    80003b58:	00002597          	auipc	a1,0x2
    80003b5c:	75058593          	addi	a1,a1,1872 # 800062a8 <CONSOLE_STATUS+0x298>
    80003b60:	00001097          	auipc	ra,0x1
    80003b64:	d88080e7          	jalr	-632(ra) # 800048e8 <initlock>
    80003b68:	00000097          	auipc	ra,0x0
    80003b6c:	7ac080e7          	jalr	1964(ra) # 80004314 <uartinit>
    80003b70:	01813083          	ld	ra,24(sp)
    80003b74:	01013403          	ld	s0,16(sp)
    80003b78:	00000797          	auipc	a5,0x0
    80003b7c:	d9c78793          	addi	a5,a5,-612 # 80003914 <consoleread>
    80003b80:	0af4bc23          	sd	a5,184(s1)
    80003b84:	00000797          	auipc	a5,0x0
    80003b88:	cec78793          	addi	a5,a5,-788 # 80003870 <consolewrite>
    80003b8c:	0cf4b023          	sd	a5,192(s1)
    80003b90:	00813483          	ld	s1,8(sp)
    80003b94:	02010113          	addi	sp,sp,32
    80003b98:	00008067          	ret

0000000080003b9c <console_read>:
    80003b9c:	ff010113          	addi	sp,sp,-16
    80003ba0:	00813423          	sd	s0,8(sp)
    80003ba4:	01010413          	addi	s0,sp,16
    80003ba8:	00813403          	ld	s0,8(sp)
    80003bac:	00004317          	auipc	t1,0x4
    80003bb0:	77433303          	ld	t1,1908(t1) # 80008320 <devsw+0x10>
    80003bb4:	01010113          	addi	sp,sp,16
    80003bb8:	00030067          	jr	t1

0000000080003bbc <console_write>:
    80003bbc:	ff010113          	addi	sp,sp,-16
    80003bc0:	00813423          	sd	s0,8(sp)
    80003bc4:	01010413          	addi	s0,sp,16
    80003bc8:	00813403          	ld	s0,8(sp)
    80003bcc:	00004317          	auipc	t1,0x4
    80003bd0:	75c33303          	ld	t1,1884(t1) # 80008328 <devsw+0x18>
    80003bd4:	01010113          	addi	sp,sp,16
    80003bd8:	00030067          	jr	t1

0000000080003bdc <panic>:
    80003bdc:	fe010113          	addi	sp,sp,-32
    80003be0:	00113c23          	sd	ra,24(sp)
    80003be4:	00813823          	sd	s0,16(sp)
    80003be8:	00913423          	sd	s1,8(sp)
    80003bec:	02010413          	addi	s0,sp,32
    80003bf0:	00050493          	mv	s1,a0
    80003bf4:	00002517          	auipc	a0,0x2
    80003bf8:	6bc50513          	addi	a0,a0,1724 # 800062b0 <CONSOLE_STATUS+0x2a0>
    80003bfc:	00004797          	auipc	a5,0x4
    80003c00:	7c07a623          	sw	zero,1996(a5) # 800083c8 <pr+0x18>
    80003c04:	00000097          	auipc	ra,0x0
    80003c08:	034080e7          	jalr	52(ra) # 80003c38 <__printf>
    80003c0c:	00048513          	mv	a0,s1
    80003c10:	00000097          	auipc	ra,0x0
    80003c14:	028080e7          	jalr	40(ra) # 80003c38 <__printf>
    80003c18:	00002517          	auipc	a0,0x2
    80003c1c:	67850513          	addi	a0,a0,1656 # 80006290 <CONSOLE_STATUS+0x280>
    80003c20:	00000097          	auipc	ra,0x0
    80003c24:	018080e7          	jalr	24(ra) # 80003c38 <__printf>
    80003c28:	00100793          	li	a5,1
    80003c2c:	00003717          	auipc	a4,0x3
    80003c30:	4ef72623          	sw	a5,1260(a4) # 80007118 <panicked>
    80003c34:	0000006f          	j	80003c34 <panic+0x58>

0000000080003c38 <__printf>:
    80003c38:	f3010113          	addi	sp,sp,-208
    80003c3c:	08813023          	sd	s0,128(sp)
    80003c40:	07313423          	sd	s3,104(sp)
    80003c44:	09010413          	addi	s0,sp,144
    80003c48:	05813023          	sd	s8,64(sp)
    80003c4c:	08113423          	sd	ra,136(sp)
    80003c50:	06913c23          	sd	s1,120(sp)
    80003c54:	07213823          	sd	s2,112(sp)
    80003c58:	07413023          	sd	s4,96(sp)
    80003c5c:	05513c23          	sd	s5,88(sp)
    80003c60:	05613823          	sd	s6,80(sp)
    80003c64:	05713423          	sd	s7,72(sp)
    80003c68:	03913c23          	sd	s9,56(sp)
    80003c6c:	03a13823          	sd	s10,48(sp)
    80003c70:	03b13423          	sd	s11,40(sp)
    80003c74:	00004317          	auipc	t1,0x4
    80003c78:	73c30313          	addi	t1,t1,1852 # 800083b0 <pr>
    80003c7c:	01832c03          	lw	s8,24(t1)
    80003c80:	00b43423          	sd	a1,8(s0)
    80003c84:	00c43823          	sd	a2,16(s0)
    80003c88:	00d43c23          	sd	a3,24(s0)
    80003c8c:	02e43023          	sd	a4,32(s0)
    80003c90:	02f43423          	sd	a5,40(s0)
    80003c94:	03043823          	sd	a6,48(s0)
    80003c98:	03143c23          	sd	a7,56(s0)
    80003c9c:	00050993          	mv	s3,a0
    80003ca0:	4a0c1663          	bnez	s8,8000414c <__printf+0x514>
    80003ca4:	60098c63          	beqz	s3,800042bc <__printf+0x684>
    80003ca8:	0009c503          	lbu	a0,0(s3)
    80003cac:	00840793          	addi	a5,s0,8
    80003cb0:	f6f43c23          	sd	a5,-136(s0)
    80003cb4:	00000493          	li	s1,0
    80003cb8:	22050063          	beqz	a0,80003ed8 <__printf+0x2a0>
    80003cbc:	00002a37          	lui	s4,0x2
    80003cc0:	00018ab7          	lui	s5,0x18
    80003cc4:	000f4b37          	lui	s6,0xf4
    80003cc8:	00989bb7          	lui	s7,0x989
    80003ccc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003cd0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003cd4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003cd8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80003cdc:	00148c9b          	addiw	s9,s1,1
    80003ce0:	02500793          	li	a5,37
    80003ce4:	01998933          	add	s2,s3,s9
    80003ce8:	38f51263          	bne	a0,a5,8000406c <__printf+0x434>
    80003cec:	00094783          	lbu	a5,0(s2)
    80003cf0:	00078c9b          	sext.w	s9,a5
    80003cf4:	1e078263          	beqz	a5,80003ed8 <__printf+0x2a0>
    80003cf8:	0024849b          	addiw	s1,s1,2
    80003cfc:	07000713          	li	a4,112
    80003d00:	00998933          	add	s2,s3,s1
    80003d04:	38e78a63          	beq	a5,a4,80004098 <__printf+0x460>
    80003d08:	20f76863          	bltu	a4,a5,80003f18 <__printf+0x2e0>
    80003d0c:	42a78863          	beq	a5,a0,8000413c <__printf+0x504>
    80003d10:	06400713          	li	a4,100
    80003d14:	40e79663          	bne	a5,a4,80004120 <__printf+0x4e8>
    80003d18:	f7843783          	ld	a5,-136(s0)
    80003d1c:	0007a603          	lw	a2,0(a5)
    80003d20:	00878793          	addi	a5,a5,8
    80003d24:	f6f43c23          	sd	a5,-136(s0)
    80003d28:	42064a63          	bltz	a2,8000415c <__printf+0x524>
    80003d2c:	00a00713          	li	a4,10
    80003d30:	02e677bb          	remuw	a5,a2,a4
    80003d34:	00002d97          	auipc	s11,0x2
    80003d38:	5a4d8d93          	addi	s11,s11,1444 # 800062d8 <digits>
    80003d3c:	00900593          	li	a1,9
    80003d40:	0006051b          	sext.w	a0,a2
    80003d44:	00000c93          	li	s9,0
    80003d48:	02079793          	slli	a5,a5,0x20
    80003d4c:	0207d793          	srli	a5,a5,0x20
    80003d50:	00fd87b3          	add	a5,s11,a5
    80003d54:	0007c783          	lbu	a5,0(a5)
    80003d58:	02e656bb          	divuw	a3,a2,a4
    80003d5c:	f8f40023          	sb	a5,-128(s0)
    80003d60:	14c5d863          	bge	a1,a2,80003eb0 <__printf+0x278>
    80003d64:	06300593          	li	a1,99
    80003d68:	00100c93          	li	s9,1
    80003d6c:	02e6f7bb          	remuw	a5,a3,a4
    80003d70:	02079793          	slli	a5,a5,0x20
    80003d74:	0207d793          	srli	a5,a5,0x20
    80003d78:	00fd87b3          	add	a5,s11,a5
    80003d7c:	0007c783          	lbu	a5,0(a5)
    80003d80:	02e6d73b          	divuw	a4,a3,a4
    80003d84:	f8f400a3          	sb	a5,-127(s0)
    80003d88:	12a5f463          	bgeu	a1,a0,80003eb0 <__printf+0x278>
    80003d8c:	00a00693          	li	a3,10
    80003d90:	00900593          	li	a1,9
    80003d94:	02d777bb          	remuw	a5,a4,a3
    80003d98:	02079793          	slli	a5,a5,0x20
    80003d9c:	0207d793          	srli	a5,a5,0x20
    80003da0:	00fd87b3          	add	a5,s11,a5
    80003da4:	0007c503          	lbu	a0,0(a5)
    80003da8:	02d757bb          	divuw	a5,a4,a3
    80003dac:	f8a40123          	sb	a0,-126(s0)
    80003db0:	48e5f263          	bgeu	a1,a4,80004234 <__printf+0x5fc>
    80003db4:	06300513          	li	a0,99
    80003db8:	02d7f5bb          	remuw	a1,a5,a3
    80003dbc:	02059593          	slli	a1,a1,0x20
    80003dc0:	0205d593          	srli	a1,a1,0x20
    80003dc4:	00bd85b3          	add	a1,s11,a1
    80003dc8:	0005c583          	lbu	a1,0(a1)
    80003dcc:	02d7d7bb          	divuw	a5,a5,a3
    80003dd0:	f8b401a3          	sb	a1,-125(s0)
    80003dd4:	48e57263          	bgeu	a0,a4,80004258 <__printf+0x620>
    80003dd8:	3e700513          	li	a0,999
    80003ddc:	02d7f5bb          	remuw	a1,a5,a3
    80003de0:	02059593          	slli	a1,a1,0x20
    80003de4:	0205d593          	srli	a1,a1,0x20
    80003de8:	00bd85b3          	add	a1,s11,a1
    80003dec:	0005c583          	lbu	a1,0(a1)
    80003df0:	02d7d7bb          	divuw	a5,a5,a3
    80003df4:	f8b40223          	sb	a1,-124(s0)
    80003df8:	46e57663          	bgeu	a0,a4,80004264 <__printf+0x62c>
    80003dfc:	02d7f5bb          	remuw	a1,a5,a3
    80003e00:	02059593          	slli	a1,a1,0x20
    80003e04:	0205d593          	srli	a1,a1,0x20
    80003e08:	00bd85b3          	add	a1,s11,a1
    80003e0c:	0005c583          	lbu	a1,0(a1)
    80003e10:	02d7d7bb          	divuw	a5,a5,a3
    80003e14:	f8b402a3          	sb	a1,-123(s0)
    80003e18:	46ea7863          	bgeu	s4,a4,80004288 <__printf+0x650>
    80003e1c:	02d7f5bb          	remuw	a1,a5,a3
    80003e20:	02059593          	slli	a1,a1,0x20
    80003e24:	0205d593          	srli	a1,a1,0x20
    80003e28:	00bd85b3          	add	a1,s11,a1
    80003e2c:	0005c583          	lbu	a1,0(a1)
    80003e30:	02d7d7bb          	divuw	a5,a5,a3
    80003e34:	f8b40323          	sb	a1,-122(s0)
    80003e38:	3eeaf863          	bgeu	s5,a4,80004228 <__printf+0x5f0>
    80003e3c:	02d7f5bb          	remuw	a1,a5,a3
    80003e40:	02059593          	slli	a1,a1,0x20
    80003e44:	0205d593          	srli	a1,a1,0x20
    80003e48:	00bd85b3          	add	a1,s11,a1
    80003e4c:	0005c583          	lbu	a1,0(a1)
    80003e50:	02d7d7bb          	divuw	a5,a5,a3
    80003e54:	f8b403a3          	sb	a1,-121(s0)
    80003e58:	42eb7e63          	bgeu	s6,a4,80004294 <__printf+0x65c>
    80003e5c:	02d7f5bb          	remuw	a1,a5,a3
    80003e60:	02059593          	slli	a1,a1,0x20
    80003e64:	0205d593          	srli	a1,a1,0x20
    80003e68:	00bd85b3          	add	a1,s11,a1
    80003e6c:	0005c583          	lbu	a1,0(a1)
    80003e70:	02d7d7bb          	divuw	a5,a5,a3
    80003e74:	f8b40423          	sb	a1,-120(s0)
    80003e78:	42ebfc63          	bgeu	s7,a4,800042b0 <__printf+0x678>
    80003e7c:	02079793          	slli	a5,a5,0x20
    80003e80:	0207d793          	srli	a5,a5,0x20
    80003e84:	00fd8db3          	add	s11,s11,a5
    80003e88:	000dc703          	lbu	a4,0(s11)
    80003e8c:	00a00793          	li	a5,10
    80003e90:	00900c93          	li	s9,9
    80003e94:	f8e404a3          	sb	a4,-119(s0)
    80003e98:	00065c63          	bgez	a2,80003eb0 <__printf+0x278>
    80003e9c:	f9040713          	addi	a4,s0,-112
    80003ea0:	00f70733          	add	a4,a4,a5
    80003ea4:	02d00693          	li	a3,45
    80003ea8:	fed70823          	sb	a3,-16(a4)
    80003eac:	00078c93          	mv	s9,a5
    80003eb0:	f8040793          	addi	a5,s0,-128
    80003eb4:	01978cb3          	add	s9,a5,s9
    80003eb8:	f7f40d13          	addi	s10,s0,-129
    80003ebc:	000cc503          	lbu	a0,0(s9)
    80003ec0:	fffc8c93          	addi	s9,s9,-1
    80003ec4:	00000097          	auipc	ra,0x0
    80003ec8:	b90080e7          	jalr	-1136(ra) # 80003a54 <consputc>
    80003ecc:	ffac98e3          	bne	s9,s10,80003ebc <__printf+0x284>
    80003ed0:	00094503          	lbu	a0,0(s2)
    80003ed4:	e00514e3          	bnez	a0,80003cdc <__printf+0xa4>
    80003ed8:	1a0c1663          	bnez	s8,80004084 <__printf+0x44c>
    80003edc:	08813083          	ld	ra,136(sp)
    80003ee0:	08013403          	ld	s0,128(sp)
    80003ee4:	07813483          	ld	s1,120(sp)
    80003ee8:	07013903          	ld	s2,112(sp)
    80003eec:	06813983          	ld	s3,104(sp)
    80003ef0:	06013a03          	ld	s4,96(sp)
    80003ef4:	05813a83          	ld	s5,88(sp)
    80003ef8:	05013b03          	ld	s6,80(sp)
    80003efc:	04813b83          	ld	s7,72(sp)
    80003f00:	04013c03          	ld	s8,64(sp)
    80003f04:	03813c83          	ld	s9,56(sp)
    80003f08:	03013d03          	ld	s10,48(sp)
    80003f0c:	02813d83          	ld	s11,40(sp)
    80003f10:	0d010113          	addi	sp,sp,208
    80003f14:	00008067          	ret
    80003f18:	07300713          	li	a4,115
    80003f1c:	1ce78a63          	beq	a5,a4,800040f0 <__printf+0x4b8>
    80003f20:	07800713          	li	a4,120
    80003f24:	1ee79e63          	bne	a5,a4,80004120 <__printf+0x4e8>
    80003f28:	f7843783          	ld	a5,-136(s0)
    80003f2c:	0007a703          	lw	a4,0(a5)
    80003f30:	00878793          	addi	a5,a5,8
    80003f34:	f6f43c23          	sd	a5,-136(s0)
    80003f38:	28074263          	bltz	a4,800041bc <__printf+0x584>
    80003f3c:	00002d97          	auipc	s11,0x2
    80003f40:	39cd8d93          	addi	s11,s11,924 # 800062d8 <digits>
    80003f44:	00f77793          	andi	a5,a4,15
    80003f48:	00fd87b3          	add	a5,s11,a5
    80003f4c:	0007c683          	lbu	a3,0(a5)
    80003f50:	00f00613          	li	a2,15
    80003f54:	0007079b          	sext.w	a5,a4
    80003f58:	f8d40023          	sb	a3,-128(s0)
    80003f5c:	0047559b          	srliw	a1,a4,0x4
    80003f60:	0047569b          	srliw	a3,a4,0x4
    80003f64:	00000c93          	li	s9,0
    80003f68:	0ee65063          	bge	a2,a4,80004048 <__printf+0x410>
    80003f6c:	00f6f693          	andi	a3,a3,15
    80003f70:	00dd86b3          	add	a3,s11,a3
    80003f74:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003f78:	0087d79b          	srliw	a5,a5,0x8
    80003f7c:	00100c93          	li	s9,1
    80003f80:	f8d400a3          	sb	a3,-127(s0)
    80003f84:	0cb67263          	bgeu	a2,a1,80004048 <__printf+0x410>
    80003f88:	00f7f693          	andi	a3,a5,15
    80003f8c:	00dd86b3          	add	a3,s11,a3
    80003f90:	0006c583          	lbu	a1,0(a3)
    80003f94:	00f00613          	li	a2,15
    80003f98:	0047d69b          	srliw	a3,a5,0x4
    80003f9c:	f8b40123          	sb	a1,-126(s0)
    80003fa0:	0047d593          	srli	a1,a5,0x4
    80003fa4:	28f67e63          	bgeu	a2,a5,80004240 <__printf+0x608>
    80003fa8:	00f6f693          	andi	a3,a3,15
    80003fac:	00dd86b3          	add	a3,s11,a3
    80003fb0:	0006c503          	lbu	a0,0(a3)
    80003fb4:	0087d813          	srli	a6,a5,0x8
    80003fb8:	0087d69b          	srliw	a3,a5,0x8
    80003fbc:	f8a401a3          	sb	a0,-125(s0)
    80003fc0:	28b67663          	bgeu	a2,a1,8000424c <__printf+0x614>
    80003fc4:	00f6f693          	andi	a3,a3,15
    80003fc8:	00dd86b3          	add	a3,s11,a3
    80003fcc:	0006c583          	lbu	a1,0(a3)
    80003fd0:	00c7d513          	srli	a0,a5,0xc
    80003fd4:	00c7d69b          	srliw	a3,a5,0xc
    80003fd8:	f8b40223          	sb	a1,-124(s0)
    80003fdc:	29067a63          	bgeu	a2,a6,80004270 <__printf+0x638>
    80003fe0:	00f6f693          	andi	a3,a3,15
    80003fe4:	00dd86b3          	add	a3,s11,a3
    80003fe8:	0006c583          	lbu	a1,0(a3)
    80003fec:	0107d813          	srli	a6,a5,0x10
    80003ff0:	0107d69b          	srliw	a3,a5,0x10
    80003ff4:	f8b402a3          	sb	a1,-123(s0)
    80003ff8:	28a67263          	bgeu	a2,a0,8000427c <__printf+0x644>
    80003ffc:	00f6f693          	andi	a3,a3,15
    80004000:	00dd86b3          	add	a3,s11,a3
    80004004:	0006c683          	lbu	a3,0(a3)
    80004008:	0147d79b          	srliw	a5,a5,0x14
    8000400c:	f8d40323          	sb	a3,-122(s0)
    80004010:	21067663          	bgeu	a2,a6,8000421c <__printf+0x5e4>
    80004014:	02079793          	slli	a5,a5,0x20
    80004018:	0207d793          	srli	a5,a5,0x20
    8000401c:	00fd8db3          	add	s11,s11,a5
    80004020:	000dc683          	lbu	a3,0(s11)
    80004024:	00800793          	li	a5,8
    80004028:	00700c93          	li	s9,7
    8000402c:	f8d403a3          	sb	a3,-121(s0)
    80004030:	00075c63          	bgez	a4,80004048 <__printf+0x410>
    80004034:	f9040713          	addi	a4,s0,-112
    80004038:	00f70733          	add	a4,a4,a5
    8000403c:	02d00693          	li	a3,45
    80004040:	fed70823          	sb	a3,-16(a4)
    80004044:	00078c93          	mv	s9,a5
    80004048:	f8040793          	addi	a5,s0,-128
    8000404c:	01978cb3          	add	s9,a5,s9
    80004050:	f7f40d13          	addi	s10,s0,-129
    80004054:	000cc503          	lbu	a0,0(s9)
    80004058:	fffc8c93          	addi	s9,s9,-1
    8000405c:	00000097          	auipc	ra,0x0
    80004060:	9f8080e7          	jalr	-1544(ra) # 80003a54 <consputc>
    80004064:	ff9d18e3          	bne	s10,s9,80004054 <__printf+0x41c>
    80004068:	0100006f          	j	80004078 <__printf+0x440>
    8000406c:	00000097          	auipc	ra,0x0
    80004070:	9e8080e7          	jalr	-1560(ra) # 80003a54 <consputc>
    80004074:	000c8493          	mv	s1,s9
    80004078:	00094503          	lbu	a0,0(s2)
    8000407c:	c60510e3          	bnez	a0,80003cdc <__printf+0xa4>
    80004080:	e40c0ee3          	beqz	s8,80003edc <__printf+0x2a4>
    80004084:	00004517          	auipc	a0,0x4
    80004088:	32c50513          	addi	a0,a0,812 # 800083b0 <pr>
    8000408c:	00001097          	auipc	ra,0x1
    80004090:	94c080e7          	jalr	-1716(ra) # 800049d8 <release>
    80004094:	e49ff06f          	j	80003edc <__printf+0x2a4>
    80004098:	f7843783          	ld	a5,-136(s0)
    8000409c:	03000513          	li	a0,48
    800040a0:	01000d13          	li	s10,16
    800040a4:	00878713          	addi	a4,a5,8
    800040a8:	0007bc83          	ld	s9,0(a5)
    800040ac:	f6e43c23          	sd	a4,-136(s0)
    800040b0:	00000097          	auipc	ra,0x0
    800040b4:	9a4080e7          	jalr	-1628(ra) # 80003a54 <consputc>
    800040b8:	07800513          	li	a0,120
    800040bc:	00000097          	auipc	ra,0x0
    800040c0:	998080e7          	jalr	-1640(ra) # 80003a54 <consputc>
    800040c4:	00002d97          	auipc	s11,0x2
    800040c8:	214d8d93          	addi	s11,s11,532 # 800062d8 <digits>
    800040cc:	03ccd793          	srli	a5,s9,0x3c
    800040d0:	00fd87b3          	add	a5,s11,a5
    800040d4:	0007c503          	lbu	a0,0(a5)
    800040d8:	fffd0d1b          	addiw	s10,s10,-1
    800040dc:	004c9c93          	slli	s9,s9,0x4
    800040e0:	00000097          	auipc	ra,0x0
    800040e4:	974080e7          	jalr	-1676(ra) # 80003a54 <consputc>
    800040e8:	fe0d12e3          	bnez	s10,800040cc <__printf+0x494>
    800040ec:	f8dff06f          	j	80004078 <__printf+0x440>
    800040f0:	f7843783          	ld	a5,-136(s0)
    800040f4:	0007bc83          	ld	s9,0(a5)
    800040f8:	00878793          	addi	a5,a5,8
    800040fc:	f6f43c23          	sd	a5,-136(s0)
    80004100:	000c9a63          	bnez	s9,80004114 <__printf+0x4dc>
    80004104:	1080006f          	j	8000420c <__printf+0x5d4>
    80004108:	001c8c93          	addi	s9,s9,1
    8000410c:	00000097          	auipc	ra,0x0
    80004110:	948080e7          	jalr	-1720(ra) # 80003a54 <consputc>
    80004114:	000cc503          	lbu	a0,0(s9)
    80004118:	fe0518e3          	bnez	a0,80004108 <__printf+0x4d0>
    8000411c:	f5dff06f          	j	80004078 <__printf+0x440>
    80004120:	02500513          	li	a0,37
    80004124:	00000097          	auipc	ra,0x0
    80004128:	930080e7          	jalr	-1744(ra) # 80003a54 <consputc>
    8000412c:	000c8513          	mv	a0,s9
    80004130:	00000097          	auipc	ra,0x0
    80004134:	924080e7          	jalr	-1756(ra) # 80003a54 <consputc>
    80004138:	f41ff06f          	j	80004078 <__printf+0x440>
    8000413c:	02500513          	li	a0,37
    80004140:	00000097          	auipc	ra,0x0
    80004144:	914080e7          	jalr	-1772(ra) # 80003a54 <consputc>
    80004148:	f31ff06f          	j	80004078 <__printf+0x440>
    8000414c:	00030513          	mv	a0,t1
    80004150:	00000097          	auipc	ra,0x0
    80004154:	7bc080e7          	jalr	1980(ra) # 8000490c <acquire>
    80004158:	b4dff06f          	j	80003ca4 <__printf+0x6c>
    8000415c:	40c0053b          	negw	a0,a2
    80004160:	00a00713          	li	a4,10
    80004164:	02e576bb          	remuw	a3,a0,a4
    80004168:	00002d97          	auipc	s11,0x2
    8000416c:	170d8d93          	addi	s11,s11,368 # 800062d8 <digits>
    80004170:	ff700593          	li	a1,-9
    80004174:	02069693          	slli	a3,a3,0x20
    80004178:	0206d693          	srli	a3,a3,0x20
    8000417c:	00dd86b3          	add	a3,s11,a3
    80004180:	0006c683          	lbu	a3,0(a3)
    80004184:	02e557bb          	divuw	a5,a0,a4
    80004188:	f8d40023          	sb	a3,-128(s0)
    8000418c:	10b65e63          	bge	a2,a1,800042a8 <__printf+0x670>
    80004190:	06300593          	li	a1,99
    80004194:	02e7f6bb          	remuw	a3,a5,a4
    80004198:	02069693          	slli	a3,a3,0x20
    8000419c:	0206d693          	srli	a3,a3,0x20
    800041a0:	00dd86b3          	add	a3,s11,a3
    800041a4:	0006c683          	lbu	a3,0(a3)
    800041a8:	02e7d73b          	divuw	a4,a5,a4
    800041ac:	00200793          	li	a5,2
    800041b0:	f8d400a3          	sb	a3,-127(s0)
    800041b4:	bca5ece3          	bltu	a1,a0,80003d8c <__printf+0x154>
    800041b8:	ce5ff06f          	j	80003e9c <__printf+0x264>
    800041bc:	40e007bb          	negw	a5,a4
    800041c0:	00002d97          	auipc	s11,0x2
    800041c4:	118d8d93          	addi	s11,s11,280 # 800062d8 <digits>
    800041c8:	00f7f693          	andi	a3,a5,15
    800041cc:	00dd86b3          	add	a3,s11,a3
    800041d0:	0006c583          	lbu	a1,0(a3)
    800041d4:	ff100613          	li	a2,-15
    800041d8:	0047d69b          	srliw	a3,a5,0x4
    800041dc:	f8b40023          	sb	a1,-128(s0)
    800041e0:	0047d59b          	srliw	a1,a5,0x4
    800041e4:	0ac75e63          	bge	a4,a2,800042a0 <__printf+0x668>
    800041e8:	00f6f693          	andi	a3,a3,15
    800041ec:	00dd86b3          	add	a3,s11,a3
    800041f0:	0006c603          	lbu	a2,0(a3)
    800041f4:	00f00693          	li	a3,15
    800041f8:	0087d79b          	srliw	a5,a5,0x8
    800041fc:	f8c400a3          	sb	a2,-127(s0)
    80004200:	d8b6e4e3          	bltu	a3,a1,80003f88 <__printf+0x350>
    80004204:	00200793          	li	a5,2
    80004208:	e2dff06f          	j	80004034 <__printf+0x3fc>
    8000420c:	00002c97          	auipc	s9,0x2
    80004210:	0acc8c93          	addi	s9,s9,172 # 800062b8 <CONSOLE_STATUS+0x2a8>
    80004214:	02800513          	li	a0,40
    80004218:	ef1ff06f          	j	80004108 <__printf+0x4d0>
    8000421c:	00700793          	li	a5,7
    80004220:	00600c93          	li	s9,6
    80004224:	e0dff06f          	j	80004030 <__printf+0x3f8>
    80004228:	00700793          	li	a5,7
    8000422c:	00600c93          	li	s9,6
    80004230:	c69ff06f          	j	80003e98 <__printf+0x260>
    80004234:	00300793          	li	a5,3
    80004238:	00200c93          	li	s9,2
    8000423c:	c5dff06f          	j	80003e98 <__printf+0x260>
    80004240:	00300793          	li	a5,3
    80004244:	00200c93          	li	s9,2
    80004248:	de9ff06f          	j	80004030 <__printf+0x3f8>
    8000424c:	00400793          	li	a5,4
    80004250:	00300c93          	li	s9,3
    80004254:	dddff06f          	j	80004030 <__printf+0x3f8>
    80004258:	00400793          	li	a5,4
    8000425c:	00300c93          	li	s9,3
    80004260:	c39ff06f          	j	80003e98 <__printf+0x260>
    80004264:	00500793          	li	a5,5
    80004268:	00400c93          	li	s9,4
    8000426c:	c2dff06f          	j	80003e98 <__printf+0x260>
    80004270:	00500793          	li	a5,5
    80004274:	00400c93          	li	s9,4
    80004278:	db9ff06f          	j	80004030 <__printf+0x3f8>
    8000427c:	00600793          	li	a5,6
    80004280:	00500c93          	li	s9,5
    80004284:	dadff06f          	j	80004030 <__printf+0x3f8>
    80004288:	00600793          	li	a5,6
    8000428c:	00500c93          	li	s9,5
    80004290:	c09ff06f          	j	80003e98 <__printf+0x260>
    80004294:	00800793          	li	a5,8
    80004298:	00700c93          	li	s9,7
    8000429c:	bfdff06f          	j	80003e98 <__printf+0x260>
    800042a0:	00100793          	li	a5,1
    800042a4:	d91ff06f          	j	80004034 <__printf+0x3fc>
    800042a8:	00100793          	li	a5,1
    800042ac:	bf1ff06f          	j	80003e9c <__printf+0x264>
    800042b0:	00900793          	li	a5,9
    800042b4:	00800c93          	li	s9,8
    800042b8:	be1ff06f          	j	80003e98 <__printf+0x260>
    800042bc:	00002517          	auipc	a0,0x2
    800042c0:	00450513          	addi	a0,a0,4 # 800062c0 <CONSOLE_STATUS+0x2b0>
    800042c4:	00000097          	auipc	ra,0x0
    800042c8:	918080e7          	jalr	-1768(ra) # 80003bdc <panic>

00000000800042cc <printfinit>:
    800042cc:	fe010113          	addi	sp,sp,-32
    800042d0:	00813823          	sd	s0,16(sp)
    800042d4:	00913423          	sd	s1,8(sp)
    800042d8:	00113c23          	sd	ra,24(sp)
    800042dc:	02010413          	addi	s0,sp,32
    800042e0:	00004497          	auipc	s1,0x4
    800042e4:	0d048493          	addi	s1,s1,208 # 800083b0 <pr>
    800042e8:	00048513          	mv	a0,s1
    800042ec:	00002597          	auipc	a1,0x2
    800042f0:	fe458593          	addi	a1,a1,-28 # 800062d0 <CONSOLE_STATUS+0x2c0>
    800042f4:	00000097          	auipc	ra,0x0
    800042f8:	5f4080e7          	jalr	1524(ra) # 800048e8 <initlock>
    800042fc:	01813083          	ld	ra,24(sp)
    80004300:	01013403          	ld	s0,16(sp)
    80004304:	0004ac23          	sw	zero,24(s1)
    80004308:	00813483          	ld	s1,8(sp)
    8000430c:	02010113          	addi	sp,sp,32
    80004310:	00008067          	ret

0000000080004314 <uartinit>:
    80004314:	ff010113          	addi	sp,sp,-16
    80004318:	00813423          	sd	s0,8(sp)
    8000431c:	01010413          	addi	s0,sp,16
    80004320:	100007b7          	lui	a5,0x10000
    80004324:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004328:	f8000713          	li	a4,-128
    8000432c:	00e781a3          	sb	a4,3(a5)
    80004330:	00300713          	li	a4,3
    80004334:	00e78023          	sb	a4,0(a5)
    80004338:	000780a3          	sb	zero,1(a5)
    8000433c:	00e781a3          	sb	a4,3(a5)
    80004340:	00700693          	li	a3,7
    80004344:	00d78123          	sb	a3,2(a5)
    80004348:	00e780a3          	sb	a4,1(a5)
    8000434c:	00813403          	ld	s0,8(sp)
    80004350:	01010113          	addi	sp,sp,16
    80004354:	00008067          	ret

0000000080004358 <uartputc>:
    80004358:	00003797          	auipc	a5,0x3
    8000435c:	dc07a783          	lw	a5,-576(a5) # 80007118 <panicked>
    80004360:	00078463          	beqz	a5,80004368 <uartputc+0x10>
    80004364:	0000006f          	j	80004364 <uartputc+0xc>
    80004368:	fd010113          	addi	sp,sp,-48
    8000436c:	02813023          	sd	s0,32(sp)
    80004370:	00913c23          	sd	s1,24(sp)
    80004374:	01213823          	sd	s2,16(sp)
    80004378:	01313423          	sd	s3,8(sp)
    8000437c:	02113423          	sd	ra,40(sp)
    80004380:	03010413          	addi	s0,sp,48
    80004384:	00003917          	auipc	s2,0x3
    80004388:	d9c90913          	addi	s2,s2,-612 # 80007120 <uart_tx_r>
    8000438c:	00093783          	ld	a5,0(s2)
    80004390:	00003497          	auipc	s1,0x3
    80004394:	d9848493          	addi	s1,s1,-616 # 80007128 <uart_tx_w>
    80004398:	0004b703          	ld	a4,0(s1)
    8000439c:	02078693          	addi	a3,a5,32
    800043a0:	00050993          	mv	s3,a0
    800043a4:	02e69c63          	bne	a3,a4,800043dc <uartputc+0x84>
    800043a8:	00001097          	auipc	ra,0x1
    800043ac:	834080e7          	jalr	-1996(ra) # 80004bdc <push_on>
    800043b0:	00093783          	ld	a5,0(s2)
    800043b4:	0004b703          	ld	a4,0(s1)
    800043b8:	02078793          	addi	a5,a5,32
    800043bc:	00e79463          	bne	a5,a4,800043c4 <uartputc+0x6c>
    800043c0:	0000006f          	j	800043c0 <uartputc+0x68>
    800043c4:	00001097          	auipc	ra,0x1
    800043c8:	88c080e7          	jalr	-1908(ra) # 80004c50 <pop_on>
    800043cc:	00093783          	ld	a5,0(s2)
    800043d0:	0004b703          	ld	a4,0(s1)
    800043d4:	02078693          	addi	a3,a5,32
    800043d8:	fce688e3          	beq	a3,a4,800043a8 <uartputc+0x50>
    800043dc:	01f77693          	andi	a3,a4,31
    800043e0:	00004597          	auipc	a1,0x4
    800043e4:	ff058593          	addi	a1,a1,-16 # 800083d0 <uart_tx_buf>
    800043e8:	00d586b3          	add	a3,a1,a3
    800043ec:	00170713          	addi	a4,a4,1
    800043f0:	01368023          	sb	s3,0(a3)
    800043f4:	00e4b023          	sd	a4,0(s1)
    800043f8:	10000637          	lui	a2,0x10000
    800043fc:	02f71063          	bne	a4,a5,8000441c <uartputc+0xc4>
    80004400:	0340006f          	j	80004434 <uartputc+0xdc>
    80004404:	00074703          	lbu	a4,0(a4)
    80004408:	00f93023          	sd	a5,0(s2)
    8000440c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004410:	00093783          	ld	a5,0(s2)
    80004414:	0004b703          	ld	a4,0(s1)
    80004418:	00f70e63          	beq	a4,a5,80004434 <uartputc+0xdc>
    8000441c:	00564683          	lbu	a3,5(a2)
    80004420:	01f7f713          	andi	a4,a5,31
    80004424:	00e58733          	add	a4,a1,a4
    80004428:	0206f693          	andi	a3,a3,32
    8000442c:	00178793          	addi	a5,a5,1
    80004430:	fc069ae3          	bnez	a3,80004404 <uartputc+0xac>
    80004434:	02813083          	ld	ra,40(sp)
    80004438:	02013403          	ld	s0,32(sp)
    8000443c:	01813483          	ld	s1,24(sp)
    80004440:	01013903          	ld	s2,16(sp)
    80004444:	00813983          	ld	s3,8(sp)
    80004448:	03010113          	addi	sp,sp,48
    8000444c:	00008067          	ret

0000000080004450 <uartputc_sync>:
    80004450:	ff010113          	addi	sp,sp,-16
    80004454:	00813423          	sd	s0,8(sp)
    80004458:	01010413          	addi	s0,sp,16
    8000445c:	00003717          	auipc	a4,0x3
    80004460:	cbc72703          	lw	a4,-836(a4) # 80007118 <panicked>
    80004464:	02071663          	bnez	a4,80004490 <uartputc_sync+0x40>
    80004468:	00050793          	mv	a5,a0
    8000446c:	100006b7          	lui	a3,0x10000
    80004470:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004474:	02077713          	andi	a4,a4,32
    80004478:	fe070ce3          	beqz	a4,80004470 <uartputc_sync+0x20>
    8000447c:	0ff7f793          	andi	a5,a5,255
    80004480:	00f68023          	sb	a5,0(a3)
    80004484:	00813403          	ld	s0,8(sp)
    80004488:	01010113          	addi	sp,sp,16
    8000448c:	00008067          	ret
    80004490:	0000006f          	j	80004490 <uartputc_sync+0x40>

0000000080004494 <uartstart>:
    80004494:	ff010113          	addi	sp,sp,-16
    80004498:	00813423          	sd	s0,8(sp)
    8000449c:	01010413          	addi	s0,sp,16
    800044a0:	00003617          	auipc	a2,0x3
    800044a4:	c8060613          	addi	a2,a2,-896 # 80007120 <uart_tx_r>
    800044a8:	00003517          	auipc	a0,0x3
    800044ac:	c8050513          	addi	a0,a0,-896 # 80007128 <uart_tx_w>
    800044b0:	00063783          	ld	a5,0(a2)
    800044b4:	00053703          	ld	a4,0(a0)
    800044b8:	04f70263          	beq	a4,a5,800044fc <uartstart+0x68>
    800044bc:	100005b7          	lui	a1,0x10000
    800044c0:	00004817          	auipc	a6,0x4
    800044c4:	f1080813          	addi	a6,a6,-240 # 800083d0 <uart_tx_buf>
    800044c8:	01c0006f          	j	800044e4 <uartstart+0x50>
    800044cc:	0006c703          	lbu	a4,0(a3)
    800044d0:	00f63023          	sd	a5,0(a2)
    800044d4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800044d8:	00063783          	ld	a5,0(a2)
    800044dc:	00053703          	ld	a4,0(a0)
    800044e0:	00f70e63          	beq	a4,a5,800044fc <uartstart+0x68>
    800044e4:	01f7f713          	andi	a4,a5,31
    800044e8:	00e806b3          	add	a3,a6,a4
    800044ec:	0055c703          	lbu	a4,5(a1)
    800044f0:	00178793          	addi	a5,a5,1
    800044f4:	02077713          	andi	a4,a4,32
    800044f8:	fc071ae3          	bnez	a4,800044cc <uartstart+0x38>
    800044fc:	00813403          	ld	s0,8(sp)
    80004500:	01010113          	addi	sp,sp,16
    80004504:	00008067          	ret

0000000080004508 <uartgetc>:
    80004508:	ff010113          	addi	sp,sp,-16
    8000450c:	00813423          	sd	s0,8(sp)
    80004510:	01010413          	addi	s0,sp,16
    80004514:	10000737          	lui	a4,0x10000
    80004518:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000451c:	0017f793          	andi	a5,a5,1
    80004520:	00078c63          	beqz	a5,80004538 <uartgetc+0x30>
    80004524:	00074503          	lbu	a0,0(a4)
    80004528:	0ff57513          	andi	a0,a0,255
    8000452c:	00813403          	ld	s0,8(sp)
    80004530:	01010113          	addi	sp,sp,16
    80004534:	00008067          	ret
    80004538:	fff00513          	li	a0,-1
    8000453c:	ff1ff06f          	j	8000452c <uartgetc+0x24>

0000000080004540 <uartintr>:
    80004540:	100007b7          	lui	a5,0x10000
    80004544:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004548:	0017f793          	andi	a5,a5,1
    8000454c:	0a078463          	beqz	a5,800045f4 <uartintr+0xb4>
    80004550:	fe010113          	addi	sp,sp,-32
    80004554:	00813823          	sd	s0,16(sp)
    80004558:	00913423          	sd	s1,8(sp)
    8000455c:	00113c23          	sd	ra,24(sp)
    80004560:	02010413          	addi	s0,sp,32
    80004564:	100004b7          	lui	s1,0x10000
    80004568:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000456c:	0ff57513          	andi	a0,a0,255
    80004570:	fffff097          	auipc	ra,0xfffff
    80004574:	534080e7          	jalr	1332(ra) # 80003aa4 <consoleintr>
    80004578:	0054c783          	lbu	a5,5(s1)
    8000457c:	0017f793          	andi	a5,a5,1
    80004580:	fe0794e3          	bnez	a5,80004568 <uartintr+0x28>
    80004584:	00003617          	auipc	a2,0x3
    80004588:	b9c60613          	addi	a2,a2,-1124 # 80007120 <uart_tx_r>
    8000458c:	00003517          	auipc	a0,0x3
    80004590:	b9c50513          	addi	a0,a0,-1124 # 80007128 <uart_tx_w>
    80004594:	00063783          	ld	a5,0(a2)
    80004598:	00053703          	ld	a4,0(a0)
    8000459c:	04f70263          	beq	a4,a5,800045e0 <uartintr+0xa0>
    800045a0:	100005b7          	lui	a1,0x10000
    800045a4:	00004817          	auipc	a6,0x4
    800045a8:	e2c80813          	addi	a6,a6,-468 # 800083d0 <uart_tx_buf>
    800045ac:	01c0006f          	j	800045c8 <uartintr+0x88>
    800045b0:	0006c703          	lbu	a4,0(a3)
    800045b4:	00f63023          	sd	a5,0(a2)
    800045b8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800045bc:	00063783          	ld	a5,0(a2)
    800045c0:	00053703          	ld	a4,0(a0)
    800045c4:	00f70e63          	beq	a4,a5,800045e0 <uartintr+0xa0>
    800045c8:	01f7f713          	andi	a4,a5,31
    800045cc:	00e806b3          	add	a3,a6,a4
    800045d0:	0055c703          	lbu	a4,5(a1)
    800045d4:	00178793          	addi	a5,a5,1
    800045d8:	02077713          	andi	a4,a4,32
    800045dc:	fc071ae3          	bnez	a4,800045b0 <uartintr+0x70>
    800045e0:	01813083          	ld	ra,24(sp)
    800045e4:	01013403          	ld	s0,16(sp)
    800045e8:	00813483          	ld	s1,8(sp)
    800045ec:	02010113          	addi	sp,sp,32
    800045f0:	00008067          	ret
    800045f4:	00003617          	auipc	a2,0x3
    800045f8:	b2c60613          	addi	a2,a2,-1236 # 80007120 <uart_tx_r>
    800045fc:	00003517          	auipc	a0,0x3
    80004600:	b2c50513          	addi	a0,a0,-1236 # 80007128 <uart_tx_w>
    80004604:	00063783          	ld	a5,0(a2)
    80004608:	00053703          	ld	a4,0(a0)
    8000460c:	04f70263          	beq	a4,a5,80004650 <uartintr+0x110>
    80004610:	100005b7          	lui	a1,0x10000
    80004614:	00004817          	auipc	a6,0x4
    80004618:	dbc80813          	addi	a6,a6,-580 # 800083d0 <uart_tx_buf>
    8000461c:	01c0006f          	j	80004638 <uartintr+0xf8>
    80004620:	0006c703          	lbu	a4,0(a3)
    80004624:	00f63023          	sd	a5,0(a2)
    80004628:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000462c:	00063783          	ld	a5,0(a2)
    80004630:	00053703          	ld	a4,0(a0)
    80004634:	02f70063          	beq	a4,a5,80004654 <uartintr+0x114>
    80004638:	01f7f713          	andi	a4,a5,31
    8000463c:	00e806b3          	add	a3,a6,a4
    80004640:	0055c703          	lbu	a4,5(a1)
    80004644:	00178793          	addi	a5,a5,1
    80004648:	02077713          	andi	a4,a4,32
    8000464c:	fc071ae3          	bnez	a4,80004620 <uartintr+0xe0>
    80004650:	00008067          	ret
    80004654:	00008067          	ret

0000000080004658 <kinit>:
    80004658:	fc010113          	addi	sp,sp,-64
    8000465c:	02913423          	sd	s1,40(sp)
    80004660:	fffff7b7          	lui	a5,0xfffff
    80004664:	00005497          	auipc	s1,0x5
    80004668:	d8b48493          	addi	s1,s1,-629 # 800093ef <end+0xfff>
    8000466c:	02813823          	sd	s0,48(sp)
    80004670:	01313c23          	sd	s3,24(sp)
    80004674:	00f4f4b3          	and	s1,s1,a5
    80004678:	02113c23          	sd	ra,56(sp)
    8000467c:	03213023          	sd	s2,32(sp)
    80004680:	01413823          	sd	s4,16(sp)
    80004684:	01513423          	sd	s5,8(sp)
    80004688:	04010413          	addi	s0,sp,64
    8000468c:	000017b7          	lui	a5,0x1
    80004690:	01100993          	li	s3,17
    80004694:	00f487b3          	add	a5,s1,a5
    80004698:	01b99993          	slli	s3,s3,0x1b
    8000469c:	06f9e063          	bltu	s3,a5,800046fc <kinit+0xa4>
    800046a0:	00004a97          	auipc	s5,0x4
    800046a4:	d50a8a93          	addi	s5,s5,-688 # 800083f0 <end>
    800046a8:	0754ec63          	bltu	s1,s5,80004720 <kinit+0xc8>
    800046ac:	0734fa63          	bgeu	s1,s3,80004720 <kinit+0xc8>
    800046b0:	00088a37          	lui	s4,0x88
    800046b4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800046b8:	00003917          	auipc	s2,0x3
    800046bc:	a7890913          	addi	s2,s2,-1416 # 80007130 <kmem>
    800046c0:	00ca1a13          	slli	s4,s4,0xc
    800046c4:	0140006f          	j	800046d8 <kinit+0x80>
    800046c8:	000017b7          	lui	a5,0x1
    800046cc:	00f484b3          	add	s1,s1,a5
    800046d0:	0554e863          	bltu	s1,s5,80004720 <kinit+0xc8>
    800046d4:	0534f663          	bgeu	s1,s3,80004720 <kinit+0xc8>
    800046d8:	00001637          	lui	a2,0x1
    800046dc:	00100593          	li	a1,1
    800046e0:	00048513          	mv	a0,s1
    800046e4:	00000097          	auipc	ra,0x0
    800046e8:	5e4080e7          	jalr	1508(ra) # 80004cc8 <__memset>
    800046ec:	00093783          	ld	a5,0(s2)
    800046f0:	00f4b023          	sd	a5,0(s1)
    800046f4:	00993023          	sd	s1,0(s2)
    800046f8:	fd4498e3          	bne	s1,s4,800046c8 <kinit+0x70>
    800046fc:	03813083          	ld	ra,56(sp)
    80004700:	03013403          	ld	s0,48(sp)
    80004704:	02813483          	ld	s1,40(sp)
    80004708:	02013903          	ld	s2,32(sp)
    8000470c:	01813983          	ld	s3,24(sp)
    80004710:	01013a03          	ld	s4,16(sp)
    80004714:	00813a83          	ld	s5,8(sp)
    80004718:	04010113          	addi	sp,sp,64
    8000471c:	00008067          	ret
    80004720:	00002517          	auipc	a0,0x2
    80004724:	bd050513          	addi	a0,a0,-1072 # 800062f0 <digits+0x18>
    80004728:	fffff097          	auipc	ra,0xfffff
    8000472c:	4b4080e7          	jalr	1204(ra) # 80003bdc <panic>

0000000080004730 <freerange>:
    80004730:	fc010113          	addi	sp,sp,-64
    80004734:	000017b7          	lui	a5,0x1
    80004738:	02913423          	sd	s1,40(sp)
    8000473c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004740:	009504b3          	add	s1,a0,s1
    80004744:	fffff537          	lui	a0,0xfffff
    80004748:	02813823          	sd	s0,48(sp)
    8000474c:	02113c23          	sd	ra,56(sp)
    80004750:	03213023          	sd	s2,32(sp)
    80004754:	01313c23          	sd	s3,24(sp)
    80004758:	01413823          	sd	s4,16(sp)
    8000475c:	01513423          	sd	s5,8(sp)
    80004760:	01613023          	sd	s6,0(sp)
    80004764:	04010413          	addi	s0,sp,64
    80004768:	00a4f4b3          	and	s1,s1,a0
    8000476c:	00f487b3          	add	a5,s1,a5
    80004770:	06f5e463          	bltu	a1,a5,800047d8 <freerange+0xa8>
    80004774:	00004a97          	auipc	s5,0x4
    80004778:	c7ca8a93          	addi	s5,s5,-900 # 800083f0 <end>
    8000477c:	0954e263          	bltu	s1,s5,80004800 <freerange+0xd0>
    80004780:	01100993          	li	s3,17
    80004784:	01b99993          	slli	s3,s3,0x1b
    80004788:	0734fc63          	bgeu	s1,s3,80004800 <freerange+0xd0>
    8000478c:	00058a13          	mv	s4,a1
    80004790:	00003917          	auipc	s2,0x3
    80004794:	9a090913          	addi	s2,s2,-1632 # 80007130 <kmem>
    80004798:	00002b37          	lui	s6,0x2
    8000479c:	0140006f          	j	800047b0 <freerange+0x80>
    800047a0:	000017b7          	lui	a5,0x1
    800047a4:	00f484b3          	add	s1,s1,a5
    800047a8:	0554ec63          	bltu	s1,s5,80004800 <freerange+0xd0>
    800047ac:	0534fa63          	bgeu	s1,s3,80004800 <freerange+0xd0>
    800047b0:	00001637          	lui	a2,0x1
    800047b4:	00100593          	li	a1,1
    800047b8:	00048513          	mv	a0,s1
    800047bc:	00000097          	auipc	ra,0x0
    800047c0:	50c080e7          	jalr	1292(ra) # 80004cc8 <__memset>
    800047c4:	00093703          	ld	a4,0(s2)
    800047c8:	016487b3          	add	a5,s1,s6
    800047cc:	00e4b023          	sd	a4,0(s1)
    800047d0:	00993023          	sd	s1,0(s2)
    800047d4:	fcfa76e3          	bgeu	s4,a5,800047a0 <freerange+0x70>
    800047d8:	03813083          	ld	ra,56(sp)
    800047dc:	03013403          	ld	s0,48(sp)
    800047e0:	02813483          	ld	s1,40(sp)
    800047e4:	02013903          	ld	s2,32(sp)
    800047e8:	01813983          	ld	s3,24(sp)
    800047ec:	01013a03          	ld	s4,16(sp)
    800047f0:	00813a83          	ld	s5,8(sp)
    800047f4:	00013b03          	ld	s6,0(sp)
    800047f8:	04010113          	addi	sp,sp,64
    800047fc:	00008067          	ret
    80004800:	00002517          	auipc	a0,0x2
    80004804:	af050513          	addi	a0,a0,-1296 # 800062f0 <digits+0x18>
    80004808:	fffff097          	auipc	ra,0xfffff
    8000480c:	3d4080e7          	jalr	980(ra) # 80003bdc <panic>

0000000080004810 <kfree>:
    80004810:	fe010113          	addi	sp,sp,-32
    80004814:	00813823          	sd	s0,16(sp)
    80004818:	00113c23          	sd	ra,24(sp)
    8000481c:	00913423          	sd	s1,8(sp)
    80004820:	02010413          	addi	s0,sp,32
    80004824:	03451793          	slli	a5,a0,0x34
    80004828:	04079c63          	bnez	a5,80004880 <kfree+0x70>
    8000482c:	00004797          	auipc	a5,0x4
    80004830:	bc478793          	addi	a5,a5,-1084 # 800083f0 <end>
    80004834:	00050493          	mv	s1,a0
    80004838:	04f56463          	bltu	a0,a5,80004880 <kfree+0x70>
    8000483c:	01100793          	li	a5,17
    80004840:	01b79793          	slli	a5,a5,0x1b
    80004844:	02f57e63          	bgeu	a0,a5,80004880 <kfree+0x70>
    80004848:	00001637          	lui	a2,0x1
    8000484c:	00100593          	li	a1,1
    80004850:	00000097          	auipc	ra,0x0
    80004854:	478080e7          	jalr	1144(ra) # 80004cc8 <__memset>
    80004858:	00003797          	auipc	a5,0x3
    8000485c:	8d878793          	addi	a5,a5,-1832 # 80007130 <kmem>
    80004860:	0007b703          	ld	a4,0(a5)
    80004864:	01813083          	ld	ra,24(sp)
    80004868:	01013403          	ld	s0,16(sp)
    8000486c:	00e4b023          	sd	a4,0(s1)
    80004870:	0097b023          	sd	s1,0(a5)
    80004874:	00813483          	ld	s1,8(sp)
    80004878:	02010113          	addi	sp,sp,32
    8000487c:	00008067          	ret
    80004880:	00002517          	auipc	a0,0x2
    80004884:	a7050513          	addi	a0,a0,-1424 # 800062f0 <digits+0x18>
    80004888:	fffff097          	auipc	ra,0xfffff
    8000488c:	354080e7          	jalr	852(ra) # 80003bdc <panic>

0000000080004890 <kalloc>:
    80004890:	fe010113          	addi	sp,sp,-32
    80004894:	00813823          	sd	s0,16(sp)
    80004898:	00913423          	sd	s1,8(sp)
    8000489c:	00113c23          	sd	ra,24(sp)
    800048a0:	02010413          	addi	s0,sp,32
    800048a4:	00003797          	auipc	a5,0x3
    800048a8:	88c78793          	addi	a5,a5,-1908 # 80007130 <kmem>
    800048ac:	0007b483          	ld	s1,0(a5)
    800048b0:	02048063          	beqz	s1,800048d0 <kalloc+0x40>
    800048b4:	0004b703          	ld	a4,0(s1)
    800048b8:	00001637          	lui	a2,0x1
    800048bc:	00500593          	li	a1,5
    800048c0:	00048513          	mv	a0,s1
    800048c4:	00e7b023          	sd	a4,0(a5)
    800048c8:	00000097          	auipc	ra,0x0
    800048cc:	400080e7          	jalr	1024(ra) # 80004cc8 <__memset>
    800048d0:	01813083          	ld	ra,24(sp)
    800048d4:	01013403          	ld	s0,16(sp)
    800048d8:	00048513          	mv	a0,s1
    800048dc:	00813483          	ld	s1,8(sp)
    800048e0:	02010113          	addi	sp,sp,32
    800048e4:	00008067          	ret

00000000800048e8 <initlock>:
    800048e8:	ff010113          	addi	sp,sp,-16
    800048ec:	00813423          	sd	s0,8(sp)
    800048f0:	01010413          	addi	s0,sp,16
    800048f4:	00813403          	ld	s0,8(sp)
    800048f8:	00b53423          	sd	a1,8(a0)
    800048fc:	00052023          	sw	zero,0(a0)
    80004900:	00053823          	sd	zero,16(a0)
    80004904:	01010113          	addi	sp,sp,16
    80004908:	00008067          	ret

000000008000490c <acquire>:
    8000490c:	fe010113          	addi	sp,sp,-32
    80004910:	00813823          	sd	s0,16(sp)
    80004914:	00913423          	sd	s1,8(sp)
    80004918:	00113c23          	sd	ra,24(sp)
    8000491c:	01213023          	sd	s2,0(sp)
    80004920:	02010413          	addi	s0,sp,32
    80004924:	00050493          	mv	s1,a0
    80004928:	10002973          	csrr	s2,sstatus
    8000492c:	100027f3          	csrr	a5,sstatus
    80004930:	ffd7f793          	andi	a5,a5,-3
    80004934:	10079073          	csrw	sstatus,a5
    80004938:	fffff097          	auipc	ra,0xfffff
    8000493c:	8e4080e7          	jalr	-1820(ra) # 8000321c <mycpu>
    80004940:	07852783          	lw	a5,120(a0)
    80004944:	06078e63          	beqz	a5,800049c0 <acquire+0xb4>
    80004948:	fffff097          	auipc	ra,0xfffff
    8000494c:	8d4080e7          	jalr	-1836(ra) # 8000321c <mycpu>
    80004950:	07852783          	lw	a5,120(a0)
    80004954:	0004a703          	lw	a4,0(s1)
    80004958:	0017879b          	addiw	a5,a5,1
    8000495c:	06f52c23          	sw	a5,120(a0)
    80004960:	04071063          	bnez	a4,800049a0 <acquire+0x94>
    80004964:	00100713          	li	a4,1
    80004968:	00070793          	mv	a5,a4
    8000496c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004970:	0007879b          	sext.w	a5,a5
    80004974:	fe079ae3          	bnez	a5,80004968 <acquire+0x5c>
    80004978:	0ff0000f          	fence
    8000497c:	fffff097          	auipc	ra,0xfffff
    80004980:	8a0080e7          	jalr	-1888(ra) # 8000321c <mycpu>
    80004984:	01813083          	ld	ra,24(sp)
    80004988:	01013403          	ld	s0,16(sp)
    8000498c:	00a4b823          	sd	a0,16(s1)
    80004990:	00013903          	ld	s2,0(sp)
    80004994:	00813483          	ld	s1,8(sp)
    80004998:	02010113          	addi	sp,sp,32
    8000499c:	00008067          	ret
    800049a0:	0104b903          	ld	s2,16(s1)
    800049a4:	fffff097          	auipc	ra,0xfffff
    800049a8:	878080e7          	jalr	-1928(ra) # 8000321c <mycpu>
    800049ac:	faa91ce3          	bne	s2,a0,80004964 <acquire+0x58>
    800049b0:	00002517          	auipc	a0,0x2
    800049b4:	94850513          	addi	a0,a0,-1720 # 800062f8 <digits+0x20>
    800049b8:	fffff097          	auipc	ra,0xfffff
    800049bc:	224080e7          	jalr	548(ra) # 80003bdc <panic>
    800049c0:	00195913          	srli	s2,s2,0x1
    800049c4:	fffff097          	auipc	ra,0xfffff
    800049c8:	858080e7          	jalr	-1960(ra) # 8000321c <mycpu>
    800049cc:	00197913          	andi	s2,s2,1
    800049d0:	07252e23          	sw	s2,124(a0)
    800049d4:	f75ff06f          	j	80004948 <acquire+0x3c>

00000000800049d8 <release>:
    800049d8:	fe010113          	addi	sp,sp,-32
    800049dc:	00813823          	sd	s0,16(sp)
    800049e0:	00113c23          	sd	ra,24(sp)
    800049e4:	00913423          	sd	s1,8(sp)
    800049e8:	01213023          	sd	s2,0(sp)
    800049ec:	02010413          	addi	s0,sp,32
    800049f0:	00052783          	lw	a5,0(a0)
    800049f4:	00079a63          	bnez	a5,80004a08 <release+0x30>
    800049f8:	00002517          	auipc	a0,0x2
    800049fc:	90850513          	addi	a0,a0,-1784 # 80006300 <digits+0x28>
    80004a00:	fffff097          	auipc	ra,0xfffff
    80004a04:	1dc080e7          	jalr	476(ra) # 80003bdc <panic>
    80004a08:	01053903          	ld	s2,16(a0)
    80004a0c:	00050493          	mv	s1,a0
    80004a10:	fffff097          	auipc	ra,0xfffff
    80004a14:	80c080e7          	jalr	-2036(ra) # 8000321c <mycpu>
    80004a18:	fea910e3          	bne	s2,a0,800049f8 <release+0x20>
    80004a1c:	0004b823          	sd	zero,16(s1)
    80004a20:	0ff0000f          	fence
    80004a24:	0f50000f          	fence	iorw,ow
    80004a28:	0804a02f          	amoswap.w	zero,zero,(s1)
    80004a2c:	ffffe097          	auipc	ra,0xffffe
    80004a30:	7f0080e7          	jalr	2032(ra) # 8000321c <mycpu>
    80004a34:	100027f3          	csrr	a5,sstatus
    80004a38:	0027f793          	andi	a5,a5,2
    80004a3c:	04079a63          	bnez	a5,80004a90 <release+0xb8>
    80004a40:	07852783          	lw	a5,120(a0)
    80004a44:	02f05e63          	blez	a5,80004a80 <release+0xa8>
    80004a48:	fff7871b          	addiw	a4,a5,-1
    80004a4c:	06e52c23          	sw	a4,120(a0)
    80004a50:	00071c63          	bnez	a4,80004a68 <release+0x90>
    80004a54:	07c52783          	lw	a5,124(a0)
    80004a58:	00078863          	beqz	a5,80004a68 <release+0x90>
    80004a5c:	100027f3          	csrr	a5,sstatus
    80004a60:	0027e793          	ori	a5,a5,2
    80004a64:	10079073          	csrw	sstatus,a5
    80004a68:	01813083          	ld	ra,24(sp)
    80004a6c:	01013403          	ld	s0,16(sp)
    80004a70:	00813483          	ld	s1,8(sp)
    80004a74:	00013903          	ld	s2,0(sp)
    80004a78:	02010113          	addi	sp,sp,32
    80004a7c:	00008067          	ret
    80004a80:	00002517          	auipc	a0,0x2
    80004a84:	8a050513          	addi	a0,a0,-1888 # 80006320 <digits+0x48>
    80004a88:	fffff097          	auipc	ra,0xfffff
    80004a8c:	154080e7          	jalr	340(ra) # 80003bdc <panic>
    80004a90:	00002517          	auipc	a0,0x2
    80004a94:	87850513          	addi	a0,a0,-1928 # 80006308 <digits+0x30>
    80004a98:	fffff097          	auipc	ra,0xfffff
    80004a9c:	144080e7          	jalr	324(ra) # 80003bdc <panic>

0000000080004aa0 <holding>:
    80004aa0:	00052783          	lw	a5,0(a0)
    80004aa4:	00079663          	bnez	a5,80004ab0 <holding+0x10>
    80004aa8:	00000513          	li	a0,0
    80004aac:	00008067          	ret
    80004ab0:	fe010113          	addi	sp,sp,-32
    80004ab4:	00813823          	sd	s0,16(sp)
    80004ab8:	00913423          	sd	s1,8(sp)
    80004abc:	00113c23          	sd	ra,24(sp)
    80004ac0:	02010413          	addi	s0,sp,32
    80004ac4:	01053483          	ld	s1,16(a0)
    80004ac8:	ffffe097          	auipc	ra,0xffffe
    80004acc:	754080e7          	jalr	1876(ra) # 8000321c <mycpu>
    80004ad0:	01813083          	ld	ra,24(sp)
    80004ad4:	01013403          	ld	s0,16(sp)
    80004ad8:	40a48533          	sub	a0,s1,a0
    80004adc:	00153513          	seqz	a0,a0
    80004ae0:	00813483          	ld	s1,8(sp)
    80004ae4:	02010113          	addi	sp,sp,32
    80004ae8:	00008067          	ret

0000000080004aec <push_off>:
    80004aec:	fe010113          	addi	sp,sp,-32
    80004af0:	00813823          	sd	s0,16(sp)
    80004af4:	00113c23          	sd	ra,24(sp)
    80004af8:	00913423          	sd	s1,8(sp)
    80004afc:	02010413          	addi	s0,sp,32
    80004b00:	100024f3          	csrr	s1,sstatus
    80004b04:	100027f3          	csrr	a5,sstatus
    80004b08:	ffd7f793          	andi	a5,a5,-3
    80004b0c:	10079073          	csrw	sstatus,a5
    80004b10:	ffffe097          	auipc	ra,0xffffe
    80004b14:	70c080e7          	jalr	1804(ra) # 8000321c <mycpu>
    80004b18:	07852783          	lw	a5,120(a0)
    80004b1c:	02078663          	beqz	a5,80004b48 <push_off+0x5c>
    80004b20:	ffffe097          	auipc	ra,0xffffe
    80004b24:	6fc080e7          	jalr	1788(ra) # 8000321c <mycpu>
    80004b28:	07852783          	lw	a5,120(a0)
    80004b2c:	01813083          	ld	ra,24(sp)
    80004b30:	01013403          	ld	s0,16(sp)
    80004b34:	0017879b          	addiw	a5,a5,1
    80004b38:	06f52c23          	sw	a5,120(a0)
    80004b3c:	00813483          	ld	s1,8(sp)
    80004b40:	02010113          	addi	sp,sp,32
    80004b44:	00008067          	ret
    80004b48:	0014d493          	srli	s1,s1,0x1
    80004b4c:	ffffe097          	auipc	ra,0xffffe
    80004b50:	6d0080e7          	jalr	1744(ra) # 8000321c <mycpu>
    80004b54:	0014f493          	andi	s1,s1,1
    80004b58:	06952e23          	sw	s1,124(a0)
    80004b5c:	fc5ff06f          	j	80004b20 <push_off+0x34>

0000000080004b60 <pop_off>:
    80004b60:	ff010113          	addi	sp,sp,-16
    80004b64:	00813023          	sd	s0,0(sp)
    80004b68:	00113423          	sd	ra,8(sp)
    80004b6c:	01010413          	addi	s0,sp,16
    80004b70:	ffffe097          	auipc	ra,0xffffe
    80004b74:	6ac080e7          	jalr	1708(ra) # 8000321c <mycpu>
    80004b78:	100027f3          	csrr	a5,sstatus
    80004b7c:	0027f793          	andi	a5,a5,2
    80004b80:	04079663          	bnez	a5,80004bcc <pop_off+0x6c>
    80004b84:	07852783          	lw	a5,120(a0)
    80004b88:	02f05a63          	blez	a5,80004bbc <pop_off+0x5c>
    80004b8c:	fff7871b          	addiw	a4,a5,-1
    80004b90:	06e52c23          	sw	a4,120(a0)
    80004b94:	00071c63          	bnez	a4,80004bac <pop_off+0x4c>
    80004b98:	07c52783          	lw	a5,124(a0)
    80004b9c:	00078863          	beqz	a5,80004bac <pop_off+0x4c>
    80004ba0:	100027f3          	csrr	a5,sstatus
    80004ba4:	0027e793          	ori	a5,a5,2
    80004ba8:	10079073          	csrw	sstatus,a5
    80004bac:	00813083          	ld	ra,8(sp)
    80004bb0:	00013403          	ld	s0,0(sp)
    80004bb4:	01010113          	addi	sp,sp,16
    80004bb8:	00008067          	ret
    80004bbc:	00001517          	auipc	a0,0x1
    80004bc0:	76450513          	addi	a0,a0,1892 # 80006320 <digits+0x48>
    80004bc4:	fffff097          	auipc	ra,0xfffff
    80004bc8:	018080e7          	jalr	24(ra) # 80003bdc <panic>
    80004bcc:	00001517          	auipc	a0,0x1
    80004bd0:	73c50513          	addi	a0,a0,1852 # 80006308 <digits+0x30>
    80004bd4:	fffff097          	auipc	ra,0xfffff
    80004bd8:	008080e7          	jalr	8(ra) # 80003bdc <panic>

0000000080004bdc <push_on>:
    80004bdc:	fe010113          	addi	sp,sp,-32
    80004be0:	00813823          	sd	s0,16(sp)
    80004be4:	00113c23          	sd	ra,24(sp)
    80004be8:	00913423          	sd	s1,8(sp)
    80004bec:	02010413          	addi	s0,sp,32
    80004bf0:	100024f3          	csrr	s1,sstatus
    80004bf4:	100027f3          	csrr	a5,sstatus
    80004bf8:	0027e793          	ori	a5,a5,2
    80004bfc:	10079073          	csrw	sstatus,a5
    80004c00:	ffffe097          	auipc	ra,0xffffe
    80004c04:	61c080e7          	jalr	1564(ra) # 8000321c <mycpu>
    80004c08:	07852783          	lw	a5,120(a0)
    80004c0c:	02078663          	beqz	a5,80004c38 <push_on+0x5c>
    80004c10:	ffffe097          	auipc	ra,0xffffe
    80004c14:	60c080e7          	jalr	1548(ra) # 8000321c <mycpu>
    80004c18:	07852783          	lw	a5,120(a0)
    80004c1c:	01813083          	ld	ra,24(sp)
    80004c20:	01013403          	ld	s0,16(sp)
    80004c24:	0017879b          	addiw	a5,a5,1
    80004c28:	06f52c23          	sw	a5,120(a0)
    80004c2c:	00813483          	ld	s1,8(sp)
    80004c30:	02010113          	addi	sp,sp,32
    80004c34:	00008067          	ret
    80004c38:	0014d493          	srli	s1,s1,0x1
    80004c3c:	ffffe097          	auipc	ra,0xffffe
    80004c40:	5e0080e7          	jalr	1504(ra) # 8000321c <mycpu>
    80004c44:	0014f493          	andi	s1,s1,1
    80004c48:	06952e23          	sw	s1,124(a0)
    80004c4c:	fc5ff06f          	j	80004c10 <push_on+0x34>

0000000080004c50 <pop_on>:
    80004c50:	ff010113          	addi	sp,sp,-16
    80004c54:	00813023          	sd	s0,0(sp)
    80004c58:	00113423          	sd	ra,8(sp)
    80004c5c:	01010413          	addi	s0,sp,16
    80004c60:	ffffe097          	auipc	ra,0xffffe
    80004c64:	5bc080e7          	jalr	1468(ra) # 8000321c <mycpu>
    80004c68:	100027f3          	csrr	a5,sstatus
    80004c6c:	0027f793          	andi	a5,a5,2
    80004c70:	04078463          	beqz	a5,80004cb8 <pop_on+0x68>
    80004c74:	07852783          	lw	a5,120(a0)
    80004c78:	02f05863          	blez	a5,80004ca8 <pop_on+0x58>
    80004c7c:	fff7879b          	addiw	a5,a5,-1
    80004c80:	06f52c23          	sw	a5,120(a0)
    80004c84:	07853783          	ld	a5,120(a0)
    80004c88:	00079863          	bnez	a5,80004c98 <pop_on+0x48>
    80004c8c:	100027f3          	csrr	a5,sstatus
    80004c90:	ffd7f793          	andi	a5,a5,-3
    80004c94:	10079073          	csrw	sstatus,a5
    80004c98:	00813083          	ld	ra,8(sp)
    80004c9c:	00013403          	ld	s0,0(sp)
    80004ca0:	01010113          	addi	sp,sp,16
    80004ca4:	00008067          	ret
    80004ca8:	00001517          	auipc	a0,0x1
    80004cac:	6a050513          	addi	a0,a0,1696 # 80006348 <digits+0x70>
    80004cb0:	fffff097          	auipc	ra,0xfffff
    80004cb4:	f2c080e7          	jalr	-212(ra) # 80003bdc <panic>
    80004cb8:	00001517          	auipc	a0,0x1
    80004cbc:	67050513          	addi	a0,a0,1648 # 80006328 <digits+0x50>
    80004cc0:	fffff097          	auipc	ra,0xfffff
    80004cc4:	f1c080e7          	jalr	-228(ra) # 80003bdc <panic>

0000000080004cc8 <__memset>:
    80004cc8:	ff010113          	addi	sp,sp,-16
    80004ccc:	00813423          	sd	s0,8(sp)
    80004cd0:	01010413          	addi	s0,sp,16
    80004cd4:	1a060e63          	beqz	a2,80004e90 <__memset+0x1c8>
    80004cd8:	40a007b3          	neg	a5,a0
    80004cdc:	0077f793          	andi	a5,a5,7
    80004ce0:	00778693          	addi	a3,a5,7
    80004ce4:	00b00813          	li	a6,11
    80004ce8:	0ff5f593          	andi	a1,a1,255
    80004cec:	fff6071b          	addiw	a4,a2,-1
    80004cf0:	1b06e663          	bltu	a3,a6,80004e9c <__memset+0x1d4>
    80004cf4:	1cd76463          	bltu	a4,a3,80004ebc <__memset+0x1f4>
    80004cf8:	1a078e63          	beqz	a5,80004eb4 <__memset+0x1ec>
    80004cfc:	00b50023          	sb	a1,0(a0)
    80004d00:	00100713          	li	a4,1
    80004d04:	1ae78463          	beq	a5,a4,80004eac <__memset+0x1e4>
    80004d08:	00b500a3          	sb	a1,1(a0)
    80004d0c:	00200713          	li	a4,2
    80004d10:	1ae78a63          	beq	a5,a4,80004ec4 <__memset+0x1fc>
    80004d14:	00b50123          	sb	a1,2(a0)
    80004d18:	00300713          	li	a4,3
    80004d1c:	18e78463          	beq	a5,a4,80004ea4 <__memset+0x1dc>
    80004d20:	00b501a3          	sb	a1,3(a0)
    80004d24:	00400713          	li	a4,4
    80004d28:	1ae78263          	beq	a5,a4,80004ecc <__memset+0x204>
    80004d2c:	00b50223          	sb	a1,4(a0)
    80004d30:	00500713          	li	a4,5
    80004d34:	1ae78063          	beq	a5,a4,80004ed4 <__memset+0x20c>
    80004d38:	00b502a3          	sb	a1,5(a0)
    80004d3c:	00700713          	li	a4,7
    80004d40:	18e79e63          	bne	a5,a4,80004edc <__memset+0x214>
    80004d44:	00b50323          	sb	a1,6(a0)
    80004d48:	00700e93          	li	t4,7
    80004d4c:	00859713          	slli	a4,a1,0x8
    80004d50:	00e5e733          	or	a4,a1,a4
    80004d54:	01059e13          	slli	t3,a1,0x10
    80004d58:	01c76e33          	or	t3,a4,t3
    80004d5c:	01859313          	slli	t1,a1,0x18
    80004d60:	006e6333          	or	t1,t3,t1
    80004d64:	02059893          	slli	a7,a1,0x20
    80004d68:	40f60e3b          	subw	t3,a2,a5
    80004d6c:	011368b3          	or	a7,t1,a7
    80004d70:	02859813          	slli	a6,a1,0x28
    80004d74:	0108e833          	or	a6,a7,a6
    80004d78:	03059693          	slli	a3,a1,0x30
    80004d7c:	003e589b          	srliw	a7,t3,0x3
    80004d80:	00d866b3          	or	a3,a6,a3
    80004d84:	03859713          	slli	a4,a1,0x38
    80004d88:	00389813          	slli	a6,a7,0x3
    80004d8c:	00f507b3          	add	a5,a0,a5
    80004d90:	00e6e733          	or	a4,a3,a4
    80004d94:	000e089b          	sext.w	a7,t3
    80004d98:	00f806b3          	add	a3,a6,a5
    80004d9c:	00e7b023          	sd	a4,0(a5)
    80004da0:	00878793          	addi	a5,a5,8
    80004da4:	fed79ce3          	bne	a5,a3,80004d9c <__memset+0xd4>
    80004da8:	ff8e7793          	andi	a5,t3,-8
    80004dac:	0007871b          	sext.w	a4,a5
    80004db0:	01d787bb          	addw	a5,a5,t4
    80004db4:	0ce88e63          	beq	a7,a4,80004e90 <__memset+0x1c8>
    80004db8:	00f50733          	add	a4,a0,a5
    80004dbc:	00b70023          	sb	a1,0(a4)
    80004dc0:	0017871b          	addiw	a4,a5,1
    80004dc4:	0cc77663          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004dc8:	00e50733          	add	a4,a0,a4
    80004dcc:	00b70023          	sb	a1,0(a4)
    80004dd0:	0027871b          	addiw	a4,a5,2
    80004dd4:	0ac77e63          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004dd8:	00e50733          	add	a4,a0,a4
    80004ddc:	00b70023          	sb	a1,0(a4)
    80004de0:	0037871b          	addiw	a4,a5,3
    80004de4:	0ac77663          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004de8:	00e50733          	add	a4,a0,a4
    80004dec:	00b70023          	sb	a1,0(a4)
    80004df0:	0047871b          	addiw	a4,a5,4
    80004df4:	08c77e63          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004df8:	00e50733          	add	a4,a0,a4
    80004dfc:	00b70023          	sb	a1,0(a4)
    80004e00:	0057871b          	addiw	a4,a5,5
    80004e04:	08c77663          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004e08:	00e50733          	add	a4,a0,a4
    80004e0c:	00b70023          	sb	a1,0(a4)
    80004e10:	0067871b          	addiw	a4,a5,6
    80004e14:	06c77e63          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004e18:	00e50733          	add	a4,a0,a4
    80004e1c:	00b70023          	sb	a1,0(a4)
    80004e20:	0077871b          	addiw	a4,a5,7
    80004e24:	06c77663          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004e28:	00e50733          	add	a4,a0,a4
    80004e2c:	00b70023          	sb	a1,0(a4)
    80004e30:	0087871b          	addiw	a4,a5,8
    80004e34:	04c77e63          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004e38:	00e50733          	add	a4,a0,a4
    80004e3c:	00b70023          	sb	a1,0(a4)
    80004e40:	0097871b          	addiw	a4,a5,9
    80004e44:	04c77663          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004e48:	00e50733          	add	a4,a0,a4
    80004e4c:	00b70023          	sb	a1,0(a4)
    80004e50:	00a7871b          	addiw	a4,a5,10
    80004e54:	02c77e63          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004e58:	00e50733          	add	a4,a0,a4
    80004e5c:	00b70023          	sb	a1,0(a4)
    80004e60:	00b7871b          	addiw	a4,a5,11
    80004e64:	02c77663          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004e68:	00e50733          	add	a4,a0,a4
    80004e6c:	00b70023          	sb	a1,0(a4)
    80004e70:	00c7871b          	addiw	a4,a5,12
    80004e74:	00c77e63          	bgeu	a4,a2,80004e90 <__memset+0x1c8>
    80004e78:	00e50733          	add	a4,a0,a4
    80004e7c:	00b70023          	sb	a1,0(a4)
    80004e80:	00d7879b          	addiw	a5,a5,13
    80004e84:	00c7f663          	bgeu	a5,a2,80004e90 <__memset+0x1c8>
    80004e88:	00f507b3          	add	a5,a0,a5
    80004e8c:	00b78023          	sb	a1,0(a5)
    80004e90:	00813403          	ld	s0,8(sp)
    80004e94:	01010113          	addi	sp,sp,16
    80004e98:	00008067          	ret
    80004e9c:	00b00693          	li	a3,11
    80004ea0:	e55ff06f          	j	80004cf4 <__memset+0x2c>
    80004ea4:	00300e93          	li	t4,3
    80004ea8:	ea5ff06f          	j	80004d4c <__memset+0x84>
    80004eac:	00100e93          	li	t4,1
    80004eb0:	e9dff06f          	j	80004d4c <__memset+0x84>
    80004eb4:	00000e93          	li	t4,0
    80004eb8:	e95ff06f          	j	80004d4c <__memset+0x84>
    80004ebc:	00000793          	li	a5,0
    80004ec0:	ef9ff06f          	j	80004db8 <__memset+0xf0>
    80004ec4:	00200e93          	li	t4,2
    80004ec8:	e85ff06f          	j	80004d4c <__memset+0x84>
    80004ecc:	00400e93          	li	t4,4
    80004ed0:	e7dff06f          	j	80004d4c <__memset+0x84>
    80004ed4:	00500e93          	li	t4,5
    80004ed8:	e75ff06f          	j	80004d4c <__memset+0x84>
    80004edc:	00600e93          	li	t4,6
    80004ee0:	e6dff06f          	j	80004d4c <__memset+0x84>

0000000080004ee4 <__memmove>:
    80004ee4:	ff010113          	addi	sp,sp,-16
    80004ee8:	00813423          	sd	s0,8(sp)
    80004eec:	01010413          	addi	s0,sp,16
    80004ef0:	0e060863          	beqz	a2,80004fe0 <__memmove+0xfc>
    80004ef4:	fff6069b          	addiw	a3,a2,-1
    80004ef8:	0006881b          	sext.w	a6,a3
    80004efc:	0ea5e863          	bltu	a1,a0,80004fec <__memmove+0x108>
    80004f00:	00758713          	addi	a4,a1,7
    80004f04:	00a5e7b3          	or	a5,a1,a0
    80004f08:	40a70733          	sub	a4,a4,a0
    80004f0c:	0077f793          	andi	a5,a5,7
    80004f10:	00f73713          	sltiu	a4,a4,15
    80004f14:	00174713          	xori	a4,a4,1
    80004f18:	0017b793          	seqz	a5,a5
    80004f1c:	00e7f7b3          	and	a5,a5,a4
    80004f20:	10078863          	beqz	a5,80005030 <__memmove+0x14c>
    80004f24:	00900793          	li	a5,9
    80004f28:	1107f463          	bgeu	a5,a6,80005030 <__memmove+0x14c>
    80004f2c:	0036581b          	srliw	a6,a2,0x3
    80004f30:	fff8081b          	addiw	a6,a6,-1
    80004f34:	02081813          	slli	a6,a6,0x20
    80004f38:	01d85893          	srli	a7,a6,0x1d
    80004f3c:	00858813          	addi	a6,a1,8
    80004f40:	00058793          	mv	a5,a1
    80004f44:	00050713          	mv	a4,a0
    80004f48:	01088833          	add	a6,a7,a6
    80004f4c:	0007b883          	ld	a7,0(a5)
    80004f50:	00878793          	addi	a5,a5,8
    80004f54:	00870713          	addi	a4,a4,8
    80004f58:	ff173c23          	sd	a7,-8(a4)
    80004f5c:	ff0798e3          	bne	a5,a6,80004f4c <__memmove+0x68>
    80004f60:	ff867713          	andi	a4,a2,-8
    80004f64:	02071793          	slli	a5,a4,0x20
    80004f68:	0207d793          	srli	a5,a5,0x20
    80004f6c:	00f585b3          	add	a1,a1,a5
    80004f70:	40e686bb          	subw	a3,a3,a4
    80004f74:	00f507b3          	add	a5,a0,a5
    80004f78:	06e60463          	beq	a2,a4,80004fe0 <__memmove+0xfc>
    80004f7c:	0005c703          	lbu	a4,0(a1)
    80004f80:	00e78023          	sb	a4,0(a5)
    80004f84:	04068e63          	beqz	a3,80004fe0 <__memmove+0xfc>
    80004f88:	0015c603          	lbu	a2,1(a1)
    80004f8c:	00100713          	li	a4,1
    80004f90:	00c780a3          	sb	a2,1(a5)
    80004f94:	04e68663          	beq	a3,a4,80004fe0 <__memmove+0xfc>
    80004f98:	0025c603          	lbu	a2,2(a1)
    80004f9c:	00200713          	li	a4,2
    80004fa0:	00c78123          	sb	a2,2(a5)
    80004fa4:	02e68e63          	beq	a3,a4,80004fe0 <__memmove+0xfc>
    80004fa8:	0035c603          	lbu	a2,3(a1)
    80004fac:	00300713          	li	a4,3
    80004fb0:	00c781a3          	sb	a2,3(a5)
    80004fb4:	02e68663          	beq	a3,a4,80004fe0 <__memmove+0xfc>
    80004fb8:	0045c603          	lbu	a2,4(a1)
    80004fbc:	00400713          	li	a4,4
    80004fc0:	00c78223          	sb	a2,4(a5)
    80004fc4:	00e68e63          	beq	a3,a4,80004fe0 <__memmove+0xfc>
    80004fc8:	0055c603          	lbu	a2,5(a1)
    80004fcc:	00500713          	li	a4,5
    80004fd0:	00c782a3          	sb	a2,5(a5)
    80004fd4:	00e68663          	beq	a3,a4,80004fe0 <__memmove+0xfc>
    80004fd8:	0065c703          	lbu	a4,6(a1)
    80004fdc:	00e78323          	sb	a4,6(a5)
    80004fe0:	00813403          	ld	s0,8(sp)
    80004fe4:	01010113          	addi	sp,sp,16
    80004fe8:	00008067          	ret
    80004fec:	02061713          	slli	a4,a2,0x20
    80004ff0:	02075713          	srli	a4,a4,0x20
    80004ff4:	00e587b3          	add	a5,a1,a4
    80004ff8:	f0f574e3          	bgeu	a0,a5,80004f00 <__memmove+0x1c>
    80004ffc:	02069613          	slli	a2,a3,0x20
    80005000:	02065613          	srli	a2,a2,0x20
    80005004:	fff64613          	not	a2,a2
    80005008:	00e50733          	add	a4,a0,a4
    8000500c:	00c78633          	add	a2,a5,a2
    80005010:	fff7c683          	lbu	a3,-1(a5)
    80005014:	fff78793          	addi	a5,a5,-1
    80005018:	fff70713          	addi	a4,a4,-1
    8000501c:	00d70023          	sb	a3,0(a4)
    80005020:	fec798e3          	bne	a5,a2,80005010 <__memmove+0x12c>
    80005024:	00813403          	ld	s0,8(sp)
    80005028:	01010113          	addi	sp,sp,16
    8000502c:	00008067          	ret
    80005030:	02069713          	slli	a4,a3,0x20
    80005034:	02075713          	srli	a4,a4,0x20
    80005038:	00170713          	addi	a4,a4,1
    8000503c:	00e50733          	add	a4,a0,a4
    80005040:	00050793          	mv	a5,a0
    80005044:	0005c683          	lbu	a3,0(a1)
    80005048:	00178793          	addi	a5,a5,1
    8000504c:	00158593          	addi	a1,a1,1
    80005050:	fed78fa3          	sb	a3,-1(a5)
    80005054:	fee798e3          	bne	a5,a4,80005044 <__memmove+0x160>
    80005058:	f89ff06f          	j	80004fe0 <__memmove+0xfc>

000000008000505c <__putc>:
    8000505c:	fe010113          	addi	sp,sp,-32
    80005060:	00813823          	sd	s0,16(sp)
    80005064:	00113c23          	sd	ra,24(sp)
    80005068:	02010413          	addi	s0,sp,32
    8000506c:	00050793          	mv	a5,a0
    80005070:	fef40593          	addi	a1,s0,-17
    80005074:	00100613          	li	a2,1
    80005078:	00000513          	li	a0,0
    8000507c:	fef407a3          	sb	a5,-17(s0)
    80005080:	fffff097          	auipc	ra,0xfffff
    80005084:	b3c080e7          	jalr	-1220(ra) # 80003bbc <console_write>
    80005088:	01813083          	ld	ra,24(sp)
    8000508c:	01013403          	ld	s0,16(sp)
    80005090:	02010113          	addi	sp,sp,32
    80005094:	00008067          	ret

0000000080005098 <__getc>:
    80005098:	fe010113          	addi	sp,sp,-32
    8000509c:	00813823          	sd	s0,16(sp)
    800050a0:	00113c23          	sd	ra,24(sp)
    800050a4:	02010413          	addi	s0,sp,32
    800050a8:	fe840593          	addi	a1,s0,-24
    800050ac:	00100613          	li	a2,1
    800050b0:	00000513          	li	a0,0
    800050b4:	fffff097          	auipc	ra,0xfffff
    800050b8:	ae8080e7          	jalr	-1304(ra) # 80003b9c <console_read>
    800050bc:	fe844503          	lbu	a0,-24(s0)
    800050c0:	01813083          	ld	ra,24(sp)
    800050c4:	01013403          	ld	s0,16(sp)
    800050c8:	02010113          	addi	sp,sp,32
    800050cc:	00008067          	ret

00000000800050d0 <console_handler>:
    800050d0:	fe010113          	addi	sp,sp,-32
    800050d4:	00813823          	sd	s0,16(sp)
    800050d8:	00113c23          	sd	ra,24(sp)
    800050dc:	00913423          	sd	s1,8(sp)
    800050e0:	02010413          	addi	s0,sp,32
    800050e4:	14202773          	csrr	a4,scause
    800050e8:	100027f3          	csrr	a5,sstatus
    800050ec:	0027f793          	andi	a5,a5,2
    800050f0:	06079e63          	bnez	a5,8000516c <console_handler+0x9c>
    800050f4:	00074c63          	bltz	a4,8000510c <console_handler+0x3c>
    800050f8:	01813083          	ld	ra,24(sp)
    800050fc:	01013403          	ld	s0,16(sp)
    80005100:	00813483          	ld	s1,8(sp)
    80005104:	02010113          	addi	sp,sp,32
    80005108:	00008067          	ret
    8000510c:	0ff77713          	andi	a4,a4,255
    80005110:	00900793          	li	a5,9
    80005114:	fef712e3          	bne	a4,a5,800050f8 <console_handler+0x28>
    80005118:	ffffe097          	auipc	ra,0xffffe
    8000511c:	6dc080e7          	jalr	1756(ra) # 800037f4 <plic_claim>
    80005120:	00a00793          	li	a5,10
    80005124:	00050493          	mv	s1,a0
    80005128:	02f50c63          	beq	a0,a5,80005160 <console_handler+0x90>
    8000512c:	fc0506e3          	beqz	a0,800050f8 <console_handler+0x28>
    80005130:	00050593          	mv	a1,a0
    80005134:	00001517          	auipc	a0,0x1
    80005138:	11c50513          	addi	a0,a0,284 # 80006250 <CONSOLE_STATUS+0x240>
    8000513c:	fffff097          	auipc	ra,0xfffff
    80005140:	afc080e7          	jalr	-1284(ra) # 80003c38 <__printf>
    80005144:	01013403          	ld	s0,16(sp)
    80005148:	01813083          	ld	ra,24(sp)
    8000514c:	00048513          	mv	a0,s1
    80005150:	00813483          	ld	s1,8(sp)
    80005154:	02010113          	addi	sp,sp,32
    80005158:	ffffe317          	auipc	t1,0xffffe
    8000515c:	6d430067          	jr	1748(t1) # 8000382c <plic_complete>
    80005160:	fffff097          	auipc	ra,0xfffff
    80005164:	3e0080e7          	jalr	992(ra) # 80004540 <uartintr>
    80005168:	fddff06f          	j	80005144 <console_handler+0x74>
    8000516c:	00001517          	auipc	a0,0x1
    80005170:	1e450513          	addi	a0,a0,484 # 80006350 <digits+0x78>
    80005174:	fffff097          	auipc	ra,0xfffff
    80005178:	a68080e7          	jalr	-1432(ra) # 80003bdc <panic>
	...
