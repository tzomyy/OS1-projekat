
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	44013103          	ld	sp,1088(sp) # 80007440 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	74c030ef          	jal	ra,80003768 <start>

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
    SEM_SIGNAL = 0x24,
    GETC = 0x41,
    PUTC = 0x42
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
                return;
        }
        Riscv::w_sepc(sepc);
        Riscv::w_sstatus(status);
    }
    else if (scause == 0x8000000000000001UL)
    80001298:	fff00793          	li	a5,-1
    8000129c:	03f79793          	slli	a5,a5,0x3f
    800012a0:	00178793          	addi	a5,a5,1
    800012a4:	20f70463          	beq	a4,a5,800014ac <trapHandler+0x238>
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
    800012bc:	5e8080e7          	jalr	1512(ra) # 800058a0 <console_handler>
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
    800012f0:	04200713          	li	a4,66
    800012f4:	1af76063          	bltu	a4,a5,80001494 <trapHandler+0x220>
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
    8000131c:	ab4080e7          	jalr	-1356(ra) # 80002dcc <_ZN15MemoryAllocator11getInstanceEv>
    80001320:	00048513          	mv	a0,s1
    80001324:	00002097          	auipc	ra,0x2
    80001328:	968080e7          	jalr	-1688(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
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
    80001360:	b04080e7          	jalr	-1276(ra) # 80002e60 <_ZN15MemoryAllocator8mem_freeEPv>
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
    80001384:	694080e7          	jalr	1684(ra) # 80001a14 <_ZN7_thread12createThreadEPFvPvES0_>
    80001388:	00a4b023          	sd	a0,0(s1)
                (*handle)->start();
    8000138c:	00000097          	auipc	ra,0x0
    80001390:	5b4080e7          	jalr	1460(ra) # 80001940 <_ZN7_thread5startEv>
                if (!handle) { ret = -1;}
    80001394:	00048863          	beqz	s1,800013a4 <trapHandler+0x130>
                int ret = 0;
    80001398:	00000793          	li	a5,0
                __asm__ volatile("mv a0, %0" : :"r"(ret));
    8000139c:	00078513          	mv	a0,a5
                break;
    800013a0:	f95ff06f          	j	80001334 <trapHandler+0xc0>
                if (!handle) { ret = -1;}
    800013a4:	fff00793          	li	a5,-1
    800013a8:	ff5ff06f          	j	8000139c <trapHandler+0x128>
                _thread::threadExit();
    800013ac:	00000097          	auipc	ra,0x0
    800013b0:	458080e7          	jalr	1112(ra) # 80001804 <_ZN7_thread10threadExitEv>
                break;}
    800013b4:	f81ff06f          	j	80001334 <trapHandler+0xc0>
                _thread::dispatch();
    800013b8:	00000097          	auipc	ra,0x0
    800013bc:	484080e7          	jalr	1156(ra) # 8000183c <_ZN7_thread8dispatchEv>
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
    800013e0:	638080e7          	jalr	1592(ra) # 80001a14 <_ZN7_thread12createThreadEPFvPvES0_>
    800013e4:	00a4b023          	sd	a0,0(s1)
                if (!handle) {ret = -1;}
    800013e8:	00048863          	beqz	s1,800013f8 <trapHandler+0x184>
                int ret = 0;
    800013ec:	00000793          	li	a5,0
                __asm__ volatile("mv a0, %0" : :"r"(ret));
    800013f0:	00078513          	mv	a0,a5
                break;}
    800013f4:	f41ff06f          	j	80001334 <trapHandler+0xc0>
                if (!handle) {ret = -1;}
    800013f8:	fff00793          	li	a5,-1
    800013fc:	ff5ff06f          	j	800013f0 <trapHandler+0x17c>
                __asm__ volatile("mv %0, a1": "=r"(handle));
    80001400:	00058513          	mv	a0,a1
                handle->start();
    80001404:	00000097          	auipc	ra,0x0
    80001408:	53c080e7          	jalr	1340(ra) # 80001940 <_ZN7_thread5startEv>
                break;}
    8000140c:	f29ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(handle));
    80001410:	00058493          	mv	s1,a1
                __asm__ volatile("mv %0, a2": "=r"(init));
    80001414:	00060513          	mv	a0,a2
                *handle = _sem::semOpen(init);
    80001418:	0005051b          	sext.w	a0,a0
    8000141c:	00001097          	auipc	ra,0x1
    80001420:	608080e7          	jalr	1544(ra) # 80002a24 <_ZN4_sem7semOpenEj>
    80001424:	00a4b023          	sd	a0,0(s1)
                __asm__ volatile("mv a0, %0" : :"r"(handle));
    80001428:	00048513          	mv	a0,s1
                break;
    8000142c:	f09ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(handle));
    80001430:	00058513          	mv	a0,a1
                int ret = _sem::semClose(handle);
    80001434:	00001097          	auipc	ra,0x1
    80001438:	75c080e7          	jalr	1884(ra) # 80002b90 <_ZN4_sem8semCloseEPS_>
                __asm__ volatile("mv a0, %0" : :"r"(ret));
    8000143c:	00050513          	mv	a0,a0
                break;
    80001440:	ef5ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(id));
    80001444:	00058513          	mv	a0,a1
                int ret = _sem::semWait(id);
    80001448:	00001097          	auipc	ra,0x1
    8000144c:	6bc080e7          	jalr	1724(ra) # 80002b04 <_ZN4_sem7semWaitEPS_>
                __asm__ volatile("mv a0, %0" : :"r"(ret));
    80001450:	00050513          	mv	a0,a0
                break;
    80001454:	ee1ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(id));
    80001458:	00058513          	mv	a0,a1
                int ret = _sem::semSignal(id);
    8000145c:	00001097          	auipc	ra,0x1
    80001460:	798080e7          	jalr	1944(ra) # 80002bf4 <_ZN4_sem9semSignalEPS_>
                __asm__ volatile("mv a0, %0" : :"r"(ret));
    80001464:	00050513          	mv	a0,a0
                break;
    80001468:	ecdff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(c));
    8000146c:	00058513          	mv	a0,a1
                __putc(c);
    80001470:	0ff57513          	andi	a0,a0,255
    80001474:	00004097          	auipc	ra,0x4
    80001478:	3b8080e7          	jalr	952(ra) # 8000582c <__putc>
                break;
    8000147c:	eb9ff06f          	j	80001334 <trapHandler+0xc0>
                char c = __getc();
    80001480:	00004097          	auipc	ra,0x4
    80001484:	3e8080e7          	jalr	1000(ra) # 80005868 <__getc>
                __asm__ volatile("sd a0, 10*8(fp)");
    80001488:	04a43823          	sd	a0,80(s0)
                __asm__ volatile("mv a0, %0" : : "r"(c));
    8000148c:	00050513          	mv	a0,a0
                break;
    80001490:	ea5ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("csrw sepc, %0" : : "r"(&userMain));
    80001494:	00006797          	auipc	a5,0x6
    80001498:	fb47b783          	ld	a5,-76(a5) # 80007448 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000149c:	14179073          	csrw	sepc,a5
    __asm__ volatile ("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800014a0:	10000793          	li	a5,256
    800014a4:	1007b073          	csrc	sstatus,a5
                return;
    800014a8:	e9dff06f          	j	80001344 <trapHandler+0xd0>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800014ac:	00200793          	li	a5,2
    800014b0:	1447b073          	csrc	sip,a5
}
    800014b4:	e91ff06f          	j	80001344 <trapHandler+0xd0>

00000000800014b8 <_Z9mem_allocm>:

void* mem_alloc(size_t size){
    800014b8:	ff010113          	addi	sp,sp,-16
    800014bc:	00113423          	sd	ra,8(sp)
    800014c0:	00813023          	sd	s0,0(sp)
    800014c4:	01010413          	addi	s0,sp,16
    //upis broja blokova
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
    800014c8:	01850513          	addi	a0,a0,24
    800014cc:	00655593          	srli	a1,a0,0x6
                         + ((size+sizeof(MemoryAllocator::FullMem))%MEM_BLOCK_SIZE?1:0);
    800014d0:	03f57513          	andi	a0,a0,63
    800014d4:	00050463          	beqz	a0,800014dc <_Z9mem_allocm+0x24>
    800014d8:	00100513          	li	a0,1

    abi_invoker(MEM_ALLOC, numOfBlocks);
    800014dc:	00a585b3          	add	a1,a1,a0
    800014e0:	00100513          	li	a0,1
    800014e4:	00000097          	auipc	ra,0x0
    800014e8:	d58080e7          	jalr	-680(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    void* p = nullptr;
    __asm__ volatile("mv a0, %0": "=r"(p));
    800014ec:	00050513          	mv	a0,a0
    return p;

}
    800014f0:	00813083          	ld	ra,8(sp)
    800014f4:	00013403          	ld	s0,0(sp)
    800014f8:	01010113          	addi	sp,sp,16
    800014fc:	00008067          	ret

0000000080001500 <_Z8mem_freePv>:

int mem_free(void *p){
    80001500:	ff010113          	addi	sp,sp,-16
    80001504:	00113423          	sd	ra,8(sp)
    80001508:	00813023          	sd	s0,0(sp)
    8000150c:	01010413          	addi	s0,sp,16
    80001510:	00050593          	mv	a1,a0
    abi_invoker(MEM_FREE, p);
    80001514:	00200513          	li	a0,2
    80001518:	00000097          	auipc	ra,0x0
    8000151c:	d24080e7          	jalr	-732(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    80001520:	00050513          	mv	a0,a0
    return ret;
}
    80001524:	0005051b          	sext.w	a0,a0
    80001528:	00813083          	ld	ra,8(sp)
    8000152c:	00013403          	ld	s0,0(sp)
    80001530:	01010113          	addi	sp,sp,16
    80001534:	00008067          	ret

0000000080001538 <_Z11thread_exitv>:

int thread_exit(){
    80001538:	ff010113          	addi	sp,sp,-16
    8000153c:	00113423          	sd	ra,8(sp)
    80001540:	00813023          	sd	s0,0(sp)
    80001544:	01010413          	addi	s0,sp,16
    //__asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_EXIT);
    80001548:	01200513          	li	a0,18
    8000154c:	00000097          	auipc	ra,0x0
    80001550:	cf0080e7          	jalr	-784(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    80001554:	00050513          	mv	a0,a0
    return ret;
}
    80001558:	0005051b          	sext.w	a0,a0
    8000155c:	00813083          	ld	ra,8(sp)
    80001560:	00013403          	ld	s0,0(sp)
    80001564:	01010113          	addi	sp,sp,16
    80001568:	00008067          	ret

000000008000156c <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    8000156c:	fd010113          	addi	sp,sp,-48
    80001570:	02113423          	sd	ra,40(sp)
    80001574:	02813023          	sd	s0,32(sp)
    80001578:	00913c23          	sd	s1,24(sp)
    8000157c:	01213823          	sd	s2,16(sp)
    80001580:	01313423          	sd	s3,8(sp)
    80001584:	03010413          	addi	s0,sp,48
    80001588:	00050493          	mv	s1,a0
    8000158c:	00058913          	mv	s2,a1
    80001590:	00060993          	mv	s3,a2
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80001594:	04100513          	li	a0,65
    80001598:	00001097          	auipc	ra,0x1
    8000159c:	6f4080e7          	jalr	1780(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
    if (!stack) return -1;
    800015a0:	04050263          	beqz	a0,800015e4 <_Z13thread_createPP7_threadPFvPvES2_+0x78>
    800015a4:	00050713          	mv	a4,a0

    abi_invoker(THREAD_CREATE, handle, start_routine, arg, stack);
    800015a8:	00098693          	mv	a3,s3
    800015ac:	00090613          	mv	a2,s2
    800015b0:	00048593          	mv	a1,s1
    800015b4:	01100513          	li	a0,17
    800015b8:	00000097          	auipc	ra,0x0
    800015bc:	c84080e7          	jalr	-892(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    800015c0:	00050513          	mv	a0,a0
    800015c4:	0005051b          	sext.w	a0,a0
    return ret;
}
    800015c8:	02813083          	ld	ra,40(sp)
    800015cc:	02013403          	ld	s0,32(sp)
    800015d0:	01813483          	ld	s1,24(sp)
    800015d4:	01013903          	ld	s2,16(sp)
    800015d8:	00813983          	ld	s3,8(sp)
    800015dc:	03010113          	addi	sp,sp,48
    800015e0:	00008067          	ret
    if (!stack) return -1;
    800015e4:	fff00513          	li	a0,-1
    800015e8:	fe1ff06f          	j	800015c8 <_Z13thread_createPP7_threadPFvPvES2_+0x5c>

00000000800015ec <_Z15thread_dispatchv>:

void thread_dispatch(){
    800015ec:	ff010113          	addi	sp,sp,-16
    800015f0:	00113423          	sd	ra,8(sp)
    800015f4:	00813023          	sd	s0,0(sp)
    800015f8:	01010413          	addi	s0,sp,16
    abi_invoker(THREAD_DISPATCH);
    800015fc:	01300513          	li	a0,19
    80001600:	00000097          	auipc	ra,0x0
    80001604:	c3c080e7          	jalr	-964(ra) # 8000123c <_Z11abi_invokeriz>
}
    80001608:	00813083          	ld	ra,8(sp)
    8000160c:	00013403          	ld	s0,0(sp)
    80001610:	01010113          	addi	sp,sp,16
    80001614:	00008067          	ret

0000000080001618 <_Z18thread_create_onlyPP7_threadPFvPvES2_>:

void thread_create_only(thread_t* handle,
                        void(*start_routine)(void*),
                        void* arg){
    80001618:	fd010113          	addi	sp,sp,-48
    8000161c:	02113423          	sd	ra,40(sp)
    80001620:	02813023          	sd	s0,32(sp)
    80001624:	00913c23          	sd	s1,24(sp)
    80001628:	01213823          	sd	s2,16(sp)
    8000162c:	01313423          	sd	s3,8(sp)
    80001630:	03010413          	addi	s0,sp,48
    80001634:	00050493          	mv	s1,a0
    80001638:	00058913          	mv	s2,a1
    8000163c:	00060993          	mv	s3,a2
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80001640:	04100513          	li	a0,65
    80001644:	00001097          	auipc	ra,0x1
    80001648:	648080e7          	jalr	1608(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
    if (!stack) return ;
    8000164c:	02050263          	beqz	a0,80001670 <_Z18thread_create_onlyPP7_threadPFvPvES2_+0x58>
    80001650:	00050713          	mv	a4,a0

    abi_invoker(THREAD_CREATE_ONLY, handle, start_routine, arg, stack);
    80001654:	00098693          	mv	a3,s3
    80001658:	00090613          	mv	a2,s2
    8000165c:	00048593          	mv	a1,s1
    80001660:	01400513          	li	a0,20
    80001664:	00000097          	auipc	ra,0x0
    80001668:	bd8080e7          	jalr	-1064(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    8000166c:	00078513          	mv	a0,a5
}
    80001670:	02813083          	ld	ra,40(sp)
    80001674:	02013403          	ld	s0,32(sp)
    80001678:	01813483          	ld	s1,24(sp)
    8000167c:	01013903          	ld	s2,16(sp)
    80001680:	00813983          	ld	s3,8(sp)
    80001684:	03010113          	addi	sp,sp,48
    80001688:	00008067          	ret

000000008000168c <_Z12thread_startP7_thread>:

void thread_start(thread_t handle){
    8000168c:	ff010113          	addi	sp,sp,-16
    80001690:	00113423          	sd	ra,8(sp)
    80001694:	00813023          	sd	s0,0(sp)
    80001698:	01010413          	addi	s0,sp,16
    8000169c:	00050593          	mv	a1,a0
    abi_invoker(THREAD_START, handle);
    800016a0:	01500513          	li	a0,21
    800016a4:	00000097          	auipc	ra,0x0
    800016a8:	b98080e7          	jalr	-1128(ra) # 8000123c <_Z11abi_invokeriz>
}
    800016ac:	00813083          	ld	ra,8(sp)
    800016b0:	00013403          	ld	s0,0(sp)
    800016b4:	01010113          	addi	sp,sp,16
    800016b8:	00008067          	ret

00000000800016bc <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned init){
    800016bc:	ff010113          	addi	sp,sp,-16
    800016c0:	00113423          	sd	ra,8(sp)
    800016c4:	00813023          	sd	s0,0(sp)
    800016c8:	01010413          	addi	s0,sp,16
    800016cc:	00058613          	mv	a2,a1
    abi_invoker(SEM_OPEN, handle, init);
    800016d0:	00050593          	mv	a1,a0
    800016d4:	02100513          	li	a0,33
    800016d8:	00000097          	auipc	ra,0x0
    800016dc:	b64080e7          	jalr	-1180(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    800016e0:	00050513          	mv	a0,a0
    return ret;
}
    800016e4:	0005051b          	sext.w	a0,a0
    800016e8:	00813083          	ld	ra,8(sp)
    800016ec:	00013403          	ld	s0,0(sp)
    800016f0:	01010113          	addi	sp,sp,16
    800016f4:	00008067          	ret

00000000800016f8 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle){
    800016f8:	ff010113          	addi	sp,sp,-16
    800016fc:	00113423          	sd	ra,8(sp)
    80001700:	00813023          	sd	s0,0(sp)
    80001704:	01010413          	addi	s0,sp,16
    80001708:	00050593          	mv	a1,a0
    abi_invoker(SEM_CLOSE, handle);
    8000170c:	02200513          	li	a0,34
    80001710:	00000097          	auipc	ra,0x0
    80001714:	b2c080e7          	jalr	-1236(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    80001718:	00050513          	mv	a0,a0
    return ret;
}
    8000171c:	0005051b          	sext.w	a0,a0
    80001720:	00813083          	ld	ra,8(sp)
    80001724:	00013403          	ld	s0,0(sp)
    80001728:	01010113          	addi	sp,sp,16
    8000172c:	00008067          	ret

0000000080001730 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id){
    80001730:	ff010113          	addi	sp,sp,-16
    80001734:	00113423          	sd	ra,8(sp)
    80001738:	00813023          	sd	s0,0(sp)
    8000173c:	01010413          	addi	s0,sp,16
    80001740:	00050593          	mv	a1,a0
    abi_invoker(SEM_WAIT, id);
    80001744:	02300513          	li	a0,35
    80001748:	00000097          	auipc	ra,0x0
    8000174c:	af4080e7          	jalr	-1292(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    80001750:	00050513          	mv	a0,a0
    return ret;
}
    80001754:	0005051b          	sext.w	a0,a0
    80001758:	00813083          	ld	ra,8(sp)
    8000175c:	00013403          	ld	s0,0(sp)
    80001760:	01010113          	addi	sp,sp,16
    80001764:	00008067          	ret

0000000080001768 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id){
    80001768:	ff010113          	addi	sp,sp,-16
    8000176c:	00113423          	sd	ra,8(sp)
    80001770:	00813023          	sd	s0,0(sp)
    80001774:	01010413          	addi	s0,sp,16
    80001778:	00050593          	mv	a1,a0
    abi_invoker(SEM_SIGNAL, id);
    8000177c:	02400513          	li	a0,36
    80001780:	00000097          	auipc	ra,0x0
    80001784:	abc080e7          	jalr	-1348(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    80001788:	00050513          	mv	a0,a0
    return ret;
}
    8000178c:	0005051b          	sext.w	a0,a0
    80001790:	00813083          	ld	ra,8(sp)
    80001794:	00013403          	ld	s0,0(sp)
    80001798:	01010113          	addi	sp,sp,16
    8000179c:	00008067          	ret

00000000800017a0 <_Z4putcc>:

void putc(char c){
    800017a0:	ff010113          	addi	sp,sp,-16
    800017a4:	00113423          	sd	ra,8(sp)
    800017a8:	00813023          	sd	s0,0(sp)
    800017ac:	01010413          	addi	s0,sp,16
    800017b0:	00050593          	mv	a1,a0
    abi_invoker(PUTC, c);
    800017b4:	04200513          	li	a0,66
    800017b8:	00000097          	auipc	ra,0x0
    800017bc:	a84080e7          	jalr	-1404(ra) # 8000123c <_Z11abi_invokeriz>
}
    800017c0:	00813083          	ld	ra,8(sp)
    800017c4:	00013403          	ld	s0,0(sp)
    800017c8:	01010113          	addi	sp,sp,16
    800017cc:	00008067          	ret

00000000800017d0 <_Z4getcv>:

char getc(){
    800017d0:	ff010113          	addi	sp,sp,-16
    800017d4:	00113423          	sd	ra,8(sp)
    800017d8:	00813023          	sd	s0,0(sp)
    800017dc:	01010413          	addi	s0,sp,16
    abi_invoker(GETC);
    800017e0:	04100513          	li	a0,65
    800017e4:	00000097          	auipc	ra,0x0
    800017e8:	a58080e7          	jalr	-1448(ra) # 8000123c <_Z11abi_invokeriz>
    char ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800017ec:	00050513          	mv	a0,a0
    return ret;
    800017f0:	0ff57513          	andi	a0,a0,255
    800017f4:	00813083          	ld	ra,8(sp)
    800017f8:	00013403          	ld	s0,0(sp)
    800017fc:	01010113          	addi	sp,sp,16
    80001800:	00008067          	ret

0000000080001804 <_ZN7_thread10threadExitEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

int _thread::threadExit(){
    80001804:	ff010113          	addi	sp,sp,-16
    80001808:	00813423          	sd	s0,8(sp)
    8000180c:	01010413          	addi	s0,sp,16
    if (_thread::running == nullptr ) return -1;
    80001810:	00006797          	auipc	a5,0x6
    80001814:	ca07b783          	ld	a5,-864(a5) # 800074b0 <_ZN7_thread7runningE>
    80001818:	00078e63          	beqz	a5,80001834 <_ZN7_thread10threadExitEv+0x30>
public:
    ~_thread() { MemoryAllocator::mem_free((char*)stack-STACK_SIZE); }

    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }
    8000181c:	00100713          	li	a4,1
    80001820:	00e78c23          	sb	a4,24(a5)
    _thread::running->setFinished(true);
    return 0;
    80001824:	00000513          	li	a0,0
}
    80001828:	00813403          	ld	s0,8(sp)
    8000182c:	01010113          	addi	sp,sp,16
    80001830:	00008067          	ret
    if (_thread::running == nullptr ) return -1;
    80001834:	fff00513          	li	a0,-1
    80001838:	ff1ff06f          	j	80001828 <_ZN7_thread10threadExitEv+0x24>

000000008000183c <_ZN7_thread8dispatchEv>:
    //thread_dispatch();

}

void _thread::dispatch()
{
    8000183c:	fe010113          	addi	sp,sp,-32
    80001840:	00113c23          	sd	ra,24(sp)
    80001844:	00813823          	sd	s0,16(sp)
    80001848:	00913423          	sd	s1,8(sp)
    8000184c:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001850:	00006497          	auipc	s1,0x6
    80001854:	c604b483          	ld	s1,-928(s1) # 800074b0 <_ZN7_thread7runningE>
    bool isFinished() const { return finished; }
    80001858:	0184c783          	lbu	a5,24(s1)
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    8000185c:	00079663          	bnez	a5,80001868 <_ZN7_thread8dispatchEv+0x2c>

    bool isBlocked() const { return blocked; }
    80001860:	0194c783          	lbu	a5,25(s1)
    80001864:	02078c63          	beqz	a5,8000189c <_ZN7_thread8dispatchEv+0x60>
    running = Scheduler::get();
    80001868:	00001097          	auipc	ra,0x1
    8000186c:	aac080e7          	jalr	-1364(ra) # 80002314 <_ZN9Scheduler3getEv>
    80001870:	00006797          	auipc	a5,0x6
    80001874:	c4a7b023          	sd	a0,-960(a5) # 800074b0 <_ZN7_thread7runningE>
        _thread* tmp = running;
        running = Scheduler::get();
        Scheduler::put(tmp);
    }*/

    _thread::contextSwitch(&old->context, &running->context);
    80001878:	02850593          	addi	a1,a0,40
    8000187c:	02848513          	addi	a0,s1,40
    80001880:	00000097          	auipc	ra,0x0
    80001884:	9a8080e7          	jalr	-1624(ra) # 80001228 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    80001888:	01813083          	ld	ra,24(sp)
    8000188c:	01013403          	ld	s0,16(sp)
    80001890:	00813483          	ld	s1,8(sp)
    80001894:	02010113          	addi	sp,sp,32
    80001898:	00008067          	ret
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    8000189c:	00048513          	mv	a0,s1
    800018a0:	00001097          	auipc	ra,0x1
    800018a4:	adc080e7          	jalr	-1316(ra) # 8000237c <_ZN9Scheduler3putEP7_thread>
    800018a8:	fc1ff06f          	j	80001868 <_ZN7_thread8dispatchEv+0x2c>

00000000800018ac <_ZN7_thread5yieldEv>:
{
    800018ac:	ff010113          	addi	sp,sp,-16
    800018b0:	00113423          	sd	ra,8(sp)
    800018b4:	00813023          	sd	s0,0(sp)
    800018b8:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    800018bc:	00000097          	auipc	ra,0x0
    800018c0:	874080e7          	jalr	-1932(ra) # 80001130 <_ZN5Riscv13pushRegistersEv>
    _thread::dispatch();
    800018c4:	00000097          	auipc	ra,0x0
    800018c8:	f78080e7          	jalr	-136(ra) # 8000183c <_ZN7_thread8dispatchEv>
    Riscv::popRegisters();
    800018cc:	00000097          	auipc	ra,0x0
    800018d0:	8e0080e7          	jalr	-1824(ra) # 800011ac <_ZN5Riscv12popRegistersEv>
}
    800018d4:	00813083          	ld	ra,8(sp)
    800018d8:	00013403          	ld	s0,0(sp)
    800018dc:	01010113          	addi	sp,sp,16
    800018e0:	00008067          	ret

00000000800018e4 <_ZN7_thread13threadWrapperEv>:
    if (running == nullptr) running = this;
    if ( this->body != nullptr) {Scheduler::put(this);}
}

void _thread::threadWrapper()
{
    800018e4:	fe010113          	addi	sp,sp,-32
    800018e8:	00113c23          	sd	ra,24(sp)
    800018ec:	00813823          	sd	s0,16(sp)
    800018f0:	00913423          	sd	s1,8(sp)
    800018f4:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    800018f8:	00001097          	auipc	ra,0x1
    800018fc:	104080e7          	jalr	260(ra) # 800029fc <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    80001900:	00006497          	auipc	s1,0x6
    80001904:	bb048493          	addi	s1,s1,-1104 # 800074b0 <_ZN7_thread7runningE>
    80001908:	0004b783          	ld	a5,0(s1)
    8000190c:	0007b703          	ld	a4,0(a5)
    80001910:	0207b503          	ld	a0,32(a5)
    80001914:	000700e7          	jalr	a4
    running->setFinished(true);
    80001918:	0004b783          	ld	a5,0(s1)
    void setFinished(bool value) { finished = value; }
    8000191c:	00100713          	li	a4,1
    80001920:	00e78c23          	sb	a4,24(a5)
    _thread::yield();
    80001924:	00000097          	auipc	ra,0x0
    80001928:	f88080e7          	jalr	-120(ra) # 800018ac <_ZN7_thread5yieldEv>
}
    8000192c:	01813083          	ld	ra,24(sp)
    80001930:	01013403          	ld	s0,16(sp)
    80001934:	00813483          	ld	s1,8(sp)
    80001938:	02010113          	addi	sp,sp,32
    8000193c:	00008067          	ret

0000000080001940 <_ZN7_thread5startEv>:
    if (running == nullptr) running = this;
    80001940:	00006797          	auipc	a5,0x6
    80001944:	b707b783          	ld	a5,-1168(a5) # 800074b0 <_ZN7_thread7runningE>
    80001948:	02078a63          	beqz	a5,8000197c <_ZN7_thread5startEv+0x3c>
    if ( this->body != nullptr) {Scheduler::put(this);}
    8000194c:	00053783          	ld	a5,0(a0)
    80001950:	02078c63          	beqz	a5,80001988 <_ZN7_thread5startEv+0x48>
void _thread::start() {
    80001954:	ff010113          	addi	sp,sp,-16
    80001958:	00113423          	sd	ra,8(sp)
    8000195c:	00813023          	sd	s0,0(sp)
    80001960:	01010413          	addi	s0,sp,16
    if ( this->body != nullptr) {Scheduler::put(this);}
    80001964:	00001097          	auipc	ra,0x1
    80001968:	a18080e7          	jalr	-1512(ra) # 8000237c <_ZN9Scheduler3putEP7_thread>
}
    8000196c:	00813083          	ld	ra,8(sp)
    80001970:	00013403          	ld	s0,0(sp)
    80001974:	01010113          	addi	sp,sp,16
    80001978:	00008067          	ret
    if (running == nullptr) running = this;
    8000197c:	00006797          	auipc	a5,0x6
    80001980:	b2a7ba23          	sd	a0,-1228(a5) # 800074b0 <_ZN7_thread7runningE>
    80001984:	fc9ff06f          	j	8000194c <_ZN7_thread5startEv+0xc>
    80001988:	00008067          	ret

000000008000198c <_ZN7_threadnwEm>:

void* _thread::operator new(size_t sz){
    8000198c:	fe010113          	addi	sp,sp,-32
    80001990:	00113c23          	sd	ra,24(sp)
    80001994:	00813823          	sd	s0,16(sp)
    80001998:	00913423          	sd	s1,8(sp)
    8000199c:	02010413          	addi	s0,sp,32
    800019a0:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->mem_alloc((sz+
    800019a4:	00001097          	auipc	ra,0x1
    800019a8:	428080e7          	jalr	1064(ra) # 80002dcc <_ZN15MemoryAllocator11getInstanceEv>
    sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
    800019ac:	05748513          	addi	a0,s1,87
    800019b0:	00655513          	srli	a0,a0,0x6
    800019b4:	00001097          	auipc	ra,0x1
    800019b8:	2d8080e7          	jalr	728(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
}
    800019bc:	01813083          	ld	ra,24(sp)
    800019c0:	01013403          	ld	s0,16(sp)
    800019c4:	00813483          	ld	s1,8(sp)
    800019c8:	02010113          	addi	sp,sp,32
    800019cc:	00008067          	ret

00000000800019d0 <_ZN7_threadnaEm>:

void* _thread::operator new[](size_t sz){
    800019d0:	fe010113          	addi	sp,sp,-32
    800019d4:	00113c23          	sd	ra,24(sp)
    800019d8:	00813823          	sd	s0,16(sp)
    800019dc:	00913423          	sd	s1,8(sp)
    800019e0:	02010413          	addi	s0,sp,32
    800019e4:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->mem_alloc((sz+
    800019e8:	00001097          	auipc	ra,0x1
    800019ec:	3e4080e7          	jalr	996(ra) # 80002dcc <_ZN15MemoryAllocator11getInstanceEv>
                                               sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
    800019f0:	05748513          	addi	a0,s1,87
    800019f4:	00655513          	srli	a0,a0,0x6
    800019f8:	00001097          	auipc	ra,0x1
    800019fc:	294080e7          	jalr	660(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
}
    80001a00:	01813083          	ld	ra,24(sp)
    80001a04:	01013403          	ld	s0,16(sp)
    80001a08:	00813483          	ld	s1,8(sp)
    80001a0c:	02010113          	addi	sp,sp,32
    80001a10:	00008067          	ret

0000000080001a14 <_ZN7_thread12createThreadEPFvPvES0_>:
_thread *_thread::createThread(Body body, void* arg){
    80001a14:	fd010113          	addi	sp,sp,-48
    80001a18:	02113423          	sd	ra,40(sp)
    80001a1c:	02813023          	sd	s0,32(sp)
    80001a20:	00913c23          	sd	s1,24(sp)
    80001a24:	01213823          	sd	s2,16(sp)
    80001a28:	01313423          	sd	s3,8(sp)
    80001a2c:	03010413          	addi	s0,sp,48
    80001a30:	00050913          	mv	s2,a0
    80001a34:	00058993          	mv	s3,a1
    _thread* ret = (_thread*)MemoryAllocator::getInstance()->mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80001a38:	00001097          	auipc	ra,0x1
    80001a3c:	394080e7          	jalr	916(ra) # 80002dcc <_ZN15MemoryAllocator11getInstanceEv>
    80001a40:	00200513          	li	a0,2
    80001a44:	00001097          	auipc	ra,0x1
    80001a48:	248080e7          	jalr	584(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
    80001a4c:	00050493          	mv	s1,a0
    if (ret == nullptr) return ret;
    80001a50:	04050663          	beqz	a0,80001a9c <_ZN7_thread12createThreadEPFvPvES0_+0x88>
    ret->body = body;
    80001a54:	01253023          	sd	s2,0(a0)
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE * sizeof(uint64)) : nullptr),
    80001a58:	06090263          	beqz	s2,80001abc <_ZN7_thread12createThreadEPFvPvES0_+0xa8>
    80001a5c:	00008537          	lui	a0,0x8
    80001a60:	00000097          	auipc	ra,0x0
    80001a64:	f70080e7          	jalr	-144(ra) # 800019d0 <_ZN7_threadnaEm>
    80001a68:	00a4b423          	sd	a0,8(s1)
    ret->timeSlice = TIME_SLICE;
    80001a6c:	00200793          	li	a5,2
    80001a70:	00f4b823          	sd	a5,16(s1)
    ret->finished = false;
    80001a74:	00048c23          	sb	zero,24(s1)
    ret->blocked = false;
    80001a78:	00048ca3          	sb	zero,25(s1)
    ret->arg = arg;
    80001a7c:	0334b023          	sd	s3,32(s1)
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    80001a80:	04050263          	beqz	a0,80001ac4 <_ZN7_thread12createThreadEPFvPvES0_+0xb0>
    80001a84:	000087b7          	lui	a5,0x8
    80001a88:	00f50533          	add	a0,a0,a5
    ret->context = {
    80001a8c:	00000797          	auipc	a5,0x0
    80001a90:	e5878793          	addi	a5,a5,-424 # 800018e4 <_ZN7_thread13threadWrapperEv>
    80001a94:	02f4b423          	sd	a5,40(s1)
    80001a98:	02a4b823          	sd	a0,48(s1)
}
    80001a9c:	00048513          	mv	a0,s1
    80001aa0:	02813083          	ld	ra,40(sp)
    80001aa4:	02013403          	ld	s0,32(sp)
    80001aa8:	01813483          	ld	s1,24(sp)
    80001aac:	01013903          	ld	s2,16(sp)
    80001ab0:	00813983          	ld	s3,8(sp)
    80001ab4:	03010113          	addi	sp,sp,48
    80001ab8:	00008067          	ret
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE * sizeof(uint64)) : nullptr),
    80001abc:	00000513          	li	a0,0
    80001ac0:	fa9ff06f          	j	80001a68 <_ZN7_thread12createThreadEPFvPvES0_+0x54>
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    80001ac4:	00000513          	li	a0,0
    80001ac8:	fc5ff06f          	j	80001a8c <_ZN7_thread12createThreadEPFvPvES0_+0x78>

0000000080001acc <_ZN7_threaddlEPv>:
void _thread::operator delete(void* p){
    80001acc:	fe010113          	addi	sp,sp,-32
    80001ad0:	00113c23          	sd	ra,24(sp)
    80001ad4:	00813823          	sd	s0,16(sp)
    80001ad8:	00913423          	sd	s1,8(sp)
    80001adc:	02010413          	addi	s0,sp,32
    80001ae0:	00050493          	mv	s1,a0
    MemoryAllocator::getInstance()->mem_free(p);
    80001ae4:	00001097          	auipc	ra,0x1
    80001ae8:	2e8080e7          	jalr	744(ra) # 80002dcc <_ZN15MemoryAllocator11getInstanceEv>
    80001aec:	00048513          	mv	a0,s1
    80001af0:	00001097          	auipc	ra,0x1
    80001af4:	370080e7          	jalr	880(ra) # 80002e60 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001af8:	01813083          	ld	ra,24(sp)
    80001afc:	01013403          	ld	s0,16(sp)
    80001b00:	00813483          	ld	s1,8(sp)
    80001b04:	02010113          	addi	sp,sp,32
    80001b08:	00008067          	ret

0000000080001b0c <_ZN7_threaddaEPv>:

void _thread::operator delete[](void* p){
    80001b0c:	fe010113          	addi	sp,sp,-32
    80001b10:	00113c23          	sd	ra,24(sp)
    80001b14:	00813823          	sd	s0,16(sp)
    80001b18:	00913423          	sd	s1,8(sp)
    80001b1c:	02010413          	addi	s0,sp,32
    80001b20:	00050493          	mv	s1,a0
    MemoryAllocator::getInstance()->mem_free(p);
    80001b24:	00001097          	auipc	ra,0x1
    80001b28:	2a8080e7          	jalr	680(ra) # 80002dcc <_ZN15MemoryAllocator11getInstanceEv>
    80001b2c:	00048513          	mv	a0,s1
    80001b30:	00001097          	auipc	ra,0x1
    80001b34:	330080e7          	jalr	816(ra) # 80002e60 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001b38:	01813083          	ld	ra,24(sp)
    80001b3c:	01013403          	ld	s0,16(sp)
    80001b40:	00813483          	ld	s1,8(sp)
    80001b44:	02010113          	addi	sp,sp,32
    80001b48:	00008067          	ret

0000000080001b4c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80001b4c:	fe010113          	addi	sp,sp,-32
    80001b50:	00113c23          	sd	ra,24(sp)
    80001b54:	00813823          	sd	s0,16(sp)
    80001b58:	00913423          	sd	s1,8(sp)
    80001b5c:	02010413          	addi	s0,sp,32
    80001b60:	00050493          	mv	s1,a0
    LOCK();
    80001b64:	00100613          	li	a2,1
    80001b68:	00000593          	li	a1,0
    80001b6c:	00006517          	auipc	a0,0x6
    80001b70:	95450513          	addi	a0,a0,-1708 # 800074c0 <lockPrint>
    80001b74:	fffff097          	auipc	ra,0xfffff
    80001b78:	59c080e7          	jalr	1436(ra) # 80001110 <copy_and_swap>
    80001b7c:	fe0514e3          	bnez	a0,80001b64 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80001b80:	0004c503          	lbu	a0,0(s1)
    80001b84:	00050a63          	beqz	a0,80001b98 <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    80001b88:	00004097          	auipc	ra,0x4
    80001b8c:	ca4080e7          	jalr	-860(ra) # 8000582c <__putc>
        string++;
    80001b90:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001b94:	fedff06f          	j	80001b80 <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80001b98:	00000613          	li	a2,0
    80001b9c:	00100593          	li	a1,1
    80001ba0:	00006517          	auipc	a0,0x6
    80001ba4:	92050513          	addi	a0,a0,-1760 # 800074c0 <lockPrint>
    80001ba8:	fffff097          	auipc	ra,0xfffff
    80001bac:	568080e7          	jalr	1384(ra) # 80001110 <copy_and_swap>
    80001bb0:	fe0514e3          	bnez	a0,80001b98 <_Z11printStringPKc+0x4c>
}
    80001bb4:	01813083          	ld	ra,24(sp)
    80001bb8:	01013403          	ld	s0,16(sp)
    80001bbc:	00813483          	ld	s1,8(sp)
    80001bc0:	02010113          	addi	sp,sp,32
    80001bc4:	00008067          	ret

0000000080001bc8 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80001bc8:	fd010113          	addi	sp,sp,-48
    80001bcc:	02113423          	sd	ra,40(sp)
    80001bd0:	02813023          	sd	s0,32(sp)
    80001bd4:	00913c23          	sd	s1,24(sp)
    80001bd8:	01213823          	sd	s2,16(sp)
    80001bdc:	01313423          	sd	s3,8(sp)
    80001be0:	01413023          	sd	s4,0(sp)
    80001be4:	03010413          	addi	s0,sp,48
    80001be8:	00050993          	mv	s3,a0
    80001bec:	00058a13          	mv	s4,a1
    LOCK();
    80001bf0:	00100613          	li	a2,1
    80001bf4:	00000593          	li	a1,0
    80001bf8:	00006517          	auipc	a0,0x6
    80001bfc:	8c850513          	addi	a0,a0,-1848 # 800074c0 <lockPrint>
    80001c00:	fffff097          	auipc	ra,0xfffff
    80001c04:	510080e7          	jalr	1296(ra) # 80001110 <copy_and_swap>
    80001c08:	fe0514e3          	bnez	a0,80001bf0 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80001c0c:	00000913          	li	s2,0
    80001c10:	00090493          	mv	s1,s2
    80001c14:	0019091b          	addiw	s2,s2,1
    80001c18:	03495a63          	bge	s2,s4,80001c4c <_Z9getStringPci+0x84>
        cc = __getc();
    80001c1c:	00004097          	auipc	ra,0x4
    80001c20:	c4c080e7          	jalr	-948(ra) # 80005868 <__getc>
        if(cc < 1)
    80001c24:	02050463          	beqz	a0,80001c4c <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    80001c28:	009984b3          	add	s1,s3,s1
    80001c2c:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80001c30:	00a00793          	li	a5,10
    80001c34:	00f50a63          	beq	a0,a5,80001c48 <_Z9getStringPci+0x80>
    80001c38:	00d00793          	li	a5,13
    80001c3c:	fcf51ae3          	bne	a0,a5,80001c10 <_Z9getStringPci+0x48>
        buf[i++] = c;
    80001c40:	00090493          	mv	s1,s2
    80001c44:	0080006f          	j	80001c4c <_Z9getStringPci+0x84>
    80001c48:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80001c4c:	009984b3          	add	s1,s3,s1
    80001c50:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80001c54:	00000613          	li	a2,0
    80001c58:	00100593          	li	a1,1
    80001c5c:	00006517          	auipc	a0,0x6
    80001c60:	86450513          	addi	a0,a0,-1948 # 800074c0 <lockPrint>
    80001c64:	fffff097          	auipc	ra,0xfffff
    80001c68:	4ac080e7          	jalr	1196(ra) # 80001110 <copy_and_swap>
    80001c6c:	fe0514e3          	bnez	a0,80001c54 <_Z9getStringPci+0x8c>
    return buf;
}
    80001c70:	00098513          	mv	a0,s3
    80001c74:	02813083          	ld	ra,40(sp)
    80001c78:	02013403          	ld	s0,32(sp)
    80001c7c:	01813483          	ld	s1,24(sp)
    80001c80:	01013903          	ld	s2,16(sp)
    80001c84:	00813983          	ld	s3,8(sp)
    80001c88:	00013a03          	ld	s4,0(sp)
    80001c8c:	03010113          	addi	sp,sp,48
    80001c90:	00008067          	ret

0000000080001c94 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80001c94:	ff010113          	addi	sp,sp,-16
    80001c98:	00813423          	sd	s0,8(sp)
    80001c9c:	01010413          	addi	s0,sp,16
    80001ca0:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80001ca4:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80001ca8:	0006c603          	lbu	a2,0(a3)
    80001cac:	fd06071b          	addiw	a4,a2,-48
    80001cb0:	0ff77713          	andi	a4,a4,255
    80001cb4:	00900793          	li	a5,9
    80001cb8:	02e7e063          	bltu	a5,a4,80001cd8 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80001cbc:	0025179b          	slliw	a5,a0,0x2
    80001cc0:	00a787bb          	addw	a5,a5,a0
    80001cc4:	0017979b          	slliw	a5,a5,0x1
    80001cc8:	00168693          	addi	a3,a3,1
    80001ccc:	00c787bb          	addw	a5,a5,a2
    80001cd0:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80001cd4:	fd5ff06f          	j	80001ca8 <_Z11stringToIntPKc+0x14>
    return n;
}
    80001cd8:	00813403          	ld	s0,8(sp)
    80001cdc:	01010113          	addi	sp,sp,16
    80001ce0:	00008067          	ret

0000000080001ce4 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80001ce4:	fc010113          	addi	sp,sp,-64
    80001ce8:	02113c23          	sd	ra,56(sp)
    80001cec:	02813823          	sd	s0,48(sp)
    80001cf0:	02913423          	sd	s1,40(sp)
    80001cf4:	03213023          	sd	s2,32(sp)
    80001cf8:	01313c23          	sd	s3,24(sp)
    80001cfc:	04010413          	addi	s0,sp,64
    80001d00:	00050493          	mv	s1,a0
    80001d04:	00058913          	mv	s2,a1
    80001d08:	00060993          	mv	s3,a2
    LOCK();
    80001d0c:	00100613          	li	a2,1
    80001d10:	00000593          	li	a1,0
    80001d14:	00005517          	auipc	a0,0x5
    80001d18:	7ac50513          	addi	a0,a0,1964 # 800074c0 <lockPrint>
    80001d1c:	fffff097          	auipc	ra,0xfffff
    80001d20:	3f4080e7          	jalr	1012(ra) # 80001110 <copy_and_swap>
    80001d24:	fe0514e3          	bnez	a0,80001d0c <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80001d28:	00098463          	beqz	s3,80001d30 <_Z8printIntiii+0x4c>
    80001d2c:	0804c463          	bltz	s1,80001db4 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80001d30:	0004851b          	sext.w	a0,s1
    neg = 0;
    80001d34:	00000593          	li	a1,0
    }

    i = 0;
    80001d38:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80001d3c:	0009079b          	sext.w	a5,s2
    80001d40:	0325773b          	remuw	a4,a0,s2
    80001d44:	00048613          	mv	a2,s1
    80001d48:	0014849b          	addiw	s1,s1,1
    80001d4c:	02071693          	slli	a3,a4,0x20
    80001d50:	0206d693          	srli	a3,a3,0x20
    80001d54:	00005717          	auipc	a4,0x5
    80001d58:	66c70713          	addi	a4,a4,1644 # 800073c0 <digits>
    80001d5c:	00d70733          	add	a4,a4,a3
    80001d60:	00074683          	lbu	a3,0(a4)
    80001d64:	fd040713          	addi	a4,s0,-48
    80001d68:	00c70733          	add	a4,a4,a2
    80001d6c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80001d70:	0005071b          	sext.w	a4,a0
    80001d74:	0325553b          	divuw	a0,a0,s2
    80001d78:	fcf772e3          	bgeu	a4,a5,80001d3c <_Z8printIntiii+0x58>
    if(neg)
    80001d7c:	00058c63          	beqz	a1,80001d94 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    80001d80:	fd040793          	addi	a5,s0,-48
    80001d84:	009784b3          	add	s1,a5,s1
    80001d88:	02d00793          	li	a5,45
    80001d8c:	fef48823          	sb	a5,-16(s1)
    80001d90:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80001d94:	fff4849b          	addiw	s1,s1,-1
    80001d98:	0204c463          	bltz	s1,80001dc0 <_Z8printIntiii+0xdc>
        __putc(buf[i]);
    80001d9c:	fd040793          	addi	a5,s0,-48
    80001da0:	009787b3          	add	a5,a5,s1
    80001da4:	ff07c503          	lbu	a0,-16(a5)
    80001da8:	00004097          	auipc	ra,0x4
    80001dac:	a84080e7          	jalr	-1404(ra) # 8000582c <__putc>
    80001db0:	fe5ff06f          	j	80001d94 <_Z8printIntiii+0xb0>
        x = -xx;
    80001db4:	4090053b          	negw	a0,s1
        neg = 1;
    80001db8:	00100593          	li	a1,1
        x = -xx;
    80001dbc:	f7dff06f          	j	80001d38 <_Z8printIntiii+0x54>

    UNLOCK();
    80001dc0:	00000613          	li	a2,0
    80001dc4:	00100593          	li	a1,1
    80001dc8:	00005517          	auipc	a0,0x5
    80001dcc:	6f850513          	addi	a0,a0,1784 # 800074c0 <lockPrint>
    80001dd0:	fffff097          	auipc	ra,0xfffff
    80001dd4:	340080e7          	jalr	832(ra) # 80001110 <copy_and_swap>
    80001dd8:	fe0514e3          	bnez	a0,80001dc0 <_Z8printIntiii+0xdc>
    80001ddc:	03813083          	ld	ra,56(sp)
    80001de0:	03013403          	ld	s0,48(sp)
    80001de4:	02813483          	ld	s1,40(sp)
    80001de8:	02013903          	ld	s2,32(sp)
    80001dec:	01813983          	ld	s3,24(sp)
    80001df0:	04010113          	addi	sp,sp,64
    80001df4:	00008067          	ret

0000000080001df8 <_Z16producerKeyboardPv>:
    sem_t wait;
};

volatile int threadEnd = 0;

void producerKeyboard(void *arg) {
    80001df8:	fe010113          	addi	sp,sp,-32
    80001dfc:	00113c23          	sd	ra,24(sp)
    80001e00:	00813823          	sd	s0,16(sp)
    80001e04:	00913423          	sd	s1,8(sp)
    80001e08:	01213023          	sd	s2,0(sp)
    80001e0c:	02010413          	addi	s0,sp,32
    80001e10:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80001e14:	00000913          	li	s2,0
    80001e18:	00c0006f          	j	80001e24 <_Z16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80001e1c:	fffff097          	auipc	ra,0xfffff
    80001e20:	7d0080e7          	jalr	2000(ra) # 800015ec <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80001e24:	00000097          	auipc	ra,0x0
    80001e28:	9ac080e7          	jalr	-1620(ra) # 800017d0 <_Z4getcv>
    80001e2c:	0005059b          	sext.w	a1,a0
    80001e30:	01b00793          	li	a5,27
    80001e34:	02f58a63          	beq	a1,a5,80001e68 <_Z16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80001e38:	0084b503          	ld	a0,8(s1)
    80001e3c:	00001097          	auipc	ra,0x1
    80001e40:	6a8080e7          	jalr	1704(ra) # 800034e4 <_ZN6Buffer3putEi>
        i++;
    80001e44:	0019071b          	addiw	a4,s2,1
    80001e48:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001e4c:	0004a683          	lw	a3,0(s1)
    80001e50:	0026979b          	slliw	a5,a3,0x2
    80001e54:	00d787bb          	addw	a5,a5,a3
    80001e58:	0017979b          	slliw	a5,a5,0x1
    80001e5c:	02f767bb          	remw	a5,a4,a5
    80001e60:	fc0792e3          	bnez	a5,80001e24 <_Z16producerKeyboardPv+0x2c>
    80001e64:	fb9ff06f          	j	80001e1c <_Z16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80001e68:	00100793          	li	a5,1
    80001e6c:	00005717          	auipc	a4,0x5
    80001e70:	64f72e23          	sw	a5,1628(a4) # 800074c8 <threadEnd>
    data->buffer->put('!');
    80001e74:	02100593          	li	a1,33
    80001e78:	0084b503          	ld	a0,8(s1)
    80001e7c:	00001097          	auipc	ra,0x1
    80001e80:	668080e7          	jalr	1640(ra) # 800034e4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80001e84:	0104b503          	ld	a0,16(s1)
    80001e88:	00000097          	auipc	ra,0x0
    80001e8c:	8e0080e7          	jalr	-1824(ra) # 80001768 <_Z10sem_signalP4_sem>
}
    80001e90:	01813083          	ld	ra,24(sp)
    80001e94:	01013403          	ld	s0,16(sp)
    80001e98:	00813483          	ld	s1,8(sp)
    80001e9c:	00013903          	ld	s2,0(sp)
    80001ea0:	02010113          	addi	sp,sp,32
    80001ea4:	00008067          	ret

0000000080001ea8 <_Z8producerPv>:

void producer(void *arg) {
    80001ea8:	fe010113          	addi	sp,sp,-32
    80001eac:	00113c23          	sd	ra,24(sp)
    80001eb0:	00813823          	sd	s0,16(sp)
    80001eb4:	00913423          	sd	s1,8(sp)
    80001eb8:	01213023          	sd	s2,0(sp)
    80001ebc:	02010413          	addi	s0,sp,32
    80001ec0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001ec4:	00000913          	li	s2,0
    80001ec8:	00c0006f          	j	80001ed4 <_Z8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80001ecc:	fffff097          	auipc	ra,0xfffff
    80001ed0:	720080e7          	jalr	1824(ra) # 800015ec <_Z15thread_dispatchv>
    while (!threadEnd) {
    80001ed4:	00005797          	auipc	a5,0x5
    80001ed8:	5f47a783          	lw	a5,1524(a5) # 800074c8 <threadEnd>
    80001edc:	02079e63          	bnez	a5,80001f18 <_Z8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80001ee0:	0004a583          	lw	a1,0(s1)
    80001ee4:	0305859b          	addiw	a1,a1,48
    80001ee8:	0084b503          	ld	a0,8(s1)
    80001eec:	00001097          	auipc	ra,0x1
    80001ef0:	5f8080e7          	jalr	1528(ra) # 800034e4 <_ZN6Buffer3putEi>
        i++;
    80001ef4:	0019071b          	addiw	a4,s2,1
    80001ef8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80001efc:	0004a683          	lw	a3,0(s1)
    80001f00:	0026979b          	slliw	a5,a3,0x2
    80001f04:	00d787bb          	addw	a5,a5,a3
    80001f08:	0017979b          	slliw	a5,a5,0x1
    80001f0c:	02f767bb          	remw	a5,a4,a5
    80001f10:	fc0792e3          	bnez	a5,80001ed4 <_Z8producerPv+0x2c>
    80001f14:	fb9ff06f          	j	80001ecc <_Z8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80001f18:	0104b503          	ld	a0,16(s1)
    80001f1c:	00000097          	auipc	ra,0x0
    80001f20:	84c080e7          	jalr	-1972(ra) # 80001768 <_Z10sem_signalP4_sem>
}
    80001f24:	01813083          	ld	ra,24(sp)
    80001f28:	01013403          	ld	s0,16(sp)
    80001f2c:	00813483          	ld	s1,8(sp)
    80001f30:	00013903          	ld	s2,0(sp)
    80001f34:	02010113          	addi	sp,sp,32
    80001f38:	00008067          	ret

0000000080001f3c <_Z8consumerPv>:

void consumer(void *arg) {
    80001f3c:	fd010113          	addi	sp,sp,-48
    80001f40:	02113423          	sd	ra,40(sp)
    80001f44:	02813023          	sd	s0,32(sp)
    80001f48:	00913c23          	sd	s1,24(sp)
    80001f4c:	01213823          	sd	s2,16(sp)
    80001f50:	01313423          	sd	s3,8(sp)
    80001f54:	03010413          	addi	s0,sp,48
    80001f58:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80001f5c:	00000993          	li	s3,0
    80001f60:	01c0006f          	j	80001f7c <_Z8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80001f64:	fffff097          	auipc	ra,0xfffff
    80001f68:	688080e7          	jalr	1672(ra) # 800015ec <_Z15thread_dispatchv>
    80001f6c:	0500006f          	j	80001fbc <_Z8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80001f70:	00a00513          	li	a0,10
    80001f74:	00000097          	auipc	ra,0x0
    80001f78:	82c080e7          	jalr	-2004(ra) # 800017a0 <_Z4putcc>
    while (!threadEnd) {
    80001f7c:	00005797          	auipc	a5,0x5
    80001f80:	54c7a783          	lw	a5,1356(a5) # 800074c8 <threadEnd>
    80001f84:	06079063          	bnez	a5,80001fe4 <_Z8consumerPv+0xa8>
        int key = data->buffer->get();
    80001f88:	00893503          	ld	a0,8(s2)
    80001f8c:	00001097          	auipc	ra,0x1
    80001f90:	5e8080e7          	jalr	1512(ra) # 80003574 <_ZN6Buffer3getEv>
        i++;
    80001f94:	0019849b          	addiw	s1,s3,1
    80001f98:	0004899b          	sext.w	s3,s1
        putc(key);
    80001f9c:	0ff57513          	andi	a0,a0,255
    80001fa0:	00000097          	auipc	ra,0x0
    80001fa4:	800080e7          	jalr	-2048(ra) # 800017a0 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80001fa8:	00092703          	lw	a4,0(s2)
    80001fac:	0027179b          	slliw	a5,a4,0x2
    80001fb0:	00e787bb          	addw	a5,a5,a4
    80001fb4:	02f4e7bb          	remw	a5,s1,a5
    80001fb8:	fa0786e3          	beqz	a5,80001f64 <_Z8consumerPv+0x28>
        if (i % 80 == 0) {
    80001fbc:	05000793          	li	a5,80
    80001fc0:	02f4e4bb          	remw	s1,s1,a5
    80001fc4:	fa049ce3          	bnez	s1,80001f7c <_Z8consumerPv+0x40>
    80001fc8:	fa9ff06f          	j	80001f70 <_Z8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80001fcc:	00893503          	ld	a0,8(s2)
    80001fd0:	00001097          	auipc	ra,0x1
    80001fd4:	5a4080e7          	jalr	1444(ra) # 80003574 <_ZN6Buffer3getEv>
        putc(key);
    80001fd8:	0ff57513          	andi	a0,a0,255
    80001fdc:	fffff097          	auipc	ra,0xfffff
    80001fe0:	7c4080e7          	jalr	1988(ra) # 800017a0 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80001fe4:	00893503          	ld	a0,8(s2)
    80001fe8:	00001097          	auipc	ra,0x1
    80001fec:	618080e7          	jalr	1560(ra) # 80003600 <_ZN6Buffer6getCntEv>
    80001ff0:	fca04ee3          	bgtz	a0,80001fcc <_Z8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80001ff4:	01093503          	ld	a0,16(s2)
    80001ff8:	fffff097          	auipc	ra,0xfffff
    80001ffc:	770080e7          	jalr	1904(ra) # 80001768 <_Z10sem_signalP4_sem>
}
    80002000:	02813083          	ld	ra,40(sp)
    80002004:	02013403          	ld	s0,32(sp)
    80002008:	01813483          	ld	s1,24(sp)
    8000200c:	01013903          	ld	s2,16(sp)
    80002010:	00813983          	ld	s3,8(sp)
    80002014:	03010113          	addi	sp,sp,48
    80002018:	00008067          	ret

000000008000201c <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    8000201c:	f9010113          	addi	sp,sp,-112
    80002020:	06113423          	sd	ra,104(sp)
    80002024:	06813023          	sd	s0,96(sp)
    80002028:	04913c23          	sd	s1,88(sp)
    8000202c:	05213823          	sd	s2,80(sp)
    80002030:	05313423          	sd	s3,72(sp)
    80002034:	05413023          	sd	s4,64(sp)
    80002038:	03513c23          	sd	s5,56(sp)
    8000203c:	03613823          	sd	s6,48(sp)
    80002040:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002044:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002048:	00004517          	auipc	a0,0x4
    8000204c:	0e850513          	addi	a0,a0,232 # 80006130 <CONSOLE_STATUS+0x120>
    80002050:	00000097          	auipc	ra,0x0
    80002054:	afc080e7          	jalr	-1284(ra) # 80001b4c <_Z11printStringPKc>
    getString(input, 30);
    80002058:	01e00593          	li	a1,30
    8000205c:	fa040493          	addi	s1,s0,-96
    80002060:	00048513          	mv	a0,s1
    80002064:	00000097          	auipc	ra,0x0
    80002068:	b64080e7          	jalr	-1180(ra) # 80001bc8 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000206c:	00048513          	mv	a0,s1
    80002070:	00000097          	auipc	ra,0x0
    80002074:	c24080e7          	jalr	-988(ra) # 80001c94 <_Z11stringToIntPKc>
    80002078:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000207c:	00004517          	auipc	a0,0x4
    80002080:	0d450513          	addi	a0,a0,212 # 80006150 <CONSOLE_STATUS+0x140>
    80002084:	00000097          	auipc	ra,0x0
    80002088:	ac8080e7          	jalr	-1336(ra) # 80001b4c <_Z11printStringPKc>
    getString(input, 30);
    8000208c:	01e00593          	li	a1,30
    80002090:	00048513          	mv	a0,s1
    80002094:	00000097          	auipc	ra,0x0
    80002098:	b34080e7          	jalr	-1228(ra) # 80001bc8 <_Z9getStringPci>
    n = stringToInt(input);
    8000209c:	00048513          	mv	a0,s1
    800020a0:	00000097          	auipc	ra,0x0
    800020a4:	bf4080e7          	jalr	-1036(ra) # 80001c94 <_Z11stringToIntPKc>
    800020a8:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800020ac:	00004517          	auipc	a0,0x4
    800020b0:	0c450513          	addi	a0,a0,196 # 80006170 <CONSOLE_STATUS+0x160>
    800020b4:	00000097          	auipc	ra,0x0
    800020b8:	a98080e7          	jalr	-1384(ra) # 80001b4c <_Z11printStringPKc>
    800020bc:	00000613          	li	a2,0
    800020c0:	00a00593          	li	a1,10
    800020c4:	00090513          	mv	a0,s2
    800020c8:	00000097          	auipc	ra,0x0
    800020cc:	c1c080e7          	jalr	-996(ra) # 80001ce4 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    800020d0:	00004517          	auipc	a0,0x4
    800020d4:	0b850513          	addi	a0,a0,184 # 80006188 <CONSOLE_STATUS+0x178>
    800020d8:	00000097          	auipc	ra,0x0
    800020dc:	a74080e7          	jalr	-1420(ra) # 80001b4c <_Z11printStringPKc>
    800020e0:	00000613          	li	a2,0
    800020e4:	00a00593          	li	a1,10
    800020e8:	00048513          	mv	a0,s1
    800020ec:	00000097          	auipc	ra,0x0
    800020f0:	bf8080e7          	jalr	-1032(ra) # 80001ce4 <_Z8printIntiii>
    printString(".\n");
    800020f4:	00004517          	auipc	a0,0x4
    800020f8:	0ac50513          	addi	a0,a0,172 # 800061a0 <CONSOLE_STATUS+0x190>
    800020fc:	00000097          	auipc	ra,0x0
    80002100:	a50080e7          	jalr	-1456(ra) # 80001b4c <_Z11printStringPKc>
    if(threadNum > n) {
    80002104:	0324c463          	blt	s1,s2,8000212c <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002108:	03205c63          	blez	s2,80002140 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    8000210c:	03800513          	li	a0,56
    80002110:	00000097          	auipc	ra,0x0
    80002114:	5cc080e7          	jalr	1484(ra) # 800026dc <_Znwm>
    80002118:	00050a13          	mv	s4,a0
    8000211c:	00048593          	mv	a1,s1
    80002120:	00001097          	auipc	ra,0x1
    80002124:	328080e7          	jalr	808(ra) # 80003448 <_ZN6BufferC1Ei>
    80002128:	0300006f          	j	80002158 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000212c:	00004517          	auipc	a0,0x4
    80002130:	07c50513          	addi	a0,a0,124 # 800061a8 <CONSOLE_STATUS+0x198>
    80002134:	00000097          	auipc	ra,0x0
    80002138:	a18080e7          	jalr	-1512(ra) # 80001b4c <_Z11printStringPKc>
        return;
    8000213c:	0140006f          	j	80002150 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002140:	00004517          	auipc	a0,0x4
    80002144:	0a850513          	addi	a0,a0,168 # 800061e8 <CONSOLE_STATUS+0x1d8>
    80002148:	00000097          	auipc	ra,0x0
    8000214c:	a04080e7          	jalr	-1532(ra) # 80001b4c <_Z11printStringPKc>
        return;
    80002150:	000b0113          	mv	sp,s6
    80002154:	1500006f          	j	800022a4 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002158:	00000593          	li	a1,0
    8000215c:	00005517          	auipc	a0,0x5
    80002160:	37450513          	addi	a0,a0,884 # 800074d0 <waitForAll>
    80002164:	fffff097          	auipc	ra,0xfffff
    80002168:	558080e7          	jalr	1368(ra) # 800016bc <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    8000216c:	00391793          	slli	a5,s2,0x3
    80002170:	00f78793          	addi	a5,a5,15
    80002174:	ff07f793          	andi	a5,a5,-16
    80002178:	40f10133          	sub	sp,sp,a5
    8000217c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002180:	0019071b          	addiw	a4,s2,1
    80002184:	00171793          	slli	a5,a4,0x1
    80002188:	00e787b3          	add	a5,a5,a4
    8000218c:	00379793          	slli	a5,a5,0x3
    80002190:	00f78793          	addi	a5,a5,15
    80002194:	ff07f793          	andi	a5,a5,-16
    80002198:	40f10133          	sub	sp,sp,a5
    8000219c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    800021a0:	00191613          	slli	a2,s2,0x1
    800021a4:	012607b3          	add	a5,a2,s2
    800021a8:	00379793          	slli	a5,a5,0x3
    800021ac:	00f987b3          	add	a5,s3,a5
    800021b0:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    800021b4:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    800021b8:	00005717          	auipc	a4,0x5
    800021bc:	31873703          	ld	a4,792(a4) # 800074d0 <waitForAll>
    800021c0:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    800021c4:	00078613          	mv	a2,a5
    800021c8:	00000597          	auipc	a1,0x0
    800021cc:	d7458593          	addi	a1,a1,-652 # 80001f3c <_Z8consumerPv>
    800021d0:	f9840513          	addi	a0,s0,-104
    800021d4:	fffff097          	auipc	ra,0xfffff
    800021d8:	398080e7          	jalr	920(ra) # 8000156c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    800021dc:	00000493          	li	s1,0
    800021e0:	0280006f          	j	80002208 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    800021e4:	00000597          	auipc	a1,0x0
    800021e8:	c1458593          	addi	a1,a1,-1004 # 80001df8 <_Z16producerKeyboardPv>
                      data + i);
    800021ec:	00179613          	slli	a2,a5,0x1
    800021f0:	00f60633          	add	a2,a2,a5
    800021f4:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    800021f8:	00c98633          	add	a2,s3,a2
    800021fc:	fffff097          	auipc	ra,0xfffff
    80002200:	370080e7          	jalr	880(ra) # 8000156c <_Z13thread_createPP7_threadPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002204:	0014849b          	addiw	s1,s1,1
    80002208:	0524d263          	bge	s1,s2,8000224c <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    8000220c:	00149793          	slli	a5,s1,0x1
    80002210:	009787b3          	add	a5,a5,s1
    80002214:	00379793          	slli	a5,a5,0x3
    80002218:	00f987b3          	add	a5,s3,a5
    8000221c:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80002220:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80002224:	00005717          	auipc	a4,0x5
    80002228:	2ac73703          	ld	a4,684(a4) # 800074d0 <waitForAll>
    8000222c:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80002230:	00048793          	mv	a5,s1
    80002234:	00349513          	slli	a0,s1,0x3
    80002238:	00aa8533          	add	a0,s5,a0
    8000223c:	fa9054e3          	blez	s1,800021e4 <_Z22producerConsumer_C_APIv+0x1c8>
    80002240:	00000597          	auipc	a1,0x0
    80002244:	c6858593          	addi	a1,a1,-920 # 80001ea8 <_Z8producerPv>
    80002248:	fa5ff06f          	j	800021ec <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    8000224c:	fffff097          	auipc	ra,0xfffff
    80002250:	3a0080e7          	jalr	928(ra) # 800015ec <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80002254:	00000493          	li	s1,0
    80002258:	00994e63          	blt	s2,s1,80002274 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    8000225c:	00005517          	auipc	a0,0x5
    80002260:	27453503          	ld	a0,628(a0) # 800074d0 <waitForAll>
    80002264:	fffff097          	auipc	ra,0xfffff
    80002268:	4cc080e7          	jalr	1228(ra) # 80001730 <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    8000226c:	0014849b          	addiw	s1,s1,1
    80002270:	fe9ff06f          	j	80002258 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80002274:	00005517          	auipc	a0,0x5
    80002278:	25c53503          	ld	a0,604(a0) # 800074d0 <waitForAll>
    8000227c:	fffff097          	auipc	ra,0xfffff
    80002280:	47c080e7          	jalr	1148(ra) # 800016f8 <_Z9sem_closeP4_sem>
    delete buffer;
    80002284:	000a0e63          	beqz	s4,800022a0 <_Z22producerConsumer_C_APIv+0x284>
    80002288:	000a0513          	mv	a0,s4
    8000228c:	00001097          	auipc	ra,0x1
    80002290:	3fc080e7          	jalr	1020(ra) # 80003688 <_ZN6BufferD1Ev>
    80002294:	000a0513          	mv	a0,s4
    80002298:	00000097          	auipc	ra,0x0
    8000229c:	494080e7          	jalr	1172(ra) # 8000272c <_ZdlPv>
    800022a0:	000b0113          	mv	sp,s6

}
    800022a4:	f9040113          	addi	sp,s0,-112
    800022a8:	06813083          	ld	ra,104(sp)
    800022ac:	06013403          	ld	s0,96(sp)
    800022b0:	05813483          	ld	s1,88(sp)
    800022b4:	05013903          	ld	s2,80(sp)
    800022b8:	04813983          	ld	s3,72(sp)
    800022bc:	04013a03          	ld	s4,64(sp)
    800022c0:	03813a83          	ld	s5,56(sp)
    800022c4:	03013b03          	ld	s6,48(sp)
    800022c8:	07010113          	addi	sp,sp,112
    800022cc:	00008067          	ret
    800022d0:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    800022d4:	000a0513          	mv	a0,s4
    800022d8:	00000097          	auipc	ra,0x0
    800022dc:	454080e7          	jalr	1108(ra) # 8000272c <_ZdlPv>
    800022e0:	00048513          	mv	a0,s1
    800022e4:	00006097          	auipc	ra,0x6
    800022e8:	2f4080e7          	jalr	756(ra) # 800085d8 <_Unwind_Resume>

00000000800022ec <_Z8userMainPv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.h" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain(void *) {
    800022ec:	ff010113          	addi	sp,sp,-16
    800022f0:	00113423          	sd	ra,8(sp)
    800022f4:	00813023          	sd	s0,0(sp)
    800022f8:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    //Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta

    producerConsumer_C_API(); // zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta
    800022fc:	00000097          	auipc	ra,0x0
    80002300:	d20080e7          	jalr	-736(ra) # 8000201c <_Z22producerConsumer_C_APIv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
//    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

}
    80002304:	00813083          	ld	ra,8(sp)
    80002308:	00013403          	ld	s0,0(sp)
    8000230c:	01010113          	addi	sp,sp,16
    80002310:	00008067          	ret

0000000080002314 <_ZN9Scheduler3getEv>:

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

_thread *Scheduler::get()
{
    80002314:	fe010113          	addi	sp,sp,-32
    80002318:	00113c23          	sd	ra,24(sp)
    8000231c:	00813823          	sd	s0,16(sp)
    80002320:	00913423          	sd	s1,8(sp)
    80002324:	02010413          	addi	s0,sp,32
    if (!head) return nullptr;
    80002328:	00005517          	auipc	a0,0x5
    8000232c:	1b053503          	ld	a0,432(a0) # 800074d8 <_ZN9Scheduler4headE>
    80002330:	04050263          	beqz	a0,80002374 <_ZN9Scheduler3getEv+0x60>

    Elem* elem = head;
    head = head->next;
    80002334:	00853783          	ld	a5,8(a0)
    80002338:	00005717          	auipc	a4,0x5
    8000233c:	1af73023          	sd	a5,416(a4) # 800074d8 <_ZN9Scheduler4headE>
    if (!head) tail = 0;
    80002340:	02078463          	beqz	a5,80002368 <_ZN9Scheduler3getEv+0x54>

    _thread *ret = elem->data;
    80002344:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    80002348:	00001097          	auipc	ra,0x1
    8000234c:	b18080e7          	jalr	-1256(ra) # 80002e60 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    80002350:	00048513          	mv	a0,s1
    80002354:	01813083          	ld	ra,24(sp)
    80002358:	01013403          	ld	s0,16(sp)
    8000235c:	00813483          	ld	s1,8(sp)
    80002360:	02010113          	addi	sp,sp,32
    80002364:	00008067          	ret
    if (!head) tail = 0;
    80002368:	00005797          	auipc	a5,0x5
    8000236c:	1607bc23          	sd	zero,376(a5) # 800074e0 <_ZN9Scheduler4tailE>
    80002370:	fd5ff06f          	j	80002344 <_ZN9Scheduler3getEv+0x30>
    if (!head) return nullptr;
    80002374:	00050493          	mv	s1,a0
    80002378:	fd9ff06f          	j	80002350 <_ZN9Scheduler3getEv+0x3c>

000000008000237c <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(_thread *ccb)
{
    8000237c:	fe010113          	addi	sp,sp,-32
    80002380:	00113c23          	sd	ra,24(sp)
    80002384:	00813823          	sd	s0,16(sp)
    80002388:	00913423          	sd	s1,8(sp)
    8000238c:	02010413          	addi	s0,sp,32
    80002390:	00050493          	mv	s1,a0
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80002394:	00100513          	li	a0,1
    80002398:	00001097          	auipc	ra,0x1
    8000239c:	8f4080e7          	jalr	-1804(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = ccb;
    800023a0:	00953023          	sd	s1,0(a0)
    elem->next = nullptr;
    800023a4:	00053423          	sd	zero,8(a0)
    if(tail){
    800023a8:	00005797          	auipc	a5,0x5
    800023ac:	1387b783          	ld	a5,312(a5) # 800074e0 <_ZN9Scheduler4tailE>
    800023b0:	02078263          	beqz	a5,800023d4 <_ZN9Scheduler3putEP7_thread+0x58>
        tail->next = elem;
    800023b4:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    800023b8:	00005797          	auipc	a5,0x5
    800023bc:	12a7b423          	sd	a0,296(a5) # 800074e0 <_ZN9Scheduler4tailE>
    }else{
        head = tail = elem;
    }
    800023c0:	01813083          	ld	ra,24(sp)
    800023c4:	01013403          	ld	s0,16(sp)
    800023c8:	00813483          	ld	s1,8(sp)
    800023cc:	02010113          	addi	sp,sp,32
    800023d0:	00008067          	ret
        head = tail = elem;
    800023d4:	00005797          	auipc	a5,0x5
    800023d8:	10478793          	addi	a5,a5,260 # 800074d8 <_ZN9Scheduler4headE>
    800023dc:	00a7b423          	sd	a0,8(a5)
    800023e0:	00a7b023          	sd	a0,0(a5)
    800023e4:	fddff06f          	j	800023c0 <_ZN9Scheduler3putEP7_thread+0x44>

00000000800023e8 <_Z12checkNullptrPv>:
//}
//extern "C" void supervisorTrap();

void checkNullptr(void* p) {
    static int x = 0;
    if(p == nullptr) {
    800023e8:	00050e63          	beqz	a0,80002404 <_Z12checkNullptrPv+0x1c>
        __putc('?');
        __putc('0' + x);
    }
    x++;
    800023ec:	00005717          	auipc	a4,0x5
    800023f0:	0fc70713          	addi	a4,a4,252 # 800074e8 <_ZZ12checkNullptrPvE1x>
    800023f4:	00072783          	lw	a5,0(a4)
    800023f8:	0017879b          	addiw	a5,a5,1
    800023fc:	00f72023          	sw	a5,0(a4)
    80002400:	00008067          	ret
void checkNullptr(void* p) {
    80002404:	ff010113          	addi	sp,sp,-16
    80002408:	00113423          	sd	ra,8(sp)
    8000240c:	00813023          	sd	s0,0(sp)
    80002410:	01010413          	addi	s0,sp,16
        __putc('?');
    80002414:	03f00513          	li	a0,63
    80002418:	00003097          	auipc	ra,0x3
    8000241c:	414080e7          	jalr	1044(ra) # 8000582c <__putc>
        __putc('0' + x);
    80002420:	00005517          	auipc	a0,0x5
    80002424:	0c852503          	lw	a0,200(a0) # 800074e8 <_ZZ12checkNullptrPvE1x>
    80002428:	0305051b          	addiw	a0,a0,48
    8000242c:	0ff57513          	andi	a0,a0,255
    80002430:	00003097          	auipc	ra,0x3
    80002434:	3fc080e7          	jalr	1020(ra) # 8000582c <__putc>
    x++;
    80002438:	00005717          	auipc	a4,0x5
    8000243c:	0b070713          	addi	a4,a4,176 # 800074e8 <_ZZ12checkNullptrPvE1x>
    80002440:	00072783          	lw	a5,0(a4)
    80002444:	0017879b          	addiw	a5,a5,1
    80002448:	00f72023          	sw	a5,0(a4)
}
    8000244c:	00813083          	ld	ra,8(sp)
    80002450:	00013403          	ld	s0,0(sp)
    80002454:	01010113          	addi	sp,sp,16
    80002458:	00008067          	ret

000000008000245c <_Z11checkStatusi>:

void checkStatus(int status) {
    static int y = 0;
    if(status) {
    8000245c:	00051e63          	bnez	a0,80002478 <_Z11checkStatusi+0x1c>
        __putc('0' + y);
        __putc('?');
    }
    y++;
    80002460:	00005717          	auipc	a4,0x5
    80002464:	08870713          	addi	a4,a4,136 # 800074e8 <_ZZ12checkNullptrPvE1x>
    80002468:	00472783          	lw	a5,4(a4)
    8000246c:	0017879b          	addiw	a5,a5,1
    80002470:	00f72223          	sw	a5,4(a4)
    80002474:	00008067          	ret
void checkStatus(int status) {
    80002478:	ff010113          	addi	sp,sp,-16
    8000247c:	00113423          	sd	ra,8(sp)
    80002480:	00813023          	sd	s0,0(sp)
    80002484:	01010413          	addi	s0,sp,16
        __putc('0' + y);
    80002488:	00005517          	auipc	a0,0x5
    8000248c:	06452503          	lw	a0,100(a0) # 800074ec <_ZZ11checkStatusiE1y>
    80002490:	0305051b          	addiw	a0,a0,48
    80002494:	0ff57513          	andi	a0,a0,255
    80002498:	00003097          	auipc	ra,0x3
    8000249c:	394080e7          	jalr	916(ra) # 8000582c <__putc>
        __putc('?');
    800024a0:	03f00513          	li	a0,63
    800024a4:	00003097          	auipc	ra,0x3
    800024a8:	388080e7          	jalr	904(ra) # 8000582c <__putc>
    y++;
    800024ac:	00005717          	auipc	a4,0x5
    800024b0:	03c70713          	addi	a4,a4,60 # 800074e8 <_ZZ12checkNullptrPvE1x>
    800024b4:	00472783          	lw	a5,4(a4)
    800024b8:	0017879b          	addiw	a5,a5,1
    800024bc:	00f72223          	sw	a5,4(a4)
}
    800024c0:	00813083          	ld	ra,8(sp)
    800024c4:	00013403          	ld	s0,0(sp)
    800024c8:	01010113          	addi	sp,sp,16
    800024cc:	00008067          	ret

00000000800024d0 <main>:
extern "C" void trap();
void userMain(void *);

int main(){
    800024d0:	fe010113          	addi	sp,sp,-32
    800024d4:	00113c23          	sd	ra,24(sp)
    800024d8:	00813823          	sd	s0,16(sp)
    800024dc:	00913423          	sd	s1,8(sp)
    800024e0:	01213023          	sd	s2,0(sp)
    800024e4:	02010413          	addi	s0,sp,32

    Riscv::w_stvec((uint64) &trap);
    800024e8:	00005797          	auipc	a5,0x5
    800024ec:	f687b783          	ld	a5,-152(a5) # 80007450 <_GLOBAL_OFFSET_TABLE_+0x28>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    800024f0:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800024f4:	00200793          	li	a5,2
    800024f8:	1007a073          	csrs	sstatus,a5
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);

    _thread* threads[2];

    threads[0] = _thread::createThread(nullptr, nullptr);
    800024fc:	00000593          	li	a1,0
    80002500:	00000513          	li	a0,0
    80002504:	fffff097          	auipc	ra,0xfffff
    80002508:	510080e7          	jalr	1296(ra) # 80001a14 <_ZN7_thread12createThreadEPFvPvES0_>
    8000250c:	00050913          	mv	s2,a0
    threads[1] = _thread::createThread(userMain, nullptr);
    80002510:	00000593          	li	a1,0
    80002514:	00005517          	auipc	a0,0x5
    80002518:	f3453503          	ld	a0,-204(a0) # 80007448 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000251c:	fffff097          	auipc	ra,0xfffff
    80002520:	4f8080e7          	jalr	1272(ra) # 80001a14 <_ZN7_thread12createThreadEPFvPvES0_>
    80002524:	00050493          	mv	s1,a0
    threads[1]->start();
    80002528:	fffff097          	auipc	ra,0xfffff
    8000252c:	418080e7          	jalr	1048(ra) # 80001940 <_ZN7_thread5startEv>

    _thread::running = threads[0];
    80002530:	00005797          	auipc	a5,0x5
    80002534:	f087b783          	ld	a5,-248(a5) # 80007438 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002538:	0127b023          	sd	s2,0(a5)
    bool isFinished() const { return finished; }
    8000253c:	0184c783          	lbu	a5,24(s1)

    while (!(threads[1]->isFinished()))
    80002540:	00079863          	bnez	a5,80002550 <main+0x80>
    {
        _thread::yield();
    80002544:	fffff097          	auipc	ra,0xfffff
    80002548:	368080e7          	jalr	872(ra) # 800018ac <_ZN7_thread5yieldEv>
    8000254c:	ff1ff06f          	j	8000253c <main+0x6c>
    }
    return 0;
}
    80002550:	00000513          	li	a0,0
    80002554:	01813083          	ld	ra,24(sp)
    80002558:	01013403          	ld	s0,16(sp)
    8000255c:	00813483          	ld	s1,8(sp)
    80002560:	00013903          	ld	s2,0(sp)
    80002564:	02010113          	addi	sp,sp,32
    80002568:	00008067          	ret

000000008000256c <_ZN7Blocked3getEv>:

#include "../h/Blocked.h"


_thread *Blocked::get()
{
    8000256c:	fe010113          	addi	sp,sp,-32
    80002570:	00113c23          	sd	ra,24(sp)
    80002574:	00813823          	sd	s0,16(sp)
    80002578:	00913423          	sd	s1,8(sp)
    8000257c:	02010413          	addi	s0,sp,32
    80002580:	00050793          	mv	a5,a0
    if (!head) return nullptr;
    80002584:	00053503          	ld	a0,0(a0)
    80002588:	02050e63          	beqz	a0,800025c4 <_ZN7Blocked3getEv+0x58>

    Elem* elem = head;
    head = head->next;
    8000258c:	00853703          	ld	a4,8(a0)
    80002590:	00e7b023          	sd	a4,0(a5)
    if (!head) tail = 0;
    80002594:	02070463          	beqz	a4,800025bc <_ZN7Blocked3getEv+0x50>

    _thread *ret = elem->data;
    80002598:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    8000259c:	00001097          	auipc	ra,0x1
    800025a0:	8c4080e7          	jalr	-1852(ra) # 80002e60 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    800025a4:	00048513          	mv	a0,s1
    800025a8:	01813083          	ld	ra,24(sp)
    800025ac:	01013403          	ld	s0,16(sp)
    800025b0:	00813483          	ld	s1,8(sp)
    800025b4:	02010113          	addi	sp,sp,32
    800025b8:	00008067          	ret
    if (!head) tail = 0;
    800025bc:	0007b423          	sd	zero,8(a5)
    800025c0:	fd9ff06f          	j	80002598 <_ZN7Blocked3getEv+0x2c>
    if (!head) return nullptr;
    800025c4:	00050493          	mv	s1,a0
    800025c8:	fddff06f          	j	800025a4 <_ZN7Blocked3getEv+0x38>

00000000800025cc <_ZN7Blocked3putEP7_thread>:

void Blocked::put(_thread *blocked)
{
    800025cc:	fe010113          	addi	sp,sp,-32
    800025d0:	00113c23          	sd	ra,24(sp)
    800025d4:	00813823          	sd	s0,16(sp)
    800025d8:	00913423          	sd	s1,8(sp)
    800025dc:	01213023          	sd	s2,0(sp)
    800025e0:	02010413          	addi	s0,sp,32
    800025e4:	00050493          	mv	s1,a0
    800025e8:	00058913          	mv	s2,a1
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800025ec:	00100513          	li	a0,1
    800025f0:	00000097          	auipc	ra,0x0
    800025f4:	69c080e7          	jalr	1692(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = blocked;
    800025f8:	01253023          	sd	s2,0(a0)
    elem->next = nullptr;
    800025fc:	00053423          	sd	zero,8(a0)
    if(tail){
    80002600:	0084b783          	ld	a5,8(s1)
    80002604:	02078263          	beqz	a5,80002628 <_ZN7Blocked3putEP7_thread+0x5c>
        tail->next = elem;
    80002608:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    8000260c:	00a4b423          	sd	a0,8(s1)
    }else{
        head = tail = elem;
    }
    80002610:	01813083          	ld	ra,24(sp)
    80002614:	01013403          	ld	s0,16(sp)
    80002618:	00813483          	ld	s1,8(sp)
    8000261c:	00013903          	ld	s2,0(sp)
    80002620:	02010113          	addi	sp,sp,32
    80002624:	00008067          	ret
        head = tail = elem;
    80002628:	00a4b423          	sd	a0,8(s1)
    8000262c:	00a4b023          	sd	a0,0(s1)
    80002630:	fe1ff06f          	j	80002610 <_ZN7Blocked3putEP7_thread+0x44>

0000000080002634 <_Z10wrapperRunPv>:
struct Wrapper {
    ptrOnFun func;
};

void wrapperRun(void* p){
    if(p == nullptr) return;
    80002634:	02050863          	beqz	a0,80002664 <_Z10wrapperRunPv+0x30>
void wrapperRun(void* p){
    80002638:	ff010113          	addi	sp,sp,-16
    8000263c:	00113423          	sd	ra,8(sp)
    80002640:	00813023          	sd	s0,0(sp)
    80002644:	01010413          	addi	s0,sp,16
    ((Thread*)p)->run();
    80002648:	00053783          	ld	a5,0(a0)
    8000264c:	0107b783          	ld	a5,16(a5)
    80002650:	000780e7          	jalr	a5
}
    80002654:	00813083          	ld	ra,8(sp)
    80002658:	00013403          	ld	s0,0(sp)
    8000265c:	01010113          	addi	sp,sp,16
    80002660:	00008067          	ret
    80002664:	00008067          	ret

0000000080002668 <_ZN6ThreadD1Ev>:

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    80002668:	ff010113          	addi	sp,sp,-16
    8000266c:	00113423          	sd	ra,8(sp)
    80002670:	00813023          	sd	s0,0(sp)
    80002674:	01010413          	addi	s0,sp,16
    80002678:	00005797          	auipc	a5,0x5
    8000267c:	d7878793          	addi	a5,a5,-648 # 800073f0 <_ZTV6Thread+0x10>
    80002680:	00f53023          	sd	a5,0(a0)
    thread_exit();
    80002684:	fffff097          	auipc	ra,0xfffff
    80002688:	eb4080e7          	jalr	-332(ra) # 80001538 <_Z11thread_exitv>
}
    8000268c:	00813083          	ld	ra,8(sp)
    80002690:	00013403          	ld	s0,0(sp)
    80002694:	01010113          	addi	sp,sp,16
    80002698:	00008067          	ret

000000008000269c <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    8000269c:	00005797          	auipc	a5,0x5
    800026a0:	d7c78793          	addi	a5,a5,-644 # 80007418 <_ZTV9Semaphore+0x10>
    800026a4:	00f53023          	sd	a5,0(a0)
    if (myHandle != nullptr) {
    800026a8:	00853503          	ld	a0,8(a0)
    800026ac:	02050663          	beqz	a0,800026d8 <_ZN9SemaphoreD1Ev+0x3c>
Semaphore::~Semaphore() {
    800026b0:	ff010113          	addi	sp,sp,-16
    800026b4:	00113423          	sd	ra,8(sp)
    800026b8:	00813023          	sd	s0,0(sp)
    800026bc:	01010413          	addi	s0,sp,16
        sem_close(myHandle);
    800026c0:	fffff097          	auipc	ra,0xfffff
    800026c4:	038080e7          	jalr	56(ra) # 800016f8 <_Z9sem_closeP4_sem>
    }
}
    800026c8:	00813083          	ld	ra,8(sp)
    800026cc:	00013403          	ld	s0,0(sp)
    800026d0:	01010113          	addi	sp,sp,16
    800026d4:	00008067          	ret
    800026d8:	00008067          	ret

00000000800026dc <_Znwm>:
void* operator new(size_t size){
    800026dc:	ff010113          	addi	sp,sp,-16
    800026e0:	00113423          	sd	ra,8(sp)
    800026e4:	00813023          	sd	s0,0(sp)
    800026e8:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    800026ec:	fffff097          	auipc	ra,0xfffff
    800026f0:	dcc080e7          	jalr	-564(ra) # 800014b8 <_Z9mem_allocm>
}
    800026f4:	00813083          	ld	ra,8(sp)
    800026f8:	00013403          	ld	s0,0(sp)
    800026fc:	01010113          	addi	sp,sp,16
    80002700:	00008067          	ret

0000000080002704 <_Znam>:
void* operator new[](size_t size){
    80002704:	ff010113          	addi	sp,sp,-16
    80002708:	00113423          	sd	ra,8(sp)
    8000270c:	00813023          	sd	s0,0(sp)
    80002710:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    80002714:	fffff097          	auipc	ra,0xfffff
    80002718:	da4080e7          	jalr	-604(ra) # 800014b8 <_Z9mem_allocm>
}
    8000271c:	00813083          	ld	ra,8(sp)
    80002720:	00013403          	ld	s0,0(sp)
    80002724:	01010113          	addi	sp,sp,16
    80002728:	00008067          	ret

000000008000272c <_ZdlPv>:
void operator delete(void * p){
    8000272c:	ff010113          	addi	sp,sp,-16
    80002730:	00113423          	sd	ra,8(sp)
    80002734:	00813023          	sd	s0,0(sp)
    80002738:	01010413          	addi	s0,sp,16
    mem_free(p);
    8000273c:	fffff097          	auipc	ra,0xfffff
    80002740:	dc4080e7          	jalr	-572(ra) # 80001500 <_Z8mem_freePv>
}
    80002744:	00813083          	ld	ra,8(sp)
    80002748:	00013403          	ld	s0,0(sp)
    8000274c:	01010113          	addi	sp,sp,16
    80002750:	00008067          	ret

0000000080002754 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80002754:	fe010113          	addi	sp,sp,-32
    80002758:	00113c23          	sd	ra,24(sp)
    8000275c:	00813823          	sd	s0,16(sp)
    80002760:	00913423          	sd	s1,8(sp)
    80002764:	02010413          	addi	s0,sp,32
    80002768:	00050493          	mv	s1,a0
}
    8000276c:	00000097          	auipc	ra,0x0
    80002770:	efc080e7          	jalr	-260(ra) # 80002668 <_ZN6ThreadD1Ev>
    80002774:	00048513          	mv	a0,s1
    80002778:	00000097          	auipc	ra,0x0
    8000277c:	fb4080e7          	jalr	-76(ra) # 8000272c <_ZdlPv>
    80002780:	01813083          	ld	ra,24(sp)
    80002784:	01013403          	ld	s0,16(sp)
    80002788:	00813483          	ld	s1,8(sp)
    8000278c:	02010113          	addi	sp,sp,32
    80002790:	00008067          	ret

0000000080002794 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002794:	fe010113          	addi	sp,sp,-32
    80002798:	00113c23          	sd	ra,24(sp)
    8000279c:	00813823          	sd	s0,16(sp)
    800027a0:	00913423          	sd	s1,8(sp)
    800027a4:	02010413          	addi	s0,sp,32
    800027a8:	00050493          	mv	s1,a0
}
    800027ac:	00000097          	auipc	ra,0x0
    800027b0:	ef0080e7          	jalr	-272(ra) # 8000269c <_ZN9SemaphoreD1Ev>
    800027b4:	00048513          	mv	a0,s1
    800027b8:	00000097          	auipc	ra,0x0
    800027bc:	f74080e7          	jalr	-140(ra) # 8000272c <_ZdlPv>
    800027c0:	01813083          	ld	ra,24(sp)
    800027c4:	01013403          	ld	s0,16(sp)
    800027c8:	00813483          	ld	s1,8(sp)
    800027cc:	02010113          	addi	sp,sp,32
    800027d0:	00008067          	ret

00000000800027d4 <_ZdaPv>:
void operator delete[](void * p){
    800027d4:	ff010113          	addi	sp,sp,-16
    800027d8:	00113423          	sd	ra,8(sp)
    800027dc:	00813023          	sd	s0,0(sp)
    800027e0:	01010413          	addi	s0,sp,16
    mem_free(p);
    800027e4:	fffff097          	auipc	ra,0xfffff
    800027e8:	d1c080e7          	jalr	-740(ra) # 80001500 <_Z8mem_freePv>
}
    800027ec:	00813083          	ld	ra,8(sp)
    800027f0:	00013403          	ld	s0,0(sp)
    800027f4:	01010113          	addi	sp,sp,16
    800027f8:	00008067          	ret

00000000800027fc <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    800027fc:	ff010113          	addi	sp,sp,-16
    80002800:	00113423          	sd	ra,8(sp)
    80002804:	00813023          	sd	s0,0(sp)
    80002808:	01010413          	addi	s0,sp,16
    8000280c:	00005797          	auipc	a5,0x5
    80002810:	be478793          	addi	a5,a5,-1052 # 800073f0 <_ZTV6Thread+0x10>
    80002814:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80002818:	00850513          	addi	a0,a0,8
    8000281c:	fffff097          	auipc	ra,0xfffff
    80002820:	d50080e7          	jalr	-688(ra) # 8000156c <_Z13thread_createPP7_threadPFvPvES2_>
}
    80002824:	00813083          	ld	ra,8(sp)
    80002828:	00013403          	ld	s0,0(sp)
    8000282c:	01010113          	addi	sp,sp,16
    80002830:	00008067          	ret

0000000080002834 <_ZN6Thread5startEv>:
int Thread::start() {
    80002834:	ff010113          	addi	sp,sp,-16
    80002838:	00113423          	sd	ra,8(sp)
    8000283c:	00813023          	sd	s0,0(sp)
    80002840:	01010413          	addi	s0,sp,16
    thread_start(myHandle);
    80002844:	00853503          	ld	a0,8(a0)
    80002848:	fffff097          	auipc	ra,0xfffff
    8000284c:	e44080e7          	jalr	-444(ra) # 8000168c <_Z12thread_startP7_thread>
}
    80002850:	00000513          	li	a0,0
    80002854:	00813083          	ld	ra,8(sp)
    80002858:	00013403          	ld	s0,0(sp)
    8000285c:	01010113          	addi	sp,sp,16
    80002860:	00008067          	ret

0000000080002864 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002864:	ff010113          	addi	sp,sp,-16
    80002868:	00113423          	sd	ra,8(sp)
    8000286c:	00813023          	sd	s0,0(sp)
    80002870:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002874:	fffff097          	auipc	ra,0xfffff
    80002878:	d78080e7          	jalr	-648(ra) # 800015ec <_Z15thread_dispatchv>
}
    8000287c:	00813083          	ld	ra,8(sp)
    80002880:	00013403          	ld	s0,0(sp)
    80002884:	01010113          	addi	sp,sp,16
    80002888:	00008067          	ret

000000008000288c <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    8000288c:	ff010113          	addi	sp,sp,-16
    80002890:	00813423          	sd	s0,8(sp)
    80002894:	01010413          	addi	s0,sp,16
}
    80002898:	00000513          	li	a0,0
    8000289c:	00813403          	ld	s0,8(sp)
    800028a0:	01010113          	addi	sp,sp,16
    800028a4:	00008067          	ret

00000000800028a8 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    800028a8:	ff010113          	addi	sp,sp,-16
    800028ac:	00113423          	sd	ra,8(sp)
    800028b0:	00813023          	sd	s0,0(sp)
    800028b4:	01010413          	addi	s0,sp,16
    800028b8:	00005797          	auipc	a5,0x5
    800028bc:	b3878793          	addi	a5,a5,-1224 # 800073f0 <_ZTV6Thread+0x10>
    800028c0:	00f53023          	sd	a5,0(a0)
    thread_create_only(&myHandle,wrapperRun,this);
    800028c4:	00050613          	mv	a2,a0
    800028c8:	00000597          	auipc	a1,0x0
    800028cc:	d6c58593          	addi	a1,a1,-660 # 80002634 <_Z10wrapperRunPv>
    800028d0:	00850513          	addi	a0,a0,8
    800028d4:	fffff097          	auipc	ra,0xfffff
    800028d8:	d44080e7          	jalr	-700(ra) # 80001618 <_Z18thread_create_onlyPP7_threadPFvPvES2_>
}
    800028dc:	00813083          	ld	ra,8(sp)
    800028e0:	00013403          	ld	s0,0(sp)
    800028e4:	01010113          	addi	sp,sp,16
    800028e8:	00008067          	ret

00000000800028ec <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800028ec:	ff010113          	addi	sp,sp,-16
    800028f0:	00113423          	sd	ra,8(sp)
    800028f4:	00813023          	sd	s0,0(sp)
    800028f8:	01010413          	addi	s0,sp,16
    800028fc:	00005797          	auipc	a5,0x5
    80002900:	b1c78793          	addi	a5,a5,-1252 # 80007418 <_ZTV9Semaphore+0x10>
    80002904:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80002908:	00850513          	addi	a0,a0,8
    8000290c:	fffff097          	auipc	ra,0xfffff
    80002910:	db0080e7          	jalr	-592(ra) # 800016bc <_Z8sem_openPP4_semj>
}
    80002914:	00813083          	ld	ra,8(sp)
    80002918:	00013403          	ld	s0,0(sp)
    8000291c:	01010113          	addi	sp,sp,16
    80002920:	00008067          	ret

0000000080002924 <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    if (myHandle != nullptr) {
    80002924:	00853503          	ld	a0,8(a0)
    80002928:	02050663          	beqz	a0,80002954 <_ZN9Semaphore4waitEv+0x30>
int Semaphore::wait() {
    8000292c:	ff010113          	addi	sp,sp,-16
    80002930:	00113423          	sd	ra,8(sp)
    80002934:	00813023          	sd	s0,0(sp)
    80002938:	01010413          	addi	s0,sp,16
        return sem_wait(myHandle);
    8000293c:	fffff097          	auipc	ra,0xfffff
    80002940:	df4080e7          	jalr	-524(ra) # 80001730 <_Z8sem_waitP4_sem>
    }
    return -1;
}
    80002944:	00813083          	ld	ra,8(sp)
    80002948:	00013403          	ld	s0,0(sp)
    8000294c:	01010113          	addi	sp,sp,16
    80002950:	00008067          	ret
    return -1;
    80002954:	fff00513          	li	a0,-1
}
    80002958:	00008067          	ret

000000008000295c <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    if (myHandle != nullptr) {
    8000295c:	00853503          	ld	a0,8(a0)
    80002960:	02050663          	beqz	a0,8000298c <_ZN9Semaphore6signalEv+0x30>
int Semaphore::signal() {
    80002964:	ff010113          	addi	sp,sp,-16
    80002968:	00113423          	sd	ra,8(sp)
    8000296c:	00813023          	sd	s0,0(sp)
    80002970:	01010413          	addi	s0,sp,16
        return sem_signal(myHandle);
    80002974:	fffff097          	auipc	ra,0xfffff
    80002978:	df4080e7          	jalr	-524(ra) # 80001768 <_Z10sem_signalP4_sem>
    }
    return -1;
}
    8000297c:	00813083          	ld	ra,8(sp)
    80002980:	00013403          	ld	s0,0(sp)
    80002984:	01010113          	addi	sp,sp,16
    80002988:	00008067          	ret
    return -1;
    8000298c:	fff00513          	li	a0,-1
}
    80002990:	00008067          	ret

0000000080002994 <_ZN7Console4getcEv>:

char Console::getc() {
    80002994:	ff010113          	addi	sp,sp,-16
    80002998:	00113423          	sd	ra,8(sp)
    8000299c:	00813023          	sd	s0,0(sp)
    800029a0:	01010413          	addi	s0,sp,16
    return ::getc();
    800029a4:	fffff097          	auipc	ra,0xfffff
    800029a8:	e2c080e7          	jalr	-468(ra) # 800017d0 <_Z4getcv>
}
    800029ac:	00813083          	ld	ra,8(sp)
    800029b0:	00013403          	ld	s0,0(sp)
    800029b4:	01010113          	addi	sp,sp,16
    800029b8:	00008067          	ret

00000000800029bc <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800029bc:	ff010113          	addi	sp,sp,-16
    800029c0:	00113423          	sd	ra,8(sp)
    800029c4:	00813023          	sd	s0,0(sp)
    800029c8:	01010413          	addi	s0,sp,16
    ::putc(c);
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	dd4080e7          	jalr	-556(ra) # 800017a0 <_Z4putcc>
    800029d4:	00813083          	ld	ra,8(sp)
    800029d8:	00013403          	ld	s0,0(sp)
    800029dc:	01010113          	addi	sp,sp,16
    800029e0:	00008067          	ret

00000000800029e4 <_ZN6Thread3runEv>:
    static int sleep(time_t);

    friend void wrapperRun(void* p);
protected:
    Thread();
    virtual void run(){};
    800029e4:	ff010113          	addi	sp,sp,-16
    800029e8:	00813423          	sd	s0,8(sp)
    800029ec:	01010413          	addi	s0,sp,16
    800029f0:	00813403          	ld	s0,8(sp)
    800029f4:	01010113          	addi	sp,sp,16
    800029f8:	00008067          	ret

00000000800029fc <_ZN5Riscv10popSppSpieEv>:


#include "../h/riscv.h"

void Riscv::popSppSpie()
{
    800029fc:	ff010113          	addi	sp,sp,-16
    80002a00:	00813423          	sd	s0,8(sp)
    80002a04:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002a08:	14109073          	csrw	sepc,ra
    80002a0c:	10000793          	li	a5,256
    80002a10:	1007a073          	csrs	sstatus,a5
    ms_sstatus(SSTATUS_SPP);
    __asm__ volatile ("sret");
    80002a14:	10200073          	sret
}
    80002a18:	00813403          	ld	s0,8(sp)
    80002a1c:	01010113          	addi	sp,sp,16
    80002a20:	00008067          	ret

0000000080002a24 <_ZN4_sem7semOpenEj>:
//

#include "../h/_sem.h"


sem_t _sem::semOpen(unsigned init) {
    80002a24:	fe010113          	addi	sp,sp,-32
    80002a28:	00113c23          	sd	ra,24(sp)
    80002a2c:	00813823          	sd	s0,16(sp)
    80002a30:	00913423          	sd	s1,8(sp)
    80002a34:	01213023          	sd	s2,0(sp)
    80002a38:	02010413          	addi	s0,sp,32
    80002a3c:	00050913          	mv	s2,a0
    _sem* ret = (_sem*)MemoryAllocator::getInstance()->mem_alloc((sizeof(_sem) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80002a40:	00000097          	auipc	ra,0x0
    80002a44:	38c080e7          	jalr	908(ra) # 80002dcc <_ZN15MemoryAllocator11getInstanceEv>
    80002a48:	00100513          	li	a0,1
    80002a4c:	00000097          	auipc	ra,0x0
    80002a50:	240080e7          	jalr	576(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
    80002a54:	00050493          	mv	s1,a0
    if (ret == nullptr) return ret;
    80002a58:	02050063          	beqz	a0,80002a78 <_ZN4_sem7semOpenEj+0x54>

    ret->init = init;
    80002a5c:	01252023          	sw	s2,0(a0)
    ret->blockedThreads = new Blocked();
    80002a60:	01000513          	li	a0,16
    80002a64:	00000097          	auipc	ra,0x0
    80002a68:	c78080e7          	jalr	-904(ra) # 800026dc <_Znwm>
    };
    Elem* head;
    Elem* tail;

    Blocked(){
        head = tail = 0;
    80002a6c:	00053423          	sd	zero,8(a0)
    80002a70:	00053023          	sd	zero,0(a0)
    80002a74:	00a4b423          	sd	a0,8(s1)
    return ret;
}
    80002a78:	00048513          	mv	a0,s1
    80002a7c:	01813083          	ld	ra,24(sp)
    80002a80:	01013403          	ld	s0,16(sp)
    80002a84:	00813483          	ld	s1,8(sp)
    80002a88:	00013903          	ld	s2,0(sp)
    80002a8c:	02010113          	addi	sp,sp,32
    80002a90:	00008067          	ret

0000000080002a94 <_ZN4_sem5blockEv>:
    if (id == nullptr) return -1;
    if (++id->init <= 0) id->deblock();
    return 0;
}

void _sem::block(){
    80002a94:	fe010113          	addi	sp,sp,-32
    80002a98:	00113c23          	sd	ra,24(sp)
    80002a9c:	00813823          	sd	s0,16(sp)
    80002aa0:	00913423          	sd	s1,8(sp)
    80002aa4:	01213023          	sd	s2,0(sp)
    80002aa8:	02010413          	addi	s0,sp,32

    _thread *old = _thread::running;
    80002aac:	00005917          	auipc	s2,0x5
    80002ab0:	98c93903          	ld	s2,-1652(s2) # 80007438 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002ab4:	00093483          	ld	s1,0(s2)

    void setFinished(bool value) { finished = value; }

    bool isBlocked() const { return blocked; }

    void setBlocked(bool value) { blocked = value; }
    80002ab8:	00100793          	li	a5,1
    80002abc:	00f48ca3          	sb	a5,25(s1)
    old->setBlocked(true);
    this->blockedThreads->put(old);
    80002ac0:	00048593          	mv	a1,s1
    80002ac4:	00853503          	ld	a0,8(a0)
    80002ac8:	00000097          	auipc	ra,0x0
    80002acc:	b04080e7          	jalr	-1276(ra) # 800025cc <_ZN7Blocked3putEP7_thread>
    _thread::running = Scheduler::get();
    80002ad0:	00000097          	auipc	ra,0x0
    80002ad4:	844080e7          	jalr	-1980(ra) # 80002314 <_ZN9Scheduler3getEv>
    80002ad8:	00a93023          	sd	a0,0(s2)
    _thread::contextSwitch(&old->context, &_thread::running->context);
    80002adc:	02850593          	addi	a1,a0,40
    80002ae0:	02848513          	addi	a0,s1,40
    80002ae4:	ffffe097          	auipc	ra,0xffffe
    80002ae8:	744080e7          	jalr	1860(ra) # 80001228 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>

}
    80002aec:	01813083          	ld	ra,24(sp)
    80002af0:	01013403          	ld	s0,16(sp)
    80002af4:	00813483          	ld	s1,8(sp)
    80002af8:	00013903          	ld	s2,0(sp)
    80002afc:	02010113          	addi	sp,sp,32
    80002b00:	00008067          	ret

0000000080002b04 <_ZN4_sem7semWaitEPS_>:
    if (id == nullptr) return -1;
    80002b04:	04050663          	beqz	a0,80002b50 <_ZN4_sem7semWaitEPS_+0x4c>
    if (--id->init < 0) id->block();
    80002b08:	00052783          	lw	a5,0(a0)
    80002b0c:	fff7879b          	addiw	a5,a5,-1
    80002b10:	00f52023          	sw	a5,0(a0)
    80002b14:	02079713          	slli	a4,a5,0x20
    80002b18:	00074663          	bltz	a4,80002b24 <_ZN4_sem7semWaitEPS_+0x20>
    return 0;
    80002b1c:	00000513          	li	a0,0
}
    80002b20:	00008067          	ret
int _sem::semWait(sem_t id){
    80002b24:	ff010113          	addi	sp,sp,-16
    80002b28:	00113423          	sd	ra,8(sp)
    80002b2c:	00813023          	sd	s0,0(sp)
    80002b30:	01010413          	addi	s0,sp,16
    if (--id->init < 0) id->block();
    80002b34:	00000097          	auipc	ra,0x0
    80002b38:	f60080e7          	jalr	-160(ra) # 80002a94 <_ZN4_sem5blockEv>
    return 0;
    80002b3c:	00000513          	li	a0,0
}
    80002b40:	00813083          	ld	ra,8(sp)
    80002b44:	00013403          	ld	s0,0(sp)
    80002b48:	01010113          	addi	sp,sp,16
    80002b4c:	00008067          	ret
    if (id == nullptr) return -1;
    80002b50:	fff00513          	li	a0,-1
    80002b54:	00008067          	ret

0000000080002b58 <_ZN4_sem7deblockEv>:

void _sem::deblock(){
    80002b58:	ff010113          	addi	sp,sp,-16
    80002b5c:	00113423          	sd	ra,8(sp)
    80002b60:	00813023          	sd	s0,0(sp)
    80002b64:	01010413          	addi	s0,sp,16
    _thread* t = this->blockedThreads->get();
    80002b68:	00853503          	ld	a0,8(a0)
    80002b6c:	00000097          	auipc	ra,0x0
    80002b70:	a00080e7          	jalr	-1536(ra) # 8000256c <_ZN7Blocked3getEv>
    80002b74:	00050ca3          	sb	zero,25(a0)
    t->setBlocked(false);
    Scheduler::put(t);
    80002b78:	00000097          	auipc	ra,0x0
    80002b7c:	804080e7          	jalr	-2044(ra) # 8000237c <_ZN9Scheduler3putEP7_thread>
    80002b80:	00813083          	ld	ra,8(sp)
    80002b84:	00013403          	ld	s0,0(sp)
    80002b88:	01010113          	addi	sp,sp,16
    80002b8c:	00008067          	ret

0000000080002b90 <_ZN4_sem8semCloseEPS_>:
int _sem::semClose(sem_t handle){
    80002b90:	fe010113          	addi	sp,sp,-32
    80002b94:	00113c23          	sd	ra,24(sp)
    80002b98:	00813823          	sd	s0,16(sp)
    80002b9c:	00913423          	sd	s1,8(sp)
    80002ba0:	02010413          	addi	s0,sp,32
    80002ba4:	00050493          	mv	s1,a0
    if (handle == nullptr) return -1;
    80002ba8:	04050263          	beqz	a0,80002bec <_ZN4_sem8semCloseEPS_+0x5c>
    while (handle->blockedThreads->head != nullptr) handle->deblock();
    80002bac:	0084b783          	ld	a5,8(s1)
    80002bb0:	0007b783          	ld	a5,0(a5)
    80002bb4:	00078a63          	beqz	a5,80002bc8 <_ZN4_sem8semCloseEPS_+0x38>
    80002bb8:	00048513          	mv	a0,s1
    80002bbc:	00000097          	auipc	ra,0x0
    80002bc0:	f9c080e7          	jalr	-100(ra) # 80002b58 <_ZN4_sem7deblockEv>
    80002bc4:	fe9ff06f          	j	80002bac <_ZN4_sem8semCloseEPS_+0x1c>
    MemoryAllocator::mem_free(handle);
    80002bc8:	00048513          	mv	a0,s1
    80002bcc:	00000097          	auipc	ra,0x0
    80002bd0:	294080e7          	jalr	660(ra) # 80002e60 <_ZN15MemoryAllocator8mem_freeEPv>
    return 0;
    80002bd4:	00000513          	li	a0,0
}
    80002bd8:	01813083          	ld	ra,24(sp)
    80002bdc:	01013403          	ld	s0,16(sp)
    80002be0:	00813483          	ld	s1,8(sp)
    80002be4:	02010113          	addi	sp,sp,32
    80002be8:	00008067          	ret
    if (handle == nullptr) return -1;
    80002bec:	fff00513          	li	a0,-1
    80002bf0:	fe9ff06f          	j	80002bd8 <_ZN4_sem8semCloseEPS_+0x48>

0000000080002bf4 <_ZN4_sem9semSignalEPS_>:
    if (id == nullptr) return -1;
    80002bf4:	04050663          	beqz	a0,80002c40 <_ZN4_sem9semSignalEPS_+0x4c>
    if (++id->init <= 0) id->deblock();
    80002bf8:	00052783          	lw	a5,0(a0)
    80002bfc:	0017879b          	addiw	a5,a5,1
    80002c00:	0007871b          	sext.w	a4,a5
    80002c04:	00f52023          	sw	a5,0(a0)
    80002c08:	00e05663          	blez	a4,80002c14 <_ZN4_sem9semSignalEPS_+0x20>
    return 0;
    80002c0c:	00000513          	li	a0,0
}
    80002c10:	00008067          	ret
int _sem::semSignal(sem_t id){
    80002c14:	ff010113          	addi	sp,sp,-16
    80002c18:	00113423          	sd	ra,8(sp)
    80002c1c:	00813023          	sd	s0,0(sp)
    80002c20:	01010413          	addi	s0,sp,16
    if (++id->init <= 0) id->deblock();
    80002c24:	00000097          	auipc	ra,0x0
    80002c28:	f34080e7          	jalr	-204(ra) # 80002b58 <_ZN4_sem7deblockEv>
    return 0;
    80002c2c:	00000513          	li	a0,0
}
    80002c30:	00813083          	ld	ra,8(sp)
    80002c34:	00013403          	ld	s0,0(sp)
    80002c38:	01010113          	addi	sp,sp,16
    80002c3c:	00008067          	ret
    if (id == nullptr) return -1;
    80002c40:	fff00513          	li	a0,-1
    80002c44:	00008067          	ret

0000000080002c48 <_Z41__static_initialization_and_destruction_0ii>:
            if (cur) cur->next = newSeg;
            else fmem_head = newSeg;
            return 0;
        }
    }
}
    80002c48:	ff010113          	addi	sp,sp,-16
    80002c4c:	00813423          	sd	s0,8(sp)
    80002c50:	01010413          	addi	s0,sp,16
    80002c54:	00100793          	li	a5,1
    80002c58:	00f50863          	beq	a0,a5,80002c68 <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002c5c:	00813403          	ld	s0,8(sp)
    80002c60:	01010113          	addi	sp,sp,16
    80002c64:	00008067          	ret
    80002c68:	000107b7          	lui	a5,0x10
    80002c6c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002c70:	fef596e3          	bne	a1,a5,80002c5c <_Z41__static_initialization_and_destruction_0ii+0x14>
MemoryAllocator::FreeMem* MemoryAllocator::fmem_head = (MemoryAllocator::FreeMem*)HEAP_START_ADDR; //stavila onako
    80002c74:	00004797          	auipc	a5,0x4
    80002c78:	7bc7b783          	ld	a5,1980(a5) # 80007430 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002c7c:	0007b783          	ld	a5,0(a5)
    80002c80:	00005717          	auipc	a4,0x5
    80002c84:	86f73823          	sd	a5,-1936(a4) # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
}
    80002c88:	fd5ff06f          	j	80002c5c <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002c8c <_ZN15MemoryAllocator9mem_allocEm>:
void *MemoryAllocator::mem_alloc(size_t size) {
    80002c8c:	ff010113          	addi	sp,sp,-16
    80002c90:	00813423          	sd	s0,8(sp)
    80002c94:	01010413          	addi	s0,sp,16
    if (size <=0) return nullptr;
    80002c98:	12050663          	beqz	a0,80002dc4 <_ZN15MemoryAllocator9mem_allocEm+0x138>
    80002c9c:	00050793          	mv	a5,a0
    FreeMem* cur = fmem_head;
    80002ca0:	00005517          	auipc	a0,0x5
    80002ca4:	85053503          	ld	a0,-1968(a0) # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
    for(;cur !=0; cur = cur->next){
    80002ca8:	0e050e63          	beqz	a0,80002da4 <_ZN15MemoryAllocator9mem_allocEm+0x118>
        if(cur->size < (size)*MEM_BLOCK_SIZE) continue;
    80002cac:	01053703          	ld	a4,16(a0)
    80002cb0:	00679693          	slli	a3,a5,0x6
    80002cb4:	04d76c63          	bltu	a4,a3,80002d0c <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(cur->size - (size)*MEM_BLOCK_SIZE < sizeof(FreeMem)){
    80002cb8:	40d70733          	sub	a4,a4,a3
    80002cbc:	01700793          	li	a5,23
    80002cc0:	06e7e263          	bltu	a5,a4,80002d24 <_ZN15MemoryAllocator9mem_allocEm+0x98>
            if(cur->prev) cur->prev->next = cur->next;
    80002cc4:	00853783          	ld	a5,8(a0)
    80002cc8:	04078663          	beqz	a5,80002d14 <_ZN15MemoryAllocator9mem_allocEm+0x88>
    80002ccc:	00053703          	ld	a4,0(a0)
    80002cd0:	00e7b023          	sd	a4,0(a5)
            if(cur->next) cur->next->prev = cur->prev;
    80002cd4:	00053783          	ld	a5,0(a0)
    80002cd8:	00078663          	beqz	a5,80002ce4 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002cdc:	00853703          	ld	a4,8(a0)
    80002ce0:	00e7b423          	sd	a4,8(a5)
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    80002ce4:	00005617          	auipc	a2,0x5
    80002ce8:	81463603          	ld	a2,-2028(a2) # 800074f8 <_ZN15MemoryAllocator9full_headE>
    80002cec:	08060063          	beqz	a2,80002d6c <_ZN15MemoryAllocator9mem_allocEm+0xe0>
    80002cf0:	08c56263          	bltu	a0,a2,80002d74 <_ZN15MemoryAllocator9mem_allocEm+0xe8>
            for (tmp = full_head; tmp->next != nullptr && (char *) cur > (char *) (tmp->next); tmp = tmp->next);
    80002cf4:	00060793          	mv	a5,a2
    80002cf8:	00078713          	mv	a4,a5
    80002cfc:	0007b783          	ld	a5,0(a5)
    80002d00:	06078c63          	beqz	a5,80002d78 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    80002d04:	fea7eae3          	bltu	a5,a0,80002cf8 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    80002d08:	0700006f          	j	80002d78 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    for(;cur !=0; cur = cur->next){
    80002d0c:	00053503          	ld	a0,0(a0)
    80002d10:	f99ff06f          	j	80002ca8 <_ZN15MemoryAllocator9mem_allocEm+0x1c>
            else fmem_head = cur->next;
    80002d14:	00053783          	ld	a5,0(a0)
    80002d18:	00004717          	auipc	a4,0x4
    80002d1c:	7cf73c23          	sd	a5,2008(a4) # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
    80002d20:	fb5ff06f          	j	80002cd4 <_ZN15MemoryAllocator9mem_allocEm+0x48>
            FreeMem* newfrgm = (FreeMem*)((char*)cur + (size)*MEM_BLOCK_SIZE);
    80002d24:	00d507b3          	add	a5,a0,a3
            newfrgm->prev = cur->prev;
    80002d28:	00853703          	ld	a4,8(a0)
    80002d2c:	00e7b423          	sd	a4,8(a5)
            newfrgm->next = cur->next;
    80002d30:	00053703          	ld	a4,0(a0)
    80002d34:	00e7b023          	sd	a4,0(a5)
            newfrgm->size = cur->size - (size)*MEM_BLOCK_SIZE;
    80002d38:	01053703          	ld	a4,16(a0)
    80002d3c:	40d70733          	sub	a4,a4,a3
    80002d40:	00e7b823          	sd	a4,16(a5)
            if(cur->prev) cur->prev->next = newfrgm;
    80002d44:	00853703          	ld	a4,8(a0)
    80002d48:	00070c63          	beqz	a4,80002d60 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    80002d4c:	00f73023          	sd	a5,0(a4)
            if(cur->next) cur->next->prev = newfrgm;
    80002d50:	00053703          	ld	a4,0(a0)
    80002d54:	f80708e3          	beqz	a4,80002ce4 <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002d58:	00f73423          	sd	a5,8(a4)
    80002d5c:	f89ff06f          	j	80002ce4 <_ZN15MemoryAllocator9mem_allocEm+0x58>
            else fmem_head = newfrgm;
    80002d60:	00004717          	auipc	a4,0x4
    80002d64:	78f73823          	sd	a5,1936(a4) # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
    80002d68:	fe9ff06f          	j	80002d50 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    80002d6c:	00060713          	mv	a4,a2
    80002d70:	0080006f          	j	80002d78 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    80002d74:	00000713          	li	a4,0
        newSeg->size = (size)*MEM_BLOCK_SIZE ;
    80002d78:	00d53823          	sd	a3,16(a0)
        newSeg->prev = tmp;
    80002d7c:	00e53423          	sd	a4,8(a0)
        if (tmp) newSeg->next = tmp->next;
    80002d80:	02070863          	beqz	a4,80002db0 <_ZN15MemoryAllocator9mem_allocEm+0x124>
    80002d84:	00073783          	ld	a5,0(a4)
    80002d88:	00f53023          	sd	a5,0(a0)
        if(newSeg->next) newSeg->next->prev = newSeg;
    80002d8c:	00053783          	ld	a5,0(a0)
    80002d90:	00078463          	beqz	a5,80002d98 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
    80002d94:	00a7b423          	sd	a0,8(a5)
        if (tmp) tmp->next = newSeg;
    80002d98:	02070063          	beqz	a4,80002db8 <_ZN15MemoryAllocator9mem_allocEm+0x12c>
    80002d9c:	00a73023          	sd	a0,0(a4)
        return (void*)((char*)cur+headSize);
    80002da0:	01850513          	addi	a0,a0,24
}
    80002da4:	00813403          	ld	s0,8(sp)
    80002da8:	01010113          	addi	sp,sp,16
    80002dac:	00008067          	ret
        else newSeg->next = full_head;
    80002db0:	00c53023          	sd	a2,0(a0)
    80002db4:	fd9ff06f          	j	80002d8c <_ZN15MemoryAllocator9mem_allocEm+0x100>
        else full_head = newSeg;
    80002db8:	00004797          	auipc	a5,0x4
    80002dbc:	74a7b023          	sd	a0,1856(a5) # 800074f8 <_ZN15MemoryAllocator9full_headE>
    80002dc0:	fe1ff06f          	j	80002da0 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    if (size <=0) return nullptr;
    80002dc4:	00000513          	li	a0,0
    80002dc8:	fddff06f          	j	80002da4 <_ZN15MemoryAllocator9mem_allocEm+0x118>

0000000080002dcc <_ZN15MemoryAllocator11getInstanceEv>:
    if (memoryAllocator == nullptr) {
    80002dcc:	00004797          	auipc	a5,0x4
    80002dd0:	7347b783          	ld	a5,1844(a5) # 80007500 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002dd4:	00078863          	beqz	a5,80002de4 <_ZN15MemoryAllocator11getInstanceEv+0x18>
}
    80002dd8:	00004517          	auipc	a0,0x4
    80002ddc:	72853503          	ld	a0,1832(a0) # 80007500 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002de0:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    80002de4:	fe010113          	addi	sp,sp,-32
    80002de8:	00113c23          	sd	ra,24(sp)
    80002dec:	00813823          	sd	s0,16(sp)
    80002df0:	00913423          	sd	s1,8(sp)
    80002df4:	02010413          	addi	s0,sp,32
        fmem_head = (FreeMem*)HEAP_START_ADDR;
    80002df8:	00004697          	auipc	a3,0x4
    80002dfc:	6386b683          	ld	a3,1592(a3) # 80007430 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002e00:	0006b783          	ld	a5,0(a3)
    80002e04:	00004497          	auipc	s1,0x4
    80002e08:	6ec48493          	addi	s1,s1,1772 # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
    80002e0c:	00f4b023          	sd	a5,0(s1)
        fmem_head->next = nullptr;
    80002e10:	0007b023          	sd	zero,0(a5)
        fmem_head->prev = nullptr;
    80002e14:	0004b703          	ld	a4,0(s1)
    80002e18:	00073423          	sd	zero,8(a4)
        fmem_head->size = (size_t)HEAP_END_ADDR -(size_t )HEAP_START_ADDR;
    80002e1c:	00004797          	auipc	a5,0x4
    80002e20:	63c7b783          	ld	a5,1596(a5) # 80007458 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002e24:	0007b783          	ld	a5,0(a5)
    80002e28:	0006b683          	ld	a3,0(a3)
    80002e2c:	40d787b3          	sub	a5,a5,a3
    80002e30:	00f73823          	sd	a5,16(a4)
        memoryAllocator = (MemoryAllocator*)MemoryAllocator::mem_alloc((sizeof(MemoryAllocator)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    80002e34:	00100513          	li	a0,1
    80002e38:	00000097          	auipc	ra,0x0
    80002e3c:	e54080e7          	jalr	-428(ra) # 80002c8c <_ZN15MemoryAllocator9mem_allocEm>
    80002e40:	00a4b823          	sd	a0,16(s1)
}
    80002e44:	00004517          	auipc	a0,0x4
    80002e48:	6bc53503          	ld	a0,1724(a0) # 80007500 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002e4c:	01813083          	ld	ra,24(sp)
    80002e50:	01013403          	ld	s0,16(sp)
    80002e54:	00813483          	ld	s1,8(sp)
    80002e58:	02010113          	addi	sp,sp,32
    80002e5c:	00008067          	ret

0000000080002e60 <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void *addr) {
    80002e60:	ff010113          	addi	sp,sp,-16
    80002e64:	00813423          	sd	s0,8(sp)
    80002e68:	01010413          	addi	s0,sp,16
    if (addr == nullptr) return -2;
    80002e6c:	1a050063          	beqz	a0,8000300c <_ZN15MemoryAllocator8mem_freeEPv+0x1ac>
    addr = (void*)((char*)addr-headSize);
    80002e70:	fe850713          	addi	a4,a0,-24
    FullMem* tmp = full_head;
    80002e74:	00004797          	auipc	a5,0x4
    80002e78:	6847b783          	ld	a5,1668(a5) # 800074f8 <_ZN15MemoryAllocator9full_headE>
    bool flag = false;
    80002e7c:	0080006f          	j	80002e84 <_ZN15MemoryAllocator8mem_freeEPv+0x24>
    for(; tmp && dSeg>=tmp; tmp = tmp->next){
    80002e80:	0007b783          	ld	a5,0(a5)
    80002e84:	00078a63          	beqz	a5,80002e98 <_ZN15MemoryAllocator8mem_freeEPv+0x38>
    80002e88:	08f76663          	bltu	a4,a5,80002f14 <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        if(tmp == dSeg) {
    80002e8c:	fee79ae3          	bne	a5,a4,80002e80 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
            flag = true;
    80002e90:	00100693          	li	a3,1
    80002e94:	0080006f          	j	80002e9c <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    bool flag = false;
    80002e98:	00000693          	li	a3,0
    if (!flag) return -1;
    80002e9c:	16068c63          	beqz	a3,80003014 <_ZN15MemoryAllocator8mem_freeEPv+0x1b4>
    if (tmp->prev) tmp->prev->next = tmp->next;
    80002ea0:	0087b683          	ld	a3,8(a5)
    80002ea4:	06068c63          	beqz	a3,80002f1c <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80002ea8:	0007b603          	ld	a2,0(a5)
    80002eac:	00c6b023          	sd	a2,0(a3)
    if (tmp->next) tmp->next->prev = tmp->prev;
    80002eb0:	0007b683          	ld	a3,0(a5)
    80002eb4:	00068663          	beqz	a3,80002ec0 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
    80002eb8:	0087b603          	ld	a2,8(a5)
    80002ebc:	00c6b423          	sd	a2,8(a3)
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002ec0:	00004597          	auipc	a1,0x4
    80002ec4:	6305b583          	ld	a1,1584(a1) # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
    80002ec8:	08058263          	beqz	a1,80002f4c <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    80002ecc:	08b76463          	bltu	a4,a1,80002f54 <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
        for (cur = fmem_head; cur->next != nullptr && (char*)addr>(char*)(cur->next); cur = cur->next);
    80002ed0:	00058693          	mv	a3,a1
    80002ed4:	00068613          	mv	a2,a3
    80002ed8:	0006b683          	ld	a3,0(a3)
    80002edc:	00068463          	beqz	a3,80002ee4 <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    80002ee0:	fee6eae3          	bltu	a3,a4,80002ed4 <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if(cur && (char*)cur+cur->size == addr){
    80002ee4:	06060a63          	beqz	a2,80002f58 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002ee8:	01063803          	ld	a6,16(a2)
    80002eec:	010608b3          	add	a7,a2,a6
    80002ef0:	06e89463          	bne	a7,a4,80002f58 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
        cur->size += tmp->size;
    80002ef4:	0107b783          	ld	a5,16(a5)
    80002ef8:	00f80833          	add	a6,a6,a5
    80002efc:	01063823          	sd	a6,16(a2)
        if (cur->next && (char*)((char*)cur+ cur->size) == (char*)(cur->next)){
    80002f00:	00068663          	beqz	a3,80002f0c <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002f04:	010607b3          	add	a5,a2,a6
    80002f08:	02f68263          	beq	a3,a5,80002f2c <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
        return 0;
    80002f0c:	00000513          	li	a0,0
    80002f10:	0900006f          	j	80002fa0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    bool flag = false;
    80002f14:	00000693          	li	a3,0
    80002f18:	f85ff06f          	j	80002e9c <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    else full_head = tmp->next;
    80002f1c:	0007b683          	ld	a3,0(a5)
    80002f20:	00004617          	auipc	a2,0x4
    80002f24:	5cd63c23          	sd	a3,1496(a2) # 800074f8 <_ZN15MemoryAllocator9full_headE>
    80002f28:	f89ff06f          	j	80002eb0 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
            cur->size += cur->next->size;
    80002f2c:	0106b783          	ld	a5,16(a3)
    80002f30:	00f80833          	add	a6,a6,a5
    80002f34:	01063823          	sd	a6,16(a2)
            cur->next = cur->next->next;
    80002f38:	0006b783          	ld	a5,0(a3)
    80002f3c:	00f63023          	sd	a5,0(a2)
            if (cur->next) cur->next->prev = cur;
    80002f40:	fc0786e3          	beqz	a5,80002f0c <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    80002f44:	00c7b423          	sd	a2,8(a5)
    80002f48:	fc5ff06f          	j	80002f0c <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002f4c:	00058613          	mv	a2,a1
    80002f50:	0080006f          	j	80002f58 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002f54:	00000613          	li	a2,0
        FreeMem* nxtSeg = cur?cur->next:fmem_head;
    80002f58:	00060463          	beqz	a2,80002f60 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    80002f5c:	00063583          	ld	a1,0(a2)
        if(nxtSeg && (char*)((char*)tmp + tmp->size) == (char*) nxtSeg){
    80002f60:	00058863          	beqz	a1,80002f70 <_ZN15MemoryAllocator8mem_freeEPv+0x110>
    80002f64:	0107b683          	ld	a3,16(a5)
    80002f68:	00d78833          	add	a6,a5,a3
    80002f6c:	04b80063          	beq	a6,a1,80002fac <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
            newSeg->size = tmp->size;
    80002f70:	0107b783          	ld	a5,16(a5)
    80002f74:	fef53c23          	sd	a5,-8(a0)
            newSeg->prev = cur;
    80002f78:	fec53823          	sd	a2,-16(a0)
            if(cur) newSeg->next = cur->next;
    80002f7c:	06060a63          	beqz	a2,80002ff0 <_ZN15MemoryAllocator8mem_freeEPv+0x190>
    80002f80:	00063783          	ld	a5,0(a2)
    80002f84:	fef53423          	sd	a5,-24(a0)
            if(newSeg->next) newSeg->next->prev = newSeg;
    80002f88:	fe853783          	ld	a5,-24(a0)
    80002f8c:	00078463          	beqz	a5,80002f94 <_ZN15MemoryAllocator8mem_freeEPv+0x134>
    80002f90:	00e7b423          	sd	a4,8(a5)
            if (cur) cur->next = newSeg;
    80002f94:	06060663          	beqz	a2,80003000 <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
    80002f98:	00e63023          	sd	a4,0(a2)
            return 0;
    80002f9c:	00000513          	li	a0,0
}
    80002fa0:	00813403          	ld	s0,8(sp)
    80002fa4:	01010113          	addi	sp,sp,16
    80002fa8:	00008067          	ret
            newSeg->size = nxtSeg->size + tmp->size;
    80002fac:	0105b783          	ld	a5,16(a1)
    80002fb0:	00f686b3          	add	a3,a3,a5
    80002fb4:	fed53c23          	sd	a3,-8(a0)
            newSeg->prev = nxtSeg->prev;
    80002fb8:	0085b783          	ld	a5,8(a1)
    80002fbc:	fef53823          	sd	a5,-16(a0)
            newSeg->next = nxtSeg->next;
    80002fc0:	0005b783          	ld	a5,0(a1)
    80002fc4:	fef53423          	sd	a5,-24(a0)
            if(nxtSeg->next) nxtSeg->next->prev = newSeg;
    80002fc8:	00078463          	beqz	a5,80002fd0 <_ZN15MemoryAllocator8mem_freeEPv+0x170>
    80002fcc:	00e7b423          	sd	a4,8(a5)
            if(nxtSeg->prev) nxtSeg->prev->next = newSeg;
    80002fd0:	0085b783          	ld	a5,8(a1)
    80002fd4:	00078863          	beqz	a5,80002fe4 <_ZN15MemoryAllocator8mem_freeEPv+0x184>
    80002fd8:	00e7b023          	sd	a4,0(a5)
            return 0;
    80002fdc:	00000513          	li	a0,0
    80002fe0:	fc1ff06f          	j	80002fa0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
            else fmem_head = newSeg;
    80002fe4:	00004797          	auipc	a5,0x4
    80002fe8:	50e7b623          	sd	a4,1292(a5) # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
    80002fec:	ff1ff06f          	j	80002fdc <_ZN15MemoryAllocator8mem_freeEPv+0x17c>
            else newSeg->next =fmem_head;
    80002ff0:	00004797          	auipc	a5,0x4
    80002ff4:	5007b783          	ld	a5,1280(a5) # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
    80002ff8:	fef53423          	sd	a5,-24(a0)
    80002ffc:	f8dff06f          	j	80002f88 <_ZN15MemoryAllocator8mem_freeEPv+0x128>
            else fmem_head = newSeg;
    80003000:	00004797          	auipc	a5,0x4
    80003004:	4ee7b823          	sd	a4,1264(a5) # 800074f0 <_ZN15MemoryAllocator9fmem_headE>
    80003008:	f95ff06f          	j	80002f9c <_ZN15MemoryAllocator8mem_freeEPv+0x13c>
    if (addr == nullptr) return -2;
    8000300c:	ffe00513          	li	a0,-2
    80003010:	f91ff06f          	j	80002fa0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    if (!flag) return -1;
    80003014:	fff00513          	li	a0,-1
    80003018:	f89ff06f          	j	80002fa0 <_ZN15MemoryAllocator8mem_freeEPv+0x140>

000000008000301c <_GLOBAL__sub_I__ZN15MemoryAllocator9fmem_headE>:
}
    8000301c:	ff010113          	addi	sp,sp,-16
    80003020:	00113423          	sd	ra,8(sp)
    80003024:	00813023          	sd	s0,0(sp)
    80003028:	01010413          	addi	s0,sp,16
    8000302c:	000105b7          	lui	a1,0x10
    80003030:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80003034:	00100513          	li	a0,1
    80003038:	00000097          	auipc	ra,0x0
    8000303c:	c10080e7          	jalr	-1008(ra) # 80002c48 <_Z41__static_initialization_and_destruction_0ii>
    80003040:	00813083          	ld	ra,8(sp)
    80003044:	00013403          	ld	s0,0(sp)
    80003048:	01010113          	addi	sp,sp,16
    8000304c:	00008067          	ret

0000000080003050 <_ZN9BufferCPPC1Ei>:
//
// Created by os on 6/28/22.
//
#include "buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003050:	fd010113          	addi	sp,sp,-48
    80003054:	02113423          	sd	ra,40(sp)
    80003058:	02813023          	sd	s0,32(sp)
    8000305c:	00913c23          	sd	s1,24(sp)
    80003060:	01213823          	sd	s2,16(sp)
    80003064:	01313423          	sd	s3,8(sp)
    80003068:	03010413          	addi	s0,sp,48
    8000306c:	00050493          	mv	s1,a0
    80003070:	00058913          	mv	s2,a1
    80003074:	0015879b          	addiw	a5,a1,1
    80003078:	0007851b          	sext.w	a0,a5
    8000307c:	00f4a023          	sw	a5,0(s1)
    80003080:	0004a823          	sw	zero,16(s1)
    80003084:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80003088:	00251513          	slli	a0,a0,0x2
    8000308c:	ffffe097          	auipc	ra,0xffffe
    80003090:	42c080e7          	jalr	1068(ra) # 800014b8 <_Z9mem_allocm>
    80003094:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80003098:	01000513          	li	a0,16
    8000309c:	fffff097          	auipc	ra,0xfffff
    800030a0:	640080e7          	jalr	1600(ra) # 800026dc <_Znwm>
    800030a4:	00050993          	mv	s3,a0
    800030a8:	00000593          	li	a1,0
    800030ac:	00000097          	auipc	ra,0x0
    800030b0:	840080e7          	jalr	-1984(ra) # 800028ec <_ZN9SemaphoreC1Ej>
    800030b4:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800030b8:	01000513          	li	a0,16
    800030bc:	fffff097          	auipc	ra,0xfffff
    800030c0:	620080e7          	jalr	1568(ra) # 800026dc <_Znwm>
    800030c4:	00050993          	mv	s3,a0
    800030c8:	00090593          	mv	a1,s2
    800030cc:	00000097          	auipc	ra,0x0
    800030d0:	820080e7          	jalr	-2016(ra) # 800028ec <_ZN9SemaphoreC1Ej>
    800030d4:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800030d8:	01000513          	li	a0,16
    800030dc:	fffff097          	auipc	ra,0xfffff
    800030e0:	600080e7          	jalr	1536(ra) # 800026dc <_Znwm>
    800030e4:	00050913          	mv	s2,a0
    800030e8:	00100593          	li	a1,1
    800030ec:	00000097          	auipc	ra,0x0
    800030f0:	800080e7          	jalr	-2048(ra) # 800028ec <_ZN9SemaphoreC1Ej>
    800030f4:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    800030f8:	01000513          	li	a0,16
    800030fc:	fffff097          	auipc	ra,0xfffff
    80003100:	5e0080e7          	jalr	1504(ra) # 800026dc <_Znwm>
    80003104:	00050913          	mv	s2,a0
    80003108:	00100593          	li	a1,1
    8000310c:	fffff097          	auipc	ra,0xfffff
    80003110:	7e0080e7          	jalr	2016(ra) # 800028ec <_ZN9SemaphoreC1Ej>
    80003114:	0324b823          	sd	s2,48(s1)
}
    80003118:	02813083          	ld	ra,40(sp)
    8000311c:	02013403          	ld	s0,32(sp)
    80003120:	01813483          	ld	s1,24(sp)
    80003124:	01013903          	ld	s2,16(sp)
    80003128:	00813983          	ld	s3,8(sp)
    8000312c:	03010113          	addi	sp,sp,48
    80003130:	00008067          	ret
    80003134:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80003138:	00098513          	mv	a0,s3
    8000313c:	fffff097          	auipc	ra,0xfffff
    80003140:	5f0080e7          	jalr	1520(ra) # 8000272c <_ZdlPv>
    80003144:	00048513          	mv	a0,s1
    80003148:	00005097          	auipc	ra,0x5
    8000314c:	490080e7          	jalr	1168(ra) # 800085d8 <_Unwind_Resume>
    80003150:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80003154:	00098513          	mv	a0,s3
    80003158:	fffff097          	auipc	ra,0xfffff
    8000315c:	5d4080e7          	jalr	1492(ra) # 8000272c <_ZdlPv>
    80003160:	00048513          	mv	a0,s1
    80003164:	00005097          	auipc	ra,0x5
    80003168:	474080e7          	jalr	1140(ra) # 800085d8 <_Unwind_Resume>
    8000316c:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80003170:	00090513          	mv	a0,s2
    80003174:	fffff097          	auipc	ra,0xfffff
    80003178:	5b8080e7          	jalr	1464(ra) # 8000272c <_ZdlPv>
    8000317c:	00048513          	mv	a0,s1
    80003180:	00005097          	auipc	ra,0x5
    80003184:	458080e7          	jalr	1112(ra) # 800085d8 <_Unwind_Resume>
    80003188:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000318c:	00090513          	mv	a0,s2
    80003190:	fffff097          	auipc	ra,0xfffff
    80003194:	59c080e7          	jalr	1436(ra) # 8000272c <_ZdlPv>
    80003198:	00048513          	mv	a0,s1
    8000319c:	00005097          	auipc	ra,0x5
    800031a0:	43c080e7          	jalr	1084(ra) # 800085d8 <_Unwind_Resume>

00000000800031a4 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800031a4:	fe010113          	addi	sp,sp,-32
    800031a8:	00113c23          	sd	ra,24(sp)
    800031ac:	00813823          	sd	s0,16(sp)
    800031b0:	00913423          	sd	s1,8(sp)
    800031b4:	01213023          	sd	s2,0(sp)
    800031b8:	02010413          	addi	s0,sp,32
    800031bc:	00050493          	mv	s1,a0
    800031c0:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800031c4:	01853503          	ld	a0,24(a0)
    800031c8:	fffff097          	auipc	ra,0xfffff
    800031cc:	75c080e7          	jalr	1884(ra) # 80002924 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800031d0:	0304b503          	ld	a0,48(s1)
    800031d4:	fffff097          	auipc	ra,0xfffff
    800031d8:	750080e7          	jalr	1872(ra) # 80002924 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800031dc:	0084b783          	ld	a5,8(s1)
    800031e0:	0144a703          	lw	a4,20(s1)
    800031e4:	00271713          	slli	a4,a4,0x2
    800031e8:	00e787b3          	add	a5,a5,a4
    800031ec:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    800031f0:	0144a783          	lw	a5,20(s1)
    800031f4:	0017879b          	addiw	a5,a5,1
    800031f8:	0004a703          	lw	a4,0(s1)
    800031fc:	02e7e7bb          	remw	a5,a5,a4
    80003200:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80003204:	0304b503          	ld	a0,48(s1)
    80003208:	fffff097          	auipc	ra,0xfffff
    8000320c:	754080e7          	jalr	1876(ra) # 8000295c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80003210:	0204b503          	ld	a0,32(s1)
    80003214:	fffff097          	auipc	ra,0xfffff
    80003218:	748080e7          	jalr	1864(ra) # 8000295c <_ZN9Semaphore6signalEv>

}
    8000321c:	01813083          	ld	ra,24(sp)
    80003220:	01013403          	ld	s0,16(sp)
    80003224:	00813483          	ld	s1,8(sp)
    80003228:	00013903          	ld	s2,0(sp)
    8000322c:	02010113          	addi	sp,sp,32
    80003230:	00008067          	ret

0000000080003234 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80003234:	fe010113          	addi	sp,sp,-32
    80003238:	00113c23          	sd	ra,24(sp)
    8000323c:	00813823          	sd	s0,16(sp)
    80003240:	00913423          	sd	s1,8(sp)
    80003244:	01213023          	sd	s2,0(sp)
    80003248:	02010413          	addi	s0,sp,32
    8000324c:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80003250:	02053503          	ld	a0,32(a0)
    80003254:	fffff097          	auipc	ra,0xfffff
    80003258:	6d0080e7          	jalr	1744(ra) # 80002924 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    8000325c:	0284b503          	ld	a0,40(s1)
    80003260:	fffff097          	auipc	ra,0xfffff
    80003264:	6c4080e7          	jalr	1732(ra) # 80002924 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80003268:	0084b703          	ld	a4,8(s1)
    8000326c:	0104a783          	lw	a5,16(s1)
    80003270:	00279693          	slli	a3,a5,0x2
    80003274:	00d70733          	add	a4,a4,a3
    80003278:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    8000327c:	0017879b          	addiw	a5,a5,1
    80003280:	0004a703          	lw	a4,0(s1)
    80003284:	02e7e7bb          	remw	a5,a5,a4
    80003288:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000328c:	0284b503          	ld	a0,40(s1)
    80003290:	fffff097          	auipc	ra,0xfffff
    80003294:	6cc080e7          	jalr	1740(ra) # 8000295c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80003298:	0184b503          	ld	a0,24(s1)
    8000329c:	fffff097          	auipc	ra,0xfffff
    800032a0:	6c0080e7          	jalr	1728(ra) # 8000295c <_ZN9Semaphore6signalEv>

    return ret;
}
    800032a4:	00090513          	mv	a0,s2
    800032a8:	01813083          	ld	ra,24(sp)
    800032ac:	01013403          	ld	s0,16(sp)
    800032b0:	00813483          	ld	s1,8(sp)
    800032b4:	00013903          	ld	s2,0(sp)
    800032b8:	02010113          	addi	sp,sp,32
    800032bc:	00008067          	ret

00000000800032c0 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800032c0:	fe010113          	addi	sp,sp,-32
    800032c4:	00113c23          	sd	ra,24(sp)
    800032c8:	00813823          	sd	s0,16(sp)
    800032cc:	00913423          	sd	s1,8(sp)
    800032d0:	01213023          	sd	s2,0(sp)
    800032d4:	02010413          	addi	s0,sp,32
    800032d8:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800032dc:	02853503          	ld	a0,40(a0)
    800032e0:	fffff097          	auipc	ra,0xfffff
    800032e4:	644080e7          	jalr	1604(ra) # 80002924 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    800032e8:	0304b503          	ld	a0,48(s1)
    800032ec:	fffff097          	auipc	ra,0xfffff
    800032f0:	638080e7          	jalr	1592(ra) # 80002924 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    800032f4:	0144a783          	lw	a5,20(s1)
    800032f8:	0104a903          	lw	s2,16(s1)
    800032fc:	0327ce63          	blt	a5,s2,80003338 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80003300:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80003304:	0304b503          	ld	a0,48(s1)
    80003308:	fffff097          	auipc	ra,0xfffff
    8000330c:	654080e7          	jalr	1620(ra) # 8000295c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80003310:	0284b503          	ld	a0,40(s1)
    80003314:	fffff097          	auipc	ra,0xfffff
    80003318:	648080e7          	jalr	1608(ra) # 8000295c <_ZN9Semaphore6signalEv>

    return ret;
    8000331c:	00090513          	mv	a0,s2
    80003320:	01813083          	ld	ra,24(sp)
    80003324:	01013403          	ld	s0,16(sp)
    80003328:	00813483          	ld	s1,8(sp)
    8000332c:	00013903          	ld	s2,0(sp)
    80003330:	02010113          	addi	sp,sp,32
    80003334:	00008067          	ret
        ret = cap - head + tail;
    80003338:	0004a703          	lw	a4,0(s1)
    8000333c:	4127093b          	subw	s2,a4,s2
    80003340:	00f9093b          	addw	s2,s2,a5
    80003344:	fc1ff06f          	j	80003304 <_ZN9BufferCPP6getCntEv+0x44>

0000000080003348 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80003348:	fe010113          	addi	sp,sp,-32
    8000334c:	00113c23          	sd	ra,24(sp)
    80003350:	00813823          	sd	s0,16(sp)
    80003354:	00913423          	sd	s1,8(sp)
    80003358:	02010413          	addi	s0,sp,32
    8000335c:	00050493          	mv	s1,a0
    Console::putc('\n');
    80003360:	00a00513          	li	a0,10
    80003364:	fffff097          	auipc	ra,0xfffff
    80003368:	658080e7          	jalr	1624(ra) # 800029bc <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    8000336c:	00003517          	auipc	a0,0x3
    80003370:	eac50513          	addi	a0,a0,-340 # 80006218 <CONSOLE_STATUS+0x208>
    80003374:	ffffe097          	auipc	ra,0xffffe
    80003378:	7d8080e7          	jalr	2008(ra) # 80001b4c <_Z11printStringPKc>
    while (getCnt()) {
    8000337c:	00048513          	mv	a0,s1
    80003380:	00000097          	auipc	ra,0x0
    80003384:	f40080e7          	jalr	-192(ra) # 800032c0 <_ZN9BufferCPP6getCntEv>
    80003388:	02050c63          	beqz	a0,800033c0 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    8000338c:	0084b783          	ld	a5,8(s1)
    80003390:	0104a703          	lw	a4,16(s1)
    80003394:	00271713          	slli	a4,a4,0x2
    80003398:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    8000339c:	0007c503          	lbu	a0,0(a5)
    800033a0:	fffff097          	auipc	ra,0xfffff
    800033a4:	61c080e7          	jalr	1564(ra) # 800029bc <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800033a8:	0104a783          	lw	a5,16(s1)
    800033ac:	0017879b          	addiw	a5,a5,1
    800033b0:	0004a703          	lw	a4,0(s1)
    800033b4:	02e7e7bb          	remw	a5,a5,a4
    800033b8:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800033bc:	fc1ff06f          	j	8000337c <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800033c0:	02100513          	li	a0,33
    800033c4:	fffff097          	auipc	ra,0xfffff
    800033c8:	5f8080e7          	jalr	1528(ra) # 800029bc <_ZN7Console4putcEc>
    Console::putc('\n');
    800033cc:	00a00513          	li	a0,10
    800033d0:	fffff097          	auipc	ra,0xfffff
    800033d4:	5ec080e7          	jalr	1516(ra) # 800029bc <_ZN7Console4putcEc>
    mem_free(buffer);
    800033d8:	0084b503          	ld	a0,8(s1)
    800033dc:	ffffe097          	auipc	ra,0xffffe
    800033e0:	124080e7          	jalr	292(ra) # 80001500 <_Z8mem_freePv>
    delete itemAvailable;
    800033e4:	0204b503          	ld	a0,32(s1)
    800033e8:	00050863          	beqz	a0,800033f8 <_ZN9BufferCPPD1Ev+0xb0>
    800033ec:	00053783          	ld	a5,0(a0)
    800033f0:	0087b783          	ld	a5,8(a5)
    800033f4:	000780e7          	jalr	a5
    delete spaceAvailable;
    800033f8:	0184b503          	ld	a0,24(s1)
    800033fc:	00050863          	beqz	a0,8000340c <_ZN9BufferCPPD1Ev+0xc4>
    80003400:	00053783          	ld	a5,0(a0)
    80003404:	0087b783          	ld	a5,8(a5)
    80003408:	000780e7          	jalr	a5
    delete mutexTail;
    8000340c:	0304b503          	ld	a0,48(s1)
    80003410:	00050863          	beqz	a0,80003420 <_ZN9BufferCPPD1Ev+0xd8>
    80003414:	00053783          	ld	a5,0(a0)
    80003418:	0087b783          	ld	a5,8(a5)
    8000341c:	000780e7          	jalr	a5
    delete mutexHead;
    80003420:	0284b503          	ld	a0,40(s1)
    80003424:	00050863          	beqz	a0,80003434 <_ZN9BufferCPPD1Ev+0xec>
    80003428:	00053783          	ld	a5,0(a0)
    8000342c:	0087b783          	ld	a5,8(a5)
    80003430:	000780e7          	jalr	a5
}
    80003434:	01813083          	ld	ra,24(sp)
    80003438:	01013403          	ld	s0,16(sp)
    8000343c:	00813483          	ld	s1,8(sp)
    80003440:	02010113          	addi	sp,sp,32
    80003444:	00008067          	ret

0000000080003448 <_ZN6BufferC1Ei>:
// Created by os on 6/26/22.
//

#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80003448:	fe010113          	addi	sp,sp,-32
    8000344c:	00113c23          	sd	ra,24(sp)
    80003450:	00813823          	sd	s0,16(sp)
    80003454:	00913423          	sd	s1,8(sp)
    80003458:	01213023          	sd	s2,0(sp)
    8000345c:	02010413          	addi	s0,sp,32
    80003460:	00050493          	mv	s1,a0
    80003464:	00058913          	mv	s2,a1
    80003468:	0015879b          	addiw	a5,a1,1
    8000346c:	0007851b          	sext.w	a0,a5
    80003470:	00f4a023          	sw	a5,0(s1)
    80003474:	0004a823          	sw	zero,16(s1)
    80003478:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    8000347c:	00251513          	slli	a0,a0,0x2
    80003480:	ffffe097          	auipc	ra,0xffffe
    80003484:	038080e7          	jalr	56(ra) # 800014b8 <_Z9mem_allocm>
    80003488:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    8000348c:	00000593          	li	a1,0
    80003490:	02048513          	addi	a0,s1,32
    80003494:	ffffe097          	auipc	ra,0xffffe
    80003498:	228080e7          	jalr	552(ra) # 800016bc <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    8000349c:	00090593          	mv	a1,s2
    800034a0:	01848513          	addi	a0,s1,24
    800034a4:	ffffe097          	auipc	ra,0xffffe
    800034a8:	218080e7          	jalr	536(ra) # 800016bc <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    800034ac:	00100593          	li	a1,1
    800034b0:	02848513          	addi	a0,s1,40
    800034b4:	ffffe097          	auipc	ra,0xffffe
    800034b8:	208080e7          	jalr	520(ra) # 800016bc <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    800034bc:	00100593          	li	a1,1
    800034c0:	03048513          	addi	a0,s1,48
    800034c4:	ffffe097          	auipc	ra,0xffffe
    800034c8:	1f8080e7          	jalr	504(ra) # 800016bc <_Z8sem_openPP4_semj>
}
    800034cc:	01813083          	ld	ra,24(sp)
    800034d0:	01013403          	ld	s0,16(sp)
    800034d4:	00813483          	ld	s1,8(sp)
    800034d8:	00013903          	ld	s2,0(sp)
    800034dc:	02010113          	addi	sp,sp,32
    800034e0:	00008067          	ret

00000000800034e4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800034e4:	fe010113          	addi	sp,sp,-32
    800034e8:	00113c23          	sd	ra,24(sp)
    800034ec:	00813823          	sd	s0,16(sp)
    800034f0:	00913423          	sd	s1,8(sp)
    800034f4:	01213023          	sd	s2,0(sp)
    800034f8:	02010413          	addi	s0,sp,32
    800034fc:	00050493          	mv	s1,a0
    80003500:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003504:	01853503          	ld	a0,24(a0)
    80003508:	ffffe097          	auipc	ra,0xffffe
    8000350c:	228080e7          	jalr	552(ra) # 80001730 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003510:	0304b503          	ld	a0,48(s1)
    80003514:	ffffe097          	auipc	ra,0xffffe
    80003518:	21c080e7          	jalr	540(ra) # 80001730 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    8000351c:	0084b783          	ld	a5,8(s1)
    80003520:	0144a703          	lw	a4,20(s1)
    80003524:	00271713          	slli	a4,a4,0x2
    80003528:	00e787b3          	add	a5,a5,a4
    8000352c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003530:	0144a783          	lw	a5,20(s1)
    80003534:	0017879b          	addiw	a5,a5,1
    80003538:	0004a703          	lw	a4,0(s1)
    8000353c:	02e7e7bb          	remw	a5,a5,a4
    80003540:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80003544:	0304b503          	ld	a0,48(s1)
    80003548:	ffffe097          	auipc	ra,0xffffe
    8000354c:	220080e7          	jalr	544(ra) # 80001768 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80003550:	0204b503          	ld	a0,32(s1)
    80003554:	ffffe097          	auipc	ra,0xffffe
    80003558:	214080e7          	jalr	532(ra) # 80001768 <_Z10sem_signalP4_sem>

}
    8000355c:	01813083          	ld	ra,24(sp)
    80003560:	01013403          	ld	s0,16(sp)
    80003564:	00813483          	ld	s1,8(sp)
    80003568:	00013903          	ld	s2,0(sp)
    8000356c:	02010113          	addi	sp,sp,32
    80003570:	00008067          	ret

0000000080003574 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80003574:	fe010113          	addi	sp,sp,-32
    80003578:	00113c23          	sd	ra,24(sp)
    8000357c:	00813823          	sd	s0,16(sp)
    80003580:	00913423          	sd	s1,8(sp)
    80003584:	01213023          	sd	s2,0(sp)
    80003588:	02010413          	addi	s0,sp,32
    8000358c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80003590:	02053503          	ld	a0,32(a0)
    80003594:	ffffe097          	auipc	ra,0xffffe
    80003598:	19c080e7          	jalr	412(ra) # 80001730 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    8000359c:	0284b503          	ld	a0,40(s1)
    800035a0:	ffffe097          	auipc	ra,0xffffe
    800035a4:	190080e7          	jalr	400(ra) # 80001730 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    800035a8:	0084b703          	ld	a4,8(s1)
    800035ac:	0104a783          	lw	a5,16(s1)
    800035b0:	00279693          	slli	a3,a5,0x2
    800035b4:	00d70733          	add	a4,a4,a3
    800035b8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800035bc:	0017879b          	addiw	a5,a5,1
    800035c0:	0004a703          	lw	a4,0(s1)
    800035c4:	02e7e7bb          	remw	a5,a5,a4
    800035c8:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800035cc:	0284b503          	ld	a0,40(s1)
    800035d0:	ffffe097          	auipc	ra,0xffffe
    800035d4:	198080e7          	jalr	408(ra) # 80001768 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    800035d8:	0184b503          	ld	a0,24(s1)
    800035dc:	ffffe097          	auipc	ra,0xffffe
    800035e0:	18c080e7          	jalr	396(ra) # 80001768 <_Z10sem_signalP4_sem>

    return ret;
}
    800035e4:	00090513          	mv	a0,s2
    800035e8:	01813083          	ld	ra,24(sp)
    800035ec:	01013403          	ld	s0,16(sp)
    800035f0:	00813483          	ld	s1,8(sp)
    800035f4:	00013903          	ld	s2,0(sp)
    800035f8:	02010113          	addi	sp,sp,32
    800035fc:	00008067          	ret

0000000080003600 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80003600:	fe010113          	addi	sp,sp,-32
    80003604:	00113c23          	sd	ra,24(sp)
    80003608:	00813823          	sd	s0,16(sp)
    8000360c:	00913423          	sd	s1,8(sp)
    80003610:	01213023          	sd	s2,0(sp)
    80003614:	02010413          	addi	s0,sp,32
    80003618:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    8000361c:	02853503          	ld	a0,40(a0)
    80003620:	ffffe097          	auipc	ra,0xffffe
    80003624:	110080e7          	jalr	272(ra) # 80001730 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80003628:	0304b503          	ld	a0,48(s1)
    8000362c:	ffffe097          	auipc	ra,0xffffe
    80003630:	104080e7          	jalr	260(ra) # 80001730 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80003634:	0144a783          	lw	a5,20(s1)
    80003638:	0104a903          	lw	s2,16(s1)
    8000363c:	0327ce63          	blt	a5,s2,80003678 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80003640:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003644:	0304b503          	ld	a0,48(s1)
    80003648:	ffffe097          	auipc	ra,0xffffe
    8000364c:	120080e7          	jalr	288(ra) # 80001768 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80003650:	0284b503          	ld	a0,40(s1)
    80003654:	ffffe097          	auipc	ra,0xffffe
    80003658:	114080e7          	jalr	276(ra) # 80001768 <_Z10sem_signalP4_sem>

    return ret;
    8000365c:	00090513          	mv	a0,s2
    80003660:	01813083          	ld	ra,24(sp)
    80003664:	01013403          	ld	s0,16(sp)
    80003668:	00813483          	ld	s1,8(sp)
    8000366c:	00013903          	ld	s2,0(sp)
    80003670:	02010113          	addi	sp,sp,32
    80003674:	00008067          	ret
        ret = cap - head + tail;
    80003678:	0004a703          	lw	a4,0(s1)
    8000367c:	4127093b          	subw	s2,a4,s2
    80003680:	00f9093b          	addw	s2,s2,a5
    80003684:	fc1ff06f          	j	80003644 <_ZN6Buffer6getCntEv+0x44>

0000000080003688 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80003688:	fe010113          	addi	sp,sp,-32
    8000368c:	00113c23          	sd	ra,24(sp)
    80003690:	00813823          	sd	s0,16(sp)
    80003694:	00913423          	sd	s1,8(sp)
    80003698:	02010413          	addi	s0,sp,32
    8000369c:	00050493          	mv	s1,a0
    putc('\n');
    800036a0:	00a00513          	li	a0,10
    800036a4:	ffffe097          	auipc	ra,0xffffe
    800036a8:	0fc080e7          	jalr	252(ra) # 800017a0 <_Z4putcc>
    printString("Buffer deleted!\n");
    800036ac:	00003517          	auipc	a0,0x3
    800036b0:	b6c50513          	addi	a0,a0,-1172 # 80006218 <CONSOLE_STATUS+0x208>
    800036b4:	ffffe097          	auipc	ra,0xffffe
    800036b8:	498080e7          	jalr	1176(ra) # 80001b4c <_Z11printStringPKc>
    while (getCnt() > 0) {
    800036bc:	00048513          	mv	a0,s1
    800036c0:	00000097          	auipc	ra,0x0
    800036c4:	f40080e7          	jalr	-192(ra) # 80003600 <_ZN6Buffer6getCntEv>
    800036c8:	02a05c63          	blez	a0,80003700 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800036cc:	0084b783          	ld	a5,8(s1)
    800036d0:	0104a703          	lw	a4,16(s1)
    800036d4:	00271713          	slli	a4,a4,0x2
    800036d8:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800036dc:	0007c503          	lbu	a0,0(a5)
    800036e0:	ffffe097          	auipc	ra,0xffffe
    800036e4:	0c0080e7          	jalr	192(ra) # 800017a0 <_Z4putcc>
        head = (head + 1) % cap;
    800036e8:	0104a783          	lw	a5,16(s1)
    800036ec:	0017879b          	addiw	a5,a5,1
    800036f0:	0004a703          	lw	a4,0(s1)
    800036f4:	02e7e7bb          	remw	a5,a5,a4
    800036f8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800036fc:	fc1ff06f          	j	800036bc <_ZN6BufferD1Ev+0x34>
    putc('!');
    80003700:	02100513          	li	a0,33
    80003704:	ffffe097          	auipc	ra,0xffffe
    80003708:	09c080e7          	jalr	156(ra) # 800017a0 <_Z4putcc>
    putc('\n');
    8000370c:	00a00513          	li	a0,10
    80003710:	ffffe097          	auipc	ra,0xffffe
    80003714:	090080e7          	jalr	144(ra) # 800017a0 <_Z4putcc>
    mem_free(buffer);
    80003718:	0084b503          	ld	a0,8(s1)
    8000371c:	ffffe097          	auipc	ra,0xffffe
    80003720:	de4080e7          	jalr	-540(ra) # 80001500 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003724:	0204b503          	ld	a0,32(s1)
    80003728:	ffffe097          	auipc	ra,0xffffe
    8000372c:	fd0080e7          	jalr	-48(ra) # 800016f8 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80003730:	0184b503          	ld	a0,24(s1)
    80003734:	ffffe097          	auipc	ra,0xffffe
    80003738:	fc4080e7          	jalr	-60(ra) # 800016f8 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    8000373c:	0304b503          	ld	a0,48(s1)
    80003740:	ffffe097          	auipc	ra,0xffffe
    80003744:	fb8080e7          	jalr	-72(ra) # 800016f8 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80003748:	0284b503          	ld	a0,40(s1)
    8000374c:	ffffe097          	auipc	ra,0xffffe
    80003750:	fac080e7          	jalr	-84(ra) # 800016f8 <_Z9sem_closeP4_sem>
}
    80003754:	01813083          	ld	ra,24(sp)
    80003758:	01013403          	ld	s0,16(sp)
    8000375c:	00813483          	ld	s1,8(sp)
    80003760:	02010113          	addi	sp,sp,32
    80003764:	00008067          	ret

0000000080003768 <start>:
    80003768:	ff010113          	addi	sp,sp,-16
    8000376c:	00813423          	sd	s0,8(sp)
    80003770:	01010413          	addi	s0,sp,16
    80003774:	300027f3          	csrr	a5,mstatus
    80003778:	ffffe737          	lui	a4,0xffffe
    8000377c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff608f>
    80003780:	00e7f7b3          	and	a5,a5,a4
    80003784:	00001737          	lui	a4,0x1
    80003788:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    8000378c:	00e7e7b3          	or	a5,a5,a4
    80003790:	30079073          	csrw	mstatus,a5
    80003794:	00000797          	auipc	a5,0x0
    80003798:	16078793          	addi	a5,a5,352 # 800038f4 <system_main>
    8000379c:	34179073          	csrw	mepc,a5
    800037a0:	00000793          	li	a5,0
    800037a4:	18079073          	csrw	satp,a5
    800037a8:	000107b7          	lui	a5,0x10
    800037ac:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800037b0:	30279073          	csrw	medeleg,a5
    800037b4:	30379073          	csrw	mideleg,a5
    800037b8:	104027f3          	csrr	a5,sie
    800037bc:	2227e793          	ori	a5,a5,546
    800037c0:	10479073          	csrw	sie,a5
    800037c4:	fff00793          	li	a5,-1
    800037c8:	00a7d793          	srli	a5,a5,0xa
    800037cc:	3b079073          	csrw	pmpaddr0,a5
    800037d0:	00f00793          	li	a5,15
    800037d4:	3a079073          	csrw	pmpcfg0,a5
    800037d8:	f14027f3          	csrr	a5,mhartid
    800037dc:	0200c737          	lui	a4,0x200c
    800037e0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800037e4:	0007869b          	sext.w	a3,a5
    800037e8:	00269713          	slli	a4,a3,0x2
    800037ec:	000f4637          	lui	a2,0xf4
    800037f0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800037f4:	00d70733          	add	a4,a4,a3
    800037f8:	0037979b          	slliw	a5,a5,0x3
    800037fc:	020046b7          	lui	a3,0x2004
    80003800:	00d787b3          	add	a5,a5,a3
    80003804:	00c585b3          	add	a1,a1,a2
    80003808:	00371693          	slli	a3,a4,0x3
    8000380c:	00004717          	auipc	a4,0x4
    80003810:	d0470713          	addi	a4,a4,-764 # 80007510 <timer_scratch>
    80003814:	00b7b023          	sd	a1,0(a5)
    80003818:	00d70733          	add	a4,a4,a3
    8000381c:	00f73c23          	sd	a5,24(a4)
    80003820:	02c73023          	sd	a2,32(a4)
    80003824:	34071073          	csrw	mscratch,a4
    80003828:	00000797          	auipc	a5,0x0
    8000382c:	6e878793          	addi	a5,a5,1768 # 80003f10 <timervec>
    80003830:	30579073          	csrw	mtvec,a5
    80003834:	300027f3          	csrr	a5,mstatus
    80003838:	0087e793          	ori	a5,a5,8
    8000383c:	30079073          	csrw	mstatus,a5
    80003840:	304027f3          	csrr	a5,mie
    80003844:	0807e793          	ori	a5,a5,128
    80003848:	30479073          	csrw	mie,a5
    8000384c:	f14027f3          	csrr	a5,mhartid
    80003850:	0007879b          	sext.w	a5,a5
    80003854:	00078213          	mv	tp,a5
    80003858:	30200073          	mret
    8000385c:	00813403          	ld	s0,8(sp)
    80003860:	01010113          	addi	sp,sp,16
    80003864:	00008067          	ret

0000000080003868 <timerinit>:
    80003868:	ff010113          	addi	sp,sp,-16
    8000386c:	00813423          	sd	s0,8(sp)
    80003870:	01010413          	addi	s0,sp,16
    80003874:	f14027f3          	csrr	a5,mhartid
    80003878:	0200c737          	lui	a4,0x200c
    8000387c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003880:	0007869b          	sext.w	a3,a5
    80003884:	00269713          	slli	a4,a3,0x2
    80003888:	000f4637          	lui	a2,0xf4
    8000388c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003890:	00d70733          	add	a4,a4,a3
    80003894:	0037979b          	slliw	a5,a5,0x3
    80003898:	020046b7          	lui	a3,0x2004
    8000389c:	00d787b3          	add	a5,a5,a3
    800038a0:	00c585b3          	add	a1,a1,a2
    800038a4:	00371693          	slli	a3,a4,0x3
    800038a8:	00004717          	auipc	a4,0x4
    800038ac:	c6870713          	addi	a4,a4,-920 # 80007510 <timer_scratch>
    800038b0:	00b7b023          	sd	a1,0(a5)
    800038b4:	00d70733          	add	a4,a4,a3
    800038b8:	00f73c23          	sd	a5,24(a4)
    800038bc:	02c73023          	sd	a2,32(a4)
    800038c0:	34071073          	csrw	mscratch,a4
    800038c4:	00000797          	auipc	a5,0x0
    800038c8:	64c78793          	addi	a5,a5,1612 # 80003f10 <timervec>
    800038cc:	30579073          	csrw	mtvec,a5
    800038d0:	300027f3          	csrr	a5,mstatus
    800038d4:	0087e793          	ori	a5,a5,8
    800038d8:	30079073          	csrw	mstatus,a5
    800038dc:	304027f3          	csrr	a5,mie
    800038e0:	0807e793          	ori	a5,a5,128
    800038e4:	30479073          	csrw	mie,a5
    800038e8:	00813403          	ld	s0,8(sp)
    800038ec:	01010113          	addi	sp,sp,16
    800038f0:	00008067          	ret

00000000800038f4 <system_main>:
    800038f4:	fe010113          	addi	sp,sp,-32
    800038f8:	00813823          	sd	s0,16(sp)
    800038fc:	00913423          	sd	s1,8(sp)
    80003900:	00113c23          	sd	ra,24(sp)
    80003904:	02010413          	addi	s0,sp,32
    80003908:	00000097          	auipc	ra,0x0
    8000390c:	0c4080e7          	jalr	196(ra) # 800039cc <cpuid>
    80003910:	00004497          	auipc	s1,0x4
    80003914:	b7048493          	addi	s1,s1,-1168 # 80007480 <started>
    80003918:	02050263          	beqz	a0,8000393c <system_main+0x48>
    8000391c:	0004a783          	lw	a5,0(s1)
    80003920:	0007879b          	sext.w	a5,a5
    80003924:	fe078ce3          	beqz	a5,8000391c <system_main+0x28>
    80003928:	0ff0000f          	fence
    8000392c:	00003517          	auipc	a0,0x3
    80003930:	93450513          	addi	a0,a0,-1740 # 80006260 <CONSOLE_STATUS+0x250>
    80003934:	00001097          	auipc	ra,0x1
    80003938:	a78080e7          	jalr	-1416(ra) # 800043ac <panic>
    8000393c:	00001097          	auipc	ra,0x1
    80003940:	9cc080e7          	jalr	-1588(ra) # 80004308 <consoleinit>
    80003944:	00001097          	auipc	ra,0x1
    80003948:	158080e7          	jalr	344(ra) # 80004a9c <printfinit>
    8000394c:	00003517          	auipc	a0,0x3
    80003950:	81c50513          	addi	a0,a0,-2020 # 80006168 <CONSOLE_STATUS+0x158>
    80003954:	00001097          	auipc	ra,0x1
    80003958:	ab4080e7          	jalr	-1356(ra) # 80004408 <__printf>
    8000395c:	00003517          	auipc	a0,0x3
    80003960:	8d450513          	addi	a0,a0,-1836 # 80006230 <CONSOLE_STATUS+0x220>
    80003964:	00001097          	auipc	ra,0x1
    80003968:	aa4080e7          	jalr	-1372(ra) # 80004408 <__printf>
    8000396c:	00002517          	auipc	a0,0x2
    80003970:	7fc50513          	addi	a0,a0,2044 # 80006168 <CONSOLE_STATUS+0x158>
    80003974:	00001097          	auipc	ra,0x1
    80003978:	a94080e7          	jalr	-1388(ra) # 80004408 <__printf>
    8000397c:	00001097          	auipc	ra,0x1
    80003980:	4ac080e7          	jalr	1196(ra) # 80004e28 <kinit>
    80003984:	00000097          	auipc	ra,0x0
    80003988:	148080e7          	jalr	328(ra) # 80003acc <trapinit>
    8000398c:	00000097          	auipc	ra,0x0
    80003990:	16c080e7          	jalr	364(ra) # 80003af8 <trapinithart>
    80003994:	00000097          	auipc	ra,0x0
    80003998:	5bc080e7          	jalr	1468(ra) # 80003f50 <plicinit>
    8000399c:	00000097          	auipc	ra,0x0
    800039a0:	5dc080e7          	jalr	1500(ra) # 80003f78 <plicinithart>
    800039a4:	00000097          	auipc	ra,0x0
    800039a8:	078080e7          	jalr	120(ra) # 80003a1c <userinit>
    800039ac:	0ff0000f          	fence
    800039b0:	00100793          	li	a5,1
    800039b4:	00003517          	auipc	a0,0x3
    800039b8:	89450513          	addi	a0,a0,-1900 # 80006248 <CONSOLE_STATUS+0x238>
    800039bc:	00f4a023          	sw	a5,0(s1)
    800039c0:	00001097          	auipc	ra,0x1
    800039c4:	a48080e7          	jalr	-1464(ra) # 80004408 <__printf>
    800039c8:	0000006f          	j	800039c8 <system_main+0xd4>

00000000800039cc <cpuid>:
    800039cc:	ff010113          	addi	sp,sp,-16
    800039d0:	00813423          	sd	s0,8(sp)
    800039d4:	01010413          	addi	s0,sp,16
    800039d8:	00020513          	mv	a0,tp
    800039dc:	00813403          	ld	s0,8(sp)
    800039e0:	0005051b          	sext.w	a0,a0
    800039e4:	01010113          	addi	sp,sp,16
    800039e8:	00008067          	ret

00000000800039ec <mycpu>:
    800039ec:	ff010113          	addi	sp,sp,-16
    800039f0:	00813423          	sd	s0,8(sp)
    800039f4:	01010413          	addi	s0,sp,16
    800039f8:	00020793          	mv	a5,tp
    800039fc:	00813403          	ld	s0,8(sp)
    80003a00:	0007879b          	sext.w	a5,a5
    80003a04:	00779793          	slli	a5,a5,0x7
    80003a08:	00005517          	auipc	a0,0x5
    80003a0c:	b3850513          	addi	a0,a0,-1224 # 80008540 <cpus>
    80003a10:	00f50533          	add	a0,a0,a5
    80003a14:	01010113          	addi	sp,sp,16
    80003a18:	00008067          	ret

0000000080003a1c <userinit>:
    80003a1c:	ff010113          	addi	sp,sp,-16
    80003a20:	00813423          	sd	s0,8(sp)
    80003a24:	01010413          	addi	s0,sp,16
    80003a28:	00813403          	ld	s0,8(sp)
    80003a2c:	01010113          	addi	sp,sp,16
    80003a30:	fffff317          	auipc	t1,0xfffff
    80003a34:	aa030067          	jr	-1376(t1) # 800024d0 <main>

0000000080003a38 <either_copyout>:
    80003a38:	ff010113          	addi	sp,sp,-16
    80003a3c:	00813023          	sd	s0,0(sp)
    80003a40:	00113423          	sd	ra,8(sp)
    80003a44:	01010413          	addi	s0,sp,16
    80003a48:	02051663          	bnez	a0,80003a74 <either_copyout+0x3c>
    80003a4c:	00058513          	mv	a0,a1
    80003a50:	00060593          	mv	a1,a2
    80003a54:	0006861b          	sext.w	a2,a3
    80003a58:	00002097          	auipc	ra,0x2
    80003a5c:	c5c080e7          	jalr	-932(ra) # 800056b4 <__memmove>
    80003a60:	00813083          	ld	ra,8(sp)
    80003a64:	00013403          	ld	s0,0(sp)
    80003a68:	00000513          	li	a0,0
    80003a6c:	01010113          	addi	sp,sp,16
    80003a70:	00008067          	ret
    80003a74:	00003517          	auipc	a0,0x3
    80003a78:	81450513          	addi	a0,a0,-2028 # 80006288 <CONSOLE_STATUS+0x278>
    80003a7c:	00001097          	auipc	ra,0x1
    80003a80:	930080e7          	jalr	-1744(ra) # 800043ac <panic>

0000000080003a84 <either_copyin>:
    80003a84:	ff010113          	addi	sp,sp,-16
    80003a88:	00813023          	sd	s0,0(sp)
    80003a8c:	00113423          	sd	ra,8(sp)
    80003a90:	01010413          	addi	s0,sp,16
    80003a94:	02059463          	bnez	a1,80003abc <either_copyin+0x38>
    80003a98:	00060593          	mv	a1,a2
    80003a9c:	0006861b          	sext.w	a2,a3
    80003aa0:	00002097          	auipc	ra,0x2
    80003aa4:	c14080e7          	jalr	-1004(ra) # 800056b4 <__memmove>
    80003aa8:	00813083          	ld	ra,8(sp)
    80003aac:	00013403          	ld	s0,0(sp)
    80003ab0:	00000513          	li	a0,0
    80003ab4:	01010113          	addi	sp,sp,16
    80003ab8:	00008067          	ret
    80003abc:	00002517          	auipc	a0,0x2
    80003ac0:	7f450513          	addi	a0,a0,2036 # 800062b0 <CONSOLE_STATUS+0x2a0>
    80003ac4:	00001097          	auipc	ra,0x1
    80003ac8:	8e8080e7          	jalr	-1816(ra) # 800043ac <panic>

0000000080003acc <trapinit>:
    80003acc:	ff010113          	addi	sp,sp,-16
    80003ad0:	00813423          	sd	s0,8(sp)
    80003ad4:	01010413          	addi	s0,sp,16
    80003ad8:	00813403          	ld	s0,8(sp)
    80003adc:	00002597          	auipc	a1,0x2
    80003ae0:	7fc58593          	addi	a1,a1,2044 # 800062d8 <CONSOLE_STATUS+0x2c8>
    80003ae4:	00005517          	auipc	a0,0x5
    80003ae8:	adc50513          	addi	a0,a0,-1316 # 800085c0 <tickslock>
    80003aec:	01010113          	addi	sp,sp,16
    80003af0:	00001317          	auipc	t1,0x1
    80003af4:	5c830067          	jr	1480(t1) # 800050b8 <initlock>

0000000080003af8 <trapinithart>:
    80003af8:	ff010113          	addi	sp,sp,-16
    80003afc:	00813423          	sd	s0,8(sp)
    80003b00:	01010413          	addi	s0,sp,16
    80003b04:	00000797          	auipc	a5,0x0
    80003b08:	2fc78793          	addi	a5,a5,764 # 80003e00 <kernelvec>
    80003b0c:	10579073          	csrw	stvec,a5
    80003b10:	00813403          	ld	s0,8(sp)
    80003b14:	01010113          	addi	sp,sp,16
    80003b18:	00008067          	ret

0000000080003b1c <usertrap>:
    80003b1c:	ff010113          	addi	sp,sp,-16
    80003b20:	00813423          	sd	s0,8(sp)
    80003b24:	01010413          	addi	s0,sp,16
    80003b28:	00813403          	ld	s0,8(sp)
    80003b2c:	01010113          	addi	sp,sp,16
    80003b30:	00008067          	ret

0000000080003b34 <usertrapret>:
    80003b34:	ff010113          	addi	sp,sp,-16
    80003b38:	00813423          	sd	s0,8(sp)
    80003b3c:	01010413          	addi	s0,sp,16
    80003b40:	00813403          	ld	s0,8(sp)
    80003b44:	01010113          	addi	sp,sp,16
    80003b48:	00008067          	ret

0000000080003b4c <kerneltrap>:
    80003b4c:	fe010113          	addi	sp,sp,-32
    80003b50:	00813823          	sd	s0,16(sp)
    80003b54:	00113c23          	sd	ra,24(sp)
    80003b58:	00913423          	sd	s1,8(sp)
    80003b5c:	02010413          	addi	s0,sp,32
    80003b60:	142025f3          	csrr	a1,scause
    80003b64:	100027f3          	csrr	a5,sstatus
    80003b68:	0027f793          	andi	a5,a5,2
    80003b6c:	10079c63          	bnez	a5,80003c84 <kerneltrap+0x138>
    80003b70:	142027f3          	csrr	a5,scause
    80003b74:	0207ce63          	bltz	a5,80003bb0 <kerneltrap+0x64>
    80003b78:	00002517          	auipc	a0,0x2
    80003b7c:	7a850513          	addi	a0,a0,1960 # 80006320 <CONSOLE_STATUS+0x310>
    80003b80:	00001097          	auipc	ra,0x1
    80003b84:	888080e7          	jalr	-1912(ra) # 80004408 <__printf>
    80003b88:	141025f3          	csrr	a1,sepc
    80003b8c:	14302673          	csrr	a2,stval
    80003b90:	00002517          	auipc	a0,0x2
    80003b94:	7a050513          	addi	a0,a0,1952 # 80006330 <CONSOLE_STATUS+0x320>
    80003b98:	00001097          	auipc	ra,0x1
    80003b9c:	870080e7          	jalr	-1936(ra) # 80004408 <__printf>
    80003ba0:	00002517          	auipc	a0,0x2
    80003ba4:	7a850513          	addi	a0,a0,1960 # 80006348 <CONSOLE_STATUS+0x338>
    80003ba8:	00001097          	auipc	ra,0x1
    80003bac:	804080e7          	jalr	-2044(ra) # 800043ac <panic>
    80003bb0:	0ff7f713          	andi	a4,a5,255
    80003bb4:	00900693          	li	a3,9
    80003bb8:	04d70063          	beq	a4,a3,80003bf8 <kerneltrap+0xac>
    80003bbc:	fff00713          	li	a4,-1
    80003bc0:	03f71713          	slli	a4,a4,0x3f
    80003bc4:	00170713          	addi	a4,a4,1
    80003bc8:	fae798e3          	bne	a5,a4,80003b78 <kerneltrap+0x2c>
    80003bcc:	00000097          	auipc	ra,0x0
    80003bd0:	e00080e7          	jalr	-512(ra) # 800039cc <cpuid>
    80003bd4:	06050663          	beqz	a0,80003c40 <kerneltrap+0xf4>
    80003bd8:	144027f3          	csrr	a5,sip
    80003bdc:	ffd7f793          	andi	a5,a5,-3
    80003be0:	14479073          	csrw	sip,a5
    80003be4:	01813083          	ld	ra,24(sp)
    80003be8:	01013403          	ld	s0,16(sp)
    80003bec:	00813483          	ld	s1,8(sp)
    80003bf0:	02010113          	addi	sp,sp,32
    80003bf4:	00008067          	ret
    80003bf8:	00000097          	auipc	ra,0x0
    80003bfc:	3cc080e7          	jalr	972(ra) # 80003fc4 <plic_claim>
    80003c00:	00a00793          	li	a5,10
    80003c04:	00050493          	mv	s1,a0
    80003c08:	06f50863          	beq	a0,a5,80003c78 <kerneltrap+0x12c>
    80003c0c:	fc050ce3          	beqz	a0,80003be4 <kerneltrap+0x98>
    80003c10:	00050593          	mv	a1,a0
    80003c14:	00002517          	auipc	a0,0x2
    80003c18:	6ec50513          	addi	a0,a0,1772 # 80006300 <CONSOLE_STATUS+0x2f0>
    80003c1c:	00000097          	auipc	ra,0x0
    80003c20:	7ec080e7          	jalr	2028(ra) # 80004408 <__printf>
    80003c24:	01013403          	ld	s0,16(sp)
    80003c28:	01813083          	ld	ra,24(sp)
    80003c2c:	00048513          	mv	a0,s1
    80003c30:	00813483          	ld	s1,8(sp)
    80003c34:	02010113          	addi	sp,sp,32
    80003c38:	00000317          	auipc	t1,0x0
    80003c3c:	3c430067          	jr	964(t1) # 80003ffc <plic_complete>
    80003c40:	00005517          	auipc	a0,0x5
    80003c44:	98050513          	addi	a0,a0,-1664 # 800085c0 <tickslock>
    80003c48:	00001097          	auipc	ra,0x1
    80003c4c:	494080e7          	jalr	1172(ra) # 800050dc <acquire>
    80003c50:	00004717          	auipc	a4,0x4
    80003c54:	83470713          	addi	a4,a4,-1996 # 80007484 <ticks>
    80003c58:	00072783          	lw	a5,0(a4)
    80003c5c:	00005517          	auipc	a0,0x5
    80003c60:	96450513          	addi	a0,a0,-1692 # 800085c0 <tickslock>
    80003c64:	0017879b          	addiw	a5,a5,1
    80003c68:	00f72023          	sw	a5,0(a4)
    80003c6c:	00001097          	auipc	ra,0x1
    80003c70:	53c080e7          	jalr	1340(ra) # 800051a8 <release>
    80003c74:	f65ff06f          	j	80003bd8 <kerneltrap+0x8c>
    80003c78:	00001097          	auipc	ra,0x1
    80003c7c:	098080e7          	jalr	152(ra) # 80004d10 <uartintr>
    80003c80:	fa5ff06f          	j	80003c24 <kerneltrap+0xd8>
    80003c84:	00002517          	auipc	a0,0x2
    80003c88:	65c50513          	addi	a0,a0,1628 # 800062e0 <CONSOLE_STATUS+0x2d0>
    80003c8c:	00000097          	auipc	ra,0x0
    80003c90:	720080e7          	jalr	1824(ra) # 800043ac <panic>

0000000080003c94 <clockintr>:
    80003c94:	fe010113          	addi	sp,sp,-32
    80003c98:	00813823          	sd	s0,16(sp)
    80003c9c:	00913423          	sd	s1,8(sp)
    80003ca0:	00113c23          	sd	ra,24(sp)
    80003ca4:	02010413          	addi	s0,sp,32
    80003ca8:	00005497          	auipc	s1,0x5
    80003cac:	91848493          	addi	s1,s1,-1768 # 800085c0 <tickslock>
    80003cb0:	00048513          	mv	a0,s1
    80003cb4:	00001097          	auipc	ra,0x1
    80003cb8:	428080e7          	jalr	1064(ra) # 800050dc <acquire>
    80003cbc:	00003717          	auipc	a4,0x3
    80003cc0:	7c870713          	addi	a4,a4,1992 # 80007484 <ticks>
    80003cc4:	00072783          	lw	a5,0(a4)
    80003cc8:	01013403          	ld	s0,16(sp)
    80003ccc:	01813083          	ld	ra,24(sp)
    80003cd0:	00048513          	mv	a0,s1
    80003cd4:	0017879b          	addiw	a5,a5,1
    80003cd8:	00813483          	ld	s1,8(sp)
    80003cdc:	00f72023          	sw	a5,0(a4)
    80003ce0:	02010113          	addi	sp,sp,32
    80003ce4:	00001317          	auipc	t1,0x1
    80003ce8:	4c430067          	jr	1220(t1) # 800051a8 <release>

0000000080003cec <devintr>:
    80003cec:	142027f3          	csrr	a5,scause
    80003cf0:	00000513          	li	a0,0
    80003cf4:	0007c463          	bltz	a5,80003cfc <devintr+0x10>
    80003cf8:	00008067          	ret
    80003cfc:	fe010113          	addi	sp,sp,-32
    80003d00:	00813823          	sd	s0,16(sp)
    80003d04:	00113c23          	sd	ra,24(sp)
    80003d08:	00913423          	sd	s1,8(sp)
    80003d0c:	02010413          	addi	s0,sp,32
    80003d10:	0ff7f713          	andi	a4,a5,255
    80003d14:	00900693          	li	a3,9
    80003d18:	04d70c63          	beq	a4,a3,80003d70 <devintr+0x84>
    80003d1c:	fff00713          	li	a4,-1
    80003d20:	03f71713          	slli	a4,a4,0x3f
    80003d24:	00170713          	addi	a4,a4,1
    80003d28:	00e78c63          	beq	a5,a4,80003d40 <devintr+0x54>
    80003d2c:	01813083          	ld	ra,24(sp)
    80003d30:	01013403          	ld	s0,16(sp)
    80003d34:	00813483          	ld	s1,8(sp)
    80003d38:	02010113          	addi	sp,sp,32
    80003d3c:	00008067          	ret
    80003d40:	00000097          	auipc	ra,0x0
    80003d44:	c8c080e7          	jalr	-884(ra) # 800039cc <cpuid>
    80003d48:	06050663          	beqz	a0,80003db4 <devintr+0xc8>
    80003d4c:	144027f3          	csrr	a5,sip
    80003d50:	ffd7f793          	andi	a5,a5,-3
    80003d54:	14479073          	csrw	sip,a5
    80003d58:	01813083          	ld	ra,24(sp)
    80003d5c:	01013403          	ld	s0,16(sp)
    80003d60:	00813483          	ld	s1,8(sp)
    80003d64:	00200513          	li	a0,2
    80003d68:	02010113          	addi	sp,sp,32
    80003d6c:	00008067          	ret
    80003d70:	00000097          	auipc	ra,0x0
    80003d74:	254080e7          	jalr	596(ra) # 80003fc4 <plic_claim>
    80003d78:	00a00793          	li	a5,10
    80003d7c:	00050493          	mv	s1,a0
    80003d80:	06f50663          	beq	a0,a5,80003dec <devintr+0x100>
    80003d84:	00100513          	li	a0,1
    80003d88:	fa0482e3          	beqz	s1,80003d2c <devintr+0x40>
    80003d8c:	00048593          	mv	a1,s1
    80003d90:	00002517          	auipc	a0,0x2
    80003d94:	57050513          	addi	a0,a0,1392 # 80006300 <CONSOLE_STATUS+0x2f0>
    80003d98:	00000097          	auipc	ra,0x0
    80003d9c:	670080e7          	jalr	1648(ra) # 80004408 <__printf>
    80003da0:	00048513          	mv	a0,s1
    80003da4:	00000097          	auipc	ra,0x0
    80003da8:	258080e7          	jalr	600(ra) # 80003ffc <plic_complete>
    80003dac:	00100513          	li	a0,1
    80003db0:	f7dff06f          	j	80003d2c <devintr+0x40>
    80003db4:	00005517          	auipc	a0,0x5
    80003db8:	80c50513          	addi	a0,a0,-2036 # 800085c0 <tickslock>
    80003dbc:	00001097          	auipc	ra,0x1
    80003dc0:	320080e7          	jalr	800(ra) # 800050dc <acquire>
    80003dc4:	00003717          	auipc	a4,0x3
    80003dc8:	6c070713          	addi	a4,a4,1728 # 80007484 <ticks>
    80003dcc:	00072783          	lw	a5,0(a4)
    80003dd0:	00004517          	auipc	a0,0x4
    80003dd4:	7f050513          	addi	a0,a0,2032 # 800085c0 <tickslock>
    80003dd8:	0017879b          	addiw	a5,a5,1
    80003ddc:	00f72023          	sw	a5,0(a4)
    80003de0:	00001097          	auipc	ra,0x1
    80003de4:	3c8080e7          	jalr	968(ra) # 800051a8 <release>
    80003de8:	f65ff06f          	j	80003d4c <devintr+0x60>
    80003dec:	00001097          	auipc	ra,0x1
    80003df0:	f24080e7          	jalr	-220(ra) # 80004d10 <uartintr>
    80003df4:	fadff06f          	j	80003da0 <devintr+0xb4>
	...

0000000080003e00 <kernelvec>:
    80003e00:	f0010113          	addi	sp,sp,-256
    80003e04:	00113023          	sd	ra,0(sp)
    80003e08:	00213423          	sd	sp,8(sp)
    80003e0c:	00313823          	sd	gp,16(sp)
    80003e10:	00413c23          	sd	tp,24(sp)
    80003e14:	02513023          	sd	t0,32(sp)
    80003e18:	02613423          	sd	t1,40(sp)
    80003e1c:	02713823          	sd	t2,48(sp)
    80003e20:	02813c23          	sd	s0,56(sp)
    80003e24:	04913023          	sd	s1,64(sp)
    80003e28:	04a13423          	sd	a0,72(sp)
    80003e2c:	04b13823          	sd	a1,80(sp)
    80003e30:	04c13c23          	sd	a2,88(sp)
    80003e34:	06d13023          	sd	a3,96(sp)
    80003e38:	06e13423          	sd	a4,104(sp)
    80003e3c:	06f13823          	sd	a5,112(sp)
    80003e40:	07013c23          	sd	a6,120(sp)
    80003e44:	09113023          	sd	a7,128(sp)
    80003e48:	09213423          	sd	s2,136(sp)
    80003e4c:	09313823          	sd	s3,144(sp)
    80003e50:	09413c23          	sd	s4,152(sp)
    80003e54:	0b513023          	sd	s5,160(sp)
    80003e58:	0b613423          	sd	s6,168(sp)
    80003e5c:	0b713823          	sd	s7,176(sp)
    80003e60:	0b813c23          	sd	s8,184(sp)
    80003e64:	0d913023          	sd	s9,192(sp)
    80003e68:	0da13423          	sd	s10,200(sp)
    80003e6c:	0db13823          	sd	s11,208(sp)
    80003e70:	0dc13c23          	sd	t3,216(sp)
    80003e74:	0fd13023          	sd	t4,224(sp)
    80003e78:	0fe13423          	sd	t5,232(sp)
    80003e7c:	0ff13823          	sd	t6,240(sp)
    80003e80:	ccdff0ef          	jal	ra,80003b4c <kerneltrap>
    80003e84:	00013083          	ld	ra,0(sp)
    80003e88:	00813103          	ld	sp,8(sp)
    80003e8c:	01013183          	ld	gp,16(sp)
    80003e90:	02013283          	ld	t0,32(sp)
    80003e94:	02813303          	ld	t1,40(sp)
    80003e98:	03013383          	ld	t2,48(sp)
    80003e9c:	03813403          	ld	s0,56(sp)
    80003ea0:	04013483          	ld	s1,64(sp)
    80003ea4:	04813503          	ld	a0,72(sp)
    80003ea8:	05013583          	ld	a1,80(sp)
    80003eac:	05813603          	ld	a2,88(sp)
    80003eb0:	06013683          	ld	a3,96(sp)
    80003eb4:	06813703          	ld	a4,104(sp)
    80003eb8:	07013783          	ld	a5,112(sp)
    80003ebc:	07813803          	ld	a6,120(sp)
    80003ec0:	08013883          	ld	a7,128(sp)
    80003ec4:	08813903          	ld	s2,136(sp)
    80003ec8:	09013983          	ld	s3,144(sp)
    80003ecc:	09813a03          	ld	s4,152(sp)
    80003ed0:	0a013a83          	ld	s5,160(sp)
    80003ed4:	0a813b03          	ld	s6,168(sp)
    80003ed8:	0b013b83          	ld	s7,176(sp)
    80003edc:	0b813c03          	ld	s8,184(sp)
    80003ee0:	0c013c83          	ld	s9,192(sp)
    80003ee4:	0c813d03          	ld	s10,200(sp)
    80003ee8:	0d013d83          	ld	s11,208(sp)
    80003eec:	0d813e03          	ld	t3,216(sp)
    80003ef0:	0e013e83          	ld	t4,224(sp)
    80003ef4:	0e813f03          	ld	t5,232(sp)
    80003ef8:	0f013f83          	ld	t6,240(sp)
    80003efc:	10010113          	addi	sp,sp,256
    80003f00:	10200073          	sret
    80003f04:	00000013          	nop
    80003f08:	00000013          	nop
    80003f0c:	00000013          	nop

0000000080003f10 <timervec>:
    80003f10:	34051573          	csrrw	a0,mscratch,a0
    80003f14:	00b53023          	sd	a1,0(a0)
    80003f18:	00c53423          	sd	a2,8(a0)
    80003f1c:	00d53823          	sd	a3,16(a0)
    80003f20:	01853583          	ld	a1,24(a0)
    80003f24:	02053603          	ld	a2,32(a0)
    80003f28:	0005b683          	ld	a3,0(a1)
    80003f2c:	00c686b3          	add	a3,a3,a2
    80003f30:	00d5b023          	sd	a3,0(a1)
    80003f34:	00200593          	li	a1,2
    80003f38:	14459073          	csrw	sip,a1
    80003f3c:	01053683          	ld	a3,16(a0)
    80003f40:	00853603          	ld	a2,8(a0)
    80003f44:	00053583          	ld	a1,0(a0)
    80003f48:	34051573          	csrrw	a0,mscratch,a0
    80003f4c:	30200073          	mret

0000000080003f50 <plicinit>:
    80003f50:	ff010113          	addi	sp,sp,-16
    80003f54:	00813423          	sd	s0,8(sp)
    80003f58:	01010413          	addi	s0,sp,16
    80003f5c:	00813403          	ld	s0,8(sp)
    80003f60:	0c0007b7          	lui	a5,0xc000
    80003f64:	00100713          	li	a4,1
    80003f68:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80003f6c:	00e7a223          	sw	a4,4(a5)
    80003f70:	01010113          	addi	sp,sp,16
    80003f74:	00008067          	ret

0000000080003f78 <plicinithart>:
    80003f78:	ff010113          	addi	sp,sp,-16
    80003f7c:	00813023          	sd	s0,0(sp)
    80003f80:	00113423          	sd	ra,8(sp)
    80003f84:	01010413          	addi	s0,sp,16
    80003f88:	00000097          	auipc	ra,0x0
    80003f8c:	a44080e7          	jalr	-1468(ra) # 800039cc <cpuid>
    80003f90:	0085171b          	slliw	a4,a0,0x8
    80003f94:	0c0027b7          	lui	a5,0xc002
    80003f98:	00e787b3          	add	a5,a5,a4
    80003f9c:	40200713          	li	a4,1026
    80003fa0:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80003fa4:	00813083          	ld	ra,8(sp)
    80003fa8:	00013403          	ld	s0,0(sp)
    80003fac:	00d5151b          	slliw	a0,a0,0xd
    80003fb0:	0c2017b7          	lui	a5,0xc201
    80003fb4:	00a78533          	add	a0,a5,a0
    80003fb8:	00052023          	sw	zero,0(a0)
    80003fbc:	01010113          	addi	sp,sp,16
    80003fc0:	00008067          	ret

0000000080003fc4 <plic_claim>:
    80003fc4:	ff010113          	addi	sp,sp,-16
    80003fc8:	00813023          	sd	s0,0(sp)
    80003fcc:	00113423          	sd	ra,8(sp)
    80003fd0:	01010413          	addi	s0,sp,16
    80003fd4:	00000097          	auipc	ra,0x0
    80003fd8:	9f8080e7          	jalr	-1544(ra) # 800039cc <cpuid>
    80003fdc:	00813083          	ld	ra,8(sp)
    80003fe0:	00013403          	ld	s0,0(sp)
    80003fe4:	00d5151b          	slliw	a0,a0,0xd
    80003fe8:	0c2017b7          	lui	a5,0xc201
    80003fec:	00a78533          	add	a0,a5,a0
    80003ff0:	00452503          	lw	a0,4(a0)
    80003ff4:	01010113          	addi	sp,sp,16
    80003ff8:	00008067          	ret

0000000080003ffc <plic_complete>:
    80003ffc:	fe010113          	addi	sp,sp,-32
    80004000:	00813823          	sd	s0,16(sp)
    80004004:	00913423          	sd	s1,8(sp)
    80004008:	00113c23          	sd	ra,24(sp)
    8000400c:	02010413          	addi	s0,sp,32
    80004010:	00050493          	mv	s1,a0
    80004014:	00000097          	auipc	ra,0x0
    80004018:	9b8080e7          	jalr	-1608(ra) # 800039cc <cpuid>
    8000401c:	01813083          	ld	ra,24(sp)
    80004020:	01013403          	ld	s0,16(sp)
    80004024:	00d5179b          	slliw	a5,a0,0xd
    80004028:	0c201737          	lui	a4,0xc201
    8000402c:	00f707b3          	add	a5,a4,a5
    80004030:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004034:	00813483          	ld	s1,8(sp)
    80004038:	02010113          	addi	sp,sp,32
    8000403c:	00008067          	ret

0000000080004040 <consolewrite>:
    80004040:	fb010113          	addi	sp,sp,-80
    80004044:	04813023          	sd	s0,64(sp)
    80004048:	04113423          	sd	ra,72(sp)
    8000404c:	02913c23          	sd	s1,56(sp)
    80004050:	03213823          	sd	s2,48(sp)
    80004054:	03313423          	sd	s3,40(sp)
    80004058:	03413023          	sd	s4,32(sp)
    8000405c:	01513c23          	sd	s5,24(sp)
    80004060:	05010413          	addi	s0,sp,80
    80004064:	06c05c63          	blez	a2,800040dc <consolewrite+0x9c>
    80004068:	00060993          	mv	s3,a2
    8000406c:	00050a13          	mv	s4,a0
    80004070:	00058493          	mv	s1,a1
    80004074:	00000913          	li	s2,0
    80004078:	fff00a93          	li	s5,-1
    8000407c:	01c0006f          	j	80004098 <consolewrite+0x58>
    80004080:	fbf44503          	lbu	a0,-65(s0)
    80004084:	0019091b          	addiw	s2,s2,1
    80004088:	00148493          	addi	s1,s1,1
    8000408c:	00001097          	auipc	ra,0x1
    80004090:	a9c080e7          	jalr	-1380(ra) # 80004b28 <uartputc>
    80004094:	03298063          	beq	s3,s2,800040b4 <consolewrite+0x74>
    80004098:	00048613          	mv	a2,s1
    8000409c:	00100693          	li	a3,1
    800040a0:	000a0593          	mv	a1,s4
    800040a4:	fbf40513          	addi	a0,s0,-65
    800040a8:	00000097          	auipc	ra,0x0
    800040ac:	9dc080e7          	jalr	-1572(ra) # 80003a84 <either_copyin>
    800040b0:	fd5518e3          	bne	a0,s5,80004080 <consolewrite+0x40>
    800040b4:	04813083          	ld	ra,72(sp)
    800040b8:	04013403          	ld	s0,64(sp)
    800040bc:	03813483          	ld	s1,56(sp)
    800040c0:	02813983          	ld	s3,40(sp)
    800040c4:	02013a03          	ld	s4,32(sp)
    800040c8:	01813a83          	ld	s5,24(sp)
    800040cc:	00090513          	mv	a0,s2
    800040d0:	03013903          	ld	s2,48(sp)
    800040d4:	05010113          	addi	sp,sp,80
    800040d8:	00008067          	ret
    800040dc:	00000913          	li	s2,0
    800040e0:	fd5ff06f          	j	800040b4 <consolewrite+0x74>

00000000800040e4 <consoleread>:
    800040e4:	f9010113          	addi	sp,sp,-112
    800040e8:	06813023          	sd	s0,96(sp)
    800040ec:	04913c23          	sd	s1,88(sp)
    800040f0:	05213823          	sd	s2,80(sp)
    800040f4:	05313423          	sd	s3,72(sp)
    800040f8:	05413023          	sd	s4,64(sp)
    800040fc:	03513c23          	sd	s5,56(sp)
    80004100:	03613823          	sd	s6,48(sp)
    80004104:	03713423          	sd	s7,40(sp)
    80004108:	03813023          	sd	s8,32(sp)
    8000410c:	06113423          	sd	ra,104(sp)
    80004110:	01913c23          	sd	s9,24(sp)
    80004114:	07010413          	addi	s0,sp,112
    80004118:	00060b93          	mv	s7,a2
    8000411c:	00050913          	mv	s2,a0
    80004120:	00058c13          	mv	s8,a1
    80004124:	00060b1b          	sext.w	s6,a2
    80004128:	00004497          	auipc	s1,0x4
    8000412c:	4c048493          	addi	s1,s1,1216 # 800085e8 <cons>
    80004130:	00400993          	li	s3,4
    80004134:	fff00a13          	li	s4,-1
    80004138:	00a00a93          	li	s5,10
    8000413c:	05705e63          	blez	s7,80004198 <consoleread+0xb4>
    80004140:	09c4a703          	lw	a4,156(s1)
    80004144:	0984a783          	lw	a5,152(s1)
    80004148:	0007071b          	sext.w	a4,a4
    8000414c:	08e78463          	beq	a5,a4,800041d4 <consoleread+0xf0>
    80004150:	07f7f713          	andi	a4,a5,127
    80004154:	00e48733          	add	a4,s1,a4
    80004158:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000415c:	0017869b          	addiw	a3,a5,1
    80004160:	08d4ac23          	sw	a3,152(s1)
    80004164:	00070c9b          	sext.w	s9,a4
    80004168:	0b370663          	beq	a4,s3,80004214 <consoleread+0x130>
    8000416c:	00100693          	li	a3,1
    80004170:	f9f40613          	addi	a2,s0,-97
    80004174:	000c0593          	mv	a1,s8
    80004178:	00090513          	mv	a0,s2
    8000417c:	f8e40fa3          	sb	a4,-97(s0)
    80004180:	00000097          	auipc	ra,0x0
    80004184:	8b8080e7          	jalr	-1864(ra) # 80003a38 <either_copyout>
    80004188:	01450863          	beq	a0,s4,80004198 <consoleread+0xb4>
    8000418c:	001c0c13          	addi	s8,s8,1
    80004190:	fffb8b9b          	addiw	s7,s7,-1
    80004194:	fb5c94e3          	bne	s9,s5,8000413c <consoleread+0x58>
    80004198:	000b851b          	sext.w	a0,s7
    8000419c:	06813083          	ld	ra,104(sp)
    800041a0:	06013403          	ld	s0,96(sp)
    800041a4:	05813483          	ld	s1,88(sp)
    800041a8:	05013903          	ld	s2,80(sp)
    800041ac:	04813983          	ld	s3,72(sp)
    800041b0:	04013a03          	ld	s4,64(sp)
    800041b4:	03813a83          	ld	s5,56(sp)
    800041b8:	02813b83          	ld	s7,40(sp)
    800041bc:	02013c03          	ld	s8,32(sp)
    800041c0:	01813c83          	ld	s9,24(sp)
    800041c4:	40ab053b          	subw	a0,s6,a0
    800041c8:	03013b03          	ld	s6,48(sp)
    800041cc:	07010113          	addi	sp,sp,112
    800041d0:	00008067          	ret
    800041d4:	00001097          	auipc	ra,0x1
    800041d8:	1d8080e7          	jalr	472(ra) # 800053ac <push_on>
    800041dc:	0984a703          	lw	a4,152(s1)
    800041e0:	09c4a783          	lw	a5,156(s1)
    800041e4:	0007879b          	sext.w	a5,a5
    800041e8:	fef70ce3          	beq	a4,a5,800041e0 <consoleread+0xfc>
    800041ec:	00001097          	auipc	ra,0x1
    800041f0:	234080e7          	jalr	564(ra) # 80005420 <pop_on>
    800041f4:	0984a783          	lw	a5,152(s1)
    800041f8:	07f7f713          	andi	a4,a5,127
    800041fc:	00e48733          	add	a4,s1,a4
    80004200:	01874703          	lbu	a4,24(a4)
    80004204:	0017869b          	addiw	a3,a5,1
    80004208:	08d4ac23          	sw	a3,152(s1)
    8000420c:	00070c9b          	sext.w	s9,a4
    80004210:	f5371ee3          	bne	a4,s3,8000416c <consoleread+0x88>
    80004214:	000b851b          	sext.w	a0,s7
    80004218:	f96bf2e3          	bgeu	s7,s6,8000419c <consoleread+0xb8>
    8000421c:	08f4ac23          	sw	a5,152(s1)
    80004220:	f7dff06f          	j	8000419c <consoleread+0xb8>

0000000080004224 <consputc>:
    80004224:	10000793          	li	a5,256
    80004228:	00f50663          	beq	a0,a5,80004234 <consputc+0x10>
    8000422c:	00001317          	auipc	t1,0x1
    80004230:	9f430067          	jr	-1548(t1) # 80004c20 <uartputc_sync>
    80004234:	ff010113          	addi	sp,sp,-16
    80004238:	00113423          	sd	ra,8(sp)
    8000423c:	00813023          	sd	s0,0(sp)
    80004240:	01010413          	addi	s0,sp,16
    80004244:	00800513          	li	a0,8
    80004248:	00001097          	auipc	ra,0x1
    8000424c:	9d8080e7          	jalr	-1576(ra) # 80004c20 <uartputc_sync>
    80004250:	02000513          	li	a0,32
    80004254:	00001097          	auipc	ra,0x1
    80004258:	9cc080e7          	jalr	-1588(ra) # 80004c20 <uartputc_sync>
    8000425c:	00013403          	ld	s0,0(sp)
    80004260:	00813083          	ld	ra,8(sp)
    80004264:	00800513          	li	a0,8
    80004268:	01010113          	addi	sp,sp,16
    8000426c:	00001317          	auipc	t1,0x1
    80004270:	9b430067          	jr	-1612(t1) # 80004c20 <uartputc_sync>

0000000080004274 <consoleintr>:
    80004274:	fe010113          	addi	sp,sp,-32
    80004278:	00813823          	sd	s0,16(sp)
    8000427c:	00913423          	sd	s1,8(sp)
    80004280:	01213023          	sd	s2,0(sp)
    80004284:	00113c23          	sd	ra,24(sp)
    80004288:	02010413          	addi	s0,sp,32
    8000428c:	00004917          	auipc	s2,0x4
    80004290:	35c90913          	addi	s2,s2,860 # 800085e8 <cons>
    80004294:	00050493          	mv	s1,a0
    80004298:	00090513          	mv	a0,s2
    8000429c:	00001097          	auipc	ra,0x1
    800042a0:	e40080e7          	jalr	-448(ra) # 800050dc <acquire>
    800042a4:	02048c63          	beqz	s1,800042dc <consoleintr+0x68>
    800042a8:	0a092783          	lw	a5,160(s2)
    800042ac:	09892703          	lw	a4,152(s2)
    800042b0:	07f00693          	li	a3,127
    800042b4:	40e7873b          	subw	a4,a5,a4
    800042b8:	02e6e263          	bltu	a3,a4,800042dc <consoleintr+0x68>
    800042bc:	00d00713          	li	a4,13
    800042c0:	04e48063          	beq	s1,a4,80004300 <consoleintr+0x8c>
    800042c4:	07f7f713          	andi	a4,a5,127
    800042c8:	00e90733          	add	a4,s2,a4
    800042cc:	0017879b          	addiw	a5,a5,1
    800042d0:	0af92023          	sw	a5,160(s2)
    800042d4:	00970c23          	sb	s1,24(a4)
    800042d8:	08f92e23          	sw	a5,156(s2)
    800042dc:	01013403          	ld	s0,16(sp)
    800042e0:	01813083          	ld	ra,24(sp)
    800042e4:	00813483          	ld	s1,8(sp)
    800042e8:	00013903          	ld	s2,0(sp)
    800042ec:	00004517          	auipc	a0,0x4
    800042f0:	2fc50513          	addi	a0,a0,764 # 800085e8 <cons>
    800042f4:	02010113          	addi	sp,sp,32
    800042f8:	00001317          	auipc	t1,0x1
    800042fc:	eb030067          	jr	-336(t1) # 800051a8 <release>
    80004300:	00a00493          	li	s1,10
    80004304:	fc1ff06f          	j	800042c4 <consoleintr+0x50>

0000000080004308 <consoleinit>:
    80004308:	fe010113          	addi	sp,sp,-32
    8000430c:	00113c23          	sd	ra,24(sp)
    80004310:	00813823          	sd	s0,16(sp)
    80004314:	00913423          	sd	s1,8(sp)
    80004318:	02010413          	addi	s0,sp,32
    8000431c:	00004497          	auipc	s1,0x4
    80004320:	2cc48493          	addi	s1,s1,716 # 800085e8 <cons>
    80004324:	00048513          	mv	a0,s1
    80004328:	00002597          	auipc	a1,0x2
    8000432c:	03058593          	addi	a1,a1,48 # 80006358 <CONSOLE_STATUS+0x348>
    80004330:	00001097          	auipc	ra,0x1
    80004334:	d88080e7          	jalr	-632(ra) # 800050b8 <initlock>
    80004338:	00000097          	auipc	ra,0x0
    8000433c:	7ac080e7          	jalr	1964(ra) # 80004ae4 <uartinit>
    80004340:	01813083          	ld	ra,24(sp)
    80004344:	01013403          	ld	s0,16(sp)
    80004348:	00000797          	auipc	a5,0x0
    8000434c:	d9c78793          	addi	a5,a5,-612 # 800040e4 <consoleread>
    80004350:	0af4bc23          	sd	a5,184(s1)
    80004354:	00000797          	auipc	a5,0x0
    80004358:	cec78793          	addi	a5,a5,-788 # 80004040 <consolewrite>
    8000435c:	0cf4b023          	sd	a5,192(s1)
    80004360:	00813483          	ld	s1,8(sp)
    80004364:	02010113          	addi	sp,sp,32
    80004368:	00008067          	ret

000000008000436c <console_read>:
    8000436c:	ff010113          	addi	sp,sp,-16
    80004370:	00813423          	sd	s0,8(sp)
    80004374:	01010413          	addi	s0,sp,16
    80004378:	00813403          	ld	s0,8(sp)
    8000437c:	00004317          	auipc	t1,0x4
    80004380:	32433303          	ld	t1,804(t1) # 800086a0 <devsw+0x10>
    80004384:	01010113          	addi	sp,sp,16
    80004388:	00030067          	jr	t1

000000008000438c <console_write>:
    8000438c:	ff010113          	addi	sp,sp,-16
    80004390:	00813423          	sd	s0,8(sp)
    80004394:	01010413          	addi	s0,sp,16
    80004398:	00813403          	ld	s0,8(sp)
    8000439c:	00004317          	auipc	t1,0x4
    800043a0:	30c33303          	ld	t1,780(t1) # 800086a8 <devsw+0x18>
    800043a4:	01010113          	addi	sp,sp,16
    800043a8:	00030067          	jr	t1

00000000800043ac <panic>:
    800043ac:	fe010113          	addi	sp,sp,-32
    800043b0:	00113c23          	sd	ra,24(sp)
    800043b4:	00813823          	sd	s0,16(sp)
    800043b8:	00913423          	sd	s1,8(sp)
    800043bc:	02010413          	addi	s0,sp,32
    800043c0:	00050493          	mv	s1,a0
    800043c4:	00002517          	auipc	a0,0x2
    800043c8:	f9c50513          	addi	a0,a0,-100 # 80006360 <CONSOLE_STATUS+0x350>
    800043cc:	00004797          	auipc	a5,0x4
    800043d0:	3607ae23          	sw	zero,892(a5) # 80008748 <pr+0x18>
    800043d4:	00000097          	auipc	ra,0x0
    800043d8:	034080e7          	jalr	52(ra) # 80004408 <__printf>
    800043dc:	00048513          	mv	a0,s1
    800043e0:	00000097          	auipc	ra,0x0
    800043e4:	028080e7          	jalr	40(ra) # 80004408 <__printf>
    800043e8:	00002517          	auipc	a0,0x2
    800043ec:	d8050513          	addi	a0,a0,-640 # 80006168 <CONSOLE_STATUS+0x158>
    800043f0:	00000097          	auipc	ra,0x0
    800043f4:	018080e7          	jalr	24(ra) # 80004408 <__printf>
    800043f8:	00100793          	li	a5,1
    800043fc:	00003717          	auipc	a4,0x3
    80004400:	08f72623          	sw	a5,140(a4) # 80007488 <panicked>
    80004404:	0000006f          	j	80004404 <panic+0x58>

0000000080004408 <__printf>:
    80004408:	f3010113          	addi	sp,sp,-208
    8000440c:	08813023          	sd	s0,128(sp)
    80004410:	07313423          	sd	s3,104(sp)
    80004414:	09010413          	addi	s0,sp,144
    80004418:	05813023          	sd	s8,64(sp)
    8000441c:	08113423          	sd	ra,136(sp)
    80004420:	06913c23          	sd	s1,120(sp)
    80004424:	07213823          	sd	s2,112(sp)
    80004428:	07413023          	sd	s4,96(sp)
    8000442c:	05513c23          	sd	s5,88(sp)
    80004430:	05613823          	sd	s6,80(sp)
    80004434:	05713423          	sd	s7,72(sp)
    80004438:	03913c23          	sd	s9,56(sp)
    8000443c:	03a13823          	sd	s10,48(sp)
    80004440:	03b13423          	sd	s11,40(sp)
    80004444:	00004317          	auipc	t1,0x4
    80004448:	2ec30313          	addi	t1,t1,748 # 80008730 <pr>
    8000444c:	01832c03          	lw	s8,24(t1)
    80004450:	00b43423          	sd	a1,8(s0)
    80004454:	00c43823          	sd	a2,16(s0)
    80004458:	00d43c23          	sd	a3,24(s0)
    8000445c:	02e43023          	sd	a4,32(s0)
    80004460:	02f43423          	sd	a5,40(s0)
    80004464:	03043823          	sd	a6,48(s0)
    80004468:	03143c23          	sd	a7,56(s0)
    8000446c:	00050993          	mv	s3,a0
    80004470:	4a0c1663          	bnez	s8,8000491c <__printf+0x514>
    80004474:	60098c63          	beqz	s3,80004a8c <__printf+0x684>
    80004478:	0009c503          	lbu	a0,0(s3)
    8000447c:	00840793          	addi	a5,s0,8
    80004480:	f6f43c23          	sd	a5,-136(s0)
    80004484:	00000493          	li	s1,0
    80004488:	22050063          	beqz	a0,800046a8 <__printf+0x2a0>
    8000448c:	00002a37          	lui	s4,0x2
    80004490:	00018ab7          	lui	s5,0x18
    80004494:	000f4b37          	lui	s6,0xf4
    80004498:	00989bb7          	lui	s7,0x989
    8000449c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    800044a0:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    800044a4:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    800044a8:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    800044ac:	00148c9b          	addiw	s9,s1,1
    800044b0:	02500793          	li	a5,37
    800044b4:	01998933          	add	s2,s3,s9
    800044b8:	38f51263          	bne	a0,a5,8000483c <__printf+0x434>
    800044bc:	00094783          	lbu	a5,0(s2)
    800044c0:	00078c9b          	sext.w	s9,a5
    800044c4:	1e078263          	beqz	a5,800046a8 <__printf+0x2a0>
    800044c8:	0024849b          	addiw	s1,s1,2
    800044cc:	07000713          	li	a4,112
    800044d0:	00998933          	add	s2,s3,s1
    800044d4:	38e78a63          	beq	a5,a4,80004868 <__printf+0x460>
    800044d8:	20f76863          	bltu	a4,a5,800046e8 <__printf+0x2e0>
    800044dc:	42a78863          	beq	a5,a0,8000490c <__printf+0x504>
    800044e0:	06400713          	li	a4,100
    800044e4:	40e79663          	bne	a5,a4,800048f0 <__printf+0x4e8>
    800044e8:	f7843783          	ld	a5,-136(s0)
    800044ec:	0007a603          	lw	a2,0(a5)
    800044f0:	00878793          	addi	a5,a5,8
    800044f4:	f6f43c23          	sd	a5,-136(s0)
    800044f8:	42064a63          	bltz	a2,8000492c <__printf+0x524>
    800044fc:	00a00713          	li	a4,10
    80004500:	02e677bb          	remuw	a5,a2,a4
    80004504:	00002d97          	auipc	s11,0x2
    80004508:	e84d8d93          	addi	s11,s11,-380 # 80006388 <digits>
    8000450c:	00900593          	li	a1,9
    80004510:	0006051b          	sext.w	a0,a2
    80004514:	00000c93          	li	s9,0
    80004518:	02079793          	slli	a5,a5,0x20
    8000451c:	0207d793          	srli	a5,a5,0x20
    80004520:	00fd87b3          	add	a5,s11,a5
    80004524:	0007c783          	lbu	a5,0(a5)
    80004528:	02e656bb          	divuw	a3,a2,a4
    8000452c:	f8f40023          	sb	a5,-128(s0)
    80004530:	14c5d863          	bge	a1,a2,80004680 <__printf+0x278>
    80004534:	06300593          	li	a1,99
    80004538:	00100c93          	li	s9,1
    8000453c:	02e6f7bb          	remuw	a5,a3,a4
    80004540:	02079793          	slli	a5,a5,0x20
    80004544:	0207d793          	srli	a5,a5,0x20
    80004548:	00fd87b3          	add	a5,s11,a5
    8000454c:	0007c783          	lbu	a5,0(a5)
    80004550:	02e6d73b          	divuw	a4,a3,a4
    80004554:	f8f400a3          	sb	a5,-127(s0)
    80004558:	12a5f463          	bgeu	a1,a0,80004680 <__printf+0x278>
    8000455c:	00a00693          	li	a3,10
    80004560:	00900593          	li	a1,9
    80004564:	02d777bb          	remuw	a5,a4,a3
    80004568:	02079793          	slli	a5,a5,0x20
    8000456c:	0207d793          	srli	a5,a5,0x20
    80004570:	00fd87b3          	add	a5,s11,a5
    80004574:	0007c503          	lbu	a0,0(a5)
    80004578:	02d757bb          	divuw	a5,a4,a3
    8000457c:	f8a40123          	sb	a0,-126(s0)
    80004580:	48e5f263          	bgeu	a1,a4,80004a04 <__printf+0x5fc>
    80004584:	06300513          	li	a0,99
    80004588:	02d7f5bb          	remuw	a1,a5,a3
    8000458c:	02059593          	slli	a1,a1,0x20
    80004590:	0205d593          	srli	a1,a1,0x20
    80004594:	00bd85b3          	add	a1,s11,a1
    80004598:	0005c583          	lbu	a1,0(a1)
    8000459c:	02d7d7bb          	divuw	a5,a5,a3
    800045a0:	f8b401a3          	sb	a1,-125(s0)
    800045a4:	48e57263          	bgeu	a0,a4,80004a28 <__printf+0x620>
    800045a8:	3e700513          	li	a0,999
    800045ac:	02d7f5bb          	remuw	a1,a5,a3
    800045b0:	02059593          	slli	a1,a1,0x20
    800045b4:	0205d593          	srli	a1,a1,0x20
    800045b8:	00bd85b3          	add	a1,s11,a1
    800045bc:	0005c583          	lbu	a1,0(a1)
    800045c0:	02d7d7bb          	divuw	a5,a5,a3
    800045c4:	f8b40223          	sb	a1,-124(s0)
    800045c8:	46e57663          	bgeu	a0,a4,80004a34 <__printf+0x62c>
    800045cc:	02d7f5bb          	remuw	a1,a5,a3
    800045d0:	02059593          	slli	a1,a1,0x20
    800045d4:	0205d593          	srli	a1,a1,0x20
    800045d8:	00bd85b3          	add	a1,s11,a1
    800045dc:	0005c583          	lbu	a1,0(a1)
    800045e0:	02d7d7bb          	divuw	a5,a5,a3
    800045e4:	f8b402a3          	sb	a1,-123(s0)
    800045e8:	46ea7863          	bgeu	s4,a4,80004a58 <__printf+0x650>
    800045ec:	02d7f5bb          	remuw	a1,a5,a3
    800045f0:	02059593          	slli	a1,a1,0x20
    800045f4:	0205d593          	srli	a1,a1,0x20
    800045f8:	00bd85b3          	add	a1,s11,a1
    800045fc:	0005c583          	lbu	a1,0(a1)
    80004600:	02d7d7bb          	divuw	a5,a5,a3
    80004604:	f8b40323          	sb	a1,-122(s0)
    80004608:	3eeaf863          	bgeu	s5,a4,800049f8 <__printf+0x5f0>
    8000460c:	02d7f5bb          	remuw	a1,a5,a3
    80004610:	02059593          	slli	a1,a1,0x20
    80004614:	0205d593          	srli	a1,a1,0x20
    80004618:	00bd85b3          	add	a1,s11,a1
    8000461c:	0005c583          	lbu	a1,0(a1)
    80004620:	02d7d7bb          	divuw	a5,a5,a3
    80004624:	f8b403a3          	sb	a1,-121(s0)
    80004628:	42eb7e63          	bgeu	s6,a4,80004a64 <__printf+0x65c>
    8000462c:	02d7f5bb          	remuw	a1,a5,a3
    80004630:	02059593          	slli	a1,a1,0x20
    80004634:	0205d593          	srli	a1,a1,0x20
    80004638:	00bd85b3          	add	a1,s11,a1
    8000463c:	0005c583          	lbu	a1,0(a1)
    80004640:	02d7d7bb          	divuw	a5,a5,a3
    80004644:	f8b40423          	sb	a1,-120(s0)
    80004648:	42ebfc63          	bgeu	s7,a4,80004a80 <__printf+0x678>
    8000464c:	02079793          	slli	a5,a5,0x20
    80004650:	0207d793          	srli	a5,a5,0x20
    80004654:	00fd8db3          	add	s11,s11,a5
    80004658:	000dc703          	lbu	a4,0(s11)
    8000465c:	00a00793          	li	a5,10
    80004660:	00900c93          	li	s9,9
    80004664:	f8e404a3          	sb	a4,-119(s0)
    80004668:	00065c63          	bgez	a2,80004680 <__printf+0x278>
    8000466c:	f9040713          	addi	a4,s0,-112
    80004670:	00f70733          	add	a4,a4,a5
    80004674:	02d00693          	li	a3,45
    80004678:	fed70823          	sb	a3,-16(a4)
    8000467c:	00078c93          	mv	s9,a5
    80004680:	f8040793          	addi	a5,s0,-128
    80004684:	01978cb3          	add	s9,a5,s9
    80004688:	f7f40d13          	addi	s10,s0,-129
    8000468c:	000cc503          	lbu	a0,0(s9)
    80004690:	fffc8c93          	addi	s9,s9,-1
    80004694:	00000097          	auipc	ra,0x0
    80004698:	b90080e7          	jalr	-1136(ra) # 80004224 <consputc>
    8000469c:	ffac98e3          	bne	s9,s10,8000468c <__printf+0x284>
    800046a0:	00094503          	lbu	a0,0(s2)
    800046a4:	e00514e3          	bnez	a0,800044ac <__printf+0xa4>
    800046a8:	1a0c1663          	bnez	s8,80004854 <__printf+0x44c>
    800046ac:	08813083          	ld	ra,136(sp)
    800046b0:	08013403          	ld	s0,128(sp)
    800046b4:	07813483          	ld	s1,120(sp)
    800046b8:	07013903          	ld	s2,112(sp)
    800046bc:	06813983          	ld	s3,104(sp)
    800046c0:	06013a03          	ld	s4,96(sp)
    800046c4:	05813a83          	ld	s5,88(sp)
    800046c8:	05013b03          	ld	s6,80(sp)
    800046cc:	04813b83          	ld	s7,72(sp)
    800046d0:	04013c03          	ld	s8,64(sp)
    800046d4:	03813c83          	ld	s9,56(sp)
    800046d8:	03013d03          	ld	s10,48(sp)
    800046dc:	02813d83          	ld	s11,40(sp)
    800046e0:	0d010113          	addi	sp,sp,208
    800046e4:	00008067          	ret
    800046e8:	07300713          	li	a4,115
    800046ec:	1ce78a63          	beq	a5,a4,800048c0 <__printf+0x4b8>
    800046f0:	07800713          	li	a4,120
    800046f4:	1ee79e63          	bne	a5,a4,800048f0 <__printf+0x4e8>
    800046f8:	f7843783          	ld	a5,-136(s0)
    800046fc:	0007a703          	lw	a4,0(a5)
    80004700:	00878793          	addi	a5,a5,8
    80004704:	f6f43c23          	sd	a5,-136(s0)
    80004708:	28074263          	bltz	a4,8000498c <__printf+0x584>
    8000470c:	00002d97          	auipc	s11,0x2
    80004710:	c7cd8d93          	addi	s11,s11,-900 # 80006388 <digits>
    80004714:	00f77793          	andi	a5,a4,15
    80004718:	00fd87b3          	add	a5,s11,a5
    8000471c:	0007c683          	lbu	a3,0(a5)
    80004720:	00f00613          	li	a2,15
    80004724:	0007079b          	sext.w	a5,a4
    80004728:	f8d40023          	sb	a3,-128(s0)
    8000472c:	0047559b          	srliw	a1,a4,0x4
    80004730:	0047569b          	srliw	a3,a4,0x4
    80004734:	00000c93          	li	s9,0
    80004738:	0ee65063          	bge	a2,a4,80004818 <__printf+0x410>
    8000473c:	00f6f693          	andi	a3,a3,15
    80004740:	00dd86b3          	add	a3,s11,a3
    80004744:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004748:	0087d79b          	srliw	a5,a5,0x8
    8000474c:	00100c93          	li	s9,1
    80004750:	f8d400a3          	sb	a3,-127(s0)
    80004754:	0cb67263          	bgeu	a2,a1,80004818 <__printf+0x410>
    80004758:	00f7f693          	andi	a3,a5,15
    8000475c:	00dd86b3          	add	a3,s11,a3
    80004760:	0006c583          	lbu	a1,0(a3)
    80004764:	00f00613          	li	a2,15
    80004768:	0047d69b          	srliw	a3,a5,0x4
    8000476c:	f8b40123          	sb	a1,-126(s0)
    80004770:	0047d593          	srli	a1,a5,0x4
    80004774:	28f67e63          	bgeu	a2,a5,80004a10 <__printf+0x608>
    80004778:	00f6f693          	andi	a3,a3,15
    8000477c:	00dd86b3          	add	a3,s11,a3
    80004780:	0006c503          	lbu	a0,0(a3)
    80004784:	0087d813          	srli	a6,a5,0x8
    80004788:	0087d69b          	srliw	a3,a5,0x8
    8000478c:	f8a401a3          	sb	a0,-125(s0)
    80004790:	28b67663          	bgeu	a2,a1,80004a1c <__printf+0x614>
    80004794:	00f6f693          	andi	a3,a3,15
    80004798:	00dd86b3          	add	a3,s11,a3
    8000479c:	0006c583          	lbu	a1,0(a3)
    800047a0:	00c7d513          	srli	a0,a5,0xc
    800047a4:	00c7d69b          	srliw	a3,a5,0xc
    800047a8:	f8b40223          	sb	a1,-124(s0)
    800047ac:	29067a63          	bgeu	a2,a6,80004a40 <__printf+0x638>
    800047b0:	00f6f693          	andi	a3,a3,15
    800047b4:	00dd86b3          	add	a3,s11,a3
    800047b8:	0006c583          	lbu	a1,0(a3)
    800047bc:	0107d813          	srli	a6,a5,0x10
    800047c0:	0107d69b          	srliw	a3,a5,0x10
    800047c4:	f8b402a3          	sb	a1,-123(s0)
    800047c8:	28a67263          	bgeu	a2,a0,80004a4c <__printf+0x644>
    800047cc:	00f6f693          	andi	a3,a3,15
    800047d0:	00dd86b3          	add	a3,s11,a3
    800047d4:	0006c683          	lbu	a3,0(a3)
    800047d8:	0147d79b          	srliw	a5,a5,0x14
    800047dc:	f8d40323          	sb	a3,-122(s0)
    800047e0:	21067663          	bgeu	a2,a6,800049ec <__printf+0x5e4>
    800047e4:	02079793          	slli	a5,a5,0x20
    800047e8:	0207d793          	srli	a5,a5,0x20
    800047ec:	00fd8db3          	add	s11,s11,a5
    800047f0:	000dc683          	lbu	a3,0(s11)
    800047f4:	00800793          	li	a5,8
    800047f8:	00700c93          	li	s9,7
    800047fc:	f8d403a3          	sb	a3,-121(s0)
    80004800:	00075c63          	bgez	a4,80004818 <__printf+0x410>
    80004804:	f9040713          	addi	a4,s0,-112
    80004808:	00f70733          	add	a4,a4,a5
    8000480c:	02d00693          	li	a3,45
    80004810:	fed70823          	sb	a3,-16(a4)
    80004814:	00078c93          	mv	s9,a5
    80004818:	f8040793          	addi	a5,s0,-128
    8000481c:	01978cb3          	add	s9,a5,s9
    80004820:	f7f40d13          	addi	s10,s0,-129
    80004824:	000cc503          	lbu	a0,0(s9)
    80004828:	fffc8c93          	addi	s9,s9,-1
    8000482c:	00000097          	auipc	ra,0x0
    80004830:	9f8080e7          	jalr	-1544(ra) # 80004224 <consputc>
    80004834:	ff9d18e3          	bne	s10,s9,80004824 <__printf+0x41c>
    80004838:	0100006f          	j	80004848 <__printf+0x440>
    8000483c:	00000097          	auipc	ra,0x0
    80004840:	9e8080e7          	jalr	-1560(ra) # 80004224 <consputc>
    80004844:	000c8493          	mv	s1,s9
    80004848:	00094503          	lbu	a0,0(s2)
    8000484c:	c60510e3          	bnez	a0,800044ac <__printf+0xa4>
    80004850:	e40c0ee3          	beqz	s8,800046ac <__printf+0x2a4>
    80004854:	00004517          	auipc	a0,0x4
    80004858:	edc50513          	addi	a0,a0,-292 # 80008730 <pr>
    8000485c:	00001097          	auipc	ra,0x1
    80004860:	94c080e7          	jalr	-1716(ra) # 800051a8 <release>
    80004864:	e49ff06f          	j	800046ac <__printf+0x2a4>
    80004868:	f7843783          	ld	a5,-136(s0)
    8000486c:	03000513          	li	a0,48
    80004870:	01000d13          	li	s10,16
    80004874:	00878713          	addi	a4,a5,8
    80004878:	0007bc83          	ld	s9,0(a5)
    8000487c:	f6e43c23          	sd	a4,-136(s0)
    80004880:	00000097          	auipc	ra,0x0
    80004884:	9a4080e7          	jalr	-1628(ra) # 80004224 <consputc>
    80004888:	07800513          	li	a0,120
    8000488c:	00000097          	auipc	ra,0x0
    80004890:	998080e7          	jalr	-1640(ra) # 80004224 <consputc>
    80004894:	00002d97          	auipc	s11,0x2
    80004898:	af4d8d93          	addi	s11,s11,-1292 # 80006388 <digits>
    8000489c:	03ccd793          	srli	a5,s9,0x3c
    800048a0:	00fd87b3          	add	a5,s11,a5
    800048a4:	0007c503          	lbu	a0,0(a5)
    800048a8:	fffd0d1b          	addiw	s10,s10,-1
    800048ac:	004c9c93          	slli	s9,s9,0x4
    800048b0:	00000097          	auipc	ra,0x0
    800048b4:	974080e7          	jalr	-1676(ra) # 80004224 <consputc>
    800048b8:	fe0d12e3          	bnez	s10,8000489c <__printf+0x494>
    800048bc:	f8dff06f          	j	80004848 <__printf+0x440>
    800048c0:	f7843783          	ld	a5,-136(s0)
    800048c4:	0007bc83          	ld	s9,0(a5)
    800048c8:	00878793          	addi	a5,a5,8
    800048cc:	f6f43c23          	sd	a5,-136(s0)
    800048d0:	000c9a63          	bnez	s9,800048e4 <__printf+0x4dc>
    800048d4:	1080006f          	j	800049dc <__printf+0x5d4>
    800048d8:	001c8c93          	addi	s9,s9,1
    800048dc:	00000097          	auipc	ra,0x0
    800048e0:	948080e7          	jalr	-1720(ra) # 80004224 <consputc>
    800048e4:	000cc503          	lbu	a0,0(s9)
    800048e8:	fe0518e3          	bnez	a0,800048d8 <__printf+0x4d0>
    800048ec:	f5dff06f          	j	80004848 <__printf+0x440>
    800048f0:	02500513          	li	a0,37
    800048f4:	00000097          	auipc	ra,0x0
    800048f8:	930080e7          	jalr	-1744(ra) # 80004224 <consputc>
    800048fc:	000c8513          	mv	a0,s9
    80004900:	00000097          	auipc	ra,0x0
    80004904:	924080e7          	jalr	-1756(ra) # 80004224 <consputc>
    80004908:	f41ff06f          	j	80004848 <__printf+0x440>
    8000490c:	02500513          	li	a0,37
    80004910:	00000097          	auipc	ra,0x0
    80004914:	914080e7          	jalr	-1772(ra) # 80004224 <consputc>
    80004918:	f31ff06f          	j	80004848 <__printf+0x440>
    8000491c:	00030513          	mv	a0,t1
    80004920:	00000097          	auipc	ra,0x0
    80004924:	7bc080e7          	jalr	1980(ra) # 800050dc <acquire>
    80004928:	b4dff06f          	j	80004474 <__printf+0x6c>
    8000492c:	40c0053b          	negw	a0,a2
    80004930:	00a00713          	li	a4,10
    80004934:	02e576bb          	remuw	a3,a0,a4
    80004938:	00002d97          	auipc	s11,0x2
    8000493c:	a50d8d93          	addi	s11,s11,-1456 # 80006388 <digits>
    80004940:	ff700593          	li	a1,-9
    80004944:	02069693          	slli	a3,a3,0x20
    80004948:	0206d693          	srli	a3,a3,0x20
    8000494c:	00dd86b3          	add	a3,s11,a3
    80004950:	0006c683          	lbu	a3,0(a3)
    80004954:	02e557bb          	divuw	a5,a0,a4
    80004958:	f8d40023          	sb	a3,-128(s0)
    8000495c:	10b65e63          	bge	a2,a1,80004a78 <__printf+0x670>
    80004960:	06300593          	li	a1,99
    80004964:	02e7f6bb          	remuw	a3,a5,a4
    80004968:	02069693          	slli	a3,a3,0x20
    8000496c:	0206d693          	srli	a3,a3,0x20
    80004970:	00dd86b3          	add	a3,s11,a3
    80004974:	0006c683          	lbu	a3,0(a3)
    80004978:	02e7d73b          	divuw	a4,a5,a4
    8000497c:	00200793          	li	a5,2
    80004980:	f8d400a3          	sb	a3,-127(s0)
    80004984:	bca5ece3          	bltu	a1,a0,8000455c <__printf+0x154>
    80004988:	ce5ff06f          	j	8000466c <__printf+0x264>
    8000498c:	40e007bb          	negw	a5,a4
    80004990:	00002d97          	auipc	s11,0x2
    80004994:	9f8d8d93          	addi	s11,s11,-1544 # 80006388 <digits>
    80004998:	00f7f693          	andi	a3,a5,15
    8000499c:	00dd86b3          	add	a3,s11,a3
    800049a0:	0006c583          	lbu	a1,0(a3)
    800049a4:	ff100613          	li	a2,-15
    800049a8:	0047d69b          	srliw	a3,a5,0x4
    800049ac:	f8b40023          	sb	a1,-128(s0)
    800049b0:	0047d59b          	srliw	a1,a5,0x4
    800049b4:	0ac75e63          	bge	a4,a2,80004a70 <__printf+0x668>
    800049b8:	00f6f693          	andi	a3,a3,15
    800049bc:	00dd86b3          	add	a3,s11,a3
    800049c0:	0006c603          	lbu	a2,0(a3)
    800049c4:	00f00693          	li	a3,15
    800049c8:	0087d79b          	srliw	a5,a5,0x8
    800049cc:	f8c400a3          	sb	a2,-127(s0)
    800049d0:	d8b6e4e3          	bltu	a3,a1,80004758 <__printf+0x350>
    800049d4:	00200793          	li	a5,2
    800049d8:	e2dff06f          	j	80004804 <__printf+0x3fc>
    800049dc:	00002c97          	auipc	s9,0x2
    800049e0:	98cc8c93          	addi	s9,s9,-1652 # 80006368 <CONSOLE_STATUS+0x358>
    800049e4:	02800513          	li	a0,40
    800049e8:	ef1ff06f          	j	800048d8 <__printf+0x4d0>
    800049ec:	00700793          	li	a5,7
    800049f0:	00600c93          	li	s9,6
    800049f4:	e0dff06f          	j	80004800 <__printf+0x3f8>
    800049f8:	00700793          	li	a5,7
    800049fc:	00600c93          	li	s9,6
    80004a00:	c69ff06f          	j	80004668 <__printf+0x260>
    80004a04:	00300793          	li	a5,3
    80004a08:	00200c93          	li	s9,2
    80004a0c:	c5dff06f          	j	80004668 <__printf+0x260>
    80004a10:	00300793          	li	a5,3
    80004a14:	00200c93          	li	s9,2
    80004a18:	de9ff06f          	j	80004800 <__printf+0x3f8>
    80004a1c:	00400793          	li	a5,4
    80004a20:	00300c93          	li	s9,3
    80004a24:	dddff06f          	j	80004800 <__printf+0x3f8>
    80004a28:	00400793          	li	a5,4
    80004a2c:	00300c93          	li	s9,3
    80004a30:	c39ff06f          	j	80004668 <__printf+0x260>
    80004a34:	00500793          	li	a5,5
    80004a38:	00400c93          	li	s9,4
    80004a3c:	c2dff06f          	j	80004668 <__printf+0x260>
    80004a40:	00500793          	li	a5,5
    80004a44:	00400c93          	li	s9,4
    80004a48:	db9ff06f          	j	80004800 <__printf+0x3f8>
    80004a4c:	00600793          	li	a5,6
    80004a50:	00500c93          	li	s9,5
    80004a54:	dadff06f          	j	80004800 <__printf+0x3f8>
    80004a58:	00600793          	li	a5,6
    80004a5c:	00500c93          	li	s9,5
    80004a60:	c09ff06f          	j	80004668 <__printf+0x260>
    80004a64:	00800793          	li	a5,8
    80004a68:	00700c93          	li	s9,7
    80004a6c:	bfdff06f          	j	80004668 <__printf+0x260>
    80004a70:	00100793          	li	a5,1
    80004a74:	d91ff06f          	j	80004804 <__printf+0x3fc>
    80004a78:	00100793          	li	a5,1
    80004a7c:	bf1ff06f          	j	8000466c <__printf+0x264>
    80004a80:	00900793          	li	a5,9
    80004a84:	00800c93          	li	s9,8
    80004a88:	be1ff06f          	j	80004668 <__printf+0x260>
    80004a8c:	00002517          	auipc	a0,0x2
    80004a90:	8e450513          	addi	a0,a0,-1820 # 80006370 <CONSOLE_STATUS+0x360>
    80004a94:	00000097          	auipc	ra,0x0
    80004a98:	918080e7          	jalr	-1768(ra) # 800043ac <panic>

0000000080004a9c <printfinit>:
    80004a9c:	fe010113          	addi	sp,sp,-32
    80004aa0:	00813823          	sd	s0,16(sp)
    80004aa4:	00913423          	sd	s1,8(sp)
    80004aa8:	00113c23          	sd	ra,24(sp)
    80004aac:	02010413          	addi	s0,sp,32
    80004ab0:	00004497          	auipc	s1,0x4
    80004ab4:	c8048493          	addi	s1,s1,-896 # 80008730 <pr>
    80004ab8:	00048513          	mv	a0,s1
    80004abc:	00002597          	auipc	a1,0x2
    80004ac0:	8c458593          	addi	a1,a1,-1852 # 80006380 <CONSOLE_STATUS+0x370>
    80004ac4:	00000097          	auipc	ra,0x0
    80004ac8:	5f4080e7          	jalr	1524(ra) # 800050b8 <initlock>
    80004acc:	01813083          	ld	ra,24(sp)
    80004ad0:	01013403          	ld	s0,16(sp)
    80004ad4:	0004ac23          	sw	zero,24(s1)
    80004ad8:	00813483          	ld	s1,8(sp)
    80004adc:	02010113          	addi	sp,sp,32
    80004ae0:	00008067          	ret

0000000080004ae4 <uartinit>:
    80004ae4:	ff010113          	addi	sp,sp,-16
    80004ae8:	00813423          	sd	s0,8(sp)
    80004aec:	01010413          	addi	s0,sp,16
    80004af0:	100007b7          	lui	a5,0x10000
    80004af4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004af8:	f8000713          	li	a4,-128
    80004afc:	00e781a3          	sb	a4,3(a5)
    80004b00:	00300713          	li	a4,3
    80004b04:	00e78023          	sb	a4,0(a5)
    80004b08:	000780a3          	sb	zero,1(a5)
    80004b0c:	00e781a3          	sb	a4,3(a5)
    80004b10:	00700693          	li	a3,7
    80004b14:	00d78123          	sb	a3,2(a5)
    80004b18:	00e780a3          	sb	a4,1(a5)
    80004b1c:	00813403          	ld	s0,8(sp)
    80004b20:	01010113          	addi	sp,sp,16
    80004b24:	00008067          	ret

0000000080004b28 <uartputc>:
    80004b28:	00003797          	auipc	a5,0x3
    80004b2c:	9607a783          	lw	a5,-1696(a5) # 80007488 <panicked>
    80004b30:	00078463          	beqz	a5,80004b38 <uartputc+0x10>
    80004b34:	0000006f          	j	80004b34 <uartputc+0xc>
    80004b38:	fd010113          	addi	sp,sp,-48
    80004b3c:	02813023          	sd	s0,32(sp)
    80004b40:	00913c23          	sd	s1,24(sp)
    80004b44:	01213823          	sd	s2,16(sp)
    80004b48:	01313423          	sd	s3,8(sp)
    80004b4c:	02113423          	sd	ra,40(sp)
    80004b50:	03010413          	addi	s0,sp,48
    80004b54:	00003917          	auipc	s2,0x3
    80004b58:	93c90913          	addi	s2,s2,-1732 # 80007490 <uart_tx_r>
    80004b5c:	00093783          	ld	a5,0(s2)
    80004b60:	00003497          	auipc	s1,0x3
    80004b64:	93848493          	addi	s1,s1,-1736 # 80007498 <uart_tx_w>
    80004b68:	0004b703          	ld	a4,0(s1)
    80004b6c:	02078693          	addi	a3,a5,32
    80004b70:	00050993          	mv	s3,a0
    80004b74:	02e69c63          	bne	a3,a4,80004bac <uartputc+0x84>
    80004b78:	00001097          	auipc	ra,0x1
    80004b7c:	834080e7          	jalr	-1996(ra) # 800053ac <push_on>
    80004b80:	00093783          	ld	a5,0(s2)
    80004b84:	0004b703          	ld	a4,0(s1)
    80004b88:	02078793          	addi	a5,a5,32
    80004b8c:	00e79463          	bne	a5,a4,80004b94 <uartputc+0x6c>
    80004b90:	0000006f          	j	80004b90 <uartputc+0x68>
    80004b94:	00001097          	auipc	ra,0x1
    80004b98:	88c080e7          	jalr	-1908(ra) # 80005420 <pop_on>
    80004b9c:	00093783          	ld	a5,0(s2)
    80004ba0:	0004b703          	ld	a4,0(s1)
    80004ba4:	02078693          	addi	a3,a5,32
    80004ba8:	fce688e3          	beq	a3,a4,80004b78 <uartputc+0x50>
    80004bac:	01f77693          	andi	a3,a4,31
    80004bb0:	00004597          	auipc	a1,0x4
    80004bb4:	ba058593          	addi	a1,a1,-1120 # 80008750 <uart_tx_buf>
    80004bb8:	00d586b3          	add	a3,a1,a3
    80004bbc:	00170713          	addi	a4,a4,1
    80004bc0:	01368023          	sb	s3,0(a3)
    80004bc4:	00e4b023          	sd	a4,0(s1)
    80004bc8:	10000637          	lui	a2,0x10000
    80004bcc:	02f71063          	bne	a4,a5,80004bec <uartputc+0xc4>
    80004bd0:	0340006f          	j	80004c04 <uartputc+0xdc>
    80004bd4:	00074703          	lbu	a4,0(a4)
    80004bd8:	00f93023          	sd	a5,0(s2)
    80004bdc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80004be0:	00093783          	ld	a5,0(s2)
    80004be4:	0004b703          	ld	a4,0(s1)
    80004be8:	00f70e63          	beq	a4,a5,80004c04 <uartputc+0xdc>
    80004bec:	00564683          	lbu	a3,5(a2)
    80004bf0:	01f7f713          	andi	a4,a5,31
    80004bf4:	00e58733          	add	a4,a1,a4
    80004bf8:	0206f693          	andi	a3,a3,32
    80004bfc:	00178793          	addi	a5,a5,1
    80004c00:	fc069ae3          	bnez	a3,80004bd4 <uartputc+0xac>
    80004c04:	02813083          	ld	ra,40(sp)
    80004c08:	02013403          	ld	s0,32(sp)
    80004c0c:	01813483          	ld	s1,24(sp)
    80004c10:	01013903          	ld	s2,16(sp)
    80004c14:	00813983          	ld	s3,8(sp)
    80004c18:	03010113          	addi	sp,sp,48
    80004c1c:	00008067          	ret

0000000080004c20 <uartputc_sync>:
    80004c20:	ff010113          	addi	sp,sp,-16
    80004c24:	00813423          	sd	s0,8(sp)
    80004c28:	01010413          	addi	s0,sp,16
    80004c2c:	00003717          	auipc	a4,0x3
    80004c30:	85c72703          	lw	a4,-1956(a4) # 80007488 <panicked>
    80004c34:	02071663          	bnez	a4,80004c60 <uartputc_sync+0x40>
    80004c38:	00050793          	mv	a5,a0
    80004c3c:	100006b7          	lui	a3,0x10000
    80004c40:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80004c44:	02077713          	andi	a4,a4,32
    80004c48:	fe070ce3          	beqz	a4,80004c40 <uartputc_sync+0x20>
    80004c4c:	0ff7f793          	andi	a5,a5,255
    80004c50:	00f68023          	sb	a5,0(a3)
    80004c54:	00813403          	ld	s0,8(sp)
    80004c58:	01010113          	addi	sp,sp,16
    80004c5c:	00008067          	ret
    80004c60:	0000006f          	j	80004c60 <uartputc_sync+0x40>

0000000080004c64 <uartstart>:
    80004c64:	ff010113          	addi	sp,sp,-16
    80004c68:	00813423          	sd	s0,8(sp)
    80004c6c:	01010413          	addi	s0,sp,16
    80004c70:	00003617          	auipc	a2,0x3
    80004c74:	82060613          	addi	a2,a2,-2016 # 80007490 <uart_tx_r>
    80004c78:	00003517          	auipc	a0,0x3
    80004c7c:	82050513          	addi	a0,a0,-2016 # 80007498 <uart_tx_w>
    80004c80:	00063783          	ld	a5,0(a2)
    80004c84:	00053703          	ld	a4,0(a0)
    80004c88:	04f70263          	beq	a4,a5,80004ccc <uartstart+0x68>
    80004c8c:	100005b7          	lui	a1,0x10000
    80004c90:	00004817          	auipc	a6,0x4
    80004c94:	ac080813          	addi	a6,a6,-1344 # 80008750 <uart_tx_buf>
    80004c98:	01c0006f          	j	80004cb4 <uartstart+0x50>
    80004c9c:	0006c703          	lbu	a4,0(a3)
    80004ca0:	00f63023          	sd	a5,0(a2)
    80004ca4:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004ca8:	00063783          	ld	a5,0(a2)
    80004cac:	00053703          	ld	a4,0(a0)
    80004cb0:	00f70e63          	beq	a4,a5,80004ccc <uartstart+0x68>
    80004cb4:	01f7f713          	andi	a4,a5,31
    80004cb8:	00e806b3          	add	a3,a6,a4
    80004cbc:	0055c703          	lbu	a4,5(a1)
    80004cc0:	00178793          	addi	a5,a5,1
    80004cc4:	02077713          	andi	a4,a4,32
    80004cc8:	fc071ae3          	bnez	a4,80004c9c <uartstart+0x38>
    80004ccc:	00813403          	ld	s0,8(sp)
    80004cd0:	01010113          	addi	sp,sp,16
    80004cd4:	00008067          	ret

0000000080004cd8 <uartgetc>:
    80004cd8:	ff010113          	addi	sp,sp,-16
    80004cdc:	00813423          	sd	s0,8(sp)
    80004ce0:	01010413          	addi	s0,sp,16
    80004ce4:	10000737          	lui	a4,0x10000
    80004ce8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80004cec:	0017f793          	andi	a5,a5,1
    80004cf0:	00078c63          	beqz	a5,80004d08 <uartgetc+0x30>
    80004cf4:	00074503          	lbu	a0,0(a4)
    80004cf8:	0ff57513          	andi	a0,a0,255
    80004cfc:	00813403          	ld	s0,8(sp)
    80004d00:	01010113          	addi	sp,sp,16
    80004d04:	00008067          	ret
    80004d08:	fff00513          	li	a0,-1
    80004d0c:	ff1ff06f          	j	80004cfc <uartgetc+0x24>

0000000080004d10 <uartintr>:
    80004d10:	100007b7          	lui	a5,0x10000
    80004d14:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80004d18:	0017f793          	andi	a5,a5,1
    80004d1c:	0a078463          	beqz	a5,80004dc4 <uartintr+0xb4>
    80004d20:	fe010113          	addi	sp,sp,-32
    80004d24:	00813823          	sd	s0,16(sp)
    80004d28:	00913423          	sd	s1,8(sp)
    80004d2c:	00113c23          	sd	ra,24(sp)
    80004d30:	02010413          	addi	s0,sp,32
    80004d34:	100004b7          	lui	s1,0x10000
    80004d38:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80004d3c:	0ff57513          	andi	a0,a0,255
    80004d40:	fffff097          	auipc	ra,0xfffff
    80004d44:	534080e7          	jalr	1332(ra) # 80004274 <consoleintr>
    80004d48:	0054c783          	lbu	a5,5(s1)
    80004d4c:	0017f793          	andi	a5,a5,1
    80004d50:	fe0794e3          	bnez	a5,80004d38 <uartintr+0x28>
    80004d54:	00002617          	auipc	a2,0x2
    80004d58:	73c60613          	addi	a2,a2,1852 # 80007490 <uart_tx_r>
    80004d5c:	00002517          	auipc	a0,0x2
    80004d60:	73c50513          	addi	a0,a0,1852 # 80007498 <uart_tx_w>
    80004d64:	00063783          	ld	a5,0(a2)
    80004d68:	00053703          	ld	a4,0(a0)
    80004d6c:	04f70263          	beq	a4,a5,80004db0 <uartintr+0xa0>
    80004d70:	100005b7          	lui	a1,0x10000
    80004d74:	00004817          	auipc	a6,0x4
    80004d78:	9dc80813          	addi	a6,a6,-1572 # 80008750 <uart_tx_buf>
    80004d7c:	01c0006f          	j	80004d98 <uartintr+0x88>
    80004d80:	0006c703          	lbu	a4,0(a3)
    80004d84:	00f63023          	sd	a5,0(a2)
    80004d88:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004d8c:	00063783          	ld	a5,0(a2)
    80004d90:	00053703          	ld	a4,0(a0)
    80004d94:	00f70e63          	beq	a4,a5,80004db0 <uartintr+0xa0>
    80004d98:	01f7f713          	andi	a4,a5,31
    80004d9c:	00e806b3          	add	a3,a6,a4
    80004da0:	0055c703          	lbu	a4,5(a1)
    80004da4:	00178793          	addi	a5,a5,1
    80004da8:	02077713          	andi	a4,a4,32
    80004dac:	fc071ae3          	bnez	a4,80004d80 <uartintr+0x70>
    80004db0:	01813083          	ld	ra,24(sp)
    80004db4:	01013403          	ld	s0,16(sp)
    80004db8:	00813483          	ld	s1,8(sp)
    80004dbc:	02010113          	addi	sp,sp,32
    80004dc0:	00008067          	ret
    80004dc4:	00002617          	auipc	a2,0x2
    80004dc8:	6cc60613          	addi	a2,a2,1740 # 80007490 <uart_tx_r>
    80004dcc:	00002517          	auipc	a0,0x2
    80004dd0:	6cc50513          	addi	a0,a0,1740 # 80007498 <uart_tx_w>
    80004dd4:	00063783          	ld	a5,0(a2)
    80004dd8:	00053703          	ld	a4,0(a0)
    80004ddc:	04f70263          	beq	a4,a5,80004e20 <uartintr+0x110>
    80004de0:	100005b7          	lui	a1,0x10000
    80004de4:	00004817          	auipc	a6,0x4
    80004de8:	96c80813          	addi	a6,a6,-1684 # 80008750 <uart_tx_buf>
    80004dec:	01c0006f          	j	80004e08 <uartintr+0xf8>
    80004df0:	0006c703          	lbu	a4,0(a3)
    80004df4:	00f63023          	sd	a5,0(a2)
    80004df8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80004dfc:	00063783          	ld	a5,0(a2)
    80004e00:	00053703          	ld	a4,0(a0)
    80004e04:	02f70063          	beq	a4,a5,80004e24 <uartintr+0x114>
    80004e08:	01f7f713          	andi	a4,a5,31
    80004e0c:	00e806b3          	add	a3,a6,a4
    80004e10:	0055c703          	lbu	a4,5(a1)
    80004e14:	00178793          	addi	a5,a5,1
    80004e18:	02077713          	andi	a4,a4,32
    80004e1c:	fc071ae3          	bnez	a4,80004df0 <uartintr+0xe0>
    80004e20:	00008067          	ret
    80004e24:	00008067          	ret

0000000080004e28 <kinit>:
    80004e28:	fc010113          	addi	sp,sp,-64
    80004e2c:	02913423          	sd	s1,40(sp)
    80004e30:	fffff7b7          	lui	a5,0xfffff
    80004e34:	00005497          	auipc	s1,0x5
    80004e38:	93b48493          	addi	s1,s1,-1733 # 8000976f <end+0xfff>
    80004e3c:	02813823          	sd	s0,48(sp)
    80004e40:	01313c23          	sd	s3,24(sp)
    80004e44:	00f4f4b3          	and	s1,s1,a5
    80004e48:	02113c23          	sd	ra,56(sp)
    80004e4c:	03213023          	sd	s2,32(sp)
    80004e50:	01413823          	sd	s4,16(sp)
    80004e54:	01513423          	sd	s5,8(sp)
    80004e58:	04010413          	addi	s0,sp,64
    80004e5c:	000017b7          	lui	a5,0x1
    80004e60:	01100993          	li	s3,17
    80004e64:	00f487b3          	add	a5,s1,a5
    80004e68:	01b99993          	slli	s3,s3,0x1b
    80004e6c:	06f9e063          	bltu	s3,a5,80004ecc <kinit+0xa4>
    80004e70:	00004a97          	auipc	s5,0x4
    80004e74:	900a8a93          	addi	s5,s5,-1792 # 80008770 <end>
    80004e78:	0754ec63          	bltu	s1,s5,80004ef0 <kinit+0xc8>
    80004e7c:	0734fa63          	bgeu	s1,s3,80004ef0 <kinit+0xc8>
    80004e80:	00088a37          	lui	s4,0x88
    80004e84:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80004e88:	00002917          	auipc	s2,0x2
    80004e8c:	61890913          	addi	s2,s2,1560 # 800074a0 <kmem>
    80004e90:	00ca1a13          	slli	s4,s4,0xc
    80004e94:	0140006f          	j	80004ea8 <kinit+0x80>
    80004e98:	000017b7          	lui	a5,0x1
    80004e9c:	00f484b3          	add	s1,s1,a5
    80004ea0:	0554e863          	bltu	s1,s5,80004ef0 <kinit+0xc8>
    80004ea4:	0534f663          	bgeu	s1,s3,80004ef0 <kinit+0xc8>
    80004ea8:	00001637          	lui	a2,0x1
    80004eac:	00100593          	li	a1,1
    80004eb0:	00048513          	mv	a0,s1
    80004eb4:	00000097          	auipc	ra,0x0
    80004eb8:	5e4080e7          	jalr	1508(ra) # 80005498 <__memset>
    80004ebc:	00093783          	ld	a5,0(s2)
    80004ec0:	00f4b023          	sd	a5,0(s1)
    80004ec4:	00993023          	sd	s1,0(s2)
    80004ec8:	fd4498e3          	bne	s1,s4,80004e98 <kinit+0x70>
    80004ecc:	03813083          	ld	ra,56(sp)
    80004ed0:	03013403          	ld	s0,48(sp)
    80004ed4:	02813483          	ld	s1,40(sp)
    80004ed8:	02013903          	ld	s2,32(sp)
    80004edc:	01813983          	ld	s3,24(sp)
    80004ee0:	01013a03          	ld	s4,16(sp)
    80004ee4:	00813a83          	ld	s5,8(sp)
    80004ee8:	04010113          	addi	sp,sp,64
    80004eec:	00008067          	ret
    80004ef0:	00001517          	auipc	a0,0x1
    80004ef4:	4b050513          	addi	a0,a0,1200 # 800063a0 <digits+0x18>
    80004ef8:	fffff097          	auipc	ra,0xfffff
    80004efc:	4b4080e7          	jalr	1204(ra) # 800043ac <panic>

0000000080004f00 <freerange>:
    80004f00:	fc010113          	addi	sp,sp,-64
    80004f04:	000017b7          	lui	a5,0x1
    80004f08:	02913423          	sd	s1,40(sp)
    80004f0c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80004f10:	009504b3          	add	s1,a0,s1
    80004f14:	fffff537          	lui	a0,0xfffff
    80004f18:	02813823          	sd	s0,48(sp)
    80004f1c:	02113c23          	sd	ra,56(sp)
    80004f20:	03213023          	sd	s2,32(sp)
    80004f24:	01313c23          	sd	s3,24(sp)
    80004f28:	01413823          	sd	s4,16(sp)
    80004f2c:	01513423          	sd	s5,8(sp)
    80004f30:	01613023          	sd	s6,0(sp)
    80004f34:	04010413          	addi	s0,sp,64
    80004f38:	00a4f4b3          	and	s1,s1,a0
    80004f3c:	00f487b3          	add	a5,s1,a5
    80004f40:	06f5e463          	bltu	a1,a5,80004fa8 <freerange+0xa8>
    80004f44:	00004a97          	auipc	s5,0x4
    80004f48:	82ca8a93          	addi	s5,s5,-2004 # 80008770 <end>
    80004f4c:	0954e263          	bltu	s1,s5,80004fd0 <freerange+0xd0>
    80004f50:	01100993          	li	s3,17
    80004f54:	01b99993          	slli	s3,s3,0x1b
    80004f58:	0734fc63          	bgeu	s1,s3,80004fd0 <freerange+0xd0>
    80004f5c:	00058a13          	mv	s4,a1
    80004f60:	00002917          	auipc	s2,0x2
    80004f64:	54090913          	addi	s2,s2,1344 # 800074a0 <kmem>
    80004f68:	00002b37          	lui	s6,0x2
    80004f6c:	0140006f          	j	80004f80 <freerange+0x80>
    80004f70:	000017b7          	lui	a5,0x1
    80004f74:	00f484b3          	add	s1,s1,a5
    80004f78:	0554ec63          	bltu	s1,s5,80004fd0 <freerange+0xd0>
    80004f7c:	0534fa63          	bgeu	s1,s3,80004fd0 <freerange+0xd0>
    80004f80:	00001637          	lui	a2,0x1
    80004f84:	00100593          	li	a1,1
    80004f88:	00048513          	mv	a0,s1
    80004f8c:	00000097          	auipc	ra,0x0
    80004f90:	50c080e7          	jalr	1292(ra) # 80005498 <__memset>
    80004f94:	00093703          	ld	a4,0(s2)
    80004f98:	016487b3          	add	a5,s1,s6
    80004f9c:	00e4b023          	sd	a4,0(s1)
    80004fa0:	00993023          	sd	s1,0(s2)
    80004fa4:	fcfa76e3          	bgeu	s4,a5,80004f70 <freerange+0x70>
    80004fa8:	03813083          	ld	ra,56(sp)
    80004fac:	03013403          	ld	s0,48(sp)
    80004fb0:	02813483          	ld	s1,40(sp)
    80004fb4:	02013903          	ld	s2,32(sp)
    80004fb8:	01813983          	ld	s3,24(sp)
    80004fbc:	01013a03          	ld	s4,16(sp)
    80004fc0:	00813a83          	ld	s5,8(sp)
    80004fc4:	00013b03          	ld	s6,0(sp)
    80004fc8:	04010113          	addi	sp,sp,64
    80004fcc:	00008067          	ret
    80004fd0:	00001517          	auipc	a0,0x1
    80004fd4:	3d050513          	addi	a0,a0,976 # 800063a0 <digits+0x18>
    80004fd8:	fffff097          	auipc	ra,0xfffff
    80004fdc:	3d4080e7          	jalr	980(ra) # 800043ac <panic>

0000000080004fe0 <kfree>:
    80004fe0:	fe010113          	addi	sp,sp,-32
    80004fe4:	00813823          	sd	s0,16(sp)
    80004fe8:	00113c23          	sd	ra,24(sp)
    80004fec:	00913423          	sd	s1,8(sp)
    80004ff0:	02010413          	addi	s0,sp,32
    80004ff4:	03451793          	slli	a5,a0,0x34
    80004ff8:	04079c63          	bnez	a5,80005050 <kfree+0x70>
    80004ffc:	00003797          	auipc	a5,0x3
    80005000:	77478793          	addi	a5,a5,1908 # 80008770 <end>
    80005004:	00050493          	mv	s1,a0
    80005008:	04f56463          	bltu	a0,a5,80005050 <kfree+0x70>
    8000500c:	01100793          	li	a5,17
    80005010:	01b79793          	slli	a5,a5,0x1b
    80005014:	02f57e63          	bgeu	a0,a5,80005050 <kfree+0x70>
    80005018:	00001637          	lui	a2,0x1
    8000501c:	00100593          	li	a1,1
    80005020:	00000097          	auipc	ra,0x0
    80005024:	478080e7          	jalr	1144(ra) # 80005498 <__memset>
    80005028:	00002797          	auipc	a5,0x2
    8000502c:	47878793          	addi	a5,a5,1144 # 800074a0 <kmem>
    80005030:	0007b703          	ld	a4,0(a5)
    80005034:	01813083          	ld	ra,24(sp)
    80005038:	01013403          	ld	s0,16(sp)
    8000503c:	00e4b023          	sd	a4,0(s1)
    80005040:	0097b023          	sd	s1,0(a5)
    80005044:	00813483          	ld	s1,8(sp)
    80005048:	02010113          	addi	sp,sp,32
    8000504c:	00008067          	ret
    80005050:	00001517          	auipc	a0,0x1
    80005054:	35050513          	addi	a0,a0,848 # 800063a0 <digits+0x18>
    80005058:	fffff097          	auipc	ra,0xfffff
    8000505c:	354080e7          	jalr	852(ra) # 800043ac <panic>

0000000080005060 <kalloc>:
    80005060:	fe010113          	addi	sp,sp,-32
    80005064:	00813823          	sd	s0,16(sp)
    80005068:	00913423          	sd	s1,8(sp)
    8000506c:	00113c23          	sd	ra,24(sp)
    80005070:	02010413          	addi	s0,sp,32
    80005074:	00002797          	auipc	a5,0x2
    80005078:	42c78793          	addi	a5,a5,1068 # 800074a0 <kmem>
    8000507c:	0007b483          	ld	s1,0(a5)
    80005080:	02048063          	beqz	s1,800050a0 <kalloc+0x40>
    80005084:	0004b703          	ld	a4,0(s1)
    80005088:	00001637          	lui	a2,0x1
    8000508c:	00500593          	li	a1,5
    80005090:	00048513          	mv	a0,s1
    80005094:	00e7b023          	sd	a4,0(a5)
    80005098:	00000097          	auipc	ra,0x0
    8000509c:	400080e7          	jalr	1024(ra) # 80005498 <__memset>
    800050a0:	01813083          	ld	ra,24(sp)
    800050a4:	01013403          	ld	s0,16(sp)
    800050a8:	00048513          	mv	a0,s1
    800050ac:	00813483          	ld	s1,8(sp)
    800050b0:	02010113          	addi	sp,sp,32
    800050b4:	00008067          	ret

00000000800050b8 <initlock>:
    800050b8:	ff010113          	addi	sp,sp,-16
    800050bc:	00813423          	sd	s0,8(sp)
    800050c0:	01010413          	addi	s0,sp,16
    800050c4:	00813403          	ld	s0,8(sp)
    800050c8:	00b53423          	sd	a1,8(a0)
    800050cc:	00052023          	sw	zero,0(a0)
    800050d0:	00053823          	sd	zero,16(a0)
    800050d4:	01010113          	addi	sp,sp,16
    800050d8:	00008067          	ret

00000000800050dc <acquire>:
    800050dc:	fe010113          	addi	sp,sp,-32
    800050e0:	00813823          	sd	s0,16(sp)
    800050e4:	00913423          	sd	s1,8(sp)
    800050e8:	00113c23          	sd	ra,24(sp)
    800050ec:	01213023          	sd	s2,0(sp)
    800050f0:	02010413          	addi	s0,sp,32
    800050f4:	00050493          	mv	s1,a0
    800050f8:	10002973          	csrr	s2,sstatus
    800050fc:	100027f3          	csrr	a5,sstatus
    80005100:	ffd7f793          	andi	a5,a5,-3
    80005104:	10079073          	csrw	sstatus,a5
    80005108:	fffff097          	auipc	ra,0xfffff
    8000510c:	8e4080e7          	jalr	-1820(ra) # 800039ec <mycpu>
    80005110:	07852783          	lw	a5,120(a0)
    80005114:	06078e63          	beqz	a5,80005190 <acquire+0xb4>
    80005118:	fffff097          	auipc	ra,0xfffff
    8000511c:	8d4080e7          	jalr	-1836(ra) # 800039ec <mycpu>
    80005120:	07852783          	lw	a5,120(a0)
    80005124:	0004a703          	lw	a4,0(s1)
    80005128:	0017879b          	addiw	a5,a5,1
    8000512c:	06f52c23          	sw	a5,120(a0)
    80005130:	04071063          	bnez	a4,80005170 <acquire+0x94>
    80005134:	00100713          	li	a4,1
    80005138:	00070793          	mv	a5,a4
    8000513c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80005140:	0007879b          	sext.w	a5,a5
    80005144:	fe079ae3          	bnez	a5,80005138 <acquire+0x5c>
    80005148:	0ff0000f          	fence
    8000514c:	fffff097          	auipc	ra,0xfffff
    80005150:	8a0080e7          	jalr	-1888(ra) # 800039ec <mycpu>
    80005154:	01813083          	ld	ra,24(sp)
    80005158:	01013403          	ld	s0,16(sp)
    8000515c:	00a4b823          	sd	a0,16(s1)
    80005160:	00013903          	ld	s2,0(sp)
    80005164:	00813483          	ld	s1,8(sp)
    80005168:	02010113          	addi	sp,sp,32
    8000516c:	00008067          	ret
    80005170:	0104b903          	ld	s2,16(s1)
    80005174:	fffff097          	auipc	ra,0xfffff
    80005178:	878080e7          	jalr	-1928(ra) # 800039ec <mycpu>
    8000517c:	faa91ce3          	bne	s2,a0,80005134 <acquire+0x58>
    80005180:	00001517          	auipc	a0,0x1
    80005184:	22850513          	addi	a0,a0,552 # 800063a8 <digits+0x20>
    80005188:	fffff097          	auipc	ra,0xfffff
    8000518c:	224080e7          	jalr	548(ra) # 800043ac <panic>
    80005190:	00195913          	srli	s2,s2,0x1
    80005194:	fffff097          	auipc	ra,0xfffff
    80005198:	858080e7          	jalr	-1960(ra) # 800039ec <mycpu>
    8000519c:	00197913          	andi	s2,s2,1
    800051a0:	07252e23          	sw	s2,124(a0)
    800051a4:	f75ff06f          	j	80005118 <acquire+0x3c>

00000000800051a8 <release>:
    800051a8:	fe010113          	addi	sp,sp,-32
    800051ac:	00813823          	sd	s0,16(sp)
    800051b0:	00113c23          	sd	ra,24(sp)
    800051b4:	00913423          	sd	s1,8(sp)
    800051b8:	01213023          	sd	s2,0(sp)
    800051bc:	02010413          	addi	s0,sp,32
    800051c0:	00052783          	lw	a5,0(a0)
    800051c4:	00079a63          	bnez	a5,800051d8 <release+0x30>
    800051c8:	00001517          	auipc	a0,0x1
    800051cc:	1e850513          	addi	a0,a0,488 # 800063b0 <digits+0x28>
    800051d0:	fffff097          	auipc	ra,0xfffff
    800051d4:	1dc080e7          	jalr	476(ra) # 800043ac <panic>
    800051d8:	01053903          	ld	s2,16(a0)
    800051dc:	00050493          	mv	s1,a0
    800051e0:	fffff097          	auipc	ra,0xfffff
    800051e4:	80c080e7          	jalr	-2036(ra) # 800039ec <mycpu>
    800051e8:	fea910e3          	bne	s2,a0,800051c8 <release+0x20>
    800051ec:	0004b823          	sd	zero,16(s1)
    800051f0:	0ff0000f          	fence
    800051f4:	0f50000f          	fence	iorw,ow
    800051f8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800051fc:	ffffe097          	auipc	ra,0xffffe
    80005200:	7f0080e7          	jalr	2032(ra) # 800039ec <mycpu>
    80005204:	100027f3          	csrr	a5,sstatus
    80005208:	0027f793          	andi	a5,a5,2
    8000520c:	04079a63          	bnez	a5,80005260 <release+0xb8>
    80005210:	07852783          	lw	a5,120(a0)
    80005214:	02f05e63          	blez	a5,80005250 <release+0xa8>
    80005218:	fff7871b          	addiw	a4,a5,-1
    8000521c:	06e52c23          	sw	a4,120(a0)
    80005220:	00071c63          	bnez	a4,80005238 <release+0x90>
    80005224:	07c52783          	lw	a5,124(a0)
    80005228:	00078863          	beqz	a5,80005238 <release+0x90>
    8000522c:	100027f3          	csrr	a5,sstatus
    80005230:	0027e793          	ori	a5,a5,2
    80005234:	10079073          	csrw	sstatus,a5
    80005238:	01813083          	ld	ra,24(sp)
    8000523c:	01013403          	ld	s0,16(sp)
    80005240:	00813483          	ld	s1,8(sp)
    80005244:	00013903          	ld	s2,0(sp)
    80005248:	02010113          	addi	sp,sp,32
    8000524c:	00008067          	ret
    80005250:	00001517          	auipc	a0,0x1
    80005254:	18050513          	addi	a0,a0,384 # 800063d0 <digits+0x48>
    80005258:	fffff097          	auipc	ra,0xfffff
    8000525c:	154080e7          	jalr	340(ra) # 800043ac <panic>
    80005260:	00001517          	auipc	a0,0x1
    80005264:	15850513          	addi	a0,a0,344 # 800063b8 <digits+0x30>
    80005268:	fffff097          	auipc	ra,0xfffff
    8000526c:	144080e7          	jalr	324(ra) # 800043ac <panic>

0000000080005270 <holding>:
    80005270:	00052783          	lw	a5,0(a0)
    80005274:	00079663          	bnez	a5,80005280 <holding+0x10>
    80005278:	00000513          	li	a0,0
    8000527c:	00008067          	ret
    80005280:	fe010113          	addi	sp,sp,-32
    80005284:	00813823          	sd	s0,16(sp)
    80005288:	00913423          	sd	s1,8(sp)
    8000528c:	00113c23          	sd	ra,24(sp)
    80005290:	02010413          	addi	s0,sp,32
    80005294:	01053483          	ld	s1,16(a0)
    80005298:	ffffe097          	auipc	ra,0xffffe
    8000529c:	754080e7          	jalr	1876(ra) # 800039ec <mycpu>
    800052a0:	01813083          	ld	ra,24(sp)
    800052a4:	01013403          	ld	s0,16(sp)
    800052a8:	40a48533          	sub	a0,s1,a0
    800052ac:	00153513          	seqz	a0,a0
    800052b0:	00813483          	ld	s1,8(sp)
    800052b4:	02010113          	addi	sp,sp,32
    800052b8:	00008067          	ret

00000000800052bc <push_off>:
    800052bc:	fe010113          	addi	sp,sp,-32
    800052c0:	00813823          	sd	s0,16(sp)
    800052c4:	00113c23          	sd	ra,24(sp)
    800052c8:	00913423          	sd	s1,8(sp)
    800052cc:	02010413          	addi	s0,sp,32
    800052d0:	100024f3          	csrr	s1,sstatus
    800052d4:	100027f3          	csrr	a5,sstatus
    800052d8:	ffd7f793          	andi	a5,a5,-3
    800052dc:	10079073          	csrw	sstatus,a5
    800052e0:	ffffe097          	auipc	ra,0xffffe
    800052e4:	70c080e7          	jalr	1804(ra) # 800039ec <mycpu>
    800052e8:	07852783          	lw	a5,120(a0)
    800052ec:	02078663          	beqz	a5,80005318 <push_off+0x5c>
    800052f0:	ffffe097          	auipc	ra,0xffffe
    800052f4:	6fc080e7          	jalr	1788(ra) # 800039ec <mycpu>
    800052f8:	07852783          	lw	a5,120(a0)
    800052fc:	01813083          	ld	ra,24(sp)
    80005300:	01013403          	ld	s0,16(sp)
    80005304:	0017879b          	addiw	a5,a5,1
    80005308:	06f52c23          	sw	a5,120(a0)
    8000530c:	00813483          	ld	s1,8(sp)
    80005310:	02010113          	addi	sp,sp,32
    80005314:	00008067          	ret
    80005318:	0014d493          	srli	s1,s1,0x1
    8000531c:	ffffe097          	auipc	ra,0xffffe
    80005320:	6d0080e7          	jalr	1744(ra) # 800039ec <mycpu>
    80005324:	0014f493          	andi	s1,s1,1
    80005328:	06952e23          	sw	s1,124(a0)
    8000532c:	fc5ff06f          	j	800052f0 <push_off+0x34>

0000000080005330 <pop_off>:
    80005330:	ff010113          	addi	sp,sp,-16
    80005334:	00813023          	sd	s0,0(sp)
    80005338:	00113423          	sd	ra,8(sp)
    8000533c:	01010413          	addi	s0,sp,16
    80005340:	ffffe097          	auipc	ra,0xffffe
    80005344:	6ac080e7          	jalr	1708(ra) # 800039ec <mycpu>
    80005348:	100027f3          	csrr	a5,sstatus
    8000534c:	0027f793          	andi	a5,a5,2
    80005350:	04079663          	bnez	a5,8000539c <pop_off+0x6c>
    80005354:	07852783          	lw	a5,120(a0)
    80005358:	02f05a63          	blez	a5,8000538c <pop_off+0x5c>
    8000535c:	fff7871b          	addiw	a4,a5,-1
    80005360:	06e52c23          	sw	a4,120(a0)
    80005364:	00071c63          	bnez	a4,8000537c <pop_off+0x4c>
    80005368:	07c52783          	lw	a5,124(a0)
    8000536c:	00078863          	beqz	a5,8000537c <pop_off+0x4c>
    80005370:	100027f3          	csrr	a5,sstatus
    80005374:	0027e793          	ori	a5,a5,2
    80005378:	10079073          	csrw	sstatus,a5
    8000537c:	00813083          	ld	ra,8(sp)
    80005380:	00013403          	ld	s0,0(sp)
    80005384:	01010113          	addi	sp,sp,16
    80005388:	00008067          	ret
    8000538c:	00001517          	auipc	a0,0x1
    80005390:	04450513          	addi	a0,a0,68 # 800063d0 <digits+0x48>
    80005394:	fffff097          	auipc	ra,0xfffff
    80005398:	018080e7          	jalr	24(ra) # 800043ac <panic>
    8000539c:	00001517          	auipc	a0,0x1
    800053a0:	01c50513          	addi	a0,a0,28 # 800063b8 <digits+0x30>
    800053a4:	fffff097          	auipc	ra,0xfffff
    800053a8:	008080e7          	jalr	8(ra) # 800043ac <panic>

00000000800053ac <push_on>:
    800053ac:	fe010113          	addi	sp,sp,-32
    800053b0:	00813823          	sd	s0,16(sp)
    800053b4:	00113c23          	sd	ra,24(sp)
    800053b8:	00913423          	sd	s1,8(sp)
    800053bc:	02010413          	addi	s0,sp,32
    800053c0:	100024f3          	csrr	s1,sstatus
    800053c4:	100027f3          	csrr	a5,sstatus
    800053c8:	0027e793          	ori	a5,a5,2
    800053cc:	10079073          	csrw	sstatus,a5
    800053d0:	ffffe097          	auipc	ra,0xffffe
    800053d4:	61c080e7          	jalr	1564(ra) # 800039ec <mycpu>
    800053d8:	07852783          	lw	a5,120(a0)
    800053dc:	02078663          	beqz	a5,80005408 <push_on+0x5c>
    800053e0:	ffffe097          	auipc	ra,0xffffe
    800053e4:	60c080e7          	jalr	1548(ra) # 800039ec <mycpu>
    800053e8:	07852783          	lw	a5,120(a0)
    800053ec:	01813083          	ld	ra,24(sp)
    800053f0:	01013403          	ld	s0,16(sp)
    800053f4:	0017879b          	addiw	a5,a5,1
    800053f8:	06f52c23          	sw	a5,120(a0)
    800053fc:	00813483          	ld	s1,8(sp)
    80005400:	02010113          	addi	sp,sp,32
    80005404:	00008067          	ret
    80005408:	0014d493          	srli	s1,s1,0x1
    8000540c:	ffffe097          	auipc	ra,0xffffe
    80005410:	5e0080e7          	jalr	1504(ra) # 800039ec <mycpu>
    80005414:	0014f493          	andi	s1,s1,1
    80005418:	06952e23          	sw	s1,124(a0)
    8000541c:	fc5ff06f          	j	800053e0 <push_on+0x34>

0000000080005420 <pop_on>:
    80005420:	ff010113          	addi	sp,sp,-16
    80005424:	00813023          	sd	s0,0(sp)
    80005428:	00113423          	sd	ra,8(sp)
    8000542c:	01010413          	addi	s0,sp,16
    80005430:	ffffe097          	auipc	ra,0xffffe
    80005434:	5bc080e7          	jalr	1468(ra) # 800039ec <mycpu>
    80005438:	100027f3          	csrr	a5,sstatus
    8000543c:	0027f793          	andi	a5,a5,2
    80005440:	04078463          	beqz	a5,80005488 <pop_on+0x68>
    80005444:	07852783          	lw	a5,120(a0)
    80005448:	02f05863          	blez	a5,80005478 <pop_on+0x58>
    8000544c:	fff7879b          	addiw	a5,a5,-1
    80005450:	06f52c23          	sw	a5,120(a0)
    80005454:	07853783          	ld	a5,120(a0)
    80005458:	00079863          	bnez	a5,80005468 <pop_on+0x48>
    8000545c:	100027f3          	csrr	a5,sstatus
    80005460:	ffd7f793          	andi	a5,a5,-3
    80005464:	10079073          	csrw	sstatus,a5
    80005468:	00813083          	ld	ra,8(sp)
    8000546c:	00013403          	ld	s0,0(sp)
    80005470:	01010113          	addi	sp,sp,16
    80005474:	00008067          	ret
    80005478:	00001517          	auipc	a0,0x1
    8000547c:	f8050513          	addi	a0,a0,-128 # 800063f8 <digits+0x70>
    80005480:	fffff097          	auipc	ra,0xfffff
    80005484:	f2c080e7          	jalr	-212(ra) # 800043ac <panic>
    80005488:	00001517          	auipc	a0,0x1
    8000548c:	f5050513          	addi	a0,a0,-176 # 800063d8 <digits+0x50>
    80005490:	fffff097          	auipc	ra,0xfffff
    80005494:	f1c080e7          	jalr	-228(ra) # 800043ac <panic>

0000000080005498 <__memset>:
    80005498:	ff010113          	addi	sp,sp,-16
    8000549c:	00813423          	sd	s0,8(sp)
    800054a0:	01010413          	addi	s0,sp,16
    800054a4:	1a060e63          	beqz	a2,80005660 <__memset+0x1c8>
    800054a8:	40a007b3          	neg	a5,a0
    800054ac:	0077f793          	andi	a5,a5,7
    800054b0:	00778693          	addi	a3,a5,7
    800054b4:	00b00813          	li	a6,11
    800054b8:	0ff5f593          	andi	a1,a1,255
    800054bc:	fff6071b          	addiw	a4,a2,-1
    800054c0:	1b06e663          	bltu	a3,a6,8000566c <__memset+0x1d4>
    800054c4:	1cd76463          	bltu	a4,a3,8000568c <__memset+0x1f4>
    800054c8:	1a078e63          	beqz	a5,80005684 <__memset+0x1ec>
    800054cc:	00b50023          	sb	a1,0(a0)
    800054d0:	00100713          	li	a4,1
    800054d4:	1ae78463          	beq	a5,a4,8000567c <__memset+0x1e4>
    800054d8:	00b500a3          	sb	a1,1(a0)
    800054dc:	00200713          	li	a4,2
    800054e0:	1ae78a63          	beq	a5,a4,80005694 <__memset+0x1fc>
    800054e4:	00b50123          	sb	a1,2(a0)
    800054e8:	00300713          	li	a4,3
    800054ec:	18e78463          	beq	a5,a4,80005674 <__memset+0x1dc>
    800054f0:	00b501a3          	sb	a1,3(a0)
    800054f4:	00400713          	li	a4,4
    800054f8:	1ae78263          	beq	a5,a4,8000569c <__memset+0x204>
    800054fc:	00b50223          	sb	a1,4(a0)
    80005500:	00500713          	li	a4,5
    80005504:	1ae78063          	beq	a5,a4,800056a4 <__memset+0x20c>
    80005508:	00b502a3          	sb	a1,5(a0)
    8000550c:	00700713          	li	a4,7
    80005510:	18e79e63          	bne	a5,a4,800056ac <__memset+0x214>
    80005514:	00b50323          	sb	a1,6(a0)
    80005518:	00700e93          	li	t4,7
    8000551c:	00859713          	slli	a4,a1,0x8
    80005520:	00e5e733          	or	a4,a1,a4
    80005524:	01059e13          	slli	t3,a1,0x10
    80005528:	01c76e33          	or	t3,a4,t3
    8000552c:	01859313          	slli	t1,a1,0x18
    80005530:	006e6333          	or	t1,t3,t1
    80005534:	02059893          	slli	a7,a1,0x20
    80005538:	40f60e3b          	subw	t3,a2,a5
    8000553c:	011368b3          	or	a7,t1,a7
    80005540:	02859813          	slli	a6,a1,0x28
    80005544:	0108e833          	or	a6,a7,a6
    80005548:	03059693          	slli	a3,a1,0x30
    8000554c:	003e589b          	srliw	a7,t3,0x3
    80005550:	00d866b3          	or	a3,a6,a3
    80005554:	03859713          	slli	a4,a1,0x38
    80005558:	00389813          	slli	a6,a7,0x3
    8000555c:	00f507b3          	add	a5,a0,a5
    80005560:	00e6e733          	or	a4,a3,a4
    80005564:	000e089b          	sext.w	a7,t3
    80005568:	00f806b3          	add	a3,a6,a5
    8000556c:	00e7b023          	sd	a4,0(a5)
    80005570:	00878793          	addi	a5,a5,8
    80005574:	fed79ce3          	bne	a5,a3,8000556c <__memset+0xd4>
    80005578:	ff8e7793          	andi	a5,t3,-8
    8000557c:	0007871b          	sext.w	a4,a5
    80005580:	01d787bb          	addw	a5,a5,t4
    80005584:	0ce88e63          	beq	a7,a4,80005660 <__memset+0x1c8>
    80005588:	00f50733          	add	a4,a0,a5
    8000558c:	00b70023          	sb	a1,0(a4)
    80005590:	0017871b          	addiw	a4,a5,1
    80005594:	0cc77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005598:	00e50733          	add	a4,a0,a4
    8000559c:	00b70023          	sb	a1,0(a4)
    800055a0:	0027871b          	addiw	a4,a5,2
    800055a4:	0ac77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055a8:	00e50733          	add	a4,a0,a4
    800055ac:	00b70023          	sb	a1,0(a4)
    800055b0:	0037871b          	addiw	a4,a5,3
    800055b4:	0ac77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055b8:	00e50733          	add	a4,a0,a4
    800055bc:	00b70023          	sb	a1,0(a4)
    800055c0:	0047871b          	addiw	a4,a5,4
    800055c4:	08c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055c8:	00e50733          	add	a4,a0,a4
    800055cc:	00b70023          	sb	a1,0(a4)
    800055d0:	0057871b          	addiw	a4,a5,5
    800055d4:	08c77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055d8:	00e50733          	add	a4,a0,a4
    800055dc:	00b70023          	sb	a1,0(a4)
    800055e0:	0067871b          	addiw	a4,a5,6
    800055e4:	06c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055e8:	00e50733          	add	a4,a0,a4
    800055ec:	00b70023          	sb	a1,0(a4)
    800055f0:	0077871b          	addiw	a4,a5,7
    800055f4:	06c77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    800055f8:	00e50733          	add	a4,a0,a4
    800055fc:	00b70023          	sb	a1,0(a4)
    80005600:	0087871b          	addiw	a4,a5,8
    80005604:	04c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005608:	00e50733          	add	a4,a0,a4
    8000560c:	00b70023          	sb	a1,0(a4)
    80005610:	0097871b          	addiw	a4,a5,9
    80005614:	04c77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005618:	00e50733          	add	a4,a0,a4
    8000561c:	00b70023          	sb	a1,0(a4)
    80005620:	00a7871b          	addiw	a4,a5,10
    80005624:	02c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005628:	00e50733          	add	a4,a0,a4
    8000562c:	00b70023          	sb	a1,0(a4)
    80005630:	00b7871b          	addiw	a4,a5,11
    80005634:	02c77663          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005638:	00e50733          	add	a4,a0,a4
    8000563c:	00b70023          	sb	a1,0(a4)
    80005640:	00c7871b          	addiw	a4,a5,12
    80005644:	00c77e63          	bgeu	a4,a2,80005660 <__memset+0x1c8>
    80005648:	00e50733          	add	a4,a0,a4
    8000564c:	00b70023          	sb	a1,0(a4)
    80005650:	00d7879b          	addiw	a5,a5,13
    80005654:	00c7f663          	bgeu	a5,a2,80005660 <__memset+0x1c8>
    80005658:	00f507b3          	add	a5,a0,a5
    8000565c:	00b78023          	sb	a1,0(a5)
    80005660:	00813403          	ld	s0,8(sp)
    80005664:	01010113          	addi	sp,sp,16
    80005668:	00008067          	ret
    8000566c:	00b00693          	li	a3,11
    80005670:	e55ff06f          	j	800054c4 <__memset+0x2c>
    80005674:	00300e93          	li	t4,3
    80005678:	ea5ff06f          	j	8000551c <__memset+0x84>
    8000567c:	00100e93          	li	t4,1
    80005680:	e9dff06f          	j	8000551c <__memset+0x84>
    80005684:	00000e93          	li	t4,0
    80005688:	e95ff06f          	j	8000551c <__memset+0x84>
    8000568c:	00000793          	li	a5,0
    80005690:	ef9ff06f          	j	80005588 <__memset+0xf0>
    80005694:	00200e93          	li	t4,2
    80005698:	e85ff06f          	j	8000551c <__memset+0x84>
    8000569c:	00400e93          	li	t4,4
    800056a0:	e7dff06f          	j	8000551c <__memset+0x84>
    800056a4:	00500e93          	li	t4,5
    800056a8:	e75ff06f          	j	8000551c <__memset+0x84>
    800056ac:	00600e93          	li	t4,6
    800056b0:	e6dff06f          	j	8000551c <__memset+0x84>

00000000800056b4 <__memmove>:
    800056b4:	ff010113          	addi	sp,sp,-16
    800056b8:	00813423          	sd	s0,8(sp)
    800056bc:	01010413          	addi	s0,sp,16
    800056c0:	0e060863          	beqz	a2,800057b0 <__memmove+0xfc>
    800056c4:	fff6069b          	addiw	a3,a2,-1
    800056c8:	0006881b          	sext.w	a6,a3
    800056cc:	0ea5e863          	bltu	a1,a0,800057bc <__memmove+0x108>
    800056d0:	00758713          	addi	a4,a1,7
    800056d4:	00a5e7b3          	or	a5,a1,a0
    800056d8:	40a70733          	sub	a4,a4,a0
    800056dc:	0077f793          	andi	a5,a5,7
    800056e0:	00f73713          	sltiu	a4,a4,15
    800056e4:	00174713          	xori	a4,a4,1
    800056e8:	0017b793          	seqz	a5,a5
    800056ec:	00e7f7b3          	and	a5,a5,a4
    800056f0:	10078863          	beqz	a5,80005800 <__memmove+0x14c>
    800056f4:	00900793          	li	a5,9
    800056f8:	1107f463          	bgeu	a5,a6,80005800 <__memmove+0x14c>
    800056fc:	0036581b          	srliw	a6,a2,0x3
    80005700:	fff8081b          	addiw	a6,a6,-1
    80005704:	02081813          	slli	a6,a6,0x20
    80005708:	01d85893          	srli	a7,a6,0x1d
    8000570c:	00858813          	addi	a6,a1,8
    80005710:	00058793          	mv	a5,a1
    80005714:	00050713          	mv	a4,a0
    80005718:	01088833          	add	a6,a7,a6
    8000571c:	0007b883          	ld	a7,0(a5)
    80005720:	00878793          	addi	a5,a5,8
    80005724:	00870713          	addi	a4,a4,8
    80005728:	ff173c23          	sd	a7,-8(a4)
    8000572c:	ff0798e3          	bne	a5,a6,8000571c <__memmove+0x68>
    80005730:	ff867713          	andi	a4,a2,-8
    80005734:	02071793          	slli	a5,a4,0x20
    80005738:	0207d793          	srli	a5,a5,0x20
    8000573c:	00f585b3          	add	a1,a1,a5
    80005740:	40e686bb          	subw	a3,a3,a4
    80005744:	00f507b3          	add	a5,a0,a5
    80005748:	06e60463          	beq	a2,a4,800057b0 <__memmove+0xfc>
    8000574c:	0005c703          	lbu	a4,0(a1)
    80005750:	00e78023          	sb	a4,0(a5)
    80005754:	04068e63          	beqz	a3,800057b0 <__memmove+0xfc>
    80005758:	0015c603          	lbu	a2,1(a1)
    8000575c:	00100713          	li	a4,1
    80005760:	00c780a3          	sb	a2,1(a5)
    80005764:	04e68663          	beq	a3,a4,800057b0 <__memmove+0xfc>
    80005768:	0025c603          	lbu	a2,2(a1)
    8000576c:	00200713          	li	a4,2
    80005770:	00c78123          	sb	a2,2(a5)
    80005774:	02e68e63          	beq	a3,a4,800057b0 <__memmove+0xfc>
    80005778:	0035c603          	lbu	a2,3(a1)
    8000577c:	00300713          	li	a4,3
    80005780:	00c781a3          	sb	a2,3(a5)
    80005784:	02e68663          	beq	a3,a4,800057b0 <__memmove+0xfc>
    80005788:	0045c603          	lbu	a2,4(a1)
    8000578c:	00400713          	li	a4,4
    80005790:	00c78223          	sb	a2,4(a5)
    80005794:	00e68e63          	beq	a3,a4,800057b0 <__memmove+0xfc>
    80005798:	0055c603          	lbu	a2,5(a1)
    8000579c:	00500713          	li	a4,5
    800057a0:	00c782a3          	sb	a2,5(a5)
    800057a4:	00e68663          	beq	a3,a4,800057b0 <__memmove+0xfc>
    800057a8:	0065c703          	lbu	a4,6(a1)
    800057ac:	00e78323          	sb	a4,6(a5)
    800057b0:	00813403          	ld	s0,8(sp)
    800057b4:	01010113          	addi	sp,sp,16
    800057b8:	00008067          	ret
    800057bc:	02061713          	slli	a4,a2,0x20
    800057c0:	02075713          	srli	a4,a4,0x20
    800057c4:	00e587b3          	add	a5,a1,a4
    800057c8:	f0f574e3          	bgeu	a0,a5,800056d0 <__memmove+0x1c>
    800057cc:	02069613          	slli	a2,a3,0x20
    800057d0:	02065613          	srli	a2,a2,0x20
    800057d4:	fff64613          	not	a2,a2
    800057d8:	00e50733          	add	a4,a0,a4
    800057dc:	00c78633          	add	a2,a5,a2
    800057e0:	fff7c683          	lbu	a3,-1(a5)
    800057e4:	fff78793          	addi	a5,a5,-1
    800057e8:	fff70713          	addi	a4,a4,-1
    800057ec:	00d70023          	sb	a3,0(a4)
    800057f0:	fec798e3          	bne	a5,a2,800057e0 <__memmove+0x12c>
    800057f4:	00813403          	ld	s0,8(sp)
    800057f8:	01010113          	addi	sp,sp,16
    800057fc:	00008067          	ret
    80005800:	02069713          	slli	a4,a3,0x20
    80005804:	02075713          	srli	a4,a4,0x20
    80005808:	00170713          	addi	a4,a4,1
    8000580c:	00e50733          	add	a4,a0,a4
    80005810:	00050793          	mv	a5,a0
    80005814:	0005c683          	lbu	a3,0(a1)
    80005818:	00178793          	addi	a5,a5,1
    8000581c:	00158593          	addi	a1,a1,1
    80005820:	fed78fa3          	sb	a3,-1(a5)
    80005824:	fee798e3          	bne	a5,a4,80005814 <__memmove+0x160>
    80005828:	f89ff06f          	j	800057b0 <__memmove+0xfc>

000000008000582c <__putc>:
    8000582c:	fe010113          	addi	sp,sp,-32
    80005830:	00813823          	sd	s0,16(sp)
    80005834:	00113c23          	sd	ra,24(sp)
    80005838:	02010413          	addi	s0,sp,32
    8000583c:	00050793          	mv	a5,a0
    80005840:	fef40593          	addi	a1,s0,-17
    80005844:	00100613          	li	a2,1
    80005848:	00000513          	li	a0,0
    8000584c:	fef407a3          	sb	a5,-17(s0)
    80005850:	fffff097          	auipc	ra,0xfffff
    80005854:	b3c080e7          	jalr	-1220(ra) # 8000438c <console_write>
    80005858:	01813083          	ld	ra,24(sp)
    8000585c:	01013403          	ld	s0,16(sp)
    80005860:	02010113          	addi	sp,sp,32
    80005864:	00008067          	ret

0000000080005868 <__getc>:
    80005868:	fe010113          	addi	sp,sp,-32
    8000586c:	00813823          	sd	s0,16(sp)
    80005870:	00113c23          	sd	ra,24(sp)
    80005874:	02010413          	addi	s0,sp,32
    80005878:	fe840593          	addi	a1,s0,-24
    8000587c:	00100613          	li	a2,1
    80005880:	00000513          	li	a0,0
    80005884:	fffff097          	auipc	ra,0xfffff
    80005888:	ae8080e7          	jalr	-1304(ra) # 8000436c <console_read>
    8000588c:	fe844503          	lbu	a0,-24(s0)
    80005890:	01813083          	ld	ra,24(sp)
    80005894:	01013403          	ld	s0,16(sp)
    80005898:	02010113          	addi	sp,sp,32
    8000589c:	00008067          	ret

00000000800058a0 <console_handler>:
    800058a0:	fe010113          	addi	sp,sp,-32
    800058a4:	00813823          	sd	s0,16(sp)
    800058a8:	00113c23          	sd	ra,24(sp)
    800058ac:	00913423          	sd	s1,8(sp)
    800058b0:	02010413          	addi	s0,sp,32
    800058b4:	14202773          	csrr	a4,scause
    800058b8:	100027f3          	csrr	a5,sstatus
    800058bc:	0027f793          	andi	a5,a5,2
    800058c0:	06079e63          	bnez	a5,8000593c <console_handler+0x9c>
    800058c4:	00074c63          	bltz	a4,800058dc <console_handler+0x3c>
    800058c8:	01813083          	ld	ra,24(sp)
    800058cc:	01013403          	ld	s0,16(sp)
    800058d0:	00813483          	ld	s1,8(sp)
    800058d4:	02010113          	addi	sp,sp,32
    800058d8:	00008067          	ret
    800058dc:	0ff77713          	andi	a4,a4,255
    800058e0:	00900793          	li	a5,9
    800058e4:	fef712e3          	bne	a4,a5,800058c8 <console_handler+0x28>
    800058e8:	ffffe097          	auipc	ra,0xffffe
    800058ec:	6dc080e7          	jalr	1756(ra) # 80003fc4 <plic_claim>
    800058f0:	00a00793          	li	a5,10
    800058f4:	00050493          	mv	s1,a0
    800058f8:	02f50c63          	beq	a0,a5,80005930 <console_handler+0x90>
    800058fc:	fc0506e3          	beqz	a0,800058c8 <console_handler+0x28>
    80005900:	00050593          	mv	a1,a0
    80005904:	00001517          	auipc	a0,0x1
    80005908:	9fc50513          	addi	a0,a0,-1540 # 80006300 <CONSOLE_STATUS+0x2f0>
    8000590c:	fffff097          	auipc	ra,0xfffff
    80005910:	afc080e7          	jalr	-1284(ra) # 80004408 <__printf>
    80005914:	01013403          	ld	s0,16(sp)
    80005918:	01813083          	ld	ra,24(sp)
    8000591c:	00048513          	mv	a0,s1
    80005920:	00813483          	ld	s1,8(sp)
    80005924:	02010113          	addi	sp,sp,32
    80005928:	ffffe317          	auipc	t1,0xffffe
    8000592c:	6d430067          	jr	1748(t1) # 80003ffc <plic_complete>
    80005930:	fffff097          	auipc	ra,0xfffff
    80005934:	3e0080e7          	jalr	992(ra) # 80004d10 <uartintr>
    80005938:	fddff06f          	j	80005914 <console_handler+0x74>
    8000593c:	00001517          	auipc	a0,0x1
    80005940:	ac450513          	addi	a0,a0,-1340 # 80006400 <digits+0x78>
    80005944:	fffff097          	auipc	ra,0xfffff
    80005948:	a68080e7          	jalr	-1432(ra) # 800043ac <panic>
	...
