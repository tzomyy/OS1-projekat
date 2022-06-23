
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00006117          	auipc	sp,0x6
    80000004:	d6813103          	ld	sp,-664(sp) # 80005d68 <_GLOBAL_OFFSET_TABLE_+0x20>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	335020ef          	jal	ra,80002b50 <start>

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
    800012bc:	9c8080e7          	jalr	-1592(ra) # 80004c80 <console_handler>
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
    800012fc:	00004717          	auipc	a4,0x4
    80001300:	d2470713          	addi	a4,a4,-732 # 80005020 <CONSOLE_STATUS+0x10>
    80001304:	00e787b3          	add	a5,a5,a4
    80001308:	0007a783          	lw	a5,0(a5)
    8000130c:	00e787b3          	add	a5,a5,a4
    80001310:	00078067          	jr	a5
                __asm__ volatile("mv %0, a1": "=r"(size));
    80001314:	00058493          	mv	s1,a1
                void* ret = MemoryAllocator::getInstance()->mem_alloc(size);
    80001318:	00001097          	auipc	ra,0x1
    8000131c:	5b4080e7          	jalr	1460(ra) # 800028cc <_ZN15MemoryAllocator11getInstanceEv>
    80001320:	00048513          	mv	a0,s1
    80001324:	00001097          	auipc	ra,0x1
    80001328:	468080e7          	jalr	1128(ra) # 8000278c <_ZN15MemoryAllocator9mem_allocEm>
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
    8000135c:	00001097          	auipc	ra,0x1
    80001360:	604080e7          	jalr	1540(ra) # 80002960 <_ZN15MemoryAllocator8mem_freeEPv>
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
    80001410:	00005797          	auipc	a5,0x5
    80001414:	9607b783          	ld	a5,-1696(a5) # 80005d70 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80001518:	278080e7          	jalr	632(ra) # 8000278c <_ZN15MemoryAllocator9mem_allocEm>
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
    8000153c:	00005797          	auipc	a5,0x5
    80001540:	81c7b783          	ld	a5,-2020(a5) # 80005d58 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    80001574:	00004797          	auipc	a5,0x4
    80001578:	7e47b783          	ld	a5,2020(a5) # 80005d58 <_GLOBAL_OFFSET_TABLE_+0x10>
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
    800015e8:	1a8080e7          	jalr	424(ra) # 8000278c <_ZN15MemoryAllocator9mem_allocEm>
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
    80001668:	00004797          	auipc	a5,0x4
    8000166c:	7687b783          	ld	a5,1896(a5) # 80005dd0 <_ZN7_thread7runningE>
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
    800016ac:	00004917          	auipc	s2,0x4
    800016b0:	72493903          	ld	s2,1828(s2) # 80005dd0 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    800016b4:	01894783          	lbu	a5,24(s2)
    if (!old->isFinished()) { Scheduler::put(old); }
    800016b8:	04078863          	beqz	a5,80001708 <_ZN7_thread8dispatchEv+0x74>
    running = Scheduler::get();
    800016bc:	00001097          	auipc	ra,0x1
    800016c0:	be8080e7          	jalr	-1048(ra) # 800022a4 <_ZN9Scheduler3getEv>
    800016c4:	00050493          	mv	s1,a0
    800016c8:	00004797          	auipc	a5,0x4
    800016cc:	70a7b423          	sd	a0,1800(a5) # 80005dd0 <_ZN7_thread7runningE>
    if (running->body == nullptr && Scheduler::head != nullptr){
    800016d0:	00053783          	ld	a5,0(a0)
    800016d4:	04078263          	beqz	a5,80001718 <_ZN7_thread8dispatchEv+0x84>
        _thread* tmp = running;
        running = Scheduler::get();
        Scheduler::put(tmp);
    }

    _thread::contextSwitch(&old->context, &running->context);
    800016d8:	00004597          	auipc	a1,0x4
    800016dc:	6f85b583          	ld	a1,1784(a1) # 80005dd0 <_ZN7_thread7runningE>
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
    80001710:	c00080e7          	jalr	-1024(ra) # 8000230c <_ZN9Scheduler3putEP7_thread>
    80001714:	fa9ff06f          	j	800016bc <_ZN7_thread8dispatchEv+0x28>
    if (running->body == nullptr && Scheduler::head != nullptr){
    80001718:	00004797          	auipc	a5,0x4
    8000171c:	6487b783          	ld	a5,1608(a5) # 80005d60 <_GLOBAL_OFFSET_TABLE_+0x18>
    80001720:	0007b783          	ld	a5,0(a5)
    80001724:	fa078ae3          	beqz	a5,800016d8 <_ZN7_thread8dispatchEv+0x44>
        running = Scheduler::get();
    80001728:	00001097          	auipc	ra,0x1
    8000172c:	b7c080e7          	jalr	-1156(ra) # 800022a4 <_ZN9Scheduler3getEv>
    80001730:	00004797          	auipc	a5,0x4
    80001734:	6aa7b023          	sd	a0,1696(a5) # 80005dd0 <_ZN7_thread7runningE>
        Scheduler::put(tmp);
    80001738:	00048513          	mv	a0,s1
    8000173c:	00001097          	auipc	ra,0x1
    80001740:	bd0080e7          	jalr	-1072(ra) # 8000230c <_ZN9Scheduler3putEP7_thread>
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
    80001798:	f8c080e7          	jalr	-116(ra) # 80002720 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    8000179c:	00004497          	auipc	s1,0x4
    800017a0:	63448493          	addi	s1,s1,1588 # 80005dd0 <_ZN7_thread7runningE>
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
    800017dc:	00004797          	auipc	a5,0x4
    800017e0:	5f47b783          	ld	a5,1524(a5) # 80005dd0 <_ZN7_thread7runningE>
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
    80001804:	b0c080e7          	jalr	-1268(ra) # 8000230c <_ZN9Scheduler3putEP7_thread>
}
    80001808:	00813083          	ld	ra,8(sp)
    8000180c:	00013403          	ld	s0,0(sp)
    80001810:	01010113          	addi	sp,sp,16
    80001814:	00008067          	ret
    if (running == nullptr) running = this;
    80001818:	00004797          	auipc	a5,0x4
    8000181c:	5aa7bc23          	sd	a0,1464(a5) # 80005dd0 <_ZN7_thread7runningE>
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
    80001844:	08c080e7          	jalr	140(ra) # 800028cc <_ZN15MemoryAllocator11getInstanceEv>
    sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
    80001848:	05748513          	addi	a0,s1,87
    8000184c:	00655513          	srli	a0,a0,0x6
    80001850:	00001097          	auipc	ra,0x1
    80001854:	f3c080e7          	jalr	-196(ra) # 8000278c <_ZN15MemoryAllocator9mem_allocEm>
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
    80001888:	048080e7          	jalr	72(ra) # 800028cc <_ZN15MemoryAllocator11getInstanceEv>
                                               sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
    8000188c:	05748513          	addi	a0,s1,87
    80001890:	00655513          	srli	a0,a0,0x6
    80001894:	00001097          	auipc	ra,0x1
    80001898:	ef8080e7          	jalr	-264(ra) # 8000278c <_ZN15MemoryAllocator9mem_allocEm>
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
    800018d8:	ff8080e7          	jalr	-8(ra) # 800028cc <_ZN15MemoryAllocator11getInstanceEv>
    800018dc:	00200513          	li	a0,2
    800018e0:	00001097          	auipc	ra,0x1
    800018e4:	eac080e7          	jalr	-340(ra) # 8000278c <_ZN15MemoryAllocator9mem_allocEm>
    800018e8:	00050493          	mv	s1,a0
    if (ret == nullptr) return ret;
    800018ec:	04050e63          	beqz	a0,80001948 <_ZN7_thread12createThreadEPFvPvES0_+0x98>
    ret->body = body;
    800018f0:	01253023          	sd	s2,0(a0)
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE) : nullptr),
    800018f4:	06090a63          	beqz	s2,80001968 <_ZN7_thread12createThreadEPFvPvES0_+0xb8>
    800018f8:	00001537          	lui	a0,0x1
    800018fc:	00000097          	auipc	ra,0x0
    80001900:	f70080e7          	jalr	-144(ra) # 8000186c <_ZN7_threadnaEm>
    80001904:	00050793          	mv	a5,a0
    80001908:	00f4b423          	sd	a5,8(s1)
    ret->timeSlice = TIME_SLICE;
    8000190c:	00200713          	li	a4,2
    80001910:	00e4b823          	sd	a4,16(s1)
    ret->finished = false;
    80001914:	00048c23          	sb	zero,24(s1)
    ret->arg = arg;
    80001918:	0334b023          	sd	s3,32(s1)
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    8000191c:	04078a63          	beqz	a5,80001970 <_ZN7_thread12createThreadEPFvPvES0_+0xc0>
    80001920:	00008537          	lui	a0,0x8
    80001924:	00a787b3          	add	a5,a5,a0
    ret->context = {
    80001928:	00000717          	auipc	a4,0x0
    8000192c:	e5870713          	addi	a4,a4,-424 # 80001780 <_ZN7_thread13threadWrapperEv>
    80001930:	02e4b423          	sd	a4,40(s1)
    80001934:	02f4b823          	sd	a5,48(s1)
    if(body != nullptr) {
    80001938:	00090863          	beqz	s2,80001948 <_ZN7_thread12createThreadEPFvPvES0_+0x98>
        Scheduler::put(ret);
    8000193c:	00048513          	mv	a0,s1
    80001940:	00001097          	auipc	ra,0x1
    80001944:	9cc080e7          	jalr	-1588(ra) # 8000230c <_ZN9Scheduler3putEP7_thread>
}
    80001948:	00048513          	mv	a0,s1
    8000194c:	02813083          	ld	ra,40(sp)
    80001950:	02013403          	ld	s0,32(sp)
    80001954:	01813483          	ld	s1,24(sp)
    80001958:	01013903          	ld	s2,16(sp)
    8000195c:	00813983          	ld	s3,8(sp)
    80001960:	03010113          	addi	sp,sp,48
    80001964:	00008067          	ret
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE) : nullptr),
    80001968:	00000793          	li	a5,0
    8000196c:	f9dff06f          	j	80001908 <_ZN7_thread12createThreadEPFvPvES0_+0x58>
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    80001970:	00000793          	li	a5,0
    80001974:	fb5ff06f          	j	80001928 <_ZN7_thread12createThreadEPFvPvES0_+0x78>

0000000080001978 <_ZN7_threaddlEPv>:
void _thread::operator delete(void* p){
    80001978:	fe010113          	addi	sp,sp,-32
    8000197c:	00113c23          	sd	ra,24(sp)
    80001980:	00813823          	sd	s0,16(sp)
    80001984:	00913423          	sd	s1,8(sp)
    80001988:	02010413          	addi	s0,sp,32
    8000198c:	00050493          	mv	s1,a0
    MemoryAllocator::getInstance()->mem_free(p);
    80001990:	00001097          	auipc	ra,0x1
    80001994:	f3c080e7          	jalr	-196(ra) # 800028cc <_ZN15MemoryAllocator11getInstanceEv>
    80001998:	00048513          	mv	a0,s1
    8000199c:	00001097          	auipc	ra,0x1
    800019a0:	fc4080e7          	jalr	-60(ra) # 80002960 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800019a4:	01813083          	ld	ra,24(sp)
    800019a8:	01013403          	ld	s0,16(sp)
    800019ac:	00813483          	ld	s1,8(sp)
    800019b0:	02010113          	addi	sp,sp,32
    800019b4:	00008067          	ret

00000000800019b8 <_ZN7_threaddaEPv>:

void _thread::operator delete[](void* p){
    800019b8:	fe010113          	addi	sp,sp,-32
    800019bc:	00113c23          	sd	ra,24(sp)
    800019c0:	00813823          	sd	s0,16(sp)
    800019c4:	00913423          	sd	s1,8(sp)
    800019c8:	02010413          	addi	s0,sp,32
    800019cc:	00050493          	mv	s1,a0
    MemoryAllocator::getInstance()->mem_free(p);
    800019d0:	00001097          	auipc	ra,0x1
    800019d4:	efc080e7          	jalr	-260(ra) # 800028cc <_ZN15MemoryAllocator11getInstanceEv>
    800019d8:	00048513          	mv	a0,s1
    800019dc:	00001097          	auipc	ra,0x1
    800019e0:	f84080e7          	jalr	-124(ra) # 80002960 <_ZN15MemoryAllocator8mem_freeEPv>
}
    800019e4:	01813083          	ld	ra,24(sp)
    800019e8:	01013403          	ld	s0,16(sp)
    800019ec:	00813483          	ld	s1,8(sp)
    800019f0:	02010113          	addi	sp,sp,32
    800019f4:	00008067          	ret

00000000800019f8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800019f8:	fe010113          	addi	sp,sp,-32
    800019fc:	00113c23          	sd	ra,24(sp)
    80001a00:	00813823          	sd	s0,16(sp)
    80001a04:	00913423          	sd	s1,8(sp)
    80001a08:	02010413          	addi	s0,sp,32
    80001a0c:	00050493          	mv	s1,a0
    LOCK();
    80001a10:	00100613          	li	a2,1
    80001a14:	00000593          	li	a1,0
    80001a18:	00004517          	auipc	a0,0x4
    80001a1c:	3c850513          	addi	a0,a0,968 # 80005de0 <lockPrint>
    80001a20:	fffff097          	auipc	ra,0xfffff
    80001a24:	6f0080e7          	jalr	1776(ra) # 80001110 <copy_and_swap>
    80001a28:	fe0514e3          	bnez	a0,80001a10 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001a2c:	0004c503          	lbu	a0,0(s1)
    80001a30:	00050a63          	beqz	a0,80001a44 <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    80001a34:	00003097          	auipc	ra,0x3
    80001a38:	1d8080e7          	jalr	472(ra) # 80004c0c <__putc>
        string++;
    80001a3c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001a40:	fedff06f          	j	80001a2c <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001a44:	00000613          	li	a2,0
    80001a48:	00100593          	li	a1,1
    80001a4c:	00004517          	auipc	a0,0x4
    80001a50:	39450513          	addi	a0,a0,916 # 80005de0 <lockPrint>
    80001a54:	fffff097          	auipc	ra,0xfffff
    80001a58:	6bc080e7          	jalr	1724(ra) # 80001110 <copy_and_swap>
    80001a5c:	fe0514e3          	bnez	a0,80001a44 <_Z11printStringPKc+0x4c>
}
    80001a60:	01813083          	ld	ra,24(sp)
    80001a64:	01013403          	ld	s0,16(sp)
    80001a68:	00813483          	ld	s1,8(sp)
    80001a6c:	02010113          	addi	sp,sp,32
    80001a70:	00008067          	ret

0000000080001a74 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001a74:	fd010113          	addi	sp,sp,-48
    80001a78:	02113423          	sd	ra,40(sp)
    80001a7c:	02813023          	sd	s0,32(sp)
    80001a80:	00913c23          	sd	s1,24(sp)
    80001a84:	01213823          	sd	s2,16(sp)
    80001a88:	01313423          	sd	s3,8(sp)
    80001a8c:	01413023          	sd	s4,0(sp)
    80001a90:	03010413          	addi	s0,sp,48
    80001a94:	00050993          	mv	s3,a0
    80001a98:	00058a13          	mv	s4,a1
    LOCK();
    80001a9c:	00100613          	li	a2,1
    80001aa0:	00000593          	li	a1,0
    80001aa4:	00004517          	auipc	a0,0x4
    80001aa8:	33c50513          	addi	a0,a0,828 # 80005de0 <lockPrint>
    80001aac:	fffff097          	auipc	ra,0xfffff
    80001ab0:	664080e7          	jalr	1636(ra) # 80001110 <copy_and_swap>
    80001ab4:	fe0514e3          	bnez	a0,80001a9c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80001ab8:	00000913          	li	s2,0
    80001abc:	00090493          	mv	s1,s2
    80001ac0:	0019091b          	addiw	s2,s2,1
    80001ac4:	03495a63          	bge	s2,s4,80001af8 <_Z9getStringPci+0x84>
        cc = __getc();
    80001ac8:	00003097          	auipc	ra,0x3
    80001acc:	180080e7          	jalr	384(ra) # 80004c48 <__getc>
        if(cc < 1)
    80001ad0:	02050463          	beqz	a0,80001af8 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80001ad4:	009984b3          	add	s1,s3,s1
    80001ad8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001adc:	00a00793          	li	a5,10
    80001ae0:	00f50a63          	beq	a0,a5,80001af4 <_Z9getStringPci+0x80>
    80001ae4:	00d00793          	li	a5,13
    80001ae8:	fcf51ae3          	bne	a0,a5,80001abc <_Z9getStringPci+0x48>
        buf[i++] = c;
    80001aec:	00090493          	mv	s1,s2
    80001af0:	0080006f          	j	80001af8 <_Z9getStringPci+0x84>
    80001af4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80001af8:	009984b3          	add	s1,s3,s1
    80001afc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80001b00:	00000613          	li	a2,0
    80001b04:	00100593          	li	a1,1
    80001b08:	00004517          	auipc	a0,0x4
    80001b0c:	2d850513          	addi	a0,a0,728 # 80005de0 <lockPrint>
    80001b10:	fffff097          	auipc	ra,0xfffff
    80001b14:	600080e7          	jalr	1536(ra) # 80001110 <copy_and_swap>
    80001b18:	fe0514e3          	bnez	a0,80001b00 <_Z9getStringPci+0x8c>
    return buf;
}
    80001b1c:	00098513          	mv	a0,s3
    80001b20:	02813083          	ld	ra,40(sp)
    80001b24:	02013403          	ld	s0,32(sp)
    80001b28:	01813483          	ld	s1,24(sp)
    80001b2c:	01013903          	ld	s2,16(sp)
    80001b30:	00813983          	ld	s3,8(sp)
    80001b34:	00013a03          	ld	s4,0(sp)
    80001b38:	03010113          	addi	sp,sp,48
    80001b3c:	00008067          	ret

0000000080001b40 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001b40:	ff010113          	addi	sp,sp,-16
    80001b44:	00813423          	sd	s0,8(sp)
    80001b48:	01010413          	addi	s0,sp,16
    80001b4c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001b50:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001b54:	0006c603          	lbu	a2,0(a3)
    80001b58:	fd06071b          	addiw	a4,a2,-48
    80001b5c:	0ff77713          	andi	a4,a4,255
    80001b60:	00900793          	li	a5,9
    80001b64:	02e7e063          	bltu	a5,a4,80001b84 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001b68:	0025179b          	slliw	a5,a0,0x2
    80001b6c:	00a787bb          	addw	a5,a5,a0
    80001b70:	0017979b          	slliw	a5,a5,0x1
    80001b74:	00168693          	addi	a3,a3,1
    80001b78:	00c787bb          	addw	a5,a5,a2
    80001b7c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001b80:	fd5ff06f          	j	80001b54 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001b84:	00813403          	ld	s0,8(sp)
    80001b88:	01010113          	addi	sp,sp,16
    80001b8c:	00008067          	ret

0000000080001b90 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001b90:	fc010113          	addi	sp,sp,-64
    80001b94:	02113c23          	sd	ra,56(sp)
    80001b98:	02813823          	sd	s0,48(sp)
    80001b9c:	02913423          	sd	s1,40(sp)
    80001ba0:	03213023          	sd	s2,32(sp)
    80001ba4:	01313c23          	sd	s3,24(sp)
    80001ba8:	04010413          	addi	s0,sp,64
    80001bac:	00050493          	mv	s1,a0
    80001bb0:	00058913          	mv	s2,a1
    80001bb4:	00060993          	mv	s3,a2
    LOCK();
    80001bb8:	00100613          	li	a2,1
    80001bbc:	00000593          	li	a1,0
    80001bc0:	00004517          	auipc	a0,0x4
    80001bc4:	22050513          	addi	a0,a0,544 # 80005de0 <lockPrint>
    80001bc8:	fffff097          	auipc	ra,0xfffff
    80001bcc:	548080e7          	jalr	1352(ra) # 80001110 <copy_and_swap>
    80001bd0:	fe0514e3          	bnez	a0,80001bb8 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001bd4:	00098463          	beqz	s3,80001bdc <_Z8printIntiii+0x4c>
    80001bd8:	0804c463          	bltz	s1,80001c60 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001bdc:	0004851b          	sext.w	a0,s1
    neg = 0;
    80001be0:	00000593          	li	a1,0
    }

    i = 0;
    80001be4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001be8:	0009079b          	sext.w	a5,s2
    80001bec:	0325773b          	remuw	a4,a0,s2
    80001bf0:	00048613          	mv	a2,s1
    80001bf4:	0014849b          	addiw	s1,s1,1
    80001bf8:	02071693          	slli	a3,a4,0x20
    80001bfc:	0206d693          	srli	a3,a3,0x20
    80001c00:	00004717          	auipc	a4,0x4
    80001c04:	10070713          	addi	a4,a4,256 # 80005d00 <digits>
    80001c08:	00d70733          	add	a4,a4,a3
    80001c0c:	00074683          	lbu	a3,0(a4)
    80001c10:	fd040713          	addi	a4,s0,-48
    80001c14:	00c70733          	add	a4,a4,a2
    80001c18:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001c1c:	0005071b          	sext.w	a4,a0
    80001c20:	0325553b          	divuw	a0,a0,s2
    80001c24:	fcf772e3          	bgeu	a4,a5,80001be8 <_Z8printIntiii+0x58>
    if(neg)
    80001c28:	00058c63          	beqz	a1,80001c40 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001c2c:	fd040793          	addi	a5,s0,-48
    80001c30:	009784b3          	add	s1,a5,s1
    80001c34:	02d00793          	li	a5,45
    80001c38:	fef48823          	sb	a5,-16(s1)
    80001c3c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001c40:	fff4849b          	addiw	s1,s1,-1
    80001c44:	0204c463          	bltz	s1,80001c6c <_Z8printIntiii+0xdc>
        __putc(buf[i]);
    80001c48:	fd040793          	addi	a5,s0,-48
    80001c4c:	009787b3          	add	a5,a5,s1
    80001c50:	ff07c503          	lbu	a0,-16(a5)
    80001c54:	00003097          	auipc	ra,0x3
    80001c58:	fb8080e7          	jalr	-72(ra) # 80004c0c <__putc>
    80001c5c:	fe5ff06f          	j	80001c40 <_Z8printIntiii+0xb0>
        x = -xx;
    80001c60:	4090053b          	negw	a0,s1
        neg = 1;
    80001c64:	00100593          	li	a1,1
        x = -xx;
    80001c68:	f7dff06f          	j	80001be4 <_Z8printIntiii+0x54>

    UNLOCK();
    80001c6c:	00000613          	li	a2,0
    80001c70:	00100593          	li	a1,1
    80001c74:	00004517          	auipc	a0,0x4
    80001c78:	16c50513          	addi	a0,a0,364 # 80005de0 <lockPrint>
    80001c7c:	fffff097          	auipc	ra,0xfffff
    80001c80:	494080e7          	jalr	1172(ra) # 80001110 <copy_and_swap>
    80001c84:	fe0514e3          	bnez	a0,80001c6c <_Z8printIntiii+0xdc>
    80001c88:	03813083          	ld	ra,56(sp)
    80001c8c:	03013403          	ld	s0,48(sp)
    80001c90:	02813483          	ld	s1,40(sp)
    80001c94:	02013903          	ld	s2,32(sp)
    80001c98:	01813983          	ld	s3,24(sp)
    80001c9c:	04010113          	addi	sp,sp,64
    80001ca0:	00008067          	ret

0000000080001ca4 <_Z11workerBodyAPv>:
    if (n == 0 || n == 1) { return n; }
    if (n % 10 == 0) { thread_dispatch(); }
    return fibonacci(n - 1) + fibonacci(n - 2);
}

void workerBodyA(void* arg) {
    80001ca4:	fe010113          	addi	sp,sp,-32
    80001ca8:	00113c23          	sd	ra,24(sp)
    80001cac:	00813823          	sd	s0,16(sp)
    80001cb0:	00913423          	sd	s1,8(sp)
    80001cb4:	01213023          	sd	s2,0(sp)
    80001cb8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80001cbc:	00000913          	li	s2,0
    80001cc0:	0380006f          	j	80001cf8 <_Z11workerBodyAPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001cc4:	00000097          	auipc	ra,0x0
    80001cc8:	8c8080e7          	jalr	-1848(ra) # 8000158c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001ccc:	00148493          	addi	s1,s1,1
    80001cd0:	000027b7          	lui	a5,0x2
    80001cd4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001cd8:	0097ee63          	bltu	a5,s1,80001cf4 <_Z11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001cdc:	00000713          	li	a4,0
    80001ce0:	000077b7          	lui	a5,0x7
    80001ce4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001ce8:	fce7eee3          	bltu	a5,a4,80001cc4 <_Z11workerBodyAPv+0x20>
    80001cec:	00170713          	addi	a4,a4,1
    80001cf0:	ff1ff06f          	j	80001ce0 <_Z11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80001cf4:	00190913          	addi	s2,s2,1
    80001cf8:	00900793          	li	a5,9
    80001cfc:	0527e063          	bltu	a5,s2,80001d3c <_Z11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80001d00:	00003517          	auipc	a0,0x3
    80001d04:	37850513          	addi	a0,a0,888 # 80005078 <CONSOLE_STATUS+0x68>
    80001d08:	00000097          	auipc	ra,0x0
    80001d0c:	cf0080e7          	jalr	-784(ra) # 800019f8 <_Z11printStringPKc>
    80001d10:	00000613          	li	a2,0
    80001d14:	00a00593          	li	a1,10
    80001d18:	0009051b          	sext.w	a0,s2
    80001d1c:	00000097          	auipc	ra,0x0
    80001d20:	e74080e7          	jalr	-396(ra) # 80001b90 <_Z8printIntiii>
    80001d24:	00003517          	auipc	a0,0x3
    80001d28:	56c50513          	addi	a0,a0,1388 # 80005290 <CONSOLE_STATUS+0x280>
    80001d2c:	00000097          	auipc	ra,0x0
    80001d30:	ccc080e7          	jalr	-820(ra) # 800019f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001d34:	00000493          	li	s1,0
    80001d38:	f99ff06f          	j	80001cd0 <_Z11workerBodyAPv+0x2c>
        }
    }
    printString("A finished!\n");
    80001d3c:	00003517          	auipc	a0,0x3
    80001d40:	34450513          	addi	a0,a0,836 # 80005080 <CONSOLE_STATUS+0x70>
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	cb4080e7          	jalr	-844(ra) # 800019f8 <_Z11printStringPKc>
    //_thread::running->setFinished(true);
    //thread_exit();
    finishedA = true;
    80001d4c:	00100793          	li	a5,1
    80001d50:	00004717          	auipc	a4,0x4
    80001d54:	08f70c23          	sb	a5,152(a4) # 80005de8 <finishedA>
    //thread_dispatch();
}
    80001d58:	01813083          	ld	ra,24(sp)
    80001d5c:	01013403          	ld	s0,16(sp)
    80001d60:	00813483          	ld	s1,8(sp)
    80001d64:	00013903          	ld	s2,0(sp)
    80001d68:	02010113          	addi	sp,sp,32
    80001d6c:	00008067          	ret

0000000080001d70 <_Z11workerBodyBPv>:

void workerBodyB(void* arg) {
    80001d70:	fe010113          	addi	sp,sp,-32
    80001d74:	00113c23          	sd	ra,24(sp)
    80001d78:	00813823          	sd	s0,16(sp)
    80001d7c:	00913423          	sd	s1,8(sp)
    80001d80:	01213023          	sd	s2,0(sp)
    80001d84:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80001d88:	00000913          	li	s2,0
    80001d8c:	0380006f          	j	80001dc4 <_Z11workerBodyBPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80001d90:	fffff097          	auipc	ra,0xfffff
    80001d94:	7fc080e7          	jalr	2044(ra) # 8000158c <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80001d98:	00148493          	addi	s1,s1,1
    80001d9c:	000027b7          	lui	a5,0x2
    80001da0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80001da4:	0097ee63          	bltu	a5,s1,80001dc0 <_Z11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80001da8:	00000713          	li	a4,0
    80001dac:	000077b7          	lui	a5,0x7
    80001db0:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80001db4:	fce7eee3          	bltu	a5,a4,80001d90 <_Z11workerBodyBPv+0x20>
    80001db8:	00170713          	addi	a4,a4,1
    80001dbc:	ff1ff06f          	j	80001dac <_Z11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80001dc0:	00190913          	addi	s2,s2,1
    80001dc4:	00f00793          	li	a5,15
    80001dc8:	0527e063          	bltu	a5,s2,80001e08 <_Z11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80001dcc:	00003517          	auipc	a0,0x3
    80001dd0:	2c450513          	addi	a0,a0,708 # 80005090 <CONSOLE_STATUS+0x80>
    80001dd4:	00000097          	auipc	ra,0x0
    80001dd8:	c24080e7          	jalr	-988(ra) # 800019f8 <_Z11printStringPKc>
    80001ddc:	00000613          	li	a2,0
    80001de0:	00a00593          	li	a1,10
    80001de4:	0009051b          	sext.w	a0,s2
    80001de8:	00000097          	auipc	ra,0x0
    80001dec:	da8080e7          	jalr	-600(ra) # 80001b90 <_Z8printIntiii>
    80001df0:	00003517          	auipc	a0,0x3
    80001df4:	4a050513          	addi	a0,a0,1184 # 80005290 <CONSOLE_STATUS+0x280>
    80001df8:	00000097          	auipc	ra,0x0
    80001dfc:	c00080e7          	jalr	-1024(ra) # 800019f8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80001e00:	00000493          	li	s1,0
    80001e04:	f99ff06f          	j	80001d9c <_Z11workerBodyBPv+0x2c>
        }
    }
    printString("B finished!\n");
    80001e08:	00003517          	auipc	a0,0x3
    80001e0c:	29050513          	addi	a0,a0,656 # 80005098 <CONSOLE_STATUS+0x88>
    80001e10:	00000097          	auipc	ra,0x0
    80001e14:	be8080e7          	jalr	-1048(ra) # 800019f8 <_Z11printStringPKc>
    //_thread::running->setFinished(true);
    //thread_exit();
    finishedB = true;
    80001e18:	00100793          	li	a5,1
    80001e1c:	00004717          	auipc	a4,0x4
    80001e20:	fcf706a3          	sb	a5,-51(a4) # 80005de9 <finishedB>
    thread_dispatch();
    80001e24:	fffff097          	auipc	ra,0xfffff
    80001e28:	768080e7          	jalr	1896(ra) # 8000158c <_Z15thread_dispatchv>
}
    80001e2c:	01813083          	ld	ra,24(sp)
    80001e30:	01013403          	ld	s0,16(sp)
    80001e34:	00813483          	ld	s1,8(sp)
    80001e38:	00013903          	ld	s2,0(sp)
    80001e3c:	02010113          	addi	sp,sp,32
    80001e40:	00008067          	ret

0000000080001e44 <_Z9fibonaccim>:
uint64 fibonacci(uint64 n) {
    80001e44:	fe010113          	addi	sp,sp,-32
    80001e48:	00113c23          	sd	ra,24(sp)
    80001e4c:	00813823          	sd	s0,16(sp)
    80001e50:	00913423          	sd	s1,8(sp)
    80001e54:	01213023          	sd	s2,0(sp)
    80001e58:	02010413          	addi	s0,sp,32
    80001e5c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80001e60:	00100793          	li	a5,1
    80001e64:	02a7f863          	bgeu	a5,a0,80001e94 <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80001e68:	00a00793          	li	a5,10
    80001e6c:	02f577b3          	remu	a5,a0,a5
    80001e70:	02078e63          	beqz	a5,80001eac <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80001e74:	fff48513          	addi	a0,s1,-1
    80001e78:	00000097          	auipc	ra,0x0
    80001e7c:	fcc080e7          	jalr	-52(ra) # 80001e44 <_Z9fibonaccim>
    80001e80:	00050913          	mv	s2,a0
    80001e84:	ffe48513          	addi	a0,s1,-2
    80001e88:	00000097          	auipc	ra,0x0
    80001e8c:	fbc080e7          	jalr	-68(ra) # 80001e44 <_Z9fibonaccim>
    80001e90:	00a90533          	add	a0,s2,a0
}
    80001e94:	01813083          	ld	ra,24(sp)
    80001e98:	01013403          	ld	s0,16(sp)
    80001e9c:	00813483          	ld	s1,8(sp)
    80001ea0:	00013903          	ld	s2,0(sp)
    80001ea4:	02010113          	addi	sp,sp,32
    80001ea8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80001eac:	fffff097          	auipc	ra,0xfffff
    80001eb0:	6e0080e7          	jalr	1760(ra) # 8000158c <_Z15thread_dispatchv>
    80001eb4:	fc1ff06f          	j	80001e74 <_Z9fibonaccim+0x30>

0000000080001eb8 <_Z11workerBodyCPv>:

void workerBodyC(void* arg) {
    80001eb8:	fe010113          	addi	sp,sp,-32
    80001ebc:	00113c23          	sd	ra,24(sp)
    80001ec0:	00813823          	sd	s0,16(sp)
    80001ec4:	00913423          	sd	s1,8(sp)
    80001ec8:	01213023          	sd	s2,0(sp)
    80001ecc:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80001ed0:	00000493          	li	s1,0
    80001ed4:	0400006f          	j	80001f14 <_Z11workerBodyCPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001ed8:	00003517          	auipc	a0,0x3
    80001edc:	1d050513          	addi	a0,a0,464 # 800050a8 <CONSOLE_STATUS+0x98>
    80001ee0:	00000097          	auipc	ra,0x0
    80001ee4:	b18080e7          	jalr	-1256(ra) # 800019f8 <_Z11printStringPKc>
    80001ee8:	00000613          	li	a2,0
    80001eec:	00a00593          	li	a1,10
    80001ef0:	00048513          	mv	a0,s1
    80001ef4:	00000097          	auipc	ra,0x0
    80001ef8:	c9c080e7          	jalr	-868(ra) # 80001b90 <_Z8printIntiii>
    80001efc:	00003517          	auipc	a0,0x3
    80001f00:	39450513          	addi	a0,a0,916 # 80005290 <CONSOLE_STATUS+0x280>
    80001f04:	00000097          	auipc	ra,0x0
    80001f08:	af4080e7          	jalr	-1292(ra) # 800019f8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80001f0c:	0014849b          	addiw	s1,s1,1
    80001f10:	0ff4f493          	andi	s1,s1,255
    80001f14:	00200793          	li	a5,2
    80001f18:	fc97f0e3          	bgeu	a5,s1,80001ed8 <_Z11workerBodyCPv+0x20>
    }

    printString("C: dispatch\n");
    80001f1c:	00003517          	auipc	a0,0x3
    80001f20:	19450513          	addi	a0,a0,404 # 800050b0 <CONSOLE_STATUS+0xa0>
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	ad4080e7          	jalr	-1324(ra) # 800019f8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80001f2c:	00700313          	li	t1,7
    thread_dispatch();
    80001f30:	fffff097          	auipc	ra,0xfffff
    80001f34:	65c080e7          	jalr	1628(ra) # 8000158c <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80001f38:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80001f3c:	00003517          	auipc	a0,0x3
    80001f40:	18450513          	addi	a0,a0,388 # 800050c0 <CONSOLE_STATUS+0xb0>
    80001f44:	00000097          	auipc	ra,0x0
    80001f48:	ab4080e7          	jalr	-1356(ra) # 800019f8 <_Z11printStringPKc>
    80001f4c:	00000613          	li	a2,0
    80001f50:	00a00593          	li	a1,10
    80001f54:	0009051b          	sext.w	a0,s2
    80001f58:	00000097          	auipc	ra,0x0
    80001f5c:	c38080e7          	jalr	-968(ra) # 80001b90 <_Z8printIntiii>
    80001f60:	00003517          	auipc	a0,0x3
    80001f64:	33050513          	addi	a0,a0,816 # 80005290 <CONSOLE_STATUS+0x280>
    80001f68:	00000097          	auipc	ra,0x0
    80001f6c:	a90080e7          	jalr	-1392(ra) # 800019f8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80001f70:	00c00513          	li	a0,12
    80001f74:	00000097          	auipc	ra,0x0
    80001f78:	ed0080e7          	jalr	-304(ra) # 80001e44 <_Z9fibonaccim>
    80001f7c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80001f80:	00003517          	auipc	a0,0x3
    80001f84:	14850513          	addi	a0,a0,328 # 800050c8 <CONSOLE_STATUS+0xb8>
    80001f88:	00000097          	auipc	ra,0x0
    80001f8c:	a70080e7          	jalr	-1424(ra) # 800019f8 <_Z11printStringPKc>
    80001f90:	00000613          	li	a2,0
    80001f94:	00a00593          	li	a1,10
    80001f98:	0009051b          	sext.w	a0,s2
    80001f9c:	00000097          	auipc	ra,0x0
    80001fa0:	bf4080e7          	jalr	-1036(ra) # 80001b90 <_Z8printIntiii>
    80001fa4:	00003517          	auipc	a0,0x3
    80001fa8:	2ec50513          	addi	a0,a0,748 # 80005290 <CONSOLE_STATUS+0x280>
    80001fac:	00000097          	auipc	ra,0x0
    80001fb0:	a4c080e7          	jalr	-1460(ra) # 800019f8 <_Z11printStringPKc>
    80001fb4:	0400006f          	j	80001ff4 <_Z11workerBodyCPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80001fb8:	00003517          	auipc	a0,0x3
    80001fbc:	0f050513          	addi	a0,a0,240 # 800050a8 <CONSOLE_STATUS+0x98>
    80001fc0:	00000097          	auipc	ra,0x0
    80001fc4:	a38080e7          	jalr	-1480(ra) # 800019f8 <_Z11printStringPKc>
    80001fc8:	00000613          	li	a2,0
    80001fcc:	00a00593          	li	a1,10
    80001fd0:	00048513          	mv	a0,s1
    80001fd4:	00000097          	auipc	ra,0x0
    80001fd8:	bbc080e7          	jalr	-1092(ra) # 80001b90 <_Z8printIntiii>
    80001fdc:	00003517          	auipc	a0,0x3
    80001fe0:	2b450513          	addi	a0,a0,692 # 80005290 <CONSOLE_STATUS+0x280>
    80001fe4:	00000097          	auipc	ra,0x0
    80001fe8:	a14080e7          	jalr	-1516(ra) # 800019f8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80001fec:	0014849b          	addiw	s1,s1,1
    80001ff0:	0ff4f493          	andi	s1,s1,255
    80001ff4:	00500793          	li	a5,5
    80001ff8:	fc97f0e3          	bgeu	a5,s1,80001fb8 <_Z11workerBodyCPv+0x100>
    }

    printString("C finished!\n");
    80001ffc:	00003517          	auipc	a0,0x3
    80002000:	0dc50513          	addi	a0,a0,220 # 800050d8 <CONSOLE_STATUS+0xc8>
    80002004:	00000097          	auipc	ra,0x0
    80002008:	9f4080e7          	jalr	-1548(ra) # 800019f8 <_Z11printStringPKc>
    //_thread::running->setFinished(true);
    //thread_exit();
    finishedC = true;
    8000200c:	00100793          	li	a5,1
    80002010:	00004717          	auipc	a4,0x4
    80002014:	dcf70d23          	sb	a5,-550(a4) # 80005dea <finishedC>
    thread_dispatch();
    80002018:	fffff097          	auipc	ra,0xfffff
    8000201c:	574080e7          	jalr	1396(ra) # 8000158c <_Z15thread_dispatchv>
}
    80002020:	01813083          	ld	ra,24(sp)
    80002024:	01013403          	ld	s0,16(sp)
    80002028:	00813483          	ld	s1,8(sp)
    8000202c:	00013903          	ld	s2,0(sp)
    80002030:	02010113          	addi	sp,sp,32
    80002034:	00008067          	ret

0000000080002038 <_Z11workerBodyDPv>:

void workerBodyD(void* arg) {
    80002038:	fe010113          	addi	sp,sp,-32
    8000203c:	00113c23          	sd	ra,24(sp)
    80002040:	00813823          	sd	s0,16(sp)
    80002044:	00913423          	sd	s1,8(sp)
    80002048:	01213023          	sd	s2,0(sp)
    8000204c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80002050:	00a00493          	li	s1,10
    80002054:	0400006f          	j	80002094 <_Z11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002058:	00003517          	auipc	a0,0x3
    8000205c:	09050513          	addi	a0,a0,144 # 800050e8 <CONSOLE_STATUS+0xd8>
    80002060:	00000097          	auipc	ra,0x0
    80002064:	998080e7          	jalr	-1640(ra) # 800019f8 <_Z11printStringPKc>
    80002068:	00000613          	li	a2,0
    8000206c:	00a00593          	li	a1,10
    80002070:	00048513          	mv	a0,s1
    80002074:	00000097          	auipc	ra,0x0
    80002078:	b1c080e7          	jalr	-1252(ra) # 80001b90 <_Z8printIntiii>
    8000207c:	00003517          	auipc	a0,0x3
    80002080:	21450513          	addi	a0,a0,532 # 80005290 <CONSOLE_STATUS+0x280>
    80002084:	00000097          	auipc	ra,0x0
    80002088:	974080e7          	jalr	-1676(ra) # 800019f8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000208c:	0014849b          	addiw	s1,s1,1
    80002090:	0ff4f493          	andi	s1,s1,255
    80002094:	00c00793          	li	a5,12
    80002098:	fc97f0e3          	bgeu	a5,s1,80002058 <_Z11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    8000209c:	00003517          	auipc	a0,0x3
    800020a0:	05450513          	addi	a0,a0,84 # 800050f0 <CONSOLE_STATUS+0xe0>
    800020a4:	00000097          	auipc	ra,0x0
    800020a8:	954080e7          	jalr	-1708(ra) # 800019f8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800020ac:	00500313          	li	t1,5
    thread_dispatch();
    800020b0:	fffff097          	auipc	ra,0xfffff
    800020b4:	4dc080e7          	jalr	1244(ra) # 8000158c <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800020b8:	01000513          	li	a0,16
    800020bc:	00000097          	auipc	ra,0x0
    800020c0:	d88080e7          	jalr	-632(ra) # 80001e44 <_Z9fibonaccim>
    800020c4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800020c8:	00003517          	auipc	a0,0x3
    800020cc:	03850513          	addi	a0,a0,56 # 80005100 <CONSOLE_STATUS+0xf0>
    800020d0:	00000097          	auipc	ra,0x0
    800020d4:	928080e7          	jalr	-1752(ra) # 800019f8 <_Z11printStringPKc>
    800020d8:	00000613          	li	a2,0
    800020dc:	00a00593          	li	a1,10
    800020e0:	0009051b          	sext.w	a0,s2
    800020e4:	00000097          	auipc	ra,0x0
    800020e8:	aac080e7          	jalr	-1364(ra) # 80001b90 <_Z8printIntiii>
    800020ec:	00003517          	auipc	a0,0x3
    800020f0:	1a450513          	addi	a0,a0,420 # 80005290 <CONSOLE_STATUS+0x280>
    800020f4:	00000097          	auipc	ra,0x0
    800020f8:	904080e7          	jalr	-1788(ra) # 800019f8 <_Z11printStringPKc>
    800020fc:	0400006f          	j	8000213c <_Z11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80002100:	00003517          	auipc	a0,0x3
    80002104:	fe850513          	addi	a0,a0,-24 # 800050e8 <CONSOLE_STATUS+0xd8>
    80002108:	00000097          	auipc	ra,0x0
    8000210c:	8f0080e7          	jalr	-1808(ra) # 800019f8 <_Z11printStringPKc>
    80002110:	00000613          	li	a2,0
    80002114:	00a00593          	li	a1,10
    80002118:	00048513          	mv	a0,s1
    8000211c:	00000097          	auipc	ra,0x0
    80002120:	a74080e7          	jalr	-1420(ra) # 80001b90 <_Z8printIntiii>
    80002124:	00003517          	auipc	a0,0x3
    80002128:	16c50513          	addi	a0,a0,364 # 80005290 <CONSOLE_STATUS+0x280>
    8000212c:	00000097          	auipc	ra,0x0
    80002130:	8cc080e7          	jalr	-1844(ra) # 800019f8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80002134:	0014849b          	addiw	s1,s1,1
    80002138:	0ff4f493          	andi	s1,s1,255
    8000213c:	00f00793          	li	a5,15
    80002140:	fc97f0e3          	bgeu	a5,s1,80002100 <_Z11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80002144:	00003517          	auipc	a0,0x3
    80002148:	fcc50513          	addi	a0,a0,-52 # 80005110 <CONSOLE_STATUS+0x100>
    8000214c:	00000097          	auipc	ra,0x0
    80002150:	8ac080e7          	jalr	-1876(ra) # 800019f8 <_Z11printStringPKc>
    //_thread::running->setFinished(true);
    //thread_exit();
    finishedD = true;
    80002154:	00100793          	li	a5,1
    80002158:	00004717          	auipc	a4,0x4
    8000215c:	c8f709a3          	sb	a5,-877(a4) # 80005deb <finishedD>
    thread_dispatch();
    80002160:	fffff097          	auipc	ra,0xfffff
    80002164:	42c080e7          	jalr	1068(ra) # 8000158c <_Z15thread_dispatchv>
}
    80002168:	01813083          	ld	ra,24(sp)
    8000216c:	01013403          	ld	s0,16(sp)
    80002170:	00813483          	ld	s1,8(sp)
    80002174:	00013903          	ld	s2,0(sp)
    80002178:	02010113          	addi	sp,sp,32
    8000217c:	00008067          	ret

0000000080002180 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80002180:	fd010113          	addi	sp,sp,-48
    80002184:	02113423          	sd	ra,40(sp)
    80002188:	02813023          	sd	s0,32(sp)
    8000218c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80002190:	00000613          	li	a2,0
    80002194:	00000597          	auipc	a1,0x0
    80002198:	b1058593          	addi	a1,a1,-1264 # 80001ca4 <_Z11workerBodyAPv>
    8000219c:	fd040513          	addi	a0,s0,-48
    800021a0:	fffff097          	auipc	ra,0xfffff
    800021a4:	348080e7          	jalr	840(ra) # 800014e8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadA created\n");
    800021a8:	00003517          	auipc	a0,0x3
    800021ac:	f7850513          	addi	a0,a0,-136 # 80005120 <CONSOLE_STATUS+0x110>
    800021b0:	00000097          	auipc	ra,0x0
    800021b4:	848080e7          	jalr	-1976(ra) # 800019f8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    800021b8:	00000613          	li	a2,0
    800021bc:	00000597          	auipc	a1,0x0
    800021c0:	bb458593          	addi	a1,a1,-1100 # 80001d70 <_Z11workerBodyBPv>
    800021c4:	fd840513          	addi	a0,s0,-40
    800021c8:	fffff097          	auipc	ra,0xfffff
    800021cc:	320080e7          	jalr	800(ra) # 800014e8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadB created\n");
    800021d0:	00003517          	auipc	a0,0x3
    800021d4:	f6850513          	addi	a0,a0,-152 # 80005138 <CONSOLE_STATUS+0x128>
    800021d8:	00000097          	auipc	ra,0x0
    800021dc:	820080e7          	jalr	-2016(ra) # 800019f8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800021e0:	00000613          	li	a2,0
    800021e4:	00000597          	auipc	a1,0x0
    800021e8:	cd458593          	addi	a1,a1,-812 # 80001eb8 <_Z11workerBodyCPv>
    800021ec:	fe040513          	addi	a0,s0,-32
    800021f0:	fffff097          	auipc	ra,0xfffff
    800021f4:	2f8080e7          	jalr	760(ra) # 800014e8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadC created\n");
    800021f8:	00003517          	auipc	a0,0x3
    800021fc:	f5850513          	addi	a0,a0,-168 # 80005150 <CONSOLE_STATUS+0x140>
    80002200:	fffff097          	auipc	ra,0xfffff
    80002204:	7f8080e7          	jalr	2040(ra) # 800019f8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80002208:	00000613          	li	a2,0
    8000220c:	00000597          	auipc	a1,0x0
    80002210:	e2c58593          	addi	a1,a1,-468 # 80002038 <_Z11workerBodyDPv>
    80002214:	fe840513          	addi	a0,s0,-24
    80002218:	fffff097          	auipc	ra,0xfffff
    8000221c:	2d0080e7          	jalr	720(ra) # 800014e8 <_Z13thread_createPP7_threadPFvPvES2_>
    printString("ThreadD created\n");
    80002220:	00003517          	auipc	a0,0x3
    80002224:	f4850513          	addi	a0,a0,-184 # 80005168 <CONSOLE_STATUS+0x158>
    80002228:	fffff097          	auipc	ra,0xfffff
    8000222c:	7d0080e7          	jalr	2000(ra) # 800019f8 <_Z11printStringPKc>
    80002230:	00c0006f          	j	8000223c <_Z18Threads_C_API_testv+0xbc>

    //_thread::running->setFinished(true);
    //thread_exit();

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80002234:	fffff097          	auipc	ra,0xfffff
    80002238:	358080e7          	jalr	856(ra) # 8000158c <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000223c:	00004797          	auipc	a5,0x4
    80002240:	bac7c783          	lbu	a5,-1108(a5) # 80005de8 <finishedA>
    80002244:	fe0788e3          	beqz	a5,80002234 <_Z18Threads_C_API_testv+0xb4>
    80002248:	00004797          	auipc	a5,0x4
    8000224c:	ba17c783          	lbu	a5,-1119(a5) # 80005de9 <finishedB>
    80002250:	fe0782e3          	beqz	a5,80002234 <_Z18Threads_C_API_testv+0xb4>
    80002254:	00004797          	auipc	a5,0x4
    80002258:	b967c783          	lbu	a5,-1130(a5) # 80005dea <finishedC>
    8000225c:	fc078ce3          	beqz	a5,80002234 <_Z18Threads_C_API_testv+0xb4>
    80002260:	00004797          	auipc	a5,0x4
    80002264:	b8b7c783          	lbu	a5,-1141(a5) # 80005deb <finishedD>
    80002268:	fc0786e3          	beqz	a5,80002234 <_Z18Threads_C_API_testv+0xb4>
    }


}
    8000226c:	02813083          	ld	ra,40(sp)
    80002270:	02013403          	ld	s0,32(sp)
    80002274:	03010113          	addi	sp,sp,48
    80002278:	00008067          	ret

000000008000227c <_Z8userMainPv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.hpp" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain(void *) {
    8000227c:	ff010113          	addi	sp,sp,-16
    80002280:	00113423          	sd	ra,8(sp)
    80002284:	00813023          	sd	s0,0(sp)
    80002288:	01010413          	addi	s0,sp,16
    Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    8000228c:	00000097          	auipc	ra,0x0
    80002290:	ef4080e7          	jalr	-268(ra) # 80002180 <_Z18Threads_C_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
//    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

}
    80002294:	00813083          	ld	ra,8(sp)
    80002298:	00013403          	ld	s0,0(sp)
    8000229c:	01010113          	addi	sp,sp,16
    800022a0:	00008067          	ret

00000000800022a4 <_ZN9Scheduler3getEv>:

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

_thread *Scheduler::get()
{
    800022a4:	fe010113          	addi	sp,sp,-32
    800022a8:	00113c23          	sd	ra,24(sp)
    800022ac:	00813823          	sd	s0,16(sp)
    800022b0:	00913423          	sd	s1,8(sp)
    800022b4:	02010413          	addi	s0,sp,32
    if (!head) return nullptr;
    800022b8:	00004517          	auipc	a0,0x4
    800022bc:	b3853503          	ld	a0,-1224(a0) # 80005df0 <_ZN9Scheduler4headE>
    800022c0:	04050263          	beqz	a0,80002304 <_ZN9Scheduler3getEv+0x60>

    Elem* elem = head;
    head = head->next;
    800022c4:	01053783          	ld	a5,16(a0)
    800022c8:	00004717          	auipc	a4,0x4
    800022cc:	b2f73423          	sd	a5,-1240(a4) # 80005df0 <_ZN9Scheduler4headE>
    if (!head) tail = 0;
    800022d0:	02078463          	beqz	a5,800022f8 <_ZN9Scheduler3getEv+0x54>

    _thread *ret = elem->data;
    800022d4:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    800022d8:	00000097          	auipc	ra,0x0
    800022dc:	688080e7          	jalr	1672(ra) # 80002960 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    800022e0:	00048513          	mv	a0,s1
    800022e4:	01813083          	ld	ra,24(sp)
    800022e8:	01013403          	ld	s0,16(sp)
    800022ec:	00813483          	ld	s1,8(sp)
    800022f0:	02010113          	addi	sp,sp,32
    800022f4:	00008067          	ret
    if (!head) tail = 0;
    800022f8:	00004797          	auipc	a5,0x4
    800022fc:	b007b023          	sd	zero,-1280(a5) # 80005df8 <_ZN9Scheduler4tailE>
    80002300:	fd5ff06f          	j	800022d4 <_ZN9Scheduler3getEv+0x30>
    if (!head) return nullptr;
    80002304:	00050493          	mv	s1,a0
    80002308:	fd9ff06f          	j	800022e0 <_ZN9Scheduler3getEv+0x3c>

000000008000230c <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(_thread *ccb)
{
    8000230c:	fe010113          	addi	sp,sp,-32
    80002310:	00113c23          	sd	ra,24(sp)
    80002314:	00813823          	sd	s0,16(sp)
    80002318:	00913423          	sd	s1,8(sp)
    8000231c:	02010413          	addi	s0,sp,32
    80002320:	00050493          	mv	s1,a0
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80002324:	00100513          	li	a0,1
    80002328:	00000097          	auipc	ra,0x0
    8000232c:	464080e7          	jalr	1124(ra) # 8000278c <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = ccb;
    80002330:	00953023          	sd	s1,0(a0)
    elem->next = nullptr;
    80002334:	00053823          	sd	zero,16(a0)
    if(tail){
    80002338:	00004797          	auipc	a5,0x4
    8000233c:	ac07b783          	ld	a5,-1344(a5) # 80005df8 <_ZN9Scheduler4tailE>
    80002340:	02078263          	beqz	a5,80002364 <_ZN9Scheduler3putEP7_thread+0x58>
        tail->next = elem;
    80002344:	00a7b823          	sd	a0,16(a5)
        tail = elem;
    80002348:	00004797          	auipc	a5,0x4
    8000234c:	aaa7b823          	sd	a0,-1360(a5) # 80005df8 <_ZN9Scheduler4tailE>
    }else{
        head = tail = elem;
    }
    80002350:	01813083          	ld	ra,24(sp)
    80002354:	01013403          	ld	s0,16(sp)
    80002358:	00813483          	ld	s1,8(sp)
    8000235c:	02010113          	addi	sp,sp,32
    80002360:	00008067          	ret
        head = tail = elem;
    80002364:	00004797          	auipc	a5,0x4
    80002368:	a8c78793          	addi	a5,a5,-1396 # 80005df0 <_ZN9Scheduler4headE>
    8000236c:	00a7b423          	sd	a0,8(a5)
    80002370:	00a7b023          	sd	a0,0(a5)
    80002374:	fddff06f          	j	80002350 <_ZN9Scheduler3putEP7_thread+0x44>

0000000080002378 <_Z12checkNullptrPv>:
//}
//extern "C" void supervisorTrap();

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
    80002378:	00050e63          	beqz	a0,80002394 <_Z12checkNullptrPv+0x1c>
        __putc('?');
        __putc('0' + x);
    }
    x++;
    8000237c:	00004717          	auipc	a4,0x4
    80002380:	a8470713          	addi	a4,a4,-1404 # 80005e00 <_ZZ12checkNullptrPvE1x>
    80002384:	00072783          	lw	a5,0(a4)
    80002388:	0017879b          	addiw	a5,a5,1
    8000238c:	00f72023          	sw	a5,0(a4)
    80002390:	00008067          	ret
void checkNullptr(void* p) {
    80002394:	ff010113          	addi	sp,sp,-16
    80002398:	00113423          	sd	ra,8(sp)
    8000239c:	00813023          	sd	s0,0(sp)
    800023a0:	01010413          	addi	s0,sp,16
        __putc('?');
    800023a4:	03f00513          	li	a0,63
    800023a8:	00003097          	auipc	ra,0x3
    800023ac:	864080e7          	jalr	-1948(ra) # 80004c0c <__putc>
        __putc('0' + x);
    800023b0:	00004517          	auipc	a0,0x4
    800023b4:	a5052503          	lw	a0,-1456(a0) # 80005e00 <_ZZ12checkNullptrPvE1x>
    800023b8:	0305051b          	addiw	a0,a0,48
    800023bc:	0ff57513          	andi	a0,a0,255
    800023c0:	00003097          	auipc	ra,0x3
    800023c4:	84c080e7          	jalr	-1972(ra) # 80004c0c <__putc>
    x++;
    800023c8:	00004717          	auipc	a4,0x4
    800023cc:	a3870713          	addi	a4,a4,-1480 # 80005e00 <_ZZ12checkNullptrPvE1x>
    800023d0:	00072783          	lw	a5,0(a4)
    800023d4:	0017879b          	addiw	a5,a5,1
    800023d8:	00f72023          	sw	a5,0(a4)
}
    800023dc:	00813083          	ld	ra,8(sp)
    800023e0:	00013403          	ld	s0,0(sp)
    800023e4:	01010113          	addi	sp,sp,16
    800023e8:	00008067          	ret

00000000800023ec <_Z11checkStatusi>:

void checkStatus(int status) {
    static int y = 0;
    if(status) {
    800023ec:	00051e63          	bnez	a0,80002408 <_Z11checkStatusi+0x1c>
        __putc('0' + y);
        __putc('?');
    }
    y++;
    800023f0:	00004717          	auipc	a4,0x4
    800023f4:	a1070713          	addi	a4,a4,-1520 # 80005e00 <_ZZ12checkNullptrPvE1x>
    800023f8:	00472783          	lw	a5,4(a4)
    800023fc:	0017879b          	addiw	a5,a5,1
    80002400:	00f72223          	sw	a5,4(a4)
    80002404:	00008067          	ret
void checkStatus(int status) {
    80002408:	ff010113          	addi	sp,sp,-16
    8000240c:	00113423          	sd	ra,8(sp)
    80002410:	00813023          	sd	s0,0(sp)
    80002414:	01010413          	addi	s0,sp,16
        __putc('0' + y);
    80002418:	00004517          	auipc	a0,0x4
    8000241c:	9ec52503          	lw	a0,-1556(a0) # 80005e04 <_ZZ11checkStatusiE1y>
    80002420:	0305051b          	addiw	a0,a0,48
    80002424:	0ff57513          	andi	a0,a0,255
    80002428:	00002097          	auipc	ra,0x2
    8000242c:	7e4080e7          	jalr	2020(ra) # 80004c0c <__putc>
        __putc('?');
    80002430:	03f00513          	li	a0,63
    80002434:	00002097          	auipc	ra,0x2
    80002438:	7d8080e7          	jalr	2008(ra) # 80004c0c <__putc>
    y++;
    8000243c:	00004717          	auipc	a4,0x4
    80002440:	9c470713          	addi	a4,a4,-1596 # 80005e00 <_ZZ12checkNullptrPvE1x>
    80002444:	00472783          	lw	a5,4(a4)
    80002448:	0017879b          	addiw	a5,a5,1
    8000244c:	00f72223          	sw	a5,4(a4)
}
    80002450:	00813083          	ld	ra,8(sp)
    80002454:	00013403          	ld	s0,0(sp)
    80002458:	01010113          	addi	sp,sp,16
    8000245c:	00008067          	ret

0000000080002460 <main>:
extern "C" void trap();
void userMain(void *);

int main(){
    80002460:	fe010113          	addi	sp,sp,-32
    80002464:	00113c23          	sd	ra,24(sp)
    80002468:	00813823          	sd	s0,16(sp)
    8000246c:	00913423          	sd	s1,8(sp)
    80002470:	02010413          	addi	s0,sp,32
    //Riscv::w_stvec((uint64) &trap);
    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    //_thread *threads[2];

    _thread *thread = _thread::createThread(nullptr, nullptr);
    80002474:	00000593          	li	a1,0
    80002478:	00000513          	li	a0,0
    8000247c:	fffff097          	auipc	ra,0xfffff
    80002480:	434080e7          	jalr	1076(ra) # 800018b0 <_ZN7_thread12createThreadEPFvPvES0_>
    80002484:	00050493          	mv	s1,a0
    _thread::running = thread;
    80002488:	00004797          	auipc	a5,0x4
    8000248c:	8d07b783          	ld	a5,-1840(a5) # 80005d58 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002490:	00a7b023          	sd	a0,0(a5)

    //threads[1] = _thread::createThread(userMain, nullptr);

    Riscv::w_stvec((uint64) &trap);
    80002494:	00004797          	auipc	a5,0x4
    80002498:	8e47b783          	ld	a5,-1820(a5) # 80005d78 <_GLOBAL_OFFSET_TABLE_+0x30>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    8000249c:	10579073          	csrw	stvec,a5
    __asm__ volatile("ecall");
    800024a0:	00000073          	ecall
    bool isFinished() const { return finished; }
    800024a4:	0184c783          	lbu	a5,24(s1)

    //Riscv::ms_sstatus(Riscv::SSTATUS_SIE);


    while (!(thread->isFinished()))
    800024a8:	00079863          	bnez	a5,800024b8 <main+0x58>
    {
        _thread::yield();
    800024ac:	fffff097          	auipc	ra,0xfffff
    800024b0:	29c080e7          	jalr	668(ra) # 80001748 <_ZN7_thread5yieldEv>
    while (!(thread->isFinished()))
    800024b4:	ff1ff06f          	j	800024a4 <main+0x44>
    }
    return 0;
}
    800024b8:	00000513          	li	a0,0
    800024bc:	01813083          	ld	ra,24(sp)
    800024c0:	01013403          	ld	s0,16(sp)
    800024c4:	00813483          	ld	s1,8(sp)
    800024c8:	02010113          	addi	sp,sp,32
    800024cc:	00008067          	ret

00000000800024d0 <_Z10wrapperRunPv>:
struct Wrapper {
    ptrOnFun func;
};

void wrapperRun(void* p){
    if(p == nullptr) return;
    800024d0:	02050863          	beqz	a0,80002500 <_Z10wrapperRunPv+0x30>
void wrapperRun(void* p){
    800024d4:	ff010113          	addi	sp,sp,-16
    800024d8:	00113423          	sd	ra,8(sp)
    800024dc:	00813023          	sd	s0,0(sp)
    800024e0:	01010413          	addi	s0,sp,16
    ((Thread*)p)->run();
    800024e4:	00053783          	ld	a5,0(a0)
    800024e8:	0107b783          	ld	a5,16(a5)
    800024ec:	000780e7          	jalr	a5
}
    800024f0:	00813083          	ld	ra,8(sp)
    800024f4:	00013403          	ld	s0,0(sp)
    800024f8:	01010113          	addi	sp,sp,16
    800024fc:	00008067          	ret
    80002500:	00008067          	ret

0000000080002504 <_ZN6ThreadD1Ev>:

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    80002504:	ff010113          	addi	sp,sp,-16
    80002508:	00113423          	sd	ra,8(sp)
    8000250c:	00813023          	sd	s0,0(sp)
    80002510:	01010413          	addi	s0,sp,16
    80002514:	00004797          	auipc	a5,0x4
    80002518:	81478793          	addi	a5,a5,-2028 # 80005d28 <_ZTV6Thread+0x10>
    8000251c:	00f53023          	sd	a5,0(a0)
    thread_exit();
    80002520:	fffff097          	auipc	ra,0xfffff
    80002524:	f94080e7          	jalr	-108(ra) # 800014b4 <_Z11thread_exitv>
}
    80002528:	00813083          	ld	ra,8(sp)
    8000252c:	00013403          	ld	s0,0(sp)
    80002530:	01010113          	addi	sp,sp,16
    80002534:	00008067          	ret

0000000080002538 <_Znwm>:
void* operator new(size_t size){
    80002538:	ff010113          	addi	sp,sp,-16
    8000253c:	00113423          	sd	ra,8(sp)
    80002540:	00813023          	sd	s0,0(sp)
    80002544:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    80002548:	fffff097          	auipc	ra,0xfffff
    8000254c:	eec080e7          	jalr	-276(ra) # 80001434 <_Z9mem_allocm>
}
    80002550:	00813083          	ld	ra,8(sp)
    80002554:	00013403          	ld	s0,0(sp)
    80002558:	01010113          	addi	sp,sp,16
    8000255c:	00008067          	ret

0000000080002560 <_Znam>:
void* operator new[](size_t size){
    80002560:	ff010113          	addi	sp,sp,-16
    80002564:	00113423          	sd	ra,8(sp)
    80002568:	00813023          	sd	s0,0(sp)
    8000256c:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    80002570:	fffff097          	auipc	ra,0xfffff
    80002574:	ec4080e7          	jalr	-316(ra) # 80001434 <_Z9mem_allocm>
}
    80002578:	00813083          	ld	ra,8(sp)
    8000257c:	00013403          	ld	s0,0(sp)
    80002580:	01010113          	addi	sp,sp,16
    80002584:	00008067          	ret

0000000080002588 <_ZdlPv>:
void operator delete(void * p){
    80002588:	ff010113          	addi	sp,sp,-16
    8000258c:	00113423          	sd	ra,8(sp)
    80002590:	00813023          	sd	s0,0(sp)
    80002594:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002598:	fffff097          	auipc	ra,0xfffff
    8000259c:	ee4080e7          	jalr	-284(ra) # 8000147c <_Z8mem_freePv>
}
    800025a0:	00813083          	ld	ra,8(sp)
    800025a4:	00013403          	ld	s0,0(sp)
    800025a8:	01010113          	addi	sp,sp,16
    800025ac:	00008067          	ret

00000000800025b0 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    800025b0:	fe010113          	addi	sp,sp,-32
    800025b4:	00113c23          	sd	ra,24(sp)
    800025b8:	00813823          	sd	s0,16(sp)
    800025bc:	00913423          	sd	s1,8(sp)
    800025c0:	02010413          	addi	s0,sp,32
    800025c4:	00050493          	mv	s1,a0
}
    800025c8:	00000097          	auipc	ra,0x0
    800025cc:	f3c080e7          	jalr	-196(ra) # 80002504 <_ZN6ThreadD1Ev>
    800025d0:	00048513          	mv	a0,s1
    800025d4:	00000097          	auipc	ra,0x0
    800025d8:	fb4080e7          	jalr	-76(ra) # 80002588 <_ZdlPv>
    800025dc:	01813083          	ld	ra,24(sp)
    800025e0:	01013403          	ld	s0,16(sp)
    800025e4:	00813483          	ld	s1,8(sp)
    800025e8:	02010113          	addi	sp,sp,32
    800025ec:	00008067          	ret

00000000800025f0 <_ZdaPv>:
void operator delete[](void * p){
    800025f0:	ff010113          	addi	sp,sp,-16
    800025f4:	00113423          	sd	ra,8(sp)
    800025f8:	00813023          	sd	s0,0(sp)
    800025fc:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002600:	fffff097          	auipc	ra,0xfffff
    80002604:	e7c080e7          	jalr	-388(ra) # 8000147c <_Z8mem_freePv>
}
    80002608:	00813083          	ld	ra,8(sp)
    8000260c:	00013403          	ld	s0,0(sp)
    80002610:	01010113          	addi	sp,sp,16
    80002614:	00008067          	ret

0000000080002618 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002618:	ff010113          	addi	sp,sp,-16
    8000261c:	00113423          	sd	ra,8(sp)
    80002620:	00813023          	sd	s0,0(sp)
    80002624:	01010413          	addi	s0,sp,16
    80002628:	00003797          	auipc	a5,0x3
    8000262c:	70078793          	addi	a5,a5,1792 # 80005d28 <_ZTV6Thread+0x10>
    80002630:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80002634:	00850513          	addi	a0,a0,8
    80002638:	fffff097          	auipc	ra,0xfffff
    8000263c:	eb0080e7          	jalr	-336(ra) # 800014e8 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80002640:	00813083          	ld	ra,8(sp)
    80002644:	00013403          	ld	s0,0(sp)
    80002648:	01010113          	addi	sp,sp,16
    8000264c:	00008067          	ret

0000000080002650 <_ZN6Thread5startEv>:

int Thread::start() {
    80002650:	ff010113          	addi	sp,sp,-16
    80002654:	00113423          	sd	ra,8(sp)
    80002658:	00813023          	sd	s0,0(sp)
    8000265c:	01010413          	addi	s0,sp,16
    thread_start(myHandle);
    80002660:	00853503          	ld	a0,8(a0)
    80002664:	fffff097          	auipc	ra,0xfffff
    80002668:	fc8080e7          	jalr	-56(ra) # 8000162c <_Z12thread_startP7_thread>
    return 0;
}
    8000266c:	00000513          	li	a0,0
    80002670:	00813083          	ld	ra,8(sp)
    80002674:	00013403          	ld	s0,0(sp)
    80002678:	01010113          	addi	sp,sp,16
    8000267c:	00008067          	ret

0000000080002680 <_ZN6Thread8dispatchEv>:

void Thread::dispatch() {
    80002680:	ff010113          	addi	sp,sp,-16
    80002684:	00113423          	sd	ra,8(sp)
    80002688:	00813023          	sd	s0,0(sp)
    8000268c:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002690:	fffff097          	auipc	ra,0xfffff
    80002694:	efc080e7          	jalr	-260(ra) # 8000158c <_Z15thread_dispatchv>
}
    80002698:	00813083          	ld	ra,8(sp)
    8000269c:	00013403          	ld	s0,0(sp)
    800026a0:	01010113          	addi	sp,sp,16
    800026a4:	00008067          	ret

00000000800026a8 <_ZN6Thread5sleepEm>:

int Thread::sleep(time_t) {
    800026a8:	ff010113          	addi	sp,sp,-16
    800026ac:	00813423          	sd	s0,8(sp)
    800026b0:	01010413          	addi	s0,sp,16
    return 0;
}
    800026b4:	00000513          	li	a0,0
    800026b8:	00813403          	ld	s0,8(sp)
    800026bc:	01010113          	addi	sp,sp,16
    800026c0:	00008067          	ret

00000000800026c4 <_ZN6ThreadC1Ev>:

Thread::Thread() {
    800026c4:	ff010113          	addi	sp,sp,-16
    800026c8:	00113423          	sd	ra,8(sp)
    800026cc:	00813023          	sd	s0,0(sp)
    800026d0:	01010413          	addi	s0,sp,16
    800026d4:	00003797          	auipc	a5,0x3
    800026d8:	65478793          	addi	a5,a5,1620 # 80005d28 <_ZTV6Thread+0x10>
    800026dc:	00f53023          	sd	a5,0(a0)

    thread_create_only(&myHandle,wrapperRun,this);
    800026e0:	00050613          	mv	a2,a0
    800026e4:	00000597          	auipc	a1,0x0
    800026e8:	dec58593          	addi	a1,a1,-532 # 800024d0 <_Z10wrapperRunPv>
    800026ec:	00850513          	addi	a0,a0,8
    800026f0:	fffff097          	auipc	ra,0xfffff
    800026f4:	ec8080e7          	jalr	-312(ra) # 800015b8 <_Z18thread_create_onlyPP7_threadPFvPvES2_>
}
    800026f8:	00813083          	ld	ra,8(sp)
    800026fc:	00013403          	ld	s0,0(sp)
    80002700:	01010113          	addi	sp,sp,16
    80002704:	00008067          	ret

0000000080002708 <_ZN6Thread3runEv>:

   // void* operator new(size_t);
    friend void wrapperRun(void* p);
protected:
    Thread();
    virtual void run(){};
    80002708:	ff010113          	addi	sp,sp,-16
    8000270c:	00813423          	sd	s0,8(sp)
    80002710:	01010413          	addi	s0,sp,16
    80002714:	00813403          	ld	s0,8(sp)
    80002718:	01010113          	addi	sp,sp,16
    8000271c:	00008067          	ret

0000000080002720 <_ZN5Riscv10popSppSpieEv>:
#include "../h/riscv.h"
//#include "../h/tcb.hpp"
#include "../lib/console.h"

void Riscv::popSppSpie()
{
    80002720:	ff010113          	addi	sp,sp,-16
    80002724:	00813423          	sd	s0,8(sp)
    80002728:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    8000272c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002730:	10000793          	li	a5,256
    80002734:	1007a073          	csrs	sstatus,a5
    ms_sstatus(SSTATUS_SPP);
    __asm__ volatile ("sret");
    80002738:	10200073          	sret
}
    8000273c:	00813403          	ld	s0,8(sp)
    80002740:	01010113          	addi	sp,sp,16
    80002744:	00008067          	ret

0000000080002748 <_Z41__static_initialization_and_destruction_0ii>:
            if (cur) cur->next = newSeg;
            else fmem_head = newSeg;
            return 0;
        }
    }
}
    80002748:	ff010113          	addi	sp,sp,-16
    8000274c:	00813423          	sd	s0,8(sp)
    80002750:	01010413          	addi	s0,sp,16
    80002754:	00100793          	li	a5,1
    80002758:	00f50863          	beq	a0,a5,80002768 <_Z41__static_initialization_and_destruction_0ii+0x20>
    8000275c:	00813403          	ld	s0,8(sp)
    80002760:	01010113          	addi	sp,sp,16
    80002764:	00008067          	ret
    80002768:	000107b7          	lui	a5,0x10
    8000276c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002770:	fef596e3          	bne	a1,a5,8000275c <_Z41__static_initialization_and_destruction_0ii+0x14>
MemoryAllocator::FreeMem* MemoryAllocator::fmem_head = (MemoryAllocator::FreeMem*)HEAP_START_ADDR; //stavila onako
    80002774:	00003797          	auipc	a5,0x3
    80002778:	5dc7b783          	ld	a5,1500(a5) # 80005d50 <_GLOBAL_OFFSET_TABLE_+0x8>
    8000277c:	0007b783          	ld	a5,0(a5)
    80002780:	00003717          	auipc	a4,0x3
    80002784:	68f73423          	sd	a5,1672(a4) # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
}
    80002788:	fd5ff06f          	j	8000275c <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000278c <_ZN15MemoryAllocator9mem_allocEm>:
void *MemoryAllocator::mem_alloc(size_t size) {
    8000278c:	ff010113          	addi	sp,sp,-16
    80002790:	00813423          	sd	s0,8(sp)
    80002794:	01010413          	addi	s0,sp,16
    if (size <=0) return nullptr;
    80002798:	12050663          	beqz	a0,800028c4 <_ZN15MemoryAllocator9mem_allocEm+0x138>
    8000279c:	00050793          	mv	a5,a0
    FreeMem* cur = fmem_head;
    800027a0:	00003517          	auipc	a0,0x3
    800027a4:	66853503          	ld	a0,1640(a0) # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
    for(;cur !=0; cur = cur->next){
    800027a8:	0e050e63          	beqz	a0,800028a4 <_ZN15MemoryAllocator9mem_allocEm+0x118>
        if(cur->size < (size)*MEM_BLOCK_SIZE) continue;
    800027ac:	01053703          	ld	a4,16(a0)
    800027b0:	00679693          	slli	a3,a5,0x6
    800027b4:	04d76c63          	bltu	a4,a3,8000280c <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(cur->size - (size)*MEM_BLOCK_SIZE < sizeof(FreeMem)){
    800027b8:	40d70733          	sub	a4,a4,a3
    800027bc:	01700793          	li	a5,23
    800027c0:	06e7e263          	bltu	a5,a4,80002824 <_ZN15MemoryAllocator9mem_allocEm+0x98>
            if(cur->prev) cur->prev->next = cur->next;
    800027c4:	00853783          	ld	a5,8(a0)
    800027c8:	04078663          	beqz	a5,80002814 <_ZN15MemoryAllocator9mem_allocEm+0x88>
    800027cc:	00053703          	ld	a4,0(a0)
    800027d0:	00e7b023          	sd	a4,0(a5)
            if(cur->next) cur->next->prev = cur->prev;
    800027d4:	00053783          	ld	a5,0(a0)
    800027d8:	00078663          	beqz	a5,800027e4 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    800027dc:	00853703          	ld	a4,8(a0)
    800027e0:	00e7b423          	sd	a4,8(a5)
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    800027e4:	00003617          	auipc	a2,0x3
    800027e8:	62c63603          	ld	a2,1580(a2) # 80005e10 <_ZN15MemoryAllocator9full_headE>
    800027ec:	08060063          	beqz	a2,8000286c <_ZN15MemoryAllocator9mem_allocEm+0xe0>
    800027f0:	08c56263          	bltu	a0,a2,80002874 <_ZN15MemoryAllocator9mem_allocEm+0xe8>
            for (tmp = full_head; tmp->next != nullptr && (char *) cur > (char *) (tmp->next); tmp = tmp->next);
    800027f4:	00060793          	mv	a5,a2
    800027f8:	00078713          	mv	a4,a5
    800027fc:	0007b783          	ld	a5,0(a5)
    80002800:	06078c63          	beqz	a5,80002878 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    80002804:	fea7eae3          	bltu	a5,a0,800027f8 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    80002808:	0700006f          	j	80002878 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    for(;cur !=0; cur = cur->next){
    8000280c:	00053503          	ld	a0,0(a0)
    80002810:	f99ff06f          	j	800027a8 <_ZN15MemoryAllocator9mem_allocEm+0x1c>
            else fmem_head = cur->next;
    80002814:	00053783          	ld	a5,0(a0)
    80002818:	00003717          	auipc	a4,0x3
    8000281c:	5ef73823          	sd	a5,1520(a4) # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
    80002820:	fb5ff06f          	j	800027d4 <_ZN15MemoryAllocator9mem_allocEm+0x48>
            FreeMem* newfrgm = (FreeMem*)((char*)cur + (size)*MEM_BLOCK_SIZE);
    80002824:	00d507b3          	add	a5,a0,a3
            newfrgm->prev = cur->prev;
    80002828:	00853703          	ld	a4,8(a0)
    8000282c:	00e7b423          	sd	a4,8(a5)
            newfrgm->next = cur->next;
    80002830:	00053703          	ld	a4,0(a0)
    80002834:	00e7b023          	sd	a4,0(a5)
            newfrgm->size = cur->size - (size)*MEM_BLOCK_SIZE;
    80002838:	01053703          	ld	a4,16(a0)
    8000283c:	40d70733          	sub	a4,a4,a3
    80002840:	00e7b823          	sd	a4,16(a5)
            if(cur->prev) cur->prev->next = newfrgm;
    80002844:	00853703          	ld	a4,8(a0)
    80002848:	00070c63          	beqz	a4,80002860 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    8000284c:	00f73023          	sd	a5,0(a4)
            if(cur->next) cur->next->prev = newfrgm;
    80002850:	00053703          	ld	a4,0(a0)
    80002854:	f80708e3          	beqz	a4,800027e4 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002858:	00f73423          	sd	a5,8(a4)
    8000285c:	f89ff06f          	j	800027e4 <_ZN15MemoryAllocator9mem_allocEm+0x58>
            else fmem_head = newfrgm;
    80002860:	00003717          	auipc	a4,0x3
    80002864:	5af73423          	sd	a5,1448(a4) # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
    80002868:	fe9ff06f          	j	80002850 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    8000286c:	00060713          	mv	a4,a2
    80002870:	0080006f          	j	80002878 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    80002874:	00000713          	li	a4,0
        newSeg->size = (size)*MEM_BLOCK_SIZE ;
    80002878:	00d53823          	sd	a3,16(a0)
        newSeg->prev = tmp;
    8000287c:	00e53423          	sd	a4,8(a0)
        if (tmp) newSeg->next = tmp->next;
    80002880:	02070863          	beqz	a4,800028b0 <_ZN15MemoryAllocator9mem_allocEm+0x124>
    80002884:	00073783          	ld	a5,0(a4)
    80002888:	00f53023          	sd	a5,0(a0)
        if(newSeg->next) newSeg->next->prev = newSeg;
    8000288c:	00053783          	ld	a5,0(a0)
    80002890:	00078463          	beqz	a5,80002898 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
    80002894:	00a7b423          	sd	a0,8(a5)
        if (tmp) tmp->next = newSeg;
    80002898:	02070063          	beqz	a4,800028b8 <_ZN15MemoryAllocator9mem_allocEm+0x12c>
    8000289c:	00a73023          	sd	a0,0(a4)
        return (void*)((char*)cur+headSize);
    800028a0:	01850513          	addi	a0,a0,24
}
    800028a4:	00813403          	ld	s0,8(sp)
    800028a8:	01010113          	addi	sp,sp,16
    800028ac:	00008067          	ret
        else newSeg->next = full_head;
    800028b0:	00c53023          	sd	a2,0(a0)
    800028b4:	fd9ff06f          	j	8000288c <_ZN15MemoryAllocator9mem_allocEm+0x100>
        else full_head = newSeg;
    800028b8:	00003797          	auipc	a5,0x3
    800028bc:	54a7bc23          	sd	a0,1368(a5) # 80005e10 <_ZN15MemoryAllocator9full_headE>
    800028c0:	fe1ff06f          	j	800028a0 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    if (size <=0) return nullptr;
    800028c4:	00000513          	li	a0,0
    800028c8:	fddff06f          	j	800028a4 <_ZN15MemoryAllocator9mem_allocEm+0x118>

00000000800028cc <_ZN15MemoryAllocator11getInstanceEv>:
    if (memoryAllocator == nullptr) {
    800028cc:	00003797          	auipc	a5,0x3
    800028d0:	54c7b783          	ld	a5,1356(a5) # 80005e18 <_ZN15MemoryAllocator15memoryAllocatorE>
    800028d4:	00078863          	beqz	a5,800028e4 <_ZN15MemoryAllocator11getInstanceEv+0x18>
}
    800028d8:	00003517          	auipc	a0,0x3
    800028dc:	54053503          	ld	a0,1344(a0) # 80005e18 <_ZN15MemoryAllocator15memoryAllocatorE>
    800028e0:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    800028e4:	fe010113          	addi	sp,sp,-32
    800028e8:	00113c23          	sd	ra,24(sp)
    800028ec:	00813823          	sd	s0,16(sp)
    800028f0:	00913423          	sd	s1,8(sp)
    800028f4:	02010413          	addi	s0,sp,32
        fmem_head = (FreeMem*)HEAP_START_ADDR;
    800028f8:	00003697          	auipc	a3,0x3
    800028fc:	4586b683          	ld	a3,1112(a3) # 80005d50 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002900:	0006b783          	ld	a5,0(a3)
    80002904:	00003497          	auipc	s1,0x3
    80002908:	50448493          	addi	s1,s1,1284 # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
    8000290c:	00f4b023          	sd	a5,0(s1)
        fmem_head->next = nullptr;
    80002910:	0007b023          	sd	zero,0(a5)
        fmem_head->prev = nullptr;
    80002914:	0004b703          	ld	a4,0(s1)
    80002918:	00073423          	sd	zero,8(a4)
        fmem_head->size = (size_t)HEAP_END_ADDR -(size_t )HEAP_START_ADDR;
    8000291c:	00003797          	auipc	a5,0x3
    80002920:	4647b783          	ld	a5,1124(a5) # 80005d80 <_GLOBAL_OFFSET_TABLE_+0x38>
    80002924:	0007b783          	ld	a5,0(a5)
    80002928:	0006b683          	ld	a3,0(a3)
    8000292c:	40d787b3          	sub	a5,a5,a3
    80002930:	00f73823          	sd	a5,16(a4)
        memoryAllocator = (MemoryAllocator*)MemoryAllocator::mem_alloc((sizeof(MemoryAllocator)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80002934:	00100513          	li	a0,1
    80002938:	00000097          	auipc	ra,0x0
    8000293c:	e54080e7          	jalr	-428(ra) # 8000278c <_ZN15MemoryAllocator9mem_allocEm>
    80002940:	00a4b823          	sd	a0,16(s1)
}
    80002944:	00003517          	auipc	a0,0x3
    80002948:	4d453503          	ld	a0,1236(a0) # 80005e18 <_ZN15MemoryAllocator15memoryAllocatorE>
    8000294c:	01813083          	ld	ra,24(sp)
    80002950:	01013403          	ld	s0,16(sp)
    80002954:	00813483          	ld	s1,8(sp)
    80002958:	02010113          	addi	sp,sp,32
    8000295c:	00008067          	ret

0000000080002960 <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void *addr) {
    80002960:	ff010113          	addi	sp,sp,-16
    80002964:	00813423          	sd	s0,8(sp)
    80002968:	01010413          	addi	s0,sp,16
    if (addr == nullptr) return -2;
    8000296c:	1a050063          	beqz	a0,80002b0c <_ZN15MemoryAllocator8mem_freeEPv+0x1ac>
    addr = (void*)((char*)addr-headSize);
    80002970:	fe850713          	addi	a4,a0,-24
    FullMem* tmp = full_head;
    80002974:	00003797          	auipc	a5,0x3
    80002978:	49c7b783          	ld	a5,1180(a5) # 80005e10 <_ZN15MemoryAllocator9full_headE>
    bool flag = false;
    8000297c:	0080006f          	j	80002984 <_ZN15MemoryAllocator8mem_freeEPv+0x24>
    for(; tmp && dSeg>=tmp; tmp = tmp->next){
    80002980:	0007b783          	ld	a5,0(a5)
    80002984:	00078a63          	beqz	a5,80002998 <_ZN15MemoryAllocator8mem_freeEPv+0x38>
    80002988:	08f76663          	bltu	a4,a5,80002a14 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        if(tmp == dSeg) {
    8000298c:	fee79ae3          	bne	a5,a4,80002980 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
            flag = true;
    80002990:	00100693          	li	a3,1
    80002994:	0080006f          	j	8000299c <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    bool flag = false;
    80002998:	00000693          	li	a3,0
    if (!flag) return -1;
    8000299c:	16068c63          	beqz	a3,80002b14 <_ZN15MemoryAllocator8mem_freeEPv+0x1b4>
    if (tmp->prev) tmp->prev->next = tmp->next;
    800029a0:	0087b683          	ld	a3,8(a5)
    800029a4:	06068c63          	beqz	a3,80002a1c <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    800029a8:	0007b603          	ld	a2,0(a5)
    800029ac:	00c6b023          	sd	a2,0(a3)
    if (tmp->next) tmp->next->prev = tmp->prev;
    800029b0:	0007b683          	ld	a3,0(a5)
    800029b4:	00068663          	beqz	a3,800029c0 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
    800029b8:	0087b603          	ld	a2,8(a5)
    800029bc:	00c6b423          	sd	a2,8(a3)
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    800029c0:	00003597          	auipc	a1,0x3
    800029c4:	4485b583          	ld	a1,1096(a1) # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
    800029c8:	08058263          	beqz	a1,80002a4c <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    800029cc:	08b76463          	bltu	a4,a1,80002a54 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
        for (cur = fmem_head; cur->next != nullptr && (char*)addr>(char*)(cur->next); cur = cur->next);
    800029d0:	00058693          	mv	a3,a1
    800029d4:	00068613          	mv	a2,a3
    800029d8:	0006b683          	ld	a3,0(a3)
    800029dc:	00068463          	beqz	a3,800029e4 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    800029e0:	fee6eae3          	bltu	a3,a4,800029d4 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if(cur && (char*)cur+cur->size == addr){
    800029e4:	06060a63          	beqz	a2,80002a58 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    800029e8:	01063803          	ld	a6,16(a2)
    800029ec:	010608b3          	add	a7,a2,a6
    800029f0:	06e89463          	bne	a7,a4,80002a58 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
        cur->size += tmp->size;
    800029f4:	0107b783          	ld	a5,16(a5)
    800029f8:	00f80833          	add	a6,a6,a5
    800029fc:	01063823          	sd	a6,16(a2)
        if (cur->next && (char*)((char*)cur+ cur->size) == (char*)(cur->next)){
    80002a00:	00068663          	beqz	a3,80002a0c <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002a04:	010607b3          	add	a5,a2,a6
    80002a08:	02f68263          	beq	a3,a5,80002a2c <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
        return 0;
    80002a0c:	00000513          	li	a0,0
    80002a10:	0900006f          	j	80002aa0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    bool flag = false;
    80002a14:	00000693          	li	a3,0
    80002a18:	f85ff06f          	j	8000299c <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    else full_head = tmp->next;
    80002a1c:	0007b683          	ld	a3,0(a5)
    80002a20:	00003617          	auipc	a2,0x3
    80002a24:	3ed63823          	sd	a3,1008(a2) # 80005e10 <_ZN15MemoryAllocator9full_headE>
    80002a28:	f89ff06f          	j	800029b0 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
            cur->size += cur->next->size;
    80002a2c:	0106b783          	ld	a5,16(a3)
    80002a30:	00f80833          	add	a6,a6,a5
    80002a34:	01063823          	sd	a6,16(a2)
            cur->next = cur->next->next;
    80002a38:	0006b783          	ld	a5,0(a3)
    80002a3c:	00f63023          	sd	a5,0(a2)
            if (cur->next) cur->next->prev = cur;
    80002a40:	fc0786e3          	beqz	a5,80002a0c <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002a44:	00c7b423          	sd	a2,8(a5)
    80002a48:	fc5ff06f          	j	80002a0c <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002a4c:	00058613          	mv	a2,a1
    80002a50:	0080006f          	j	80002a58 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002a54:	00000613          	li	a2,0
        FreeMem* nxtSeg = cur?cur->next:fmem_head;
    80002a58:	00060463          	beqz	a2,80002a60 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    80002a5c:	00063583          	ld	a1,0(a2)
        if(nxtSeg && (char*)((char*)tmp + tmp->size) == (char*) nxtSeg){
    80002a60:	00058863          	beqz	a1,80002a70 <_ZN15MemoryAllocator8mem_freeEPv+0x110>
    80002a64:	0107b683          	ld	a3,16(a5)
    80002a68:	00d78833          	add	a6,a5,a3
    80002a6c:	04b80063          	beq	a6,a1,80002aac <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
            newSeg->size = tmp->size;
    80002a70:	0107b783          	ld	a5,16(a5)
    80002a74:	fef53c23          	sd	a5,-8(a0)
            newSeg->prev = cur;
    80002a78:	fec53823          	sd	a2,-16(a0)
            if(cur) newSeg->next = cur->next;
    80002a7c:	06060a63          	beqz	a2,80002af0 <_ZN15MemoryAllocator8mem_freeEPv+0x190>
    80002a80:	00063783          	ld	a5,0(a2)
    80002a84:	fef53423          	sd	a5,-24(a0)
            if(newSeg->next) newSeg->next->prev = newSeg;
    80002a88:	fe853783          	ld	a5,-24(a0)
    80002a8c:	00078463          	beqz	a5,80002a94 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
    80002a90:	00e7b423          	sd	a4,8(a5)
            if (cur) cur->next = newSeg;
    80002a94:	06060663          	beqz	a2,80002b00 <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
    80002a98:	00e63023          	sd	a4,0(a2)
            return 0;
    80002a9c:	00000513          	li	a0,0
}
    80002aa0:	00813403          	ld	s0,8(sp)
    80002aa4:	01010113          	addi	sp,sp,16
    80002aa8:	00008067          	ret
            newSeg->size = nxtSeg->size + tmp->size;
    80002aac:	0105b783          	ld	a5,16(a1)
    80002ab0:	00f686b3          	add	a3,a3,a5
    80002ab4:	fed53c23          	sd	a3,-8(a0)
            newSeg->prev = nxtSeg->prev;
    80002ab8:	0085b783          	ld	a5,8(a1)
    80002abc:	fef53823          	sd	a5,-16(a0)
            newSeg->next = nxtSeg->next;
    80002ac0:	0005b783          	ld	a5,0(a1)
    80002ac4:	fef53423          	sd	a5,-24(a0)
            if(nxtSeg->next) nxtSeg->next->prev = newSeg;
    80002ac8:	00078463          	beqz	a5,80002ad0 <_ZN15MemoryAllocator8mem_freeEPv+0x170>
    80002acc:	00e7b423          	sd	a4,8(a5)
            if(nxtSeg->prev) nxtSeg->prev->next = newSeg;
    80002ad0:	0085b783          	ld	a5,8(a1)
    80002ad4:	00078863          	beqz	a5,80002ae4 <_ZN15MemoryAllocator8mem_freeEPv+0x184>
    80002ad8:	00e7b023          	sd	a4,0(a5)
            return 0;
    80002adc:	00000513          	li	a0,0
    80002ae0:	fc1ff06f          	j	80002aa0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
            else fmem_head = newSeg;
    80002ae4:	00003797          	auipc	a5,0x3
    80002ae8:	32e7b223          	sd	a4,804(a5) # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
    80002aec:	ff1ff06f          	j	80002adc <_ZN15MemoryAllocator8mem_freeEPv+0x17c>
            else newSeg->next =fmem_head;
    80002af0:	00003797          	auipc	a5,0x3
    80002af4:	3187b783          	ld	a5,792(a5) # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
    80002af8:	fef53423          	sd	a5,-24(a0)
    80002afc:	f8dff06f          	j	80002a88 <_ZN15MemoryAllocator8mem_freeEPv+0x128>
            else fmem_head = newSeg;
    80002b00:	00003797          	auipc	a5,0x3
    80002b04:	30e7b423          	sd	a4,776(a5) # 80005e08 <_ZN15MemoryAllocator9fmem_headE>
    80002b08:	f95ff06f          	j	80002a9c <_ZN15MemoryAllocator8mem_freeEPv+0x13c>
    if (addr == nullptr) return -2;
    80002b0c:	ffe00513          	li	a0,-2
    80002b10:	f91ff06f          	j	80002aa0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    if (!flag) return -1;
    80002b14:	fff00513          	li	a0,-1
    80002b18:	f89ff06f          	j	80002aa0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>

0000000080002b1c <_GLOBAL__sub_I__ZN15MemoryAllocator9fmem_headE>:
}
    80002b1c:	ff010113          	addi	sp,sp,-16
    80002b20:	00113423          	sd	ra,8(sp)
    80002b24:	00813023          	sd	s0,0(sp)
    80002b28:	01010413          	addi	s0,sp,16
    80002b2c:	000105b7          	lui	a1,0x10
    80002b30:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002b34:	00100513          	li	a0,1
    80002b38:	00000097          	auipc	ra,0x0
    80002b3c:	c10080e7          	jalr	-1008(ra) # 80002748 <_Z41__static_initialization_and_destruction_0ii>
    80002b40:	00813083          	ld	ra,8(sp)
    80002b44:	00013403          	ld	s0,0(sp)
    80002b48:	01010113          	addi	sp,sp,16
    80002b4c:	00008067          	ret

0000000080002b50 <start>:
    80002b50:	ff010113          	addi	sp,sp,-16
    80002b54:	00813423          	sd	s0,8(sp)
    80002b58:	01010413          	addi	s0,sp,16
    80002b5c:	300027f3          	csrr	a5,mstatus
    80002b60:	ffffe737          	lui	a4,0xffffe
    80002b64:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff777f>
    80002b68:	00e7f7b3          	and	a5,a5,a4
    80002b6c:	00001737          	lui	a4,0x1
    80002b70:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80002b74:	00e7e7b3          	or	a5,a5,a4
    80002b78:	30079073          	csrw	mstatus,a5
    80002b7c:	00000797          	auipc	a5,0x0
    80002b80:	16078793          	addi	a5,a5,352 # 80002cdc <system_main>
    80002b84:	34179073          	csrw	mepc,a5
    80002b88:	00000793          	li	a5,0
    80002b8c:	18079073          	csrw	satp,a5
    80002b90:	000107b7          	lui	a5,0x10
    80002b94:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002b98:	30279073          	csrw	medeleg,a5
    80002b9c:	30379073          	csrw	mideleg,a5
    80002ba0:	104027f3          	csrr	a5,sie
    80002ba4:	2227e793          	ori	a5,a5,546
    80002ba8:	10479073          	csrw	sie,a5
    80002bac:	fff00793          	li	a5,-1
    80002bb0:	00a7d793          	srli	a5,a5,0xa
    80002bb4:	3b079073          	csrw	pmpaddr0,a5
    80002bb8:	00f00793          	li	a5,15
    80002bbc:	3a079073          	csrw	pmpcfg0,a5
    80002bc0:	f14027f3          	csrr	a5,mhartid
    80002bc4:	0200c737          	lui	a4,0x200c
    80002bc8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002bcc:	0007869b          	sext.w	a3,a5
    80002bd0:	00269713          	slli	a4,a3,0x2
    80002bd4:	000f4637          	lui	a2,0xf4
    80002bd8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002bdc:	00d70733          	add	a4,a4,a3
    80002be0:	0037979b          	slliw	a5,a5,0x3
    80002be4:	020046b7          	lui	a3,0x2004
    80002be8:	00d787b3          	add	a5,a5,a3
    80002bec:	00c585b3          	add	a1,a1,a2
    80002bf0:	00371693          	slli	a3,a4,0x3
    80002bf4:	00003717          	auipc	a4,0x3
    80002bf8:	22c70713          	addi	a4,a4,556 # 80005e20 <timer_scratch>
    80002bfc:	00b7b023          	sd	a1,0(a5)
    80002c00:	00d70733          	add	a4,a4,a3
    80002c04:	00f73c23          	sd	a5,24(a4)
    80002c08:	02c73023          	sd	a2,32(a4)
    80002c0c:	34071073          	csrw	mscratch,a4
    80002c10:	00000797          	auipc	a5,0x0
    80002c14:	6e078793          	addi	a5,a5,1760 # 800032f0 <timervec>
    80002c18:	30579073          	csrw	mtvec,a5
    80002c1c:	300027f3          	csrr	a5,mstatus
    80002c20:	0087e793          	ori	a5,a5,8
    80002c24:	30079073          	csrw	mstatus,a5
    80002c28:	304027f3          	csrr	a5,mie
    80002c2c:	0807e793          	ori	a5,a5,128
    80002c30:	30479073          	csrw	mie,a5
    80002c34:	f14027f3          	csrr	a5,mhartid
    80002c38:	0007879b          	sext.w	a5,a5
    80002c3c:	00078213          	mv	tp,a5
    80002c40:	30200073          	mret
    80002c44:	00813403          	ld	s0,8(sp)
    80002c48:	01010113          	addi	sp,sp,16
    80002c4c:	00008067          	ret

0000000080002c50 <timerinit>:
    80002c50:	ff010113          	addi	sp,sp,-16
    80002c54:	00813423          	sd	s0,8(sp)
    80002c58:	01010413          	addi	s0,sp,16
    80002c5c:	f14027f3          	csrr	a5,mhartid
    80002c60:	0200c737          	lui	a4,0x200c
    80002c64:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80002c68:	0007869b          	sext.w	a3,a5
    80002c6c:	00269713          	slli	a4,a3,0x2
    80002c70:	000f4637          	lui	a2,0xf4
    80002c74:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80002c78:	00d70733          	add	a4,a4,a3
    80002c7c:	0037979b          	slliw	a5,a5,0x3
    80002c80:	020046b7          	lui	a3,0x2004
    80002c84:	00d787b3          	add	a5,a5,a3
    80002c88:	00c585b3          	add	a1,a1,a2
    80002c8c:	00371693          	slli	a3,a4,0x3
    80002c90:	00003717          	auipc	a4,0x3
    80002c94:	19070713          	addi	a4,a4,400 # 80005e20 <timer_scratch>
    80002c98:	00b7b023          	sd	a1,0(a5)
    80002c9c:	00d70733          	add	a4,a4,a3
    80002ca0:	00f73c23          	sd	a5,24(a4)
    80002ca4:	02c73023          	sd	a2,32(a4)
    80002ca8:	34071073          	csrw	mscratch,a4
    80002cac:	00000797          	auipc	a5,0x0
    80002cb0:	64478793          	addi	a5,a5,1604 # 800032f0 <timervec>
    80002cb4:	30579073          	csrw	mtvec,a5
    80002cb8:	300027f3          	csrr	a5,mstatus
    80002cbc:	0087e793          	ori	a5,a5,8
    80002cc0:	30079073          	csrw	mstatus,a5
    80002cc4:	304027f3          	csrr	a5,mie
    80002cc8:	0807e793          	ori	a5,a5,128
    80002ccc:	30479073          	csrw	mie,a5
    80002cd0:	00813403          	ld	s0,8(sp)
    80002cd4:	01010113          	addi	sp,sp,16
    80002cd8:	00008067          	ret

0000000080002cdc <system_main>:
    80002cdc:	fe010113          	addi	sp,sp,-32
    80002ce0:	00813823          	sd	s0,16(sp)
    80002ce4:	00913423          	sd	s1,8(sp)
    80002ce8:	00113c23          	sd	ra,24(sp)
    80002cec:	02010413          	addi	s0,sp,32
    80002cf0:	00000097          	auipc	ra,0x0
    80002cf4:	0c4080e7          	jalr	196(ra) # 80002db4 <cpuid>
    80002cf8:	00003497          	auipc	s1,0x3
    80002cfc:	0a848493          	addi	s1,s1,168 # 80005da0 <started>
    80002d00:	02050263          	beqz	a0,80002d24 <system_main+0x48>
    80002d04:	0004a783          	lw	a5,0(s1)
    80002d08:	0007879b          	sext.w	a5,a5
    80002d0c:	fe078ce3          	beqz	a5,80002d04 <system_main+0x28>
    80002d10:	0ff0000f          	fence
    80002d14:	00002517          	auipc	a0,0x2
    80002d18:	49c50513          	addi	a0,a0,1180 # 800051b0 <CONSOLE_STATUS+0x1a0>
    80002d1c:	00001097          	auipc	ra,0x1
    80002d20:	a70080e7          	jalr	-1424(ra) # 8000378c <panic>
    80002d24:	00001097          	auipc	ra,0x1
    80002d28:	9c4080e7          	jalr	-1596(ra) # 800036e8 <consoleinit>
    80002d2c:	00001097          	auipc	ra,0x1
    80002d30:	150080e7          	jalr	336(ra) # 80003e7c <printfinit>
    80002d34:	00002517          	auipc	a0,0x2
    80002d38:	55c50513          	addi	a0,a0,1372 # 80005290 <CONSOLE_STATUS+0x280>
    80002d3c:	00001097          	auipc	ra,0x1
    80002d40:	aac080e7          	jalr	-1364(ra) # 800037e8 <__printf>
    80002d44:	00002517          	auipc	a0,0x2
    80002d48:	43c50513          	addi	a0,a0,1084 # 80005180 <CONSOLE_STATUS+0x170>
    80002d4c:	00001097          	auipc	ra,0x1
    80002d50:	a9c080e7          	jalr	-1380(ra) # 800037e8 <__printf>
    80002d54:	00002517          	auipc	a0,0x2
    80002d58:	53c50513          	addi	a0,a0,1340 # 80005290 <CONSOLE_STATUS+0x280>
    80002d5c:	00001097          	auipc	ra,0x1
    80002d60:	a8c080e7          	jalr	-1396(ra) # 800037e8 <__printf>
    80002d64:	00001097          	auipc	ra,0x1
    80002d68:	4a4080e7          	jalr	1188(ra) # 80004208 <kinit>
    80002d6c:	00000097          	auipc	ra,0x0
    80002d70:	148080e7          	jalr	328(ra) # 80002eb4 <trapinit>
    80002d74:	00000097          	auipc	ra,0x0
    80002d78:	16c080e7          	jalr	364(ra) # 80002ee0 <trapinithart>
    80002d7c:	00000097          	auipc	ra,0x0
    80002d80:	5b4080e7          	jalr	1460(ra) # 80003330 <plicinit>
    80002d84:	00000097          	auipc	ra,0x0
    80002d88:	5d4080e7          	jalr	1492(ra) # 80003358 <plicinithart>
    80002d8c:	00000097          	auipc	ra,0x0
    80002d90:	078080e7          	jalr	120(ra) # 80002e04 <userinit>
    80002d94:	0ff0000f          	fence
    80002d98:	00100793          	li	a5,1
    80002d9c:	00002517          	auipc	a0,0x2
    80002da0:	3fc50513          	addi	a0,a0,1020 # 80005198 <CONSOLE_STATUS+0x188>
    80002da4:	00f4a023          	sw	a5,0(s1)
    80002da8:	00001097          	auipc	ra,0x1
    80002dac:	a40080e7          	jalr	-1472(ra) # 800037e8 <__printf>
    80002db0:	0000006f          	j	80002db0 <system_main+0xd4>

0000000080002db4 <cpuid>:
    80002db4:	ff010113          	addi	sp,sp,-16
    80002db8:	00813423          	sd	s0,8(sp)
    80002dbc:	01010413          	addi	s0,sp,16
    80002dc0:	00020513          	mv	a0,tp
    80002dc4:	00813403          	ld	s0,8(sp)
    80002dc8:	0005051b          	sext.w	a0,a0
    80002dcc:	01010113          	addi	sp,sp,16
    80002dd0:	00008067          	ret

0000000080002dd4 <mycpu>:
    80002dd4:	ff010113          	addi	sp,sp,-16
    80002dd8:	00813423          	sd	s0,8(sp)
    80002ddc:	01010413          	addi	s0,sp,16
    80002de0:	00020793          	mv	a5,tp
    80002de4:	00813403          	ld	s0,8(sp)
    80002de8:	0007879b          	sext.w	a5,a5
    80002dec:	00779793          	slli	a5,a5,0x7
    80002df0:	00004517          	auipc	a0,0x4
    80002df4:	06050513          	addi	a0,a0,96 # 80006e50 <cpus>
    80002df8:	00f50533          	add	a0,a0,a5
    80002dfc:	01010113          	addi	sp,sp,16
    80002e00:	00008067          	ret

0000000080002e04 <userinit>:
    80002e04:	ff010113          	addi	sp,sp,-16
    80002e08:	00813423          	sd	s0,8(sp)
    80002e0c:	01010413          	addi	s0,sp,16
    80002e10:	00813403          	ld	s0,8(sp)
    80002e14:	01010113          	addi	sp,sp,16
    80002e18:	fffff317          	auipc	t1,0xfffff
    80002e1c:	64830067          	jr	1608(t1) # 80002460 <main>

0000000080002e20 <either_copyout>:
    80002e20:	ff010113          	addi	sp,sp,-16
    80002e24:	00813023          	sd	s0,0(sp)
    80002e28:	00113423          	sd	ra,8(sp)
    80002e2c:	01010413          	addi	s0,sp,16
    80002e30:	02051663          	bnez	a0,80002e5c <either_copyout+0x3c>
    80002e34:	00058513          	mv	a0,a1
    80002e38:	00060593          	mv	a1,a2
    80002e3c:	0006861b          	sext.w	a2,a3
    80002e40:	00002097          	auipc	ra,0x2
    80002e44:	c54080e7          	jalr	-940(ra) # 80004a94 <__memmove>
    80002e48:	00813083          	ld	ra,8(sp)
    80002e4c:	00013403          	ld	s0,0(sp)
    80002e50:	00000513          	li	a0,0
    80002e54:	01010113          	addi	sp,sp,16
    80002e58:	00008067          	ret
    80002e5c:	00002517          	auipc	a0,0x2
    80002e60:	37c50513          	addi	a0,a0,892 # 800051d8 <CONSOLE_STATUS+0x1c8>
    80002e64:	00001097          	auipc	ra,0x1
    80002e68:	928080e7          	jalr	-1752(ra) # 8000378c <panic>

0000000080002e6c <either_copyin>:
    80002e6c:	ff010113          	addi	sp,sp,-16
    80002e70:	00813023          	sd	s0,0(sp)
    80002e74:	00113423          	sd	ra,8(sp)
    80002e78:	01010413          	addi	s0,sp,16
    80002e7c:	02059463          	bnez	a1,80002ea4 <either_copyin+0x38>
    80002e80:	00060593          	mv	a1,a2
    80002e84:	0006861b          	sext.w	a2,a3
    80002e88:	00002097          	auipc	ra,0x2
    80002e8c:	c0c080e7          	jalr	-1012(ra) # 80004a94 <__memmove>
    80002e90:	00813083          	ld	ra,8(sp)
    80002e94:	00013403          	ld	s0,0(sp)
    80002e98:	00000513          	li	a0,0
    80002e9c:	01010113          	addi	sp,sp,16
    80002ea0:	00008067          	ret
    80002ea4:	00002517          	auipc	a0,0x2
    80002ea8:	35c50513          	addi	a0,a0,860 # 80005200 <CONSOLE_STATUS+0x1f0>
    80002eac:	00001097          	auipc	ra,0x1
    80002eb0:	8e0080e7          	jalr	-1824(ra) # 8000378c <panic>

0000000080002eb4 <trapinit>:
    80002eb4:	ff010113          	addi	sp,sp,-16
    80002eb8:	00813423          	sd	s0,8(sp)
    80002ebc:	01010413          	addi	s0,sp,16
    80002ec0:	00813403          	ld	s0,8(sp)
    80002ec4:	00002597          	auipc	a1,0x2
    80002ec8:	36458593          	addi	a1,a1,868 # 80005228 <CONSOLE_STATUS+0x218>
    80002ecc:	00004517          	auipc	a0,0x4
    80002ed0:	00450513          	addi	a0,a0,4 # 80006ed0 <tickslock>
    80002ed4:	01010113          	addi	sp,sp,16
    80002ed8:	00001317          	auipc	t1,0x1
    80002edc:	5c030067          	jr	1472(t1) # 80004498 <initlock>

0000000080002ee0 <trapinithart>:
    80002ee0:	ff010113          	addi	sp,sp,-16
    80002ee4:	00813423          	sd	s0,8(sp)
    80002ee8:	01010413          	addi	s0,sp,16
    80002eec:	00000797          	auipc	a5,0x0
    80002ef0:	2f478793          	addi	a5,a5,756 # 800031e0 <kernelvec>
    80002ef4:	10579073          	csrw	stvec,a5
    80002ef8:	00813403          	ld	s0,8(sp)
    80002efc:	01010113          	addi	sp,sp,16
    80002f00:	00008067          	ret

0000000080002f04 <usertrap>:
    80002f04:	ff010113          	addi	sp,sp,-16
    80002f08:	00813423          	sd	s0,8(sp)
    80002f0c:	01010413          	addi	s0,sp,16
    80002f10:	00813403          	ld	s0,8(sp)
    80002f14:	01010113          	addi	sp,sp,16
    80002f18:	00008067          	ret

0000000080002f1c <usertrapret>:
    80002f1c:	ff010113          	addi	sp,sp,-16
    80002f20:	00813423          	sd	s0,8(sp)
    80002f24:	01010413          	addi	s0,sp,16
    80002f28:	00813403          	ld	s0,8(sp)
    80002f2c:	01010113          	addi	sp,sp,16
    80002f30:	00008067          	ret

0000000080002f34 <kerneltrap>:
    80002f34:	fe010113          	addi	sp,sp,-32
    80002f38:	00813823          	sd	s0,16(sp)
    80002f3c:	00113c23          	sd	ra,24(sp)
    80002f40:	00913423          	sd	s1,8(sp)
    80002f44:	02010413          	addi	s0,sp,32
    80002f48:	142025f3          	csrr	a1,scause
    80002f4c:	100027f3          	csrr	a5,sstatus
    80002f50:	0027f793          	andi	a5,a5,2
    80002f54:	10079c63          	bnez	a5,8000306c <kerneltrap+0x138>
    80002f58:	142027f3          	csrr	a5,scause
    80002f5c:	0207ce63          	bltz	a5,80002f98 <kerneltrap+0x64>
    80002f60:	00002517          	auipc	a0,0x2
    80002f64:	31050513          	addi	a0,a0,784 # 80005270 <CONSOLE_STATUS+0x260>
    80002f68:	00001097          	auipc	ra,0x1
    80002f6c:	880080e7          	jalr	-1920(ra) # 800037e8 <__printf>
    80002f70:	141025f3          	csrr	a1,sepc
    80002f74:	14302673          	csrr	a2,stval
    80002f78:	00002517          	auipc	a0,0x2
    80002f7c:	30850513          	addi	a0,a0,776 # 80005280 <CONSOLE_STATUS+0x270>
    80002f80:	00001097          	auipc	ra,0x1
    80002f84:	868080e7          	jalr	-1944(ra) # 800037e8 <__printf>
    80002f88:	00002517          	auipc	a0,0x2
    80002f8c:	31050513          	addi	a0,a0,784 # 80005298 <CONSOLE_STATUS+0x288>
    80002f90:	00000097          	auipc	ra,0x0
    80002f94:	7fc080e7          	jalr	2044(ra) # 8000378c <panic>
    80002f98:	0ff7f713          	andi	a4,a5,255
    80002f9c:	00900693          	li	a3,9
    80002fa0:	04d70063          	beq	a4,a3,80002fe0 <kerneltrap+0xac>
    80002fa4:	fff00713          	li	a4,-1
    80002fa8:	03f71713          	slli	a4,a4,0x3f
    80002fac:	00170713          	addi	a4,a4,1
    80002fb0:	fae798e3          	bne	a5,a4,80002f60 <kerneltrap+0x2c>
    80002fb4:	00000097          	auipc	ra,0x0
    80002fb8:	e00080e7          	jalr	-512(ra) # 80002db4 <cpuid>
    80002fbc:	06050663          	beqz	a0,80003028 <kerneltrap+0xf4>
    80002fc0:	144027f3          	csrr	a5,sip
    80002fc4:	ffd7f793          	andi	a5,a5,-3
    80002fc8:	14479073          	csrw	sip,a5
    80002fcc:	01813083          	ld	ra,24(sp)
    80002fd0:	01013403          	ld	s0,16(sp)
    80002fd4:	00813483          	ld	s1,8(sp)
    80002fd8:	02010113          	addi	sp,sp,32
    80002fdc:	00008067          	ret
    80002fe0:	00000097          	auipc	ra,0x0
    80002fe4:	3c4080e7          	jalr	964(ra) # 800033a4 <plic_claim>
    80002fe8:	00a00793          	li	a5,10
    80002fec:	00050493          	mv	s1,a0
    80002ff0:	06f50863          	beq	a0,a5,80003060 <kerneltrap+0x12c>
    80002ff4:	fc050ce3          	beqz	a0,80002fcc <kerneltrap+0x98>
    80002ff8:	00050593          	mv	a1,a0
    80002ffc:	00002517          	auipc	a0,0x2
    80003000:	25450513          	addi	a0,a0,596 # 80005250 <CONSOLE_STATUS+0x240>
    80003004:	00000097          	auipc	ra,0x0
    80003008:	7e4080e7          	jalr	2020(ra) # 800037e8 <__printf>
    8000300c:	01013403          	ld	s0,16(sp)
    80003010:	01813083          	ld	ra,24(sp)
    80003014:	00048513          	mv	a0,s1
    80003018:	00813483          	ld	s1,8(sp)
    8000301c:	02010113          	addi	sp,sp,32
    80003020:	00000317          	auipc	t1,0x0
    80003024:	3bc30067          	jr	956(t1) # 800033dc <plic_complete>
    80003028:	00004517          	auipc	a0,0x4
    8000302c:	ea850513          	addi	a0,a0,-344 # 80006ed0 <tickslock>
    80003030:	00001097          	auipc	ra,0x1
    80003034:	48c080e7          	jalr	1164(ra) # 800044bc <acquire>
    80003038:	00003717          	auipc	a4,0x3
    8000303c:	d6c70713          	addi	a4,a4,-660 # 80005da4 <ticks>
    80003040:	00072783          	lw	a5,0(a4)
    80003044:	00004517          	auipc	a0,0x4
    80003048:	e8c50513          	addi	a0,a0,-372 # 80006ed0 <tickslock>
    8000304c:	0017879b          	addiw	a5,a5,1
    80003050:	00f72023          	sw	a5,0(a4)
    80003054:	00001097          	auipc	ra,0x1
    80003058:	534080e7          	jalr	1332(ra) # 80004588 <release>
    8000305c:	f65ff06f          	j	80002fc0 <kerneltrap+0x8c>
    80003060:	00001097          	auipc	ra,0x1
    80003064:	090080e7          	jalr	144(ra) # 800040f0 <uartintr>
    80003068:	fa5ff06f          	j	8000300c <kerneltrap+0xd8>
    8000306c:	00002517          	auipc	a0,0x2
    80003070:	1c450513          	addi	a0,a0,452 # 80005230 <CONSOLE_STATUS+0x220>
    80003074:	00000097          	auipc	ra,0x0
    80003078:	718080e7          	jalr	1816(ra) # 8000378c <panic>

000000008000307c <clockintr>:
    8000307c:	fe010113          	addi	sp,sp,-32
    80003080:	00813823          	sd	s0,16(sp)
    80003084:	00913423          	sd	s1,8(sp)
    80003088:	00113c23          	sd	ra,24(sp)
    8000308c:	02010413          	addi	s0,sp,32
    80003090:	00004497          	auipc	s1,0x4
    80003094:	e4048493          	addi	s1,s1,-448 # 80006ed0 <tickslock>
    80003098:	00048513          	mv	a0,s1
    8000309c:	00001097          	auipc	ra,0x1
    800030a0:	420080e7          	jalr	1056(ra) # 800044bc <acquire>
    800030a4:	00003717          	auipc	a4,0x3
    800030a8:	d0070713          	addi	a4,a4,-768 # 80005da4 <ticks>
    800030ac:	00072783          	lw	a5,0(a4)
    800030b0:	01013403          	ld	s0,16(sp)
    800030b4:	01813083          	ld	ra,24(sp)
    800030b8:	00048513          	mv	a0,s1
    800030bc:	0017879b          	addiw	a5,a5,1
    800030c0:	00813483          	ld	s1,8(sp)
    800030c4:	00f72023          	sw	a5,0(a4)
    800030c8:	02010113          	addi	sp,sp,32
    800030cc:	00001317          	auipc	t1,0x1
    800030d0:	4bc30067          	jr	1212(t1) # 80004588 <release>

00000000800030d4 <devintr>:
    800030d4:	142027f3          	csrr	a5,scause
    800030d8:	00000513          	li	a0,0
    800030dc:	0007c463          	bltz	a5,800030e4 <devintr+0x10>
    800030e0:	00008067          	ret
    800030e4:	fe010113          	addi	sp,sp,-32
    800030e8:	00813823          	sd	s0,16(sp)
    800030ec:	00113c23          	sd	ra,24(sp)
    800030f0:	00913423          	sd	s1,8(sp)
    800030f4:	02010413          	addi	s0,sp,32
    800030f8:	0ff7f713          	andi	a4,a5,255
    800030fc:	00900693          	li	a3,9
    80003100:	04d70c63          	beq	a4,a3,80003158 <devintr+0x84>
    80003104:	fff00713          	li	a4,-1
    80003108:	03f71713          	slli	a4,a4,0x3f
    8000310c:	00170713          	addi	a4,a4,1
    80003110:	00e78c63          	beq	a5,a4,80003128 <devintr+0x54>
    80003114:	01813083          	ld	ra,24(sp)
    80003118:	01013403          	ld	s0,16(sp)
    8000311c:	00813483          	ld	s1,8(sp)
    80003120:	02010113          	addi	sp,sp,32
    80003124:	00008067          	ret
    80003128:	00000097          	auipc	ra,0x0
    8000312c:	c8c080e7          	jalr	-884(ra) # 80002db4 <cpuid>
    80003130:	06050663          	beqz	a0,8000319c <devintr+0xc8>
    80003134:	144027f3          	csrr	a5,sip
    80003138:	ffd7f793          	andi	a5,a5,-3
    8000313c:	14479073          	csrw	sip,a5
    80003140:	01813083          	ld	ra,24(sp)
    80003144:	01013403          	ld	s0,16(sp)
    80003148:	00813483          	ld	s1,8(sp)
    8000314c:	00200513          	li	a0,2
    80003150:	02010113          	addi	sp,sp,32
    80003154:	00008067          	ret
    80003158:	00000097          	auipc	ra,0x0
    8000315c:	24c080e7          	jalr	588(ra) # 800033a4 <plic_claim>
    80003160:	00a00793          	li	a5,10
    80003164:	00050493          	mv	s1,a0
    80003168:	06f50663          	beq	a0,a5,800031d4 <devintr+0x100>
    8000316c:	00100513          	li	a0,1
    80003170:	fa0482e3          	beqz	s1,80003114 <devintr+0x40>
    80003174:	00048593          	mv	a1,s1
    80003178:	00002517          	auipc	a0,0x2
    8000317c:	0d850513          	addi	a0,a0,216 # 80005250 <CONSOLE_STATUS+0x240>
    80003180:	00000097          	auipc	ra,0x0
    80003184:	668080e7          	jalr	1640(ra) # 800037e8 <__printf>
    80003188:	00048513          	mv	a0,s1
    8000318c:	00000097          	auipc	ra,0x0
    80003190:	250080e7          	jalr	592(ra) # 800033dc <plic_complete>
    80003194:	00100513          	li	a0,1
    80003198:	f7dff06f          	j	80003114 <devintr+0x40>
    8000319c:	00004517          	auipc	a0,0x4
    800031a0:	d3450513          	addi	a0,a0,-716 # 80006ed0 <tickslock>
    800031a4:	00001097          	auipc	ra,0x1
    800031a8:	318080e7          	jalr	792(ra) # 800044bc <acquire>
    800031ac:	00003717          	auipc	a4,0x3
    800031b0:	bf870713          	addi	a4,a4,-1032 # 80005da4 <ticks>
    800031b4:	00072783          	lw	a5,0(a4)
    800031b8:	00004517          	auipc	a0,0x4
    800031bc:	d1850513          	addi	a0,a0,-744 # 80006ed0 <tickslock>
    800031c0:	0017879b          	addiw	a5,a5,1
    800031c4:	00f72023          	sw	a5,0(a4)
    800031c8:	00001097          	auipc	ra,0x1
    800031cc:	3c0080e7          	jalr	960(ra) # 80004588 <release>
    800031d0:	f65ff06f          	j	80003134 <devintr+0x60>
    800031d4:	00001097          	auipc	ra,0x1
    800031d8:	f1c080e7          	jalr	-228(ra) # 800040f0 <uartintr>
    800031dc:	fadff06f          	j	80003188 <devintr+0xb4>

00000000800031e0 <kernelvec>:
    800031e0:	f0010113          	addi	sp,sp,-256
    800031e4:	00113023          	sd	ra,0(sp)
    800031e8:	00213423          	sd	sp,8(sp)
    800031ec:	00313823          	sd	gp,16(sp)
    800031f0:	00413c23          	sd	tp,24(sp)
    800031f4:	02513023          	sd	t0,32(sp)
    800031f8:	02613423          	sd	t1,40(sp)
    800031fc:	02713823          	sd	t2,48(sp)
    80003200:	02813c23          	sd	s0,56(sp)
    80003204:	04913023          	sd	s1,64(sp)
    80003208:	04a13423          	sd	a0,72(sp)
    8000320c:	04b13823          	sd	a1,80(sp)
    80003210:	04c13c23          	sd	a2,88(sp)
    80003214:	06d13023          	sd	a3,96(sp)
    80003218:	06e13423          	sd	a4,104(sp)
    8000321c:	06f13823          	sd	a5,112(sp)
    80003220:	07013c23          	sd	a6,120(sp)
    80003224:	09113023          	sd	a7,128(sp)
    80003228:	09213423          	sd	s2,136(sp)
    8000322c:	09313823          	sd	s3,144(sp)
    80003230:	09413c23          	sd	s4,152(sp)
    80003234:	0b513023          	sd	s5,160(sp)
    80003238:	0b613423          	sd	s6,168(sp)
    8000323c:	0b713823          	sd	s7,176(sp)
    80003240:	0b813c23          	sd	s8,184(sp)
    80003244:	0d913023          	sd	s9,192(sp)
    80003248:	0da13423          	sd	s10,200(sp)
    8000324c:	0db13823          	sd	s11,208(sp)
    80003250:	0dc13c23          	sd	t3,216(sp)
    80003254:	0fd13023          	sd	t4,224(sp)
    80003258:	0fe13423          	sd	t5,232(sp)
    8000325c:	0ff13823          	sd	t6,240(sp)
    80003260:	cd5ff0ef          	jal	ra,80002f34 <kerneltrap>
    80003264:	00013083          	ld	ra,0(sp)
    80003268:	00813103          	ld	sp,8(sp)
    8000326c:	01013183          	ld	gp,16(sp)
    80003270:	02013283          	ld	t0,32(sp)
    80003274:	02813303          	ld	t1,40(sp)
    80003278:	03013383          	ld	t2,48(sp)
    8000327c:	03813403          	ld	s0,56(sp)
    80003280:	04013483          	ld	s1,64(sp)
    80003284:	04813503          	ld	a0,72(sp)
    80003288:	05013583          	ld	a1,80(sp)
    8000328c:	05813603          	ld	a2,88(sp)
    80003290:	06013683          	ld	a3,96(sp)
    80003294:	06813703          	ld	a4,104(sp)
    80003298:	07013783          	ld	a5,112(sp)
    8000329c:	07813803          	ld	a6,120(sp)
    800032a0:	08013883          	ld	a7,128(sp)
    800032a4:	08813903          	ld	s2,136(sp)
    800032a8:	09013983          	ld	s3,144(sp)
    800032ac:	09813a03          	ld	s4,152(sp)
    800032b0:	0a013a83          	ld	s5,160(sp)
    800032b4:	0a813b03          	ld	s6,168(sp)
    800032b8:	0b013b83          	ld	s7,176(sp)
    800032bc:	0b813c03          	ld	s8,184(sp)
    800032c0:	0c013c83          	ld	s9,192(sp)
    800032c4:	0c813d03          	ld	s10,200(sp)
    800032c8:	0d013d83          	ld	s11,208(sp)
    800032cc:	0d813e03          	ld	t3,216(sp)
    800032d0:	0e013e83          	ld	t4,224(sp)
    800032d4:	0e813f03          	ld	t5,232(sp)
    800032d8:	0f013f83          	ld	t6,240(sp)
    800032dc:	10010113          	addi	sp,sp,256
    800032e0:	10200073          	sret
    800032e4:	00000013          	nop
    800032e8:	00000013          	nop
    800032ec:	00000013          	nop

00000000800032f0 <timervec>:
    800032f0:	34051573          	csrrw	a0,mscratch,a0
    800032f4:	00b53023          	sd	a1,0(a0)
    800032f8:	00c53423          	sd	a2,8(a0)
    800032fc:	00d53823          	sd	a3,16(a0)
    80003300:	01853583          	ld	a1,24(a0)
    80003304:	02053603          	ld	a2,32(a0)
    80003308:	0005b683          	ld	a3,0(a1)
    8000330c:	00c686b3          	add	a3,a3,a2
    80003310:	00d5b023          	sd	a3,0(a1)
    80003314:	00200593          	li	a1,2
    80003318:	14459073          	csrw	sip,a1
    8000331c:	01053683          	ld	a3,16(a0)
    80003320:	00853603          	ld	a2,8(a0)
    80003324:	00053583          	ld	a1,0(a0)
    80003328:	34051573          	csrrw	a0,mscratch,a0
    8000332c:	30200073          	mret

0000000080003330 <plicinit>:
    80003330:	ff010113          	addi	sp,sp,-16
    80003334:	00813423          	sd	s0,8(sp)
    80003338:	01010413          	addi	s0,sp,16
    8000333c:	00813403          	ld	s0,8(sp)
    80003340:	0c0007b7          	lui	a5,0xc000
    80003344:	00100713          	li	a4,1
    80003348:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000334c:	00e7a223          	sw	a4,4(a5)
    80003350:	01010113          	addi	sp,sp,16
    80003354:	00008067          	ret

0000000080003358 <plicinithart>:
    80003358:	ff010113          	addi	sp,sp,-16
    8000335c:	00813023          	sd	s0,0(sp)
    80003360:	00113423          	sd	ra,8(sp)
    80003364:	01010413          	addi	s0,sp,16
    80003368:	00000097          	auipc	ra,0x0
    8000336c:	a4c080e7          	jalr	-1460(ra) # 80002db4 <cpuid>
    80003370:	0085171b          	slliw	a4,a0,0x8
    80003374:	0c0027b7          	lui	a5,0xc002
    80003378:	00e787b3          	add	a5,a5,a4
    8000337c:	40200713          	li	a4,1026
    80003380:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003384:	00813083          	ld	ra,8(sp)
    80003388:	00013403          	ld	s0,0(sp)
    8000338c:	00d5151b          	slliw	a0,a0,0xd
    80003390:	0c2017b7          	lui	a5,0xc201
    80003394:	00a78533          	add	a0,a5,a0
    80003398:	00052023          	sw	zero,0(a0)
    8000339c:	01010113          	addi	sp,sp,16
    800033a0:	00008067          	ret

00000000800033a4 <plic_claim>:
    800033a4:	ff010113          	addi	sp,sp,-16
    800033a8:	00813023          	sd	s0,0(sp)
    800033ac:	00113423          	sd	ra,8(sp)
    800033b0:	01010413          	addi	s0,sp,16
    800033b4:	00000097          	auipc	ra,0x0
    800033b8:	a00080e7          	jalr	-1536(ra) # 80002db4 <cpuid>
    800033bc:	00813083          	ld	ra,8(sp)
    800033c0:	00013403          	ld	s0,0(sp)
    800033c4:	00d5151b          	slliw	a0,a0,0xd
    800033c8:	0c2017b7          	lui	a5,0xc201
    800033cc:	00a78533          	add	a0,a5,a0
    800033d0:	00452503          	lw	a0,4(a0)
    800033d4:	01010113          	addi	sp,sp,16
    800033d8:	00008067          	ret

00000000800033dc <plic_complete>:
    800033dc:	fe010113          	addi	sp,sp,-32
    800033e0:	00813823          	sd	s0,16(sp)
    800033e4:	00913423          	sd	s1,8(sp)
    800033e8:	00113c23          	sd	ra,24(sp)
    800033ec:	02010413          	addi	s0,sp,32
    800033f0:	00050493          	mv	s1,a0
    800033f4:	00000097          	auipc	ra,0x0
    800033f8:	9c0080e7          	jalr	-1600(ra) # 80002db4 <cpuid>
    800033fc:	01813083          	ld	ra,24(sp)
    80003400:	01013403          	ld	s0,16(sp)
    80003404:	00d5179b          	slliw	a5,a0,0xd
    80003408:	0c201737          	lui	a4,0xc201
    8000340c:	00f707b3          	add	a5,a4,a5
    80003410:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80003414:	00813483          	ld	s1,8(sp)
    80003418:	02010113          	addi	sp,sp,32
    8000341c:	00008067          	ret

0000000080003420 <consolewrite>:
    80003420:	fb010113          	addi	sp,sp,-80
    80003424:	04813023          	sd	s0,64(sp)
    80003428:	04113423          	sd	ra,72(sp)
    8000342c:	02913c23          	sd	s1,56(sp)
    80003430:	03213823          	sd	s2,48(sp)
    80003434:	03313423          	sd	s3,40(sp)
    80003438:	03413023          	sd	s4,32(sp)
    8000343c:	01513c23          	sd	s5,24(sp)
    80003440:	05010413          	addi	s0,sp,80
    80003444:	06c05c63          	blez	a2,800034bc <consolewrite+0x9c>
    80003448:	00060993          	mv	s3,a2
    8000344c:	00050a13          	mv	s4,a0
    80003450:	00058493          	mv	s1,a1
    80003454:	00000913          	li	s2,0
    80003458:	fff00a93          	li	s5,-1
    8000345c:	01c0006f          	j	80003478 <consolewrite+0x58>
    80003460:	fbf44503          	lbu	a0,-65(s0)
    80003464:	0019091b          	addiw	s2,s2,1
    80003468:	00148493          	addi	s1,s1,1
    8000346c:	00001097          	auipc	ra,0x1
    80003470:	a9c080e7          	jalr	-1380(ra) # 80003f08 <uartputc>
    80003474:	03298063          	beq	s3,s2,80003494 <consolewrite+0x74>
    80003478:	00048613          	mv	a2,s1
    8000347c:	00100693          	li	a3,1
    80003480:	000a0593          	mv	a1,s4
    80003484:	fbf40513          	addi	a0,s0,-65
    80003488:	00000097          	auipc	ra,0x0
    8000348c:	9e4080e7          	jalr	-1564(ra) # 80002e6c <either_copyin>
    80003490:	fd5518e3          	bne	a0,s5,80003460 <consolewrite+0x40>
    80003494:	04813083          	ld	ra,72(sp)
    80003498:	04013403          	ld	s0,64(sp)
    8000349c:	03813483          	ld	s1,56(sp)
    800034a0:	02813983          	ld	s3,40(sp)
    800034a4:	02013a03          	ld	s4,32(sp)
    800034a8:	01813a83          	ld	s5,24(sp)
    800034ac:	00090513          	mv	a0,s2
    800034b0:	03013903          	ld	s2,48(sp)
    800034b4:	05010113          	addi	sp,sp,80
    800034b8:	00008067          	ret
    800034bc:	00000913          	li	s2,0
    800034c0:	fd5ff06f          	j	80003494 <consolewrite+0x74>

00000000800034c4 <consoleread>:
    800034c4:	f9010113          	addi	sp,sp,-112
    800034c8:	06813023          	sd	s0,96(sp)
    800034cc:	04913c23          	sd	s1,88(sp)
    800034d0:	05213823          	sd	s2,80(sp)
    800034d4:	05313423          	sd	s3,72(sp)
    800034d8:	05413023          	sd	s4,64(sp)
    800034dc:	03513c23          	sd	s5,56(sp)
    800034e0:	03613823          	sd	s6,48(sp)
    800034e4:	03713423          	sd	s7,40(sp)
    800034e8:	03813023          	sd	s8,32(sp)
    800034ec:	06113423          	sd	ra,104(sp)
    800034f0:	01913c23          	sd	s9,24(sp)
    800034f4:	07010413          	addi	s0,sp,112
    800034f8:	00060b93          	mv	s7,a2
    800034fc:	00050913          	mv	s2,a0
    80003500:	00058c13          	mv	s8,a1
    80003504:	00060b1b          	sext.w	s6,a2
    80003508:	00004497          	auipc	s1,0x4
    8000350c:	9f048493          	addi	s1,s1,-1552 # 80006ef8 <cons>
    80003510:	00400993          	li	s3,4
    80003514:	fff00a13          	li	s4,-1
    80003518:	00a00a93          	li	s5,10
    8000351c:	05705e63          	blez	s7,80003578 <consoleread+0xb4>
    80003520:	09c4a703          	lw	a4,156(s1)
    80003524:	0984a783          	lw	a5,152(s1)
    80003528:	0007071b          	sext.w	a4,a4
    8000352c:	08e78463          	beq	a5,a4,800035b4 <consoleread+0xf0>
    80003530:	07f7f713          	andi	a4,a5,127
    80003534:	00e48733          	add	a4,s1,a4
    80003538:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000353c:	0017869b          	addiw	a3,a5,1
    80003540:	08d4ac23          	sw	a3,152(s1)
    80003544:	00070c9b          	sext.w	s9,a4
    80003548:	0b370663          	beq	a4,s3,800035f4 <consoleread+0x130>
    8000354c:	00100693          	li	a3,1
    80003550:	f9f40613          	addi	a2,s0,-97
    80003554:	000c0593          	mv	a1,s8
    80003558:	00090513          	mv	a0,s2
    8000355c:	f8e40fa3          	sb	a4,-97(s0)
    80003560:	00000097          	auipc	ra,0x0
    80003564:	8c0080e7          	jalr	-1856(ra) # 80002e20 <either_copyout>
    80003568:	01450863          	beq	a0,s4,80003578 <consoleread+0xb4>
    8000356c:	001c0c13          	addi	s8,s8,1
    80003570:	fffb8b9b          	addiw	s7,s7,-1
    80003574:	fb5c94e3          	bne	s9,s5,8000351c <consoleread+0x58>
    80003578:	000b851b          	sext.w	a0,s7
    8000357c:	06813083          	ld	ra,104(sp)
    80003580:	06013403          	ld	s0,96(sp)
    80003584:	05813483          	ld	s1,88(sp)
    80003588:	05013903          	ld	s2,80(sp)
    8000358c:	04813983          	ld	s3,72(sp)
    80003590:	04013a03          	ld	s4,64(sp)
    80003594:	03813a83          	ld	s5,56(sp)
    80003598:	02813b83          	ld	s7,40(sp)
    8000359c:	02013c03          	ld	s8,32(sp)
    800035a0:	01813c83          	ld	s9,24(sp)
    800035a4:	40ab053b          	subw	a0,s6,a0
    800035a8:	03013b03          	ld	s6,48(sp)
    800035ac:	07010113          	addi	sp,sp,112
    800035b0:	00008067          	ret
    800035b4:	00001097          	auipc	ra,0x1
    800035b8:	1d8080e7          	jalr	472(ra) # 8000478c <push_on>
    800035bc:	0984a703          	lw	a4,152(s1)
    800035c0:	09c4a783          	lw	a5,156(s1)
    800035c4:	0007879b          	sext.w	a5,a5
    800035c8:	fef70ce3          	beq	a4,a5,800035c0 <consoleread+0xfc>
    800035cc:	00001097          	auipc	ra,0x1
    800035d0:	234080e7          	jalr	564(ra) # 80004800 <pop_on>
    800035d4:	0984a783          	lw	a5,152(s1)
    800035d8:	07f7f713          	andi	a4,a5,127
    800035dc:	00e48733          	add	a4,s1,a4
    800035e0:	01874703          	lbu	a4,24(a4)
    800035e4:	0017869b          	addiw	a3,a5,1
    800035e8:	08d4ac23          	sw	a3,152(s1)
    800035ec:	00070c9b          	sext.w	s9,a4
    800035f0:	f5371ee3          	bne	a4,s3,8000354c <consoleread+0x88>
    800035f4:	000b851b          	sext.w	a0,s7
    800035f8:	f96bf2e3          	bgeu	s7,s6,8000357c <consoleread+0xb8>
    800035fc:	08f4ac23          	sw	a5,152(s1)
    80003600:	f7dff06f          	j	8000357c <consoleread+0xb8>

0000000080003604 <consputc>:
    80003604:	10000793          	li	a5,256
    80003608:	00f50663          	beq	a0,a5,80003614 <consputc+0x10>
    8000360c:	00001317          	auipc	t1,0x1
    80003610:	9f430067          	jr	-1548(t1) # 80004000 <uartputc_sync>
    80003614:	ff010113          	addi	sp,sp,-16
    80003618:	00113423          	sd	ra,8(sp)
    8000361c:	00813023          	sd	s0,0(sp)
    80003620:	01010413          	addi	s0,sp,16
    80003624:	00800513          	li	a0,8
    80003628:	00001097          	auipc	ra,0x1
    8000362c:	9d8080e7          	jalr	-1576(ra) # 80004000 <uartputc_sync>
    80003630:	02000513          	li	a0,32
    80003634:	00001097          	auipc	ra,0x1
    80003638:	9cc080e7          	jalr	-1588(ra) # 80004000 <uartputc_sync>
    8000363c:	00013403          	ld	s0,0(sp)
    80003640:	00813083          	ld	ra,8(sp)
    80003644:	00800513          	li	a0,8
    80003648:	01010113          	addi	sp,sp,16
    8000364c:	00001317          	auipc	t1,0x1
    80003650:	9b430067          	jr	-1612(t1) # 80004000 <uartputc_sync>

0000000080003654 <consoleintr>:
    80003654:	fe010113          	addi	sp,sp,-32
    80003658:	00813823          	sd	s0,16(sp)
    8000365c:	00913423          	sd	s1,8(sp)
    80003660:	01213023          	sd	s2,0(sp)
    80003664:	00113c23          	sd	ra,24(sp)
    80003668:	02010413          	addi	s0,sp,32
    8000366c:	00004917          	auipc	s2,0x4
    80003670:	88c90913          	addi	s2,s2,-1908 # 80006ef8 <cons>
    80003674:	00050493          	mv	s1,a0
    80003678:	00090513          	mv	a0,s2
    8000367c:	00001097          	auipc	ra,0x1
    80003680:	e40080e7          	jalr	-448(ra) # 800044bc <acquire>
    80003684:	02048c63          	beqz	s1,800036bc <consoleintr+0x68>
    80003688:	0a092783          	lw	a5,160(s2)
    8000368c:	09892703          	lw	a4,152(s2)
    80003690:	07f00693          	li	a3,127
    80003694:	40e7873b          	subw	a4,a5,a4
    80003698:	02e6e263          	bltu	a3,a4,800036bc <consoleintr+0x68>
    8000369c:	00d00713          	li	a4,13
    800036a0:	04e48063          	beq	s1,a4,800036e0 <consoleintr+0x8c>
    800036a4:	07f7f713          	andi	a4,a5,127
    800036a8:	00e90733          	add	a4,s2,a4
    800036ac:	0017879b          	addiw	a5,a5,1
    800036b0:	0af92023          	sw	a5,160(s2)
    800036b4:	00970c23          	sb	s1,24(a4)
    800036b8:	08f92e23          	sw	a5,156(s2)
    800036bc:	01013403          	ld	s0,16(sp)
    800036c0:	01813083          	ld	ra,24(sp)
    800036c4:	00813483          	ld	s1,8(sp)
    800036c8:	00013903          	ld	s2,0(sp)
    800036cc:	00004517          	auipc	a0,0x4
    800036d0:	82c50513          	addi	a0,a0,-2004 # 80006ef8 <cons>
    800036d4:	02010113          	addi	sp,sp,32
    800036d8:	00001317          	auipc	t1,0x1
    800036dc:	eb030067          	jr	-336(t1) # 80004588 <release>
    800036e0:	00a00493          	li	s1,10
    800036e4:	fc1ff06f          	j	800036a4 <consoleintr+0x50>

00000000800036e8 <consoleinit>:
    800036e8:	fe010113          	addi	sp,sp,-32
    800036ec:	00113c23          	sd	ra,24(sp)
    800036f0:	00813823          	sd	s0,16(sp)
    800036f4:	00913423          	sd	s1,8(sp)
    800036f8:	02010413          	addi	s0,sp,32
    800036fc:	00003497          	auipc	s1,0x3
    80003700:	7fc48493          	addi	s1,s1,2044 # 80006ef8 <cons>
    80003704:	00048513          	mv	a0,s1
    80003708:	00002597          	auipc	a1,0x2
    8000370c:	ba058593          	addi	a1,a1,-1120 # 800052a8 <CONSOLE_STATUS+0x298>
    80003710:	00001097          	auipc	ra,0x1
    80003714:	d88080e7          	jalr	-632(ra) # 80004498 <initlock>
    80003718:	00000097          	auipc	ra,0x0
    8000371c:	7ac080e7          	jalr	1964(ra) # 80003ec4 <uartinit>
    80003720:	01813083          	ld	ra,24(sp)
    80003724:	01013403          	ld	s0,16(sp)
    80003728:	00000797          	auipc	a5,0x0
    8000372c:	d9c78793          	addi	a5,a5,-612 # 800034c4 <consoleread>
    80003730:	0af4bc23          	sd	a5,184(s1)
    80003734:	00000797          	auipc	a5,0x0
    80003738:	cec78793          	addi	a5,a5,-788 # 80003420 <consolewrite>
    8000373c:	0cf4b023          	sd	a5,192(s1)
    80003740:	00813483          	ld	s1,8(sp)
    80003744:	02010113          	addi	sp,sp,32
    80003748:	00008067          	ret

000000008000374c <console_read>:
    8000374c:	ff010113          	addi	sp,sp,-16
    80003750:	00813423          	sd	s0,8(sp)
    80003754:	01010413          	addi	s0,sp,16
    80003758:	00813403          	ld	s0,8(sp)
    8000375c:	00004317          	auipc	t1,0x4
    80003760:	85433303          	ld	t1,-1964(t1) # 80006fb0 <devsw+0x10>
    80003764:	01010113          	addi	sp,sp,16
    80003768:	00030067          	jr	t1

000000008000376c <console_write>:
    8000376c:	ff010113          	addi	sp,sp,-16
    80003770:	00813423          	sd	s0,8(sp)
    80003774:	01010413          	addi	s0,sp,16
    80003778:	00813403          	ld	s0,8(sp)
    8000377c:	00004317          	auipc	t1,0x4
    80003780:	83c33303          	ld	t1,-1988(t1) # 80006fb8 <devsw+0x18>
    80003784:	01010113          	addi	sp,sp,16
    80003788:	00030067          	jr	t1

000000008000378c <panic>:
    8000378c:	fe010113          	addi	sp,sp,-32
    80003790:	00113c23          	sd	ra,24(sp)
    80003794:	00813823          	sd	s0,16(sp)
    80003798:	00913423          	sd	s1,8(sp)
    8000379c:	02010413          	addi	s0,sp,32
    800037a0:	00050493          	mv	s1,a0
    800037a4:	00002517          	auipc	a0,0x2
    800037a8:	b0c50513          	addi	a0,a0,-1268 # 800052b0 <CONSOLE_STATUS+0x2a0>
    800037ac:	00004797          	auipc	a5,0x4
    800037b0:	8a07a623          	sw	zero,-1876(a5) # 80007058 <pr+0x18>
    800037b4:	00000097          	auipc	ra,0x0
    800037b8:	034080e7          	jalr	52(ra) # 800037e8 <__printf>
    800037bc:	00048513          	mv	a0,s1
    800037c0:	00000097          	auipc	ra,0x0
    800037c4:	028080e7          	jalr	40(ra) # 800037e8 <__printf>
    800037c8:	00002517          	auipc	a0,0x2
    800037cc:	ac850513          	addi	a0,a0,-1336 # 80005290 <CONSOLE_STATUS+0x280>
    800037d0:	00000097          	auipc	ra,0x0
    800037d4:	018080e7          	jalr	24(ra) # 800037e8 <__printf>
    800037d8:	00100793          	li	a5,1
    800037dc:	00002717          	auipc	a4,0x2
    800037e0:	5cf72623          	sw	a5,1484(a4) # 80005da8 <panicked>
    800037e4:	0000006f          	j	800037e4 <panic+0x58>

00000000800037e8 <__printf>:
    800037e8:	f3010113          	addi	sp,sp,-208
    800037ec:	08813023          	sd	s0,128(sp)
    800037f0:	07313423          	sd	s3,104(sp)
    800037f4:	09010413          	addi	s0,sp,144
    800037f8:	05813023          	sd	s8,64(sp)
    800037fc:	08113423          	sd	ra,136(sp)
    80003800:	06913c23          	sd	s1,120(sp)
    80003804:	07213823          	sd	s2,112(sp)
    80003808:	07413023          	sd	s4,96(sp)
    8000380c:	05513c23          	sd	s5,88(sp)
    80003810:	05613823          	sd	s6,80(sp)
    80003814:	05713423          	sd	s7,72(sp)
    80003818:	03913c23          	sd	s9,56(sp)
    8000381c:	03a13823          	sd	s10,48(sp)
    80003820:	03b13423          	sd	s11,40(sp)
    80003824:	00004317          	auipc	t1,0x4
    80003828:	81c30313          	addi	t1,t1,-2020 # 80007040 <pr>
    8000382c:	01832c03          	lw	s8,24(t1)
    80003830:	00b43423          	sd	a1,8(s0)
    80003834:	00c43823          	sd	a2,16(s0)
    80003838:	00d43c23          	sd	a3,24(s0)
    8000383c:	02e43023          	sd	a4,32(s0)
    80003840:	02f43423          	sd	a5,40(s0)
    80003844:	03043823          	sd	a6,48(s0)
    80003848:	03143c23          	sd	a7,56(s0)
    8000384c:	00050993          	mv	s3,a0
    80003850:	4a0c1663          	bnez	s8,80003cfc <__printf+0x514>
    80003854:	60098c63          	beqz	s3,80003e6c <__printf+0x684>
    80003858:	0009c503          	lbu	a0,0(s3)
    8000385c:	00840793          	addi	a5,s0,8
    80003860:	f6f43c23          	sd	a5,-136(s0)
    80003864:	00000493          	li	s1,0
    80003868:	22050063          	beqz	a0,80003a88 <__printf+0x2a0>
    8000386c:	00002a37          	lui	s4,0x2
    80003870:	00018ab7          	lui	s5,0x18
    80003874:	000f4b37          	lui	s6,0xf4
    80003878:	00989bb7          	lui	s7,0x989
    8000387c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80003880:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80003884:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80003888:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000388c:	00148c9b          	addiw	s9,s1,1
    80003890:	02500793          	li	a5,37
    80003894:	01998933          	add	s2,s3,s9
    80003898:	38f51263          	bne	a0,a5,80003c1c <__printf+0x434>
    8000389c:	00094783          	lbu	a5,0(s2)
    800038a0:	00078c9b          	sext.w	s9,a5
    800038a4:	1e078263          	beqz	a5,80003a88 <__printf+0x2a0>
    800038a8:	0024849b          	addiw	s1,s1,2
    800038ac:	07000713          	li	a4,112
    800038b0:	00998933          	add	s2,s3,s1
    800038b4:	38e78a63          	beq	a5,a4,80003c48 <__printf+0x460>
    800038b8:	20f76863          	bltu	a4,a5,80003ac8 <__printf+0x2e0>
    800038bc:	42a78863          	beq	a5,a0,80003cec <__printf+0x504>
    800038c0:	06400713          	li	a4,100
    800038c4:	40e79663          	bne	a5,a4,80003cd0 <__printf+0x4e8>
    800038c8:	f7843783          	ld	a5,-136(s0)
    800038cc:	0007a603          	lw	a2,0(a5)
    800038d0:	00878793          	addi	a5,a5,8
    800038d4:	f6f43c23          	sd	a5,-136(s0)
    800038d8:	42064a63          	bltz	a2,80003d0c <__printf+0x524>
    800038dc:	00a00713          	li	a4,10
    800038e0:	02e677bb          	remuw	a5,a2,a4
    800038e4:	00002d97          	auipc	s11,0x2
    800038e8:	9f4d8d93          	addi	s11,s11,-1548 # 800052d8 <digits>
    800038ec:	00900593          	li	a1,9
    800038f0:	0006051b          	sext.w	a0,a2
    800038f4:	00000c93          	li	s9,0
    800038f8:	02079793          	slli	a5,a5,0x20
    800038fc:	0207d793          	srli	a5,a5,0x20
    80003900:	00fd87b3          	add	a5,s11,a5
    80003904:	0007c783          	lbu	a5,0(a5)
    80003908:	02e656bb          	divuw	a3,a2,a4
    8000390c:	f8f40023          	sb	a5,-128(s0)
    80003910:	14c5d863          	bge	a1,a2,80003a60 <__printf+0x278>
    80003914:	06300593          	li	a1,99
    80003918:	00100c93          	li	s9,1
    8000391c:	02e6f7bb          	remuw	a5,a3,a4
    80003920:	02079793          	slli	a5,a5,0x20
    80003924:	0207d793          	srli	a5,a5,0x20
    80003928:	00fd87b3          	add	a5,s11,a5
    8000392c:	0007c783          	lbu	a5,0(a5)
    80003930:	02e6d73b          	divuw	a4,a3,a4
    80003934:	f8f400a3          	sb	a5,-127(s0)
    80003938:	12a5f463          	bgeu	a1,a0,80003a60 <__printf+0x278>
    8000393c:	00a00693          	li	a3,10
    80003940:	00900593          	li	a1,9
    80003944:	02d777bb          	remuw	a5,a4,a3
    80003948:	02079793          	slli	a5,a5,0x20
    8000394c:	0207d793          	srli	a5,a5,0x20
    80003950:	00fd87b3          	add	a5,s11,a5
    80003954:	0007c503          	lbu	a0,0(a5)
    80003958:	02d757bb          	divuw	a5,a4,a3
    8000395c:	f8a40123          	sb	a0,-126(s0)
    80003960:	48e5f263          	bgeu	a1,a4,80003de4 <__printf+0x5fc>
    80003964:	06300513          	li	a0,99
    80003968:	02d7f5bb          	remuw	a1,a5,a3
    8000396c:	02059593          	slli	a1,a1,0x20
    80003970:	0205d593          	srli	a1,a1,0x20
    80003974:	00bd85b3          	add	a1,s11,a1
    80003978:	0005c583          	lbu	a1,0(a1)
    8000397c:	02d7d7bb          	divuw	a5,a5,a3
    80003980:	f8b401a3          	sb	a1,-125(s0)
    80003984:	48e57263          	bgeu	a0,a4,80003e08 <__printf+0x620>
    80003988:	3e700513          	li	a0,999
    8000398c:	02d7f5bb          	remuw	a1,a5,a3
    80003990:	02059593          	slli	a1,a1,0x20
    80003994:	0205d593          	srli	a1,a1,0x20
    80003998:	00bd85b3          	add	a1,s11,a1
    8000399c:	0005c583          	lbu	a1,0(a1)
    800039a0:	02d7d7bb          	divuw	a5,a5,a3
    800039a4:	f8b40223          	sb	a1,-124(s0)
    800039a8:	46e57663          	bgeu	a0,a4,80003e14 <__printf+0x62c>
    800039ac:	02d7f5bb          	remuw	a1,a5,a3
    800039b0:	02059593          	slli	a1,a1,0x20
    800039b4:	0205d593          	srli	a1,a1,0x20
    800039b8:	00bd85b3          	add	a1,s11,a1
    800039bc:	0005c583          	lbu	a1,0(a1)
    800039c0:	02d7d7bb          	divuw	a5,a5,a3
    800039c4:	f8b402a3          	sb	a1,-123(s0)
    800039c8:	46ea7863          	bgeu	s4,a4,80003e38 <__printf+0x650>
    800039cc:	02d7f5bb          	remuw	a1,a5,a3
    800039d0:	02059593          	slli	a1,a1,0x20
    800039d4:	0205d593          	srli	a1,a1,0x20
    800039d8:	00bd85b3          	add	a1,s11,a1
    800039dc:	0005c583          	lbu	a1,0(a1)
    800039e0:	02d7d7bb          	divuw	a5,a5,a3
    800039e4:	f8b40323          	sb	a1,-122(s0)
    800039e8:	3eeaf863          	bgeu	s5,a4,80003dd8 <__printf+0x5f0>
    800039ec:	02d7f5bb          	remuw	a1,a5,a3
    800039f0:	02059593          	slli	a1,a1,0x20
    800039f4:	0205d593          	srli	a1,a1,0x20
    800039f8:	00bd85b3          	add	a1,s11,a1
    800039fc:	0005c583          	lbu	a1,0(a1)
    80003a00:	02d7d7bb          	divuw	a5,a5,a3
    80003a04:	f8b403a3          	sb	a1,-121(s0)
    80003a08:	42eb7e63          	bgeu	s6,a4,80003e44 <__printf+0x65c>
    80003a0c:	02d7f5bb          	remuw	a1,a5,a3
    80003a10:	02059593          	slli	a1,a1,0x20
    80003a14:	0205d593          	srli	a1,a1,0x20
    80003a18:	00bd85b3          	add	a1,s11,a1
    80003a1c:	0005c583          	lbu	a1,0(a1)
    80003a20:	02d7d7bb          	divuw	a5,a5,a3
    80003a24:	f8b40423          	sb	a1,-120(s0)
    80003a28:	42ebfc63          	bgeu	s7,a4,80003e60 <__printf+0x678>
    80003a2c:	02079793          	slli	a5,a5,0x20
    80003a30:	0207d793          	srli	a5,a5,0x20
    80003a34:	00fd8db3          	add	s11,s11,a5
    80003a38:	000dc703          	lbu	a4,0(s11)
    80003a3c:	00a00793          	li	a5,10
    80003a40:	00900c93          	li	s9,9
    80003a44:	f8e404a3          	sb	a4,-119(s0)
    80003a48:	00065c63          	bgez	a2,80003a60 <__printf+0x278>
    80003a4c:	f9040713          	addi	a4,s0,-112
    80003a50:	00f70733          	add	a4,a4,a5
    80003a54:	02d00693          	li	a3,45
    80003a58:	fed70823          	sb	a3,-16(a4)
    80003a5c:	00078c93          	mv	s9,a5
    80003a60:	f8040793          	addi	a5,s0,-128
    80003a64:	01978cb3          	add	s9,a5,s9
    80003a68:	f7f40d13          	addi	s10,s0,-129
    80003a6c:	000cc503          	lbu	a0,0(s9)
    80003a70:	fffc8c93          	addi	s9,s9,-1
    80003a74:	00000097          	auipc	ra,0x0
    80003a78:	b90080e7          	jalr	-1136(ra) # 80003604 <consputc>
    80003a7c:	ffac98e3          	bne	s9,s10,80003a6c <__printf+0x284>
    80003a80:	00094503          	lbu	a0,0(s2)
    80003a84:	e00514e3          	bnez	a0,8000388c <__printf+0xa4>
    80003a88:	1a0c1663          	bnez	s8,80003c34 <__printf+0x44c>
    80003a8c:	08813083          	ld	ra,136(sp)
    80003a90:	08013403          	ld	s0,128(sp)
    80003a94:	07813483          	ld	s1,120(sp)
    80003a98:	07013903          	ld	s2,112(sp)
    80003a9c:	06813983          	ld	s3,104(sp)
    80003aa0:	06013a03          	ld	s4,96(sp)
    80003aa4:	05813a83          	ld	s5,88(sp)
    80003aa8:	05013b03          	ld	s6,80(sp)
    80003aac:	04813b83          	ld	s7,72(sp)
    80003ab0:	04013c03          	ld	s8,64(sp)
    80003ab4:	03813c83          	ld	s9,56(sp)
    80003ab8:	03013d03          	ld	s10,48(sp)
    80003abc:	02813d83          	ld	s11,40(sp)
    80003ac0:	0d010113          	addi	sp,sp,208
    80003ac4:	00008067          	ret
    80003ac8:	07300713          	li	a4,115
    80003acc:	1ce78a63          	beq	a5,a4,80003ca0 <__printf+0x4b8>
    80003ad0:	07800713          	li	a4,120
    80003ad4:	1ee79e63          	bne	a5,a4,80003cd0 <__printf+0x4e8>
    80003ad8:	f7843783          	ld	a5,-136(s0)
    80003adc:	0007a703          	lw	a4,0(a5)
    80003ae0:	00878793          	addi	a5,a5,8
    80003ae4:	f6f43c23          	sd	a5,-136(s0)
    80003ae8:	28074263          	bltz	a4,80003d6c <__printf+0x584>
    80003aec:	00001d97          	auipc	s11,0x1
    80003af0:	7ecd8d93          	addi	s11,s11,2028 # 800052d8 <digits>
    80003af4:	00f77793          	andi	a5,a4,15
    80003af8:	00fd87b3          	add	a5,s11,a5
    80003afc:	0007c683          	lbu	a3,0(a5)
    80003b00:	00f00613          	li	a2,15
    80003b04:	0007079b          	sext.w	a5,a4
    80003b08:	f8d40023          	sb	a3,-128(s0)
    80003b0c:	0047559b          	srliw	a1,a4,0x4
    80003b10:	0047569b          	srliw	a3,a4,0x4
    80003b14:	00000c93          	li	s9,0
    80003b18:	0ee65063          	bge	a2,a4,80003bf8 <__printf+0x410>
    80003b1c:	00f6f693          	andi	a3,a3,15
    80003b20:	00dd86b3          	add	a3,s11,a3
    80003b24:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80003b28:	0087d79b          	srliw	a5,a5,0x8
    80003b2c:	00100c93          	li	s9,1
    80003b30:	f8d400a3          	sb	a3,-127(s0)
    80003b34:	0cb67263          	bgeu	a2,a1,80003bf8 <__printf+0x410>
    80003b38:	00f7f693          	andi	a3,a5,15
    80003b3c:	00dd86b3          	add	a3,s11,a3
    80003b40:	0006c583          	lbu	a1,0(a3)
    80003b44:	00f00613          	li	a2,15
    80003b48:	0047d69b          	srliw	a3,a5,0x4
    80003b4c:	f8b40123          	sb	a1,-126(s0)
    80003b50:	0047d593          	srli	a1,a5,0x4
    80003b54:	28f67e63          	bgeu	a2,a5,80003df0 <__printf+0x608>
    80003b58:	00f6f693          	andi	a3,a3,15
    80003b5c:	00dd86b3          	add	a3,s11,a3
    80003b60:	0006c503          	lbu	a0,0(a3)
    80003b64:	0087d813          	srli	a6,a5,0x8
    80003b68:	0087d69b          	srliw	a3,a5,0x8
    80003b6c:	f8a401a3          	sb	a0,-125(s0)
    80003b70:	28b67663          	bgeu	a2,a1,80003dfc <__printf+0x614>
    80003b74:	00f6f693          	andi	a3,a3,15
    80003b78:	00dd86b3          	add	a3,s11,a3
    80003b7c:	0006c583          	lbu	a1,0(a3)
    80003b80:	00c7d513          	srli	a0,a5,0xc
    80003b84:	00c7d69b          	srliw	a3,a5,0xc
    80003b88:	f8b40223          	sb	a1,-124(s0)
    80003b8c:	29067a63          	bgeu	a2,a6,80003e20 <__printf+0x638>
    80003b90:	00f6f693          	andi	a3,a3,15
    80003b94:	00dd86b3          	add	a3,s11,a3
    80003b98:	0006c583          	lbu	a1,0(a3)
    80003b9c:	0107d813          	srli	a6,a5,0x10
    80003ba0:	0107d69b          	srliw	a3,a5,0x10
    80003ba4:	f8b402a3          	sb	a1,-123(s0)
    80003ba8:	28a67263          	bgeu	a2,a0,80003e2c <__printf+0x644>
    80003bac:	00f6f693          	andi	a3,a3,15
    80003bb0:	00dd86b3          	add	a3,s11,a3
    80003bb4:	0006c683          	lbu	a3,0(a3)
    80003bb8:	0147d79b          	srliw	a5,a5,0x14
    80003bbc:	f8d40323          	sb	a3,-122(s0)
    80003bc0:	21067663          	bgeu	a2,a6,80003dcc <__printf+0x5e4>
    80003bc4:	02079793          	slli	a5,a5,0x20
    80003bc8:	0207d793          	srli	a5,a5,0x20
    80003bcc:	00fd8db3          	add	s11,s11,a5
    80003bd0:	000dc683          	lbu	a3,0(s11)
    80003bd4:	00800793          	li	a5,8
    80003bd8:	00700c93          	li	s9,7
    80003bdc:	f8d403a3          	sb	a3,-121(s0)
    80003be0:	00075c63          	bgez	a4,80003bf8 <__printf+0x410>
    80003be4:	f9040713          	addi	a4,s0,-112
    80003be8:	00f70733          	add	a4,a4,a5
    80003bec:	02d00693          	li	a3,45
    80003bf0:	fed70823          	sb	a3,-16(a4)
    80003bf4:	00078c93          	mv	s9,a5
    80003bf8:	f8040793          	addi	a5,s0,-128
    80003bfc:	01978cb3          	add	s9,a5,s9
    80003c00:	f7f40d13          	addi	s10,s0,-129
    80003c04:	000cc503          	lbu	a0,0(s9)
    80003c08:	fffc8c93          	addi	s9,s9,-1
    80003c0c:	00000097          	auipc	ra,0x0
    80003c10:	9f8080e7          	jalr	-1544(ra) # 80003604 <consputc>
    80003c14:	ff9d18e3          	bne	s10,s9,80003c04 <__printf+0x41c>
    80003c18:	0100006f          	j	80003c28 <__printf+0x440>
    80003c1c:	00000097          	auipc	ra,0x0
    80003c20:	9e8080e7          	jalr	-1560(ra) # 80003604 <consputc>
    80003c24:	000c8493          	mv	s1,s9
    80003c28:	00094503          	lbu	a0,0(s2)
    80003c2c:	c60510e3          	bnez	a0,8000388c <__printf+0xa4>
    80003c30:	e40c0ee3          	beqz	s8,80003a8c <__printf+0x2a4>
    80003c34:	00003517          	auipc	a0,0x3
    80003c38:	40c50513          	addi	a0,a0,1036 # 80007040 <pr>
    80003c3c:	00001097          	auipc	ra,0x1
    80003c40:	94c080e7          	jalr	-1716(ra) # 80004588 <release>
    80003c44:	e49ff06f          	j	80003a8c <__printf+0x2a4>
    80003c48:	f7843783          	ld	a5,-136(s0)
    80003c4c:	03000513          	li	a0,48
    80003c50:	01000d13          	li	s10,16
    80003c54:	00878713          	addi	a4,a5,8
    80003c58:	0007bc83          	ld	s9,0(a5)
    80003c5c:	f6e43c23          	sd	a4,-136(s0)
    80003c60:	00000097          	auipc	ra,0x0
    80003c64:	9a4080e7          	jalr	-1628(ra) # 80003604 <consputc>
    80003c68:	07800513          	li	a0,120
    80003c6c:	00000097          	auipc	ra,0x0
    80003c70:	998080e7          	jalr	-1640(ra) # 80003604 <consputc>
    80003c74:	00001d97          	auipc	s11,0x1
    80003c78:	664d8d93          	addi	s11,s11,1636 # 800052d8 <digits>
    80003c7c:	03ccd793          	srli	a5,s9,0x3c
    80003c80:	00fd87b3          	add	a5,s11,a5
    80003c84:	0007c503          	lbu	a0,0(a5)
    80003c88:	fffd0d1b          	addiw	s10,s10,-1
    80003c8c:	004c9c93          	slli	s9,s9,0x4
    80003c90:	00000097          	auipc	ra,0x0
    80003c94:	974080e7          	jalr	-1676(ra) # 80003604 <consputc>
    80003c98:	fe0d12e3          	bnez	s10,80003c7c <__printf+0x494>
    80003c9c:	f8dff06f          	j	80003c28 <__printf+0x440>
    80003ca0:	f7843783          	ld	a5,-136(s0)
    80003ca4:	0007bc83          	ld	s9,0(a5)
    80003ca8:	00878793          	addi	a5,a5,8
    80003cac:	f6f43c23          	sd	a5,-136(s0)
    80003cb0:	000c9a63          	bnez	s9,80003cc4 <__printf+0x4dc>
    80003cb4:	1080006f          	j	80003dbc <__printf+0x5d4>
    80003cb8:	001c8c93          	addi	s9,s9,1
    80003cbc:	00000097          	auipc	ra,0x0
    80003cc0:	948080e7          	jalr	-1720(ra) # 80003604 <consputc>
    80003cc4:	000cc503          	lbu	a0,0(s9)
    80003cc8:	fe0518e3          	bnez	a0,80003cb8 <__printf+0x4d0>
    80003ccc:	f5dff06f          	j	80003c28 <__printf+0x440>
    80003cd0:	02500513          	li	a0,37
    80003cd4:	00000097          	auipc	ra,0x0
    80003cd8:	930080e7          	jalr	-1744(ra) # 80003604 <consputc>
    80003cdc:	000c8513          	mv	a0,s9
    80003ce0:	00000097          	auipc	ra,0x0
    80003ce4:	924080e7          	jalr	-1756(ra) # 80003604 <consputc>
    80003ce8:	f41ff06f          	j	80003c28 <__printf+0x440>
    80003cec:	02500513          	li	a0,37
    80003cf0:	00000097          	auipc	ra,0x0
    80003cf4:	914080e7          	jalr	-1772(ra) # 80003604 <consputc>
    80003cf8:	f31ff06f          	j	80003c28 <__printf+0x440>
    80003cfc:	00030513          	mv	a0,t1
    80003d00:	00000097          	auipc	ra,0x0
    80003d04:	7bc080e7          	jalr	1980(ra) # 800044bc <acquire>
    80003d08:	b4dff06f          	j	80003854 <__printf+0x6c>
    80003d0c:	40c0053b          	negw	a0,a2
    80003d10:	00a00713          	li	a4,10
    80003d14:	02e576bb          	remuw	a3,a0,a4
    80003d18:	00001d97          	auipc	s11,0x1
    80003d1c:	5c0d8d93          	addi	s11,s11,1472 # 800052d8 <digits>
    80003d20:	ff700593          	li	a1,-9
    80003d24:	02069693          	slli	a3,a3,0x20
    80003d28:	0206d693          	srli	a3,a3,0x20
    80003d2c:	00dd86b3          	add	a3,s11,a3
    80003d30:	0006c683          	lbu	a3,0(a3)
    80003d34:	02e557bb          	divuw	a5,a0,a4
    80003d38:	f8d40023          	sb	a3,-128(s0)
    80003d3c:	10b65e63          	bge	a2,a1,80003e58 <__printf+0x670>
    80003d40:	06300593          	li	a1,99
    80003d44:	02e7f6bb          	remuw	a3,a5,a4
    80003d48:	02069693          	slli	a3,a3,0x20
    80003d4c:	0206d693          	srli	a3,a3,0x20
    80003d50:	00dd86b3          	add	a3,s11,a3
    80003d54:	0006c683          	lbu	a3,0(a3)
    80003d58:	02e7d73b          	divuw	a4,a5,a4
    80003d5c:	00200793          	li	a5,2
    80003d60:	f8d400a3          	sb	a3,-127(s0)
    80003d64:	bca5ece3          	bltu	a1,a0,8000393c <__printf+0x154>
    80003d68:	ce5ff06f          	j	80003a4c <__printf+0x264>
    80003d6c:	40e007bb          	negw	a5,a4
    80003d70:	00001d97          	auipc	s11,0x1
    80003d74:	568d8d93          	addi	s11,s11,1384 # 800052d8 <digits>
    80003d78:	00f7f693          	andi	a3,a5,15
    80003d7c:	00dd86b3          	add	a3,s11,a3
    80003d80:	0006c583          	lbu	a1,0(a3)
    80003d84:	ff100613          	li	a2,-15
    80003d88:	0047d69b          	srliw	a3,a5,0x4
    80003d8c:	f8b40023          	sb	a1,-128(s0)
    80003d90:	0047d59b          	srliw	a1,a5,0x4
    80003d94:	0ac75e63          	bge	a4,a2,80003e50 <__printf+0x668>
    80003d98:	00f6f693          	andi	a3,a3,15
    80003d9c:	00dd86b3          	add	a3,s11,a3
    80003da0:	0006c603          	lbu	a2,0(a3)
    80003da4:	00f00693          	li	a3,15
    80003da8:	0087d79b          	srliw	a5,a5,0x8
    80003dac:	f8c400a3          	sb	a2,-127(s0)
    80003db0:	d8b6e4e3          	bltu	a3,a1,80003b38 <__printf+0x350>
    80003db4:	00200793          	li	a5,2
    80003db8:	e2dff06f          	j	80003be4 <__printf+0x3fc>
    80003dbc:	00001c97          	auipc	s9,0x1
    80003dc0:	4fcc8c93          	addi	s9,s9,1276 # 800052b8 <CONSOLE_STATUS+0x2a8>
    80003dc4:	02800513          	li	a0,40
    80003dc8:	ef1ff06f          	j	80003cb8 <__printf+0x4d0>
    80003dcc:	00700793          	li	a5,7
    80003dd0:	00600c93          	li	s9,6
    80003dd4:	e0dff06f          	j	80003be0 <__printf+0x3f8>
    80003dd8:	00700793          	li	a5,7
    80003ddc:	00600c93          	li	s9,6
    80003de0:	c69ff06f          	j	80003a48 <__printf+0x260>
    80003de4:	00300793          	li	a5,3
    80003de8:	00200c93          	li	s9,2
    80003dec:	c5dff06f          	j	80003a48 <__printf+0x260>
    80003df0:	00300793          	li	a5,3
    80003df4:	00200c93          	li	s9,2
    80003df8:	de9ff06f          	j	80003be0 <__printf+0x3f8>
    80003dfc:	00400793          	li	a5,4
    80003e00:	00300c93          	li	s9,3
    80003e04:	dddff06f          	j	80003be0 <__printf+0x3f8>
    80003e08:	00400793          	li	a5,4
    80003e0c:	00300c93          	li	s9,3
    80003e10:	c39ff06f          	j	80003a48 <__printf+0x260>
    80003e14:	00500793          	li	a5,5
    80003e18:	00400c93          	li	s9,4
    80003e1c:	c2dff06f          	j	80003a48 <__printf+0x260>
    80003e20:	00500793          	li	a5,5
    80003e24:	00400c93          	li	s9,4
    80003e28:	db9ff06f          	j	80003be0 <__printf+0x3f8>
    80003e2c:	00600793          	li	a5,6
    80003e30:	00500c93          	li	s9,5
    80003e34:	dadff06f          	j	80003be0 <__printf+0x3f8>
    80003e38:	00600793          	li	a5,6
    80003e3c:	00500c93          	li	s9,5
    80003e40:	c09ff06f          	j	80003a48 <__printf+0x260>
    80003e44:	00800793          	li	a5,8
    80003e48:	00700c93          	li	s9,7
    80003e4c:	bfdff06f          	j	80003a48 <__printf+0x260>
    80003e50:	00100793          	li	a5,1
    80003e54:	d91ff06f          	j	80003be4 <__printf+0x3fc>
    80003e58:	00100793          	li	a5,1
    80003e5c:	bf1ff06f          	j	80003a4c <__printf+0x264>
    80003e60:	00900793          	li	a5,9
    80003e64:	00800c93          	li	s9,8
    80003e68:	be1ff06f          	j	80003a48 <__printf+0x260>
    80003e6c:	00001517          	auipc	a0,0x1
    80003e70:	45450513          	addi	a0,a0,1108 # 800052c0 <CONSOLE_STATUS+0x2b0>
    80003e74:	00000097          	auipc	ra,0x0
    80003e78:	918080e7          	jalr	-1768(ra) # 8000378c <panic>

0000000080003e7c <printfinit>:
    80003e7c:	fe010113          	addi	sp,sp,-32
    80003e80:	00813823          	sd	s0,16(sp)
    80003e84:	00913423          	sd	s1,8(sp)
    80003e88:	00113c23          	sd	ra,24(sp)
    80003e8c:	02010413          	addi	s0,sp,32
    80003e90:	00003497          	auipc	s1,0x3
    80003e94:	1b048493          	addi	s1,s1,432 # 80007040 <pr>
    80003e98:	00048513          	mv	a0,s1
    80003e9c:	00001597          	auipc	a1,0x1
    80003ea0:	43458593          	addi	a1,a1,1076 # 800052d0 <CONSOLE_STATUS+0x2c0>
    80003ea4:	00000097          	auipc	ra,0x0
    80003ea8:	5f4080e7          	jalr	1524(ra) # 80004498 <initlock>
    80003eac:	01813083          	ld	ra,24(sp)
    80003eb0:	01013403          	ld	s0,16(sp)
    80003eb4:	0004ac23          	sw	zero,24(s1)
    80003eb8:	00813483          	ld	s1,8(sp)
    80003ebc:	02010113          	addi	sp,sp,32
    80003ec0:	00008067          	ret

0000000080003ec4 <uartinit>:
    80003ec4:	ff010113          	addi	sp,sp,-16
    80003ec8:	00813423          	sd	s0,8(sp)
    80003ecc:	01010413          	addi	s0,sp,16
    80003ed0:	100007b7          	lui	a5,0x10000
    80003ed4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80003ed8:	f8000713          	li	a4,-128
    80003edc:	00e781a3          	sb	a4,3(a5)
    80003ee0:	00300713          	li	a4,3
    80003ee4:	00e78023          	sb	a4,0(a5)
    80003ee8:	000780a3          	sb	zero,1(a5)
    80003eec:	00e781a3          	sb	a4,3(a5)
    80003ef0:	00700693          	li	a3,7
    80003ef4:	00d78123          	sb	a3,2(a5)
    80003ef8:	00e780a3          	sb	a4,1(a5)
    80003efc:	00813403          	ld	s0,8(sp)
    80003f00:	01010113          	addi	sp,sp,16
    80003f04:	00008067          	ret

0000000080003f08 <uartputc>:
    80003f08:	00002797          	auipc	a5,0x2
    80003f0c:	ea07a783          	lw	a5,-352(a5) # 80005da8 <panicked>
    80003f10:	00078463          	beqz	a5,80003f18 <uartputc+0x10>
    80003f14:	0000006f          	j	80003f14 <uartputc+0xc>
    80003f18:	fd010113          	addi	sp,sp,-48
    80003f1c:	02813023          	sd	s0,32(sp)
    80003f20:	00913c23          	sd	s1,24(sp)
    80003f24:	01213823          	sd	s2,16(sp)
    80003f28:	01313423          	sd	s3,8(sp)
    80003f2c:	02113423          	sd	ra,40(sp)
    80003f30:	03010413          	addi	s0,sp,48
    80003f34:	00002917          	auipc	s2,0x2
    80003f38:	e7c90913          	addi	s2,s2,-388 # 80005db0 <uart_tx_r>
    80003f3c:	00093783          	ld	a5,0(s2)
    80003f40:	00002497          	auipc	s1,0x2
    80003f44:	e7848493          	addi	s1,s1,-392 # 80005db8 <uart_tx_w>
    80003f48:	0004b703          	ld	a4,0(s1)
    80003f4c:	02078693          	addi	a3,a5,32
    80003f50:	00050993          	mv	s3,a0
    80003f54:	02e69c63          	bne	a3,a4,80003f8c <uartputc+0x84>
    80003f58:	00001097          	auipc	ra,0x1
    80003f5c:	834080e7          	jalr	-1996(ra) # 8000478c <push_on>
    80003f60:	00093783          	ld	a5,0(s2)
    80003f64:	0004b703          	ld	a4,0(s1)
    80003f68:	02078793          	addi	a5,a5,32
    80003f6c:	00e79463          	bne	a5,a4,80003f74 <uartputc+0x6c>
    80003f70:	0000006f          	j	80003f70 <uartputc+0x68>
    80003f74:	00001097          	auipc	ra,0x1
    80003f78:	88c080e7          	jalr	-1908(ra) # 80004800 <pop_on>
    80003f7c:	00093783          	ld	a5,0(s2)
    80003f80:	0004b703          	ld	a4,0(s1)
    80003f84:	02078693          	addi	a3,a5,32
    80003f88:	fce688e3          	beq	a3,a4,80003f58 <uartputc+0x50>
    80003f8c:	01f77693          	andi	a3,a4,31
    80003f90:	00003597          	auipc	a1,0x3
    80003f94:	0d058593          	addi	a1,a1,208 # 80007060 <uart_tx_buf>
    80003f98:	00d586b3          	add	a3,a1,a3
    80003f9c:	00170713          	addi	a4,a4,1
    80003fa0:	01368023          	sb	s3,0(a3)
    80003fa4:	00e4b023          	sd	a4,0(s1)
    80003fa8:	10000637          	lui	a2,0x10000
    80003fac:	02f71063          	bne	a4,a5,80003fcc <uartputc+0xc4>
    80003fb0:	0340006f          	j	80003fe4 <uartputc+0xdc>
    80003fb4:	00074703          	lbu	a4,0(a4)
    80003fb8:	00f93023          	sd	a5,0(s2)
    80003fbc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80003fc0:	00093783          	ld	a5,0(s2)
    80003fc4:	0004b703          	ld	a4,0(s1)
    80003fc8:	00f70e63          	beq	a4,a5,80003fe4 <uartputc+0xdc>
    80003fcc:	00564683          	lbu	a3,5(a2)
    80003fd0:	01f7f713          	andi	a4,a5,31
    80003fd4:	00e58733          	add	a4,a1,a4
    80003fd8:	0206f693          	andi	a3,a3,32
    80003fdc:	00178793          	addi	a5,a5,1
    80003fe0:	fc069ae3          	bnez	a3,80003fb4 <uartputc+0xac>
    80003fe4:	02813083          	ld	ra,40(sp)
    80003fe8:	02013403          	ld	s0,32(sp)
    80003fec:	01813483          	ld	s1,24(sp)
    80003ff0:	01013903          	ld	s2,16(sp)
    80003ff4:	00813983          	ld	s3,8(sp)
    80003ff8:	03010113          	addi	sp,sp,48
    80003ffc:	00008067          	ret

0000000080004000 <uartputc_sync>:
    80004000:	ff010113          	addi	sp,sp,-16
    80004004:	00813423          	sd	s0,8(sp)
    80004008:	01010413          	addi	s0,sp,16
    8000400c:	00002717          	auipc	a4,0x2
    80004010:	d9c72703          	lw	a4,-612(a4) # 80005da8 <panicked>
    80004014:	02071663          	bnez	a4,80004040 <uartputc_sync+0x40>
    80004018:	00050793          	mv	a5,a0
    8000401c:	100006b7          	lui	a3,0x10000
    80004020:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004024:	02077713          	andi	a4,a4,32
    80004028:	fe070ce3          	beqz	a4,80004020 <uartputc_sync+0x20>
    8000402c:	0ff7f793          	andi	a5,a5,255
    80004030:	00f68023          	sb	a5,0(a3)
    80004034:	00813403          	ld	s0,8(sp)
    80004038:	01010113          	addi	sp,sp,16
    8000403c:	00008067          	ret
    80004040:	0000006f          	j	80004040 <uartputc_sync+0x40>

0000000080004044 <uartstart>:
    80004044:	ff010113          	addi	sp,sp,-16
    80004048:	00813423          	sd	s0,8(sp)
    8000404c:	01010413          	addi	s0,sp,16
    80004050:	00002617          	auipc	a2,0x2
    80004054:	d6060613          	addi	a2,a2,-672 # 80005db0 <uart_tx_r>
    80004058:	00002517          	auipc	a0,0x2
    8000405c:	d6050513          	addi	a0,a0,-672 # 80005db8 <uart_tx_w>
    80004060:	00063783          	ld	a5,0(a2)
    80004064:	00053703          	ld	a4,0(a0)
    80004068:	04f70263          	beq	a4,a5,800040ac <uartstart+0x68>
    8000406c:	100005b7          	lui	a1,0x10000
    80004070:	00003817          	auipc	a6,0x3
    80004074:	ff080813          	addi	a6,a6,-16 # 80007060 <uart_tx_buf>
    80004078:	01c0006f          	j	80004094 <uartstart+0x50>
    8000407c:	0006c703          	lbu	a4,0(a3)
    80004080:	00f63023          	sd	a5,0(a2)
    80004084:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004088:	00063783          	ld	a5,0(a2)
    8000408c:	00053703          	ld	a4,0(a0)
    80004090:	00f70e63          	beq	a4,a5,800040ac <uartstart+0x68>
    80004094:	01f7f713          	andi	a4,a5,31
    80004098:	00e806b3          	add	a3,a6,a4
    8000409c:	0055c703          	lbu	a4,5(a1)
    800040a0:	00178793          	addi	a5,a5,1
    800040a4:	02077713          	andi	a4,a4,32
    800040a8:	fc071ae3          	bnez	a4,8000407c <uartstart+0x38>
    800040ac:	00813403          	ld	s0,8(sp)
    800040b0:	01010113          	addi	sp,sp,16
    800040b4:	00008067          	ret

00000000800040b8 <uartgetc>:
    800040b8:	ff010113          	addi	sp,sp,-16
    800040bc:	00813423          	sd	s0,8(sp)
    800040c0:	01010413          	addi	s0,sp,16
    800040c4:	10000737          	lui	a4,0x10000
    800040c8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800040cc:	0017f793          	andi	a5,a5,1
    800040d0:	00078c63          	beqz	a5,800040e8 <uartgetc+0x30>
    800040d4:	00074503          	lbu	a0,0(a4)
    800040d8:	0ff57513          	andi	a0,a0,255
    800040dc:	00813403          	ld	s0,8(sp)
    800040e0:	01010113          	addi	sp,sp,16
    800040e4:	00008067          	ret
    800040e8:	fff00513          	li	a0,-1
    800040ec:	ff1ff06f          	j	800040dc <uartgetc+0x24>

00000000800040f0 <uartintr>:
    800040f0:	100007b7          	lui	a5,0x10000
    800040f4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800040f8:	0017f793          	andi	a5,a5,1
    800040fc:	0a078463          	beqz	a5,800041a4 <uartintr+0xb4>
    80004100:	fe010113          	addi	sp,sp,-32
    80004104:	00813823          	sd	s0,16(sp)
    80004108:	00913423          	sd	s1,8(sp)
    8000410c:	00113c23          	sd	ra,24(sp)
    80004110:	02010413          	addi	s0,sp,32
    80004114:	100004b7          	lui	s1,0x10000
    80004118:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000411c:	0ff57513          	andi	a0,a0,255
    80004120:	fffff097          	auipc	ra,0xfffff
    80004124:	534080e7          	jalr	1332(ra) # 80003654 <consoleintr>
    80004128:	0054c783          	lbu	a5,5(s1)
    8000412c:	0017f793          	andi	a5,a5,1
    80004130:	fe0794e3          	bnez	a5,80004118 <uartintr+0x28>
    80004134:	00002617          	auipc	a2,0x2
    80004138:	c7c60613          	addi	a2,a2,-900 # 80005db0 <uart_tx_r>
    8000413c:	00002517          	auipc	a0,0x2
    80004140:	c7c50513          	addi	a0,a0,-900 # 80005db8 <uart_tx_w>
    80004144:	00063783          	ld	a5,0(a2)
    80004148:	00053703          	ld	a4,0(a0)
    8000414c:	04f70263          	beq	a4,a5,80004190 <uartintr+0xa0>
    80004150:	100005b7          	lui	a1,0x10000
    80004154:	00003817          	auipc	a6,0x3
    80004158:	f0c80813          	addi	a6,a6,-244 # 80007060 <uart_tx_buf>
    8000415c:	01c0006f          	j	80004178 <uartintr+0x88>
    80004160:	0006c703          	lbu	a4,0(a3)
    80004164:	00f63023          	sd	a5,0(a2)
    80004168:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000416c:	00063783          	ld	a5,0(a2)
    80004170:	00053703          	ld	a4,0(a0)
    80004174:	00f70e63          	beq	a4,a5,80004190 <uartintr+0xa0>
    80004178:	01f7f713          	andi	a4,a5,31
    8000417c:	00e806b3          	add	a3,a6,a4
    80004180:	0055c703          	lbu	a4,5(a1)
    80004184:	00178793          	addi	a5,a5,1
    80004188:	02077713          	andi	a4,a4,32
    8000418c:	fc071ae3          	bnez	a4,80004160 <uartintr+0x70>
    80004190:	01813083          	ld	ra,24(sp)
    80004194:	01013403          	ld	s0,16(sp)
    80004198:	00813483          	ld	s1,8(sp)
    8000419c:	02010113          	addi	sp,sp,32
    800041a0:	00008067          	ret
    800041a4:	00002617          	auipc	a2,0x2
    800041a8:	c0c60613          	addi	a2,a2,-1012 # 80005db0 <uart_tx_r>
    800041ac:	00002517          	auipc	a0,0x2
    800041b0:	c0c50513          	addi	a0,a0,-1012 # 80005db8 <uart_tx_w>
    800041b4:	00063783          	ld	a5,0(a2)
    800041b8:	00053703          	ld	a4,0(a0)
    800041bc:	04f70263          	beq	a4,a5,80004200 <uartintr+0x110>
    800041c0:	100005b7          	lui	a1,0x10000
    800041c4:	00003817          	auipc	a6,0x3
    800041c8:	e9c80813          	addi	a6,a6,-356 # 80007060 <uart_tx_buf>
    800041cc:	01c0006f          	j	800041e8 <uartintr+0xf8>
    800041d0:	0006c703          	lbu	a4,0(a3)
    800041d4:	00f63023          	sd	a5,0(a2)
    800041d8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800041dc:	00063783          	ld	a5,0(a2)
    800041e0:	00053703          	ld	a4,0(a0)
    800041e4:	02f70063          	beq	a4,a5,80004204 <uartintr+0x114>
    800041e8:	01f7f713          	andi	a4,a5,31
    800041ec:	00e806b3          	add	a3,a6,a4
    800041f0:	0055c703          	lbu	a4,5(a1)
    800041f4:	00178793          	addi	a5,a5,1
    800041f8:	02077713          	andi	a4,a4,32
    800041fc:	fc071ae3          	bnez	a4,800041d0 <uartintr+0xe0>
    80004200:	00008067          	ret
    80004204:	00008067          	ret

0000000080004208 <kinit>:
    80004208:	fc010113          	addi	sp,sp,-64
    8000420c:	02913423          	sd	s1,40(sp)
    80004210:	fffff7b7          	lui	a5,0xfffff
    80004214:	00004497          	auipc	s1,0x4
    80004218:	e6b48493          	addi	s1,s1,-405 # 8000807f <end+0xfff>
    8000421c:	02813823          	sd	s0,48(sp)
    80004220:	01313c23          	sd	s3,24(sp)
    80004224:	00f4f4b3          	and	s1,s1,a5
    80004228:	02113c23          	sd	ra,56(sp)
    8000422c:	03213023          	sd	s2,32(sp)
    80004230:	01413823          	sd	s4,16(sp)
    80004234:	01513423          	sd	s5,8(sp)
    80004238:	04010413          	addi	s0,sp,64
    8000423c:	000017b7          	lui	a5,0x1
    80004240:	01100993          	li	s3,17
    80004244:	00f487b3          	add	a5,s1,a5
    80004248:	01b99993          	slli	s3,s3,0x1b
    8000424c:	06f9e063          	bltu	s3,a5,800042ac <kinit+0xa4>
    80004250:	00003a97          	auipc	s5,0x3
    80004254:	e30a8a93          	addi	s5,s5,-464 # 80007080 <end>
    80004258:	0754ec63          	bltu	s1,s5,800042d0 <kinit+0xc8>
    8000425c:	0734fa63          	bgeu	s1,s3,800042d0 <kinit+0xc8>
    80004260:	00088a37          	lui	s4,0x88
    80004264:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004268:	00002917          	auipc	s2,0x2
    8000426c:	b5890913          	addi	s2,s2,-1192 # 80005dc0 <kmem>
    80004270:	00ca1a13          	slli	s4,s4,0xc
    80004274:	0140006f          	j	80004288 <kinit+0x80>
    80004278:	000017b7          	lui	a5,0x1
    8000427c:	00f484b3          	add	s1,s1,a5
    80004280:	0554e863          	bltu	s1,s5,800042d0 <kinit+0xc8>
    80004284:	0534f663          	bgeu	s1,s3,800042d0 <kinit+0xc8>
    80004288:	00001637          	lui	a2,0x1
    8000428c:	00100593          	li	a1,1
    80004290:	00048513          	mv	a0,s1
    80004294:	00000097          	auipc	ra,0x0
    80004298:	5e4080e7          	jalr	1508(ra) # 80004878 <__memset>
    8000429c:	00093783          	ld	a5,0(s2)
    800042a0:	00f4b023          	sd	a5,0(s1)
    800042a4:	00993023          	sd	s1,0(s2)
    800042a8:	fd4498e3          	bne	s1,s4,80004278 <kinit+0x70>
    800042ac:	03813083          	ld	ra,56(sp)
    800042b0:	03013403          	ld	s0,48(sp)
    800042b4:	02813483          	ld	s1,40(sp)
    800042b8:	02013903          	ld	s2,32(sp)
    800042bc:	01813983          	ld	s3,24(sp)
    800042c0:	01013a03          	ld	s4,16(sp)
    800042c4:	00813a83          	ld	s5,8(sp)
    800042c8:	04010113          	addi	sp,sp,64
    800042cc:	00008067          	ret
    800042d0:	00001517          	auipc	a0,0x1
    800042d4:	02050513          	addi	a0,a0,32 # 800052f0 <digits+0x18>
    800042d8:	fffff097          	auipc	ra,0xfffff
    800042dc:	4b4080e7          	jalr	1204(ra) # 8000378c <panic>

00000000800042e0 <freerange>:
    800042e0:	fc010113          	addi	sp,sp,-64
    800042e4:	000017b7          	lui	a5,0x1
    800042e8:	02913423          	sd	s1,40(sp)
    800042ec:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800042f0:	009504b3          	add	s1,a0,s1
    800042f4:	fffff537          	lui	a0,0xfffff
    800042f8:	02813823          	sd	s0,48(sp)
    800042fc:	02113c23          	sd	ra,56(sp)
    80004300:	03213023          	sd	s2,32(sp)
    80004304:	01313c23          	sd	s3,24(sp)
    80004308:	01413823          	sd	s4,16(sp)
    8000430c:	01513423          	sd	s5,8(sp)
    80004310:	01613023          	sd	s6,0(sp)
    80004314:	04010413          	addi	s0,sp,64
    80004318:	00a4f4b3          	and	s1,s1,a0
    8000431c:	00f487b3          	add	a5,s1,a5
    80004320:	06f5e463          	bltu	a1,a5,80004388 <freerange+0xa8>
    80004324:	00003a97          	auipc	s5,0x3
    80004328:	d5ca8a93          	addi	s5,s5,-676 # 80007080 <end>
    8000432c:	0954e263          	bltu	s1,s5,800043b0 <freerange+0xd0>
    80004330:	01100993          	li	s3,17
    80004334:	01b99993          	slli	s3,s3,0x1b
    80004338:	0734fc63          	bgeu	s1,s3,800043b0 <freerange+0xd0>
    8000433c:	00058a13          	mv	s4,a1
    80004340:	00002917          	auipc	s2,0x2
    80004344:	a8090913          	addi	s2,s2,-1408 # 80005dc0 <kmem>
    80004348:	00002b37          	lui	s6,0x2
    8000434c:	0140006f          	j	80004360 <freerange+0x80>
    80004350:	000017b7          	lui	a5,0x1
    80004354:	00f484b3          	add	s1,s1,a5
    80004358:	0554ec63          	bltu	s1,s5,800043b0 <freerange+0xd0>
    8000435c:	0534fa63          	bgeu	s1,s3,800043b0 <freerange+0xd0>
    80004360:	00001637          	lui	a2,0x1
    80004364:	00100593          	li	a1,1
    80004368:	00048513          	mv	a0,s1
    8000436c:	00000097          	auipc	ra,0x0
    80004370:	50c080e7          	jalr	1292(ra) # 80004878 <__memset>
    80004374:	00093703          	ld	a4,0(s2)
    80004378:	016487b3          	add	a5,s1,s6
    8000437c:	00e4b023          	sd	a4,0(s1)
    80004380:	00993023          	sd	s1,0(s2)
    80004384:	fcfa76e3          	bgeu	s4,a5,80004350 <freerange+0x70>
    80004388:	03813083          	ld	ra,56(sp)
    8000438c:	03013403          	ld	s0,48(sp)
    80004390:	02813483          	ld	s1,40(sp)
    80004394:	02013903          	ld	s2,32(sp)
    80004398:	01813983          	ld	s3,24(sp)
    8000439c:	01013a03          	ld	s4,16(sp)
    800043a0:	00813a83          	ld	s5,8(sp)
    800043a4:	00013b03          	ld	s6,0(sp)
    800043a8:	04010113          	addi	sp,sp,64
    800043ac:	00008067          	ret
    800043b0:	00001517          	auipc	a0,0x1
    800043b4:	f4050513          	addi	a0,a0,-192 # 800052f0 <digits+0x18>
    800043b8:	fffff097          	auipc	ra,0xfffff
    800043bc:	3d4080e7          	jalr	980(ra) # 8000378c <panic>

00000000800043c0 <kfree>:
    800043c0:	fe010113          	addi	sp,sp,-32
    800043c4:	00813823          	sd	s0,16(sp)
    800043c8:	00113c23          	sd	ra,24(sp)
    800043cc:	00913423          	sd	s1,8(sp)
    800043d0:	02010413          	addi	s0,sp,32
    800043d4:	03451793          	slli	a5,a0,0x34
    800043d8:	04079c63          	bnez	a5,80004430 <kfree+0x70>
    800043dc:	00003797          	auipc	a5,0x3
    800043e0:	ca478793          	addi	a5,a5,-860 # 80007080 <end>
    800043e4:	00050493          	mv	s1,a0
    800043e8:	04f56463          	bltu	a0,a5,80004430 <kfree+0x70>
    800043ec:	01100793          	li	a5,17
    800043f0:	01b79793          	slli	a5,a5,0x1b
    800043f4:	02f57e63          	bgeu	a0,a5,80004430 <kfree+0x70>
    800043f8:	00001637          	lui	a2,0x1
    800043fc:	00100593          	li	a1,1
    80004400:	00000097          	auipc	ra,0x0
    80004404:	478080e7          	jalr	1144(ra) # 80004878 <__memset>
    80004408:	00002797          	auipc	a5,0x2
    8000440c:	9b878793          	addi	a5,a5,-1608 # 80005dc0 <kmem>
    80004410:	0007b703          	ld	a4,0(a5)
    80004414:	01813083          	ld	ra,24(sp)
    80004418:	01013403          	ld	s0,16(sp)
    8000441c:	00e4b023          	sd	a4,0(s1)
    80004420:	0097b023          	sd	s1,0(a5)
    80004424:	00813483          	ld	s1,8(sp)
    80004428:	02010113          	addi	sp,sp,32
    8000442c:	00008067          	ret
    80004430:	00001517          	auipc	a0,0x1
    80004434:	ec050513          	addi	a0,a0,-320 # 800052f0 <digits+0x18>
    80004438:	fffff097          	auipc	ra,0xfffff
    8000443c:	354080e7          	jalr	852(ra) # 8000378c <panic>

0000000080004440 <kalloc>:
    80004440:	fe010113          	addi	sp,sp,-32
    80004444:	00813823          	sd	s0,16(sp)
    80004448:	00913423          	sd	s1,8(sp)
    8000444c:	00113c23          	sd	ra,24(sp)
    80004450:	02010413          	addi	s0,sp,32
    80004454:	00002797          	auipc	a5,0x2
    80004458:	96c78793          	addi	a5,a5,-1684 # 80005dc0 <kmem>
    8000445c:	0007b483          	ld	s1,0(a5)
    80004460:	02048063          	beqz	s1,80004480 <kalloc+0x40>
    80004464:	0004b703          	ld	a4,0(s1)
    80004468:	00001637          	lui	a2,0x1
    8000446c:	00500593          	li	a1,5
    80004470:	00048513          	mv	a0,s1
    80004474:	00e7b023          	sd	a4,0(a5)
    80004478:	00000097          	auipc	ra,0x0
    8000447c:	400080e7          	jalr	1024(ra) # 80004878 <__memset>
    80004480:	01813083          	ld	ra,24(sp)
    80004484:	01013403          	ld	s0,16(sp)
    80004488:	00048513          	mv	a0,s1
    8000448c:	00813483          	ld	s1,8(sp)
    80004490:	02010113          	addi	sp,sp,32
    80004494:	00008067          	ret

0000000080004498 <initlock>:
    80004498:	ff010113          	addi	sp,sp,-16
    8000449c:	00813423          	sd	s0,8(sp)
    800044a0:	01010413          	addi	s0,sp,16
    800044a4:	00813403          	ld	s0,8(sp)
    800044a8:	00b53423          	sd	a1,8(a0)
    800044ac:	00052023          	sw	zero,0(a0)
    800044b0:	00053823          	sd	zero,16(a0)
    800044b4:	01010113          	addi	sp,sp,16
    800044b8:	00008067          	ret

00000000800044bc <acquire>:
    800044bc:	fe010113          	addi	sp,sp,-32
    800044c0:	00813823          	sd	s0,16(sp)
    800044c4:	00913423          	sd	s1,8(sp)
    800044c8:	00113c23          	sd	ra,24(sp)
    800044cc:	01213023          	sd	s2,0(sp)
    800044d0:	02010413          	addi	s0,sp,32
    800044d4:	00050493          	mv	s1,a0
    800044d8:	10002973          	csrr	s2,sstatus
    800044dc:	100027f3          	csrr	a5,sstatus
    800044e0:	ffd7f793          	andi	a5,a5,-3
    800044e4:	10079073          	csrw	sstatus,a5
    800044e8:	fffff097          	auipc	ra,0xfffff
    800044ec:	8ec080e7          	jalr	-1812(ra) # 80002dd4 <mycpu>
    800044f0:	07852783          	lw	a5,120(a0)
    800044f4:	06078e63          	beqz	a5,80004570 <acquire+0xb4>
    800044f8:	fffff097          	auipc	ra,0xfffff
    800044fc:	8dc080e7          	jalr	-1828(ra) # 80002dd4 <mycpu>
    80004500:	07852783          	lw	a5,120(a0)
    80004504:	0004a703          	lw	a4,0(s1)
    80004508:	0017879b          	addiw	a5,a5,1
    8000450c:	06f52c23          	sw	a5,120(a0)
    80004510:	04071063          	bnez	a4,80004550 <acquire+0x94>
    80004514:	00100713          	li	a4,1
    80004518:	00070793          	mv	a5,a4
    8000451c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80004520:	0007879b          	sext.w	a5,a5
    80004524:	fe079ae3          	bnez	a5,80004518 <acquire+0x5c>
    80004528:	0ff0000f          	fence
    8000452c:	fffff097          	auipc	ra,0xfffff
    80004530:	8a8080e7          	jalr	-1880(ra) # 80002dd4 <mycpu>
    80004534:	01813083          	ld	ra,24(sp)
    80004538:	01013403          	ld	s0,16(sp)
    8000453c:	00a4b823          	sd	a0,16(s1)
    80004540:	00013903          	ld	s2,0(sp)
    80004544:	00813483          	ld	s1,8(sp)
    80004548:	02010113          	addi	sp,sp,32
    8000454c:	00008067          	ret
    80004550:	0104b903          	ld	s2,16(s1)
    80004554:	fffff097          	auipc	ra,0xfffff
    80004558:	880080e7          	jalr	-1920(ra) # 80002dd4 <mycpu>
    8000455c:	faa91ce3          	bne	s2,a0,80004514 <acquire+0x58>
    80004560:	00001517          	auipc	a0,0x1
    80004564:	d9850513          	addi	a0,a0,-616 # 800052f8 <digits+0x20>
    80004568:	fffff097          	auipc	ra,0xfffff
    8000456c:	224080e7          	jalr	548(ra) # 8000378c <panic>
    80004570:	00195913          	srli	s2,s2,0x1
    80004574:	fffff097          	auipc	ra,0xfffff
    80004578:	860080e7          	jalr	-1952(ra) # 80002dd4 <mycpu>
    8000457c:	00197913          	andi	s2,s2,1
    80004580:	07252e23          	sw	s2,124(a0)
    80004584:	f75ff06f          	j	800044f8 <acquire+0x3c>

0000000080004588 <release>:
    80004588:	fe010113          	addi	sp,sp,-32
    8000458c:	00813823          	sd	s0,16(sp)
    80004590:	00113c23          	sd	ra,24(sp)
    80004594:	00913423          	sd	s1,8(sp)
    80004598:	01213023          	sd	s2,0(sp)
    8000459c:	02010413          	addi	s0,sp,32
    800045a0:	00052783          	lw	a5,0(a0)
    800045a4:	00079a63          	bnez	a5,800045b8 <release+0x30>
    800045a8:	00001517          	auipc	a0,0x1
    800045ac:	d5850513          	addi	a0,a0,-680 # 80005300 <digits+0x28>
    800045b0:	fffff097          	auipc	ra,0xfffff
    800045b4:	1dc080e7          	jalr	476(ra) # 8000378c <panic>
    800045b8:	01053903          	ld	s2,16(a0)
    800045bc:	00050493          	mv	s1,a0
    800045c0:	fffff097          	auipc	ra,0xfffff
    800045c4:	814080e7          	jalr	-2028(ra) # 80002dd4 <mycpu>
    800045c8:	fea910e3          	bne	s2,a0,800045a8 <release+0x20>
    800045cc:	0004b823          	sd	zero,16(s1)
    800045d0:	0ff0000f          	fence
    800045d4:	0f50000f          	fence	iorw,ow
    800045d8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800045dc:	ffffe097          	auipc	ra,0xffffe
    800045e0:	7f8080e7          	jalr	2040(ra) # 80002dd4 <mycpu>
    800045e4:	100027f3          	csrr	a5,sstatus
    800045e8:	0027f793          	andi	a5,a5,2
    800045ec:	04079a63          	bnez	a5,80004640 <release+0xb8>
    800045f0:	07852783          	lw	a5,120(a0)
    800045f4:	02f05e63          	blez	a5,80004630 <release+0xa8>
    800045f8:	fff7871b          	addiw	a4,a5,-1
    800045fc:	06e52c23          	sw	a4,120(a0)
    80004600:	00071c63          	bnez	a4,80004618 <release+0x90>
    80004604:	07c52783          	lw	a5,124(a0)
    80004608:	00078863          	beqz	a5,80004618 <release+0x90>
    8000460c:	100027f3          	csrr	a5,sstatus
    80004610:	0027e793          	ori	a5,a5,2
    80004614:	10079073          	csrw	sstatus,a5
    80004618:	01813083          	ld	ra,24(sp)
    8000461c:	01013403          	ld	s0,16(sp)
    80004620:	00813483          	ld	s1,8(sp)
    80004624:	00013903          	ld	s2,0(sp)
    80004628:	02010113          	addi	sp,sp,32
    8000462c:	00008067          	ret
    80004630:	00001517          	auipc	a0,0x1
    80004634:	cf050513          	addi	a0,a0,-784 # 80005320 <digits+0x48>
    80004638:	fffff097          	auipc	ra,0xfffff
    8000463c:	154080e7          	jalr	340(ra) # 8000378c <panic>
    80004640:	00001517          	auipc	a0,0x1
    80004644:	cc850513          	addi	a0,a0,-824 # 80005308 <digits+0x30>
    80004648:	fffff097          	auipc	ra,0xfffff
    8000464c:	144080e7          	jalr	324(ra) # 8000378c <panic>

0000000080004650 <holding>:
    80004650:	00052783          	lw	a5,0(a0)
    80004654:	00079663          	bnez	a5,80004660 <holding+0x10>
    80004658:	00000513          	li	a0,0
    8000465c:	00008067          	ret
    80004660:	fe010113          	addi	sp,sp,-32
    80004664:	00813823          	sd	s0,16(sp)
    80004668:	00913423          	sd	s1,8(sp)
    8000466c:	00113c23          	sd	ra,24(sp)
    80004670:	02010413          	addi	s0,sp,32
    80004674:	01053483          	ld	s1,16(a0)
    80004678:	ffffe097          	auipc	ra,0xffffe
    8000467c:	75c080e7          	jalr	1884(ra) # 80002dd4 <mycpu>
    80004680:	01813083          	ld	ra,24(sp)
    80004684:	01013403          	ld	s0,16(sp)
    80004688:	40a48533          	sub	a0,s1,a0
    8000468c:	00153513          	seqz	a0,a0
    80004690:	00813483          	ld	s1,8(sp)
    80004694:	02010113          	addi	sp,sp,32
    80004698:	00008067          	ret

000000008000469c <push_off>:
    8000469c:	fe010113          	addi	sp,sp,-32
    800046a0:	00813823          	sd	s0,16(sp)
    800046a4:	00113c23          	sd	ra,24(sp)
    800046a8:	00913423          	sd	s1,8(sp)
    800046ac:	02010413          	addi	s0,sp,32
    800046b0:	100024f3          	csrr	s1,sstatus
    800046b4:	100027f3          	csrr	a5,sstatus
    800046b8:	ffd7f793          	andi	a5,a5,-3
    800046bc:	10079073          	csrw	sstatus,a5
    800046c0:	ffffe097          	auipc	ra,0xffffe
    800046c4:	714080e7          	jalr	1812(ra) # 80002dd4 <mycpu>
    800046c8:	07852783          	lw	a5,120(a0)
    800046cc:	02078663          	beqz	a5,800046f8 <push_off+0x5c>
    800046d0:	ffffe097          	auipc	ra,0xffffe
    800046d4:	704080e7          	jalr	1796(ra) # 80002dd4 <mycpu>
    800046d8:	07852783          	lw	a5,120(a0)
    800046dc:	01813083          	ld	ra,24(sp)
    800046e0:	01013403          	ld	s0,16(sp)
    800046e4:	0017879b          	addiw	a5,a5,1
    800046e8:	06f52c23          	sw	a5,120(a0)
    800046ec:	00813483          	ld	s1,8(sp)
    800046f0:	02010113          	addi	sp,sp,32
    800046f4:	00008067          	ret
    800046f8:	0014d493          	srli	s1,s1,0x1
    800046fc:	ffffe097          	auipc	ra,0xffffe
    80004700:	6d8080e7          	jalr	1752(ra) # 80002dd4 <mycpu>
    80004704:	0014f493          	andi	s1,s1,1
    80004708:	06952e23          	sw	s1,124(a0)
    8000470c:	fc5ff06f          	j	800046d0 <push_off+0x34>

0000000080004710 <pop_off>:
    80004710:	ff010113          	addi	sp,sp,-16
    80004714:	00813023          	sd	s0,0(sp)
    80004718:	00113423          	sd	ra,8(sp)
    8000471c:	01010413          	addi	s0,sp,16
    80004720:	ffffe097          	auipc	ra,0xffffe
    80004724:	6b4080e7          	jalr	1716(ra) # 80002dd4 <mycpu>
    80004728:	100027f3          	csrr	a5,sstatus
    8000472c:	0027f793          	andi	a5,a5,2
    80004730:	04079663          	bnez	a5,8000477c <pop_off+0x6c>
    80004734:	07852783          	lw	a5,120(a0)
    80004738:	02f05a63          	blez	a5,8000476c <pop_off+0x5c>
    8000473c:	fff7871b          	addiw	a4,a5,-1
    80004740:	06e52c23          	sw	a4,120(a0)
    80004744:	00071c63          	bnez	a4,8000475c <pop_off+0x4c>
    80004748:	07c52783          	lw	a5,124(a0)
    8000474c:	00078863          	beqz	a5,8000475c <pop_off+0x4c>
    80004750:	100027f3          	csrr	a5,sstatus
    80004754:	0027e793          	ori	a5,a5,2
    80004758:	10079073          	csrw	sstatus,a5
    8000475c:	00813083          	ld	ra,8(sp)
    80004760:	00013403          	ld	s0,0(sp)
    80004764:	01010113          	addi	sp,sp,16
    80004768:	00008067          	ret
    8000476c:	00001517          	auipc	a0,0x1
    80004770:	bb450513          	addi	a0,a0,-1100 # 80005320 <digits+0x48>
    80004774:	fffff097          	auipc	ra,0xfffff
    80004778:	018080e7          	jalr	24(ra) # 8000378c <panic>
    8000477c:	00001517          	auipc	a0,0x1
    80004780:	b8c50513          	addi	a0,a0,-1140 # 80005308 <digits+0x30>
    80004784:	fffff097          	auipc	ra,0xfffff
    80004788:	008080e7          	jalr	8(ra) # 8000378c <panic>

000000008000478c <push_on>:
    8000478c:	fe010113          	addi	sp,sp,-32
    80004790:	00813823          	sd	s0,16(sp)
    80004794:	00113c23          	sd	ra,24(sp)
    80004798:	00913423          	sd	s1,8(sp)
    8000479c:	02010413          	addi	s0,sp,32
    800047a0:	100024f3          	csrr	s1,sstatus
    800047a4:	100027f3          	csrr	a5,sstatus
    800047a8:	0027e793          	ori	a5,a5,2
    800047ac:	10079073          	csrw	sstatus,a5
    800047b0:	ffffe097          	auipc	ra,0xffffe
    800047b4:	624080e7          	jalr	1572(ra) # 80002dd4 <mycpu>
    800047b8:	07852783          	lw	a5,120(a0)
    800047bc:	02078663          	beqz	a5,800047e8 <push_on+0x5c>
    800047c0:	ffffe097          	auipc	ra,0xffffe
    800047c4:	614080e7          	jalr	1556(ra) # 80002dd4 <mycpu>
    800047c8:	07852783          	lw	a5,120(a0)
    800047cc:	01813083          	ld	ra,24(sp)
    800047d0:	01013403          	ld	s0,16(sp)
    800047d4:	0017879b          	addiw	a5,a5,1
    800047d8:	06f52c23          	sw	a5,120(a0)
    800047dc:	00813483          	ld	s1,8(sp)
    800047e0:	02010113          	addi	sp,sp,32
    800047e4:	00008067          	ret
    800047e8:	0014d493          	srli	s1,s1,0x1
    800047ec:	ffffe097          	auipc	ra,0xffffe
    800047f0:	5e8080e7          	jalr	1512(ra) # 80002dd4 <mycpu>
    800047f4:	0014f493          	andi	s1,s1,1
    800047f8:	06952e23          	sw	s1,124(a0)
    800047fc:	fc5ff06f          	j	800047c0 <push_on+0x34>

0000000080004800 <pop_on>:
    80004800:	ff010113          	addi	sp,sp,-16
    80004804:	00813023          	sd	s0,0(sp)
    80004808:	00113423          	sd	ra,8(sp)
    8000480c:	01010413          	addi	s0,sp,16
    80004810:	ffffe097          	auipc	ra,0xffffe
    80004814:	5c4080e7          	jalr	1476(ra) # 80002dd4 <mycpu>
    80004818:	100027f3          	csrr	a5,sstatus
    8000481c:	0027f793          	andi	a5,a5,2
    80004820:	04078463          	beqz	a5,80004868 <pop_on+0x68>
    80004824:	07852783          	lw	a5,120(a0)
    80004828:	02f05863          	blez	a5,80004858 <pop_on+0x58>
    8000482c:	fff7879b          	addiw	a5,a5,-1
    80004830:	06f52c23          	sw	a5,120(a0)
    80004834:	07853783          	ld	a5,120(a0)
    80004838:	00079863          	bnez	a5,80004848 <pop_on+0x48>
    8000483c:	100027f3          	csrr	a5,sstatus
    80004840:	ffd7f793          	andi	a5,a5,-3
    80004844:	10079073          	csrw	sstatus,a5
    80004848:	00813083          	ld	ra,8(sp)
    8000484c:	00013403          	ld	s0,0(sp)
    80004850:	01010113          	addi	sp,sp,16
    80004854:	00008067          	ret
    80004858:	00001517          	auipc	a0,0x1
    8000485c:	af050513          	addi	a0,a0,-1296 # 80005348 <digits+0x70>
    80004860:	fffff097          	auipc	ra,0xfffff
    80004864:	f2c080e7          	jalr	-212(ra) # 8000378c <panic>
    80004868:	00001517          	auipc	a0,0x1
    8000486c:	ac050513          	addi	a0,a0,-1344 # 80005328 <digits+0x50>
    80004870:	fffff097          	auipc	ra,0xfffff
    80004874:	f1c080e7          	jalr	-228(ra) # 8000378c <panic>

0000000080004878 <__memset>:
    80004878:	ff010113          	addi	sp,sp,-16
    8000487c:	00813423          	sd	s0,8(sp)
    80004880:	01010413          	addi	s0,sp,16
    80004884:	1a060e63          	beqz	a2,80004a40 <__memset+0x1c8>
    80004888:	40a007b3          	neg	a5,a0
    8000488c:	0077f793          	andi	a5,a5,7
    80004890:	00778693          	addi	a3,a5,7
    80004894:	00b00813          	li	a6,11
    80004898:	0ff5f593          	andi	a1,a1,255
    8000489c:	fff6071b          	addiw	a4,a2,-1
    800048a0:	1b06e663          	bltu	a3,a6,80004a4c <__memset+0x1d4>
    800048a4:	1cd76463          	bltu	a4,a3,80004a6c <__memset+0x1f4>
    800048a8:	1a078e63          	beqz	a5,80004a64 <__memset+0x1ec>
    800048ac:	00b50023          	sb	a1,0(a0)
    800048b0:	00100713          	li	a4,1
    800048b4:	1ae78463          	beq	a5,a4,80004a5c <__memset+0x1e4>
    800048b8:	00b500a3          	sb	a1,1(a0)
    800048bc:	00200713          	li	a4,2
    800048c0:	1ae78a63          	beq	a5,a4,80004a74 <__memset+0x1fc>
    800048c4:	00b50123          	sb	a1,2(a0)
    800048c8:	00300713          	li	a4,3
    800048cc:	18e78463          	beq	a5,a4,80004a54 <__memset+0x1dc>
    800048d0:	00b501a3          	sb	a1,3(a0)
    800048d4:	00400713          	li	a4,4
    800048d8:	1ae78263          	beq	a5,a4,80004a7c <__memset+0x204>
    800048dc:	00b50223          	sb	a1,4(a0)
    800048e0:	00500713          	li	a4,5
    800048e4:	1ae78063          	beq	a5,a4,80004a84 <__memset+0x20c>
    800048e8:	00b502a3          	sb	a1,5(a0)
    800048ec:	00700713          	li	a4,7
    800048f0:	18e79e63          	bne	a5,a4,80004a8c <__memset+0x214>
    800048f4:	00b50323          	sb	a1,6(a0)
    800048f8:	00700e93          	li	t4,7
    800048fc:	00859713          	slli	a4,a1,0x8
    80004900:	00e5e733          	or	a4,a1,a4
    80004904:	01059e13          	slli	t3,a1,0x10
    80004908:	01c76e33          	or	t3,a4,t3
    8000490c:	01859313          	slli	t1,a1,0x18
    80004910:	006e6333          	or	t1,t3,t1
    80004914:	02059893          	slli	a7,a1,0x20
    80004918:	40f60e3b          	subw	t3,a2,a5
    8000491c:	011368b3          	or	a7,t1,a7
    80004920:	02859813          	slli	a6,a1,0x28
    80004924:	0108e833          	or	a6,a7,a6
    80004928:	03059693          	slli	a3,a1,0x30
    8000492c:	003e589b          	srliw	a7,t3,0x3
    80004930:	00d866b3          	or	a3,a6,a3
    80004934:	03859713          	slli	a4,a1,0x38
    80004938:	00389813          	slli	a6,a7,0x3
    8000493c:	00f507b3          	add	a5,a0,a5
    80004940:	00e6e733          	or	a4,a3,a4
    80004944:	000e089b          	sext.w	a7,t3
    80004948:	00f806b3          	add	a3,a6,a5
    8000494c:	00e7b023          	sd	a4,0(a5)
    80004950:	00878793          	addi	a5,a5,8
    80004954:	fed79ce3          	bne	a5,a3,8000494c <__memset+0xd4>
    80004958:	ff8e7793          	andi	a5,t3,-8
    8000495c:	0007871b          	sext.w	a4,a5
    80004960:	01d787bb          	addw	a5,a5,t4
    80004964:	0ce88e63          	beq	a7,a4,80004a40 <__memset+0x1c8>
    80004968:	00f50733          	add	a4,a0,a5
    8000496c:	00b70023          	sb	a1,0(a4)
    80004970:	0017871b          	addiw	a4,a5,1
    80004974:	0cc77663          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    80004978:	00e50733          	add	a4,a0,a4
    8000497c:	00b70023          	sb	a1,0(a4)
    80004980:	0027871b          	addiw	a4,a5,2
    80004984:	0ac77e63          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    80004988:	00e50733          	add	a4,a0,a4
    8000498c:	00b70023          	sb	a1,0(a4)
    80004990:	0037871b          	addiw	a4,a5,3
    80004994:	0ac77663          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    80004998:	00e50733          	add	a4,a0,a4
    8000499c:	00b70023          	sb	a1,0(a4)
    800049a0:	0047871b          	addiw	a4,a5,4
    800049a4:	08c77e63          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    800049a8:	00e50733          	add	a4,a0,a4
    800049ac:	00b70023          	sb	a1,0(a4)
    800049b0:	0057871b          	addiw	a4,a5,5
    800049b4:	08c77663          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    800049b8:	00e50733          	add	a4,a0,a4
    800049bc:	00b70023          	sb	a1,0(a4)
    800049c0:	0067871b          	addiw	a4,a5,6
    800049c4:	06c77e63          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    800049c8:	00e50733          	add	a4,a0,a4
    800049cc:	00b70023          	sb	a1,0(a4)
    800049d0:	0077871b          	addiw	a4,a5,7
    800049d4:	06c77663          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    800049d8:	00e50733          	add	a4,a0,a4
    800049dc:	00b70023          	sb	a1,0(a4)
    800049e0:	0087871b          	addiw	a4,a5,8
    800049e4:	04c77e63          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    800049e8:	00e50733          	add	a4,a0,a4
    800049ec:	00b70023          	sb	a1,0(a4)
    800049f0:	0097871b          	addiw	a4,a5,9
    800049f4:	04c77663          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    800049f8:	00e50733          	add	a4,a0,a4
    800049fc:	00b70023          	sb	a1,0(a4)
    80004a00:	00a7871b          	addiw	a4,a5,10
    80004a04:	02c77e63          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    80004a08:	00e50733          	add	a4,a0,a4
    80004a0c:	00b70023          	sb	a1,0(a4)
    80004a10:	00b7871b          	addiw	a4,a5,11
    80004a14:	02c77663          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    80004a18:	00e50733          	add	a4,a0,a4
    80004a1c:	00b70023          	sb	a1,0(a4)
    80004a20:	00c7871b          	addiw	a4,a5,12
    80004a24:	00c77e63          	bgeu	a4,a2,80004a40 <__memset+0x1c8>
    80004a28:	00e50733          	add	a4,a0,a4
    80004a2c:	00b70023          	sb	a1,0(a4)
    80004a30:	00d7879b          	addiw	a5,a5,13
    80004a34:	00c7f663          	bgeu	a5,a2,80004a40 <__memset+0x1c8>
    80004a38:	00f507b3          	add	a5,a0,a5
    80004a3c:	00b78023          	sb	a1,0(a5)
    80004a40:	00813403          	ld	s0,8(sp)
    80004a44:	01010113          	addi	sp,sp,16
    80004a48:	00008067          	ret
    80004a4c:	00b00693          	li	a3,11
    80004a50:	e55ff06f          	j	800048a4 <__memset+0x2c>
    80004a54:	00300e93          	li	t4,3
    80004a58:	ea5ff06f          	j	800048fc <__memset+0x84>
    80004a5c:	00100e93          	li	t4,1
    80004a60:	e9dff06f          	j	800048fc <__memset+0x84>
    80004a64:	00000e93          	li	t4,0
    80004a68:	e95ff06f          	j	800048fc <__memset+0x84>
    80004a6c:	00000793          	li	a5,0
    80004a70:	ef9ff06f          	j	80004968 <__memset+0xf0>
    80004a74:	00200e93          	li	t4,2
    80004a78:	e85ff06f          	j	800048fc <__memset+0x84>
    80004a7c:	00400e93          	li	t4,4
    80004a80:	e7dff06f          	j	800048fc <__memset+0x84>
    80004a84:	00500e93          	li	t4,5
    80004a88:	e75ff06f          	j	800048fc <__memset+0x84>
    80004a8c:	00600e93          	li	t4,6
    80004a90:	e6dff06f          	j	800048fc <__memset+0x84>

0000000080004a94 <__memmove>:
    80004a94:	ff010113          	addi	sp,sp,-16
    80004a98:	00813423          	sd	s0,8(sp)
    80004a9c:	01010413          	addi	s0,sp,16
    80004aa0:	0e060863          	beqz	a2,80004b90 <__memmove+0xfc>
    80004aa4:	fff6069b          	addiw	a3,a2,-1
    80004aa8:	0006881b          	sext.w	a6,a3
    80004aac:	0ea5e863          	bltu	a1,a0,80004b9c <__memmove+0x108>
    80004ab0:	00758713          	addi	a4,a1,7
    80004ab4:	00a5e7b3          	or	a5,a1,a0
    80004ab8:	40a70733          	sub	a4,a4,a0
    80004abc:	0077f793          	andi	a5,a5,7
    80004ac0:	00f73713          	sltiu	a4,a4,15
    80004ac4:	00174713          	xori	a4,a4,1
    80004ac8:	0017b793          	seqz	a5,a5
    80004acc:	00e7f7b3          	and	a5,a5,a4
    80004ad0:	10078863          	beqz	a5,80004be0 <__memmove+0x14c>
    80004ad4:	00900793          	li	a5,9
    80004ad8:	1107f463          	bgeu	a5,a6,80004be0 <__memmove+0x14c>
    80004adc:	0036581b          	srliw	a6,a2,0x3
    80004ae0:	fff8081b          	addiw	a6,a6,-1
    80004ae4:	02081813          	slli	a6,a6,0x20
    80004ae8:	01d85893          	srli	a7,a6,0x1d
    80004aec:	00858813          	addi	a6,a1,8
    80004af0:	00058793          	mv	a5,a1
    80004af4:	00050713          	mv	a4,a0
    80004af8:	01088833          	add	a6,a7,a6
    80004afc:	0007b883          	ld	a7,0(a5)
    80004b00:	00878793          	addi	a5,a5,8
    80004b04:	00870713          	addi	a4,a4,8
    80004b08:	ff173c23          	sd	a7,-8(a4)
    80004b0c:	ff0798e3          	bne	a5,a6,80004afc <__memmove+0x68>
    80004b10:	ff867713          	andi	a4,a2,-8
    80004b14:	02071793          	slli	a5,a4,0x20
    80004b18:	0207d793          	srli	a5,a5,0x20
    80004b1c:	00f585b3          	add	a1,a1,a5
    80004b20:	40e686bb          	subw	a3,a3,a4
    80004b24:	00f507b3          	add	a5,a0,a5
    80004b28:	06e60463          	beq	a2,a4,80004b90 <__memmove+0xfc>
    80004b2c:	0005c703          	lbu	a4,0(a1)
    80004b30:	00e78023          	sb	a4,0(a5)
    80004b34:	04068e63          	beqz	a3,80004b90 <__memmove+0xfc>
    80004b38:	0015c603          	lbu	a2,1(a1)
    80004b3c:	00100713          	li	a4,1
    80004b40:	00c780a3          	sb	a2,1(a5)
    80004b44:	04e68663          	beq	a3,a4,80004b90 <__memmove+0xfc>
    80004b48:	0025c603          	lbu	a2,2(a1)
    80004b4c:	00200713          	li	a4,2
    80004b50:	00c78123          	sb	a2,2(a5)
    80004b54:	02e68e63          	beq	a3,a4,80004b90 <__memmove+0xfc>
    80004b58:	0035c603          	lbu	a2,3(a1)
    80004b5c:	00300713          	li	a4,3
    80004b60:	00c781a3          	sb	a2,3(a5)
    80004b64:	02e68663          	beq	a3,a4,80004b90 <__memmove+0xfc>
    80004b68:	0045c603          	lbu	a2,4(a1)
    80004b6c:	00400713          	li	a4,4
    80004b70:	00c78223          	sb	a2,4(a5)
    80004b74:	00e68e63          	beq	a3,a4,80004b90 <__memmove+0xfc>
    80004b78:	0055c603          	lbu	a2,5(a1)
    80004b7c:	00500713          	li	a4,5
    80004b80:	00c782a3          	sb	a2,5(a5)
    80004b84:	00e68663          	beq	a3,a4,80004b90 <__memmove+0xfc>
    80004b88:	0065c703          	lbu	a4,6(a1)
    80004b8c:	00e78323          	sb	a4,6(a5)
    80004b90:	00813403          	ld	s0,8(sp)
    80004b94:	01010113          	addi	sp,sp,16
    80004b98:	00008067          	ret
    80004b9c:	02061713          	slli	a4,a2,0x20
    80004ba0:	02075713          	srli	a4,a4,0x20
    80004ba4:	00e587b3          	add	a5,a1,a4
    80004ba8:	f0f574e3          	bgeu	a0,a5,80004ab0 <__memmove+0x1c>
    80004bac:	02069613          	slli	a2,a3,0x20
    80004bb0:	02065613          	srli	a2,a2,0x20
    80004bb4:	fff64613          	not	a2,a2
    80004bb8:	00e50733          	add	a4,a0,a4
    80004bbc:	00c78633          	add	a2,a5,a2
    80004bc0:	fff7c683          	lbu	a3,-1(a5)
    80004bc4:	fff78793          	addi	a5,a5,-1
    80004bc8:	fff70713          	addi	a4,a4,-1
    80004bcc:	00d70023          	sb	a3,0(a4)
    80004bd0:	fec798e3          	bne	a5,a2,80004bc0 <__memmove+0x12c>
    80004bd4:	00813403          	ld	s0,8(sp)
    80004bd8:	01010113          	addi	sp,sp,16
    80004bdc:	00008067          	ret
    80004be0:	02069713          	slli	a4,a3,0x20
    80004be4:	02075713          	srli	a4,a4,0x20
    80004be8:	00170713          	addi	a4,a4,1
    80004bec:	00e50733          	add	a4,a0,a4
    80004bf0:	00050793          	mv	a5,a0
    80004bf4:	0005c683          	lbu	a3,0(a1)
    80004bf8:	00178793          	addi	a5,a5,1
    80004bfc:	00158593          	addi	a1,a1,1
    80004c00:	fed78fa3          	sb	a3,-1(a5)
    80004c04:	fee798e3          	bne	a5,a4,80004bf4 <__memmove+0x160>
    80004c08:	f89ff06f          	j	80004b90 <__memmove+0xfc>

0000000080004c0c <__putc>:
    80004c0c:	fe010113          	addi	sp,sp,-32
    80004c10:	00813823          	sd	s0,16(sp)
    80004c14:	00113c23          	sd	ra,24(sp)
    80004c18:	02010413          	addi	s0,sp,32
    80004c1c:	00050793          	mv	a5,a0
    80004c20:	fef40593          	addi	a1,s0,-17
    80004c24:	00100613          	li	a2,1
    80004c28:	00000513          	li	a0,0
    80004c2c:	fef407a3          	sb	a5,-17(s0)
    80004c30:	fffff097          	auipc	ra,0xfffff
    80004c34:	b3c080e7          	jalr	-1220(ra) # 8000376c <console_write>
    80004c38:	01813083          	ld	ra,24(sp)
    80004c3c:	01013403          	ld	s0,16(sp)
    80004c40:	02010113          	addi	sp,sp,32
    80004c44:	00008067          	ret

0000000080004c48 <__getc>:
    80004c48:	fe010113          	addi	sp,sp,-32
    80004c4c:	00813823          	sd	s0,16(sp)
    80004c50:	00113c23          	sd	ra,24(sp)
    80004c54:	02010413          	addi	s0,sp,32
    80004c58:	fe840593          	addi	a1,s0,-24
    80004c5c:	00100613          	li	a2,1
    80004c60:	00000513          	li	a0,0
    80004c64:	fffff097          	auipc	ra,0xfffff
    80004c68:	ae8080e7          	jalr	-1304(ra) # 8000374c <console_read>
    80004c6c:	fe844503          	lbu	a0,-24(s0)
    80004c70:	01813083          	ld	ra,24(sp)
    80004c74:	01013403          	ld	s0,16(sp)
    80004c78:	02010113          	addi	sp,sp,32
    80004c7c:	00008067          	ret

0000000080004c80 <console_handler>:
    80004c80:	fe010113          	addi	sp,sp,-32
    80004c84:	00813823          	sd	s0,16(sp)
    80004c88:	00113c23          	sd	ra,24(sp)
    80004c8c:	00913423          	sd	s1,8(sp)
    80004c90:	02010413          	addi	s0,sp,32
    80004c94:	14202773          	csrr	a4,scause
    80004c98:	100027f3          	csrr	a5,sstatus
    80004c9c:	0027f793          	andi	a5,a5,2
    80004ca0:	06079e63          	bnez	a5,80004d1c <console_handler+0x9c>
    80004ca4:	00074c63          	bltz	a4,80004cbc <console_handler+0x3c>
    80004ca8:	01813083          	ld	ra,24(sp)
    80004cac:	01013403          	ld	s0,16(sp)
    80004cb0:	00813483          	ld	s1,8(sp)
    80004cb4:	02010113          	addi	sp,sp,32
    80004cb8:	00008067          	ret
    80004cbc:	0ff77713          	andi	a4,a4,255
    80004cc0:	00900793          	li	a5,9
    80004cc4:	fef712e3          	bne	a4,a5,80004ca8 <console_handler+0x28>
    80004cc8:	ffffe097          	auipc	ra,0xffffe
    80004ccc:	6dc080e7          	jalr	1756(ra) # 800033a4 <plic_claim>
    80004cd0:	00a00793          	li	a5,10
    80004cd4:	00050493          	mv	s1,a0
    80004cd8:	02f50c63          	beq	a0,a5,80004d10 <console_handler+0x90>
    80004cdc:	fc0506e3          	beqz	a0,80004ca8 <console_handler+0x28>
    80004ce0:	00050593          	mv	a1,a0
    80004ce4:	00000517          	auipc	a0,0x0
    80004ce8:	56c50513          	addi	a0,a0,1388 # 80005250 <CONSOLE_STATUS+0x240>
    80004cec:	fffff097          	auipc	ra,0xfffff
    80004cf0:	afc080e7          	jalr	-1284(ra) # 800037e8 <__printf>
    80004cf4:	01013403          	ld	s0,16(sp)
    80004cf8:	01813083          	ld	ra,24(sp)
    80004cfc:	00048513          	mv	a0,s1
    80004d00:	00813483          	ld	s1,8(sp)
    80004d04:	02010113          	addi	sp,sp,32
    80004d08:	ffffe317          	auipc	t1,0xffffe
    80004d0c:	6d430067          	jr	1748(t1) # 800033dc <plic_complete>
    80004d10:	fffff097          	auipc	ra,0xfffff
    80004d14:	3e0080e7          	jalr	992(ra) # 800040f0 <uartintr>
    80004d18:	fddff06f          	j	80004cf4 <console_handler+0x74>
    80004d1c:	00000517          	auipc	a0,0x0
    80004d20:	63450513          	addi	a0,a0,1588 # 80005350 <digits+0x78>
    80004d24:	fffff097          	auipc	ra,0xfffff
    80004d28:	a68080e7          	jalr	-1432(ra) # 8000378c <panic>
	...
