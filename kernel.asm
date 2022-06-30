
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	00007117          	auipc	sp,0x7
    80000004:	7c013103          	ld	sp,1984(sp) # 800077c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	3ad030ef          	jal	ra,80003bc8 <start>

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
            }
        }
        Riscv::w_sepc(sepc);
        Riscv::w_sstatus(status);
    }
    else if (scause == 0x8000000000000001UL)
    80001298:	fff00793          	li	a5,-1
    8000129c:	03f79793          	slli	a5,a5,0x3f
    800012a0:	00178793          	addi	a5,a5,1
    800012a4:	1ef70863          	beq	a4,a5,80001494 <trapHandler+0x220>
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
    800012b8:	00005097          	auipc	ra,0x5
    800012bc:	a48080e7          	jalr	-1464(ra) # 80005d00 <console_handler>
    } else
    {
        // unexpected trap cause
    }
}
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
    800012f4:	04f76063          	bltu	a4,a5,80001334 <trapHandler+0xc0>
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
    80001318:	00001097          	auipc	ra,0x1
    8000131c:	22c080e7          	jalr	556(ra) # 80002544 <_ZN15MemoryAllocator11getInstanceEv>
    80001320:	00048513          	mv	a0,s1
    80001324:	00001097          	auipc	ra,0x1
    80001328:	0e0080e7          	jalr	224(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
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
    80001360:	27c080e7          	jalr	636(ra) # 800025d8 <_ZN15MemoryAllocator8mem_freeEPv>
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
    80001384:	67c080e7          	jalr	1660(ra) # 800019fc <_ZN7_thread12createThreadEPFvPvES0_>
    80001388:	00a4b023          	sd	a0,0(s1)
                (*handle)->start();
    8000138c:	00000097          	auipc	ra,0x0
    80001390:	59c080e7          	jalr	1436(ra) # 80001928 <_ZN7_thread5startEv>
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
    800013b0:	440080e7          	jalr	1088(ra) # 800017ec <_ZN7_thread10threadExitEv>
                break;}
    800013b4:	f81ff06f          	j	80001334 <trapHandler+0xc0>
                _thread::dispatch();
    800013b8:	00000097          	auipc	ra,0x0
    800013bc:	46c080e7          	jalr	1132(ra) # 80001824 <_ZN7_thread8dispatchEv>
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
    800013e0:	620080e7          	jalr	1568(ra) # 800019fc <_ZN7_thread12createThreadEPFvPvES0_>
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
    80001408:	524080e7          	jalr	1316(ra) # 80001928 <_ZN7_thread5startEv>
                break;}
    8000140c:	f29ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(handle));
    80001410:	00058493          	mv	s1,a1
                __asm__ volatile("mv %0, a2": "=r"(init));
    80001414:	00060513          	mv	a0,a2
                *handle = _sem::semOpen(init);
    80001418:	0005051b          	sext.w	a0,a0
    8000141c:	00001097          	auipc	ra,0x1
    80001420:	d80080e7          	jalr	-640(ra) # 8000219c <_ZN4_sem7semOpenEj>
    80001424:	00a4b023          	sd	a0,0(s1)
                __asm__ volatile("mv a0, %0" : :"r"(handle));
    80001428:	00048513          	mv	a0,s1
                break;
    8000142c:	f09ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(handle));
    80001430:	00058513          	mv	a0,a1
                int ret = _sem::semClose(handle);
    80001434:	00001097          	auipc	ra,0x1
    80001438:	ed4080e7          	jalr	-300(ra) # 80002308 <_ZN4_sem8semCloseEPS_>
                __asm__ volatile("mv a0, %0" : :"r"(ret));
    8000143c:	00050513          	mv	a0,a0
                break;
    80001440:	ef5ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(id));
    80001444:	00058513          	mv	a0,a1
                int ret = _sem::semWait(id);
    80001448:	00001097          	auipc	ra,0x1
    8000144c:	e34080e7          	jalr	-460(ra) # 8000227c <_ZN4_sem7semWaitEPS_>
                __asm__ volatile("mv a0, %0" : :"r"(ret));
    80001450:	00050513          	mv	a0,a0
                break;
    80001454:	ee1ff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(id));
    80001458:	00058513          	mv	a0,a1
                int ret = _sem::semSignal(id);
    8000145c:	00001097          	auipc	ra,0x1
    80001460:	f10080e7          	jalr	-240(ra) # 8000236c <_ZN4_sem9semSignalEPS_>
                __asm__ volatile("mv a0, %0" : :"r"(ret));
    80001464:	00050513          	mv	a0,a0
                break;
    80001468:	ecdff06f          	j	80001334 <trapHandler+0xc0>
                __asm__ volatile("mv %0, a1": "=r"(c));
    8000146c:	00058513          	mv	a0,a1
                __putc(c);
    80001470:	0ff57513          	andi	a0,a0,255
    80001474:	00005097          	auipc	ra,0x5
    80001478:	818080e7          	jalr	-2024(ra) # 80005c8c <__putc>
                break;
    8000147c:	eb9ff06f          	j	80001334 <trapHandler+0xc0>
                char c = __getc();
    80001480:	00005097          	auipc	ra,0x5
    80001484:	848080e7          	jalr	-1976(ra) # 80005cc8 <__getc>
                __asm__ volatile("sd a0, 10*8(fp)");
    80001488:	04a43823          	sd	a0,80(s0)
                __asm__ volatile("mv a0, %0" : : "r"(c));
    8000148c:	00050513          	mv	a0,a0
                break;
    80001490:	ea5ff06f          	j	80001334 <trapHandler+0xc0>
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80001494:	00200793          	li	a5,2
    80001498:	1447b073          	csrc	sip,a5
}
    8000149c:	ea9ff06f          	j	80001344 <trapHandler+0xd0>

00000000800014a0 <_Z9mem_allocm>:

void* mem_alloc(size_t size){
    800014a0:	ff010113          	addi	sp,sp,-16
    800014a4:	00113423          	sd	ra,8(sp)
    800014a8:	00813023          	sd	s0,0(sp)
    800014ac:	01010413          	addi	s0,sp,16
    //upis broja blokova
    size_t numOfBlocks = (size+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE
    800014b0:	01850513          	addi	a0,a0,24
    800014b4:	00655593          	srli	a1,a0,0x6
                         + ((size+sizeof(MemoryAllocator::FullMem))%MEM_BLOCK_SIZE?1:0);
    800014b8:	03f57513          	andi	a0,a0,63
    800014bc:	00050463          	beqz	a0,800014c4 <_Z9mem_allocm+0x24>
    800014c0:	00100513          	li	a0,1

    abi_invoker(MEM_ALLOC, numOfBlocks);
    800014c4:	00a585b3          	add	a1,a1,a0
    800014c8:	00100513          	li	a0,1
    800014cc:	00000097          	auipc	ra,0x0
    800014d0:	d70080e7          	jalr	-656(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    void* p = nullptr;
    __asm__ volatile("mv a0, %0": "=r"(p));
    800014d4:	00050513          	mv	a0,a0
    return p;

}
    800014d8:	00813083          	ld	ra,8(sp)
    800014dc:	00013403          	ld	s0,0(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <_Z8mem_freePv>:

int mem_free(void *p){
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00113423          	sd	ra,8(sp)
    800014f0:	00813023          	sd	s0,0(sp)
    800014f4:	01010413          	addi	s0,sp,16
    800014f8:	00050593          	mv	a1,a0
    abi_invoker(MEM_FREE, p);
    800014fc:	00200513          	li	a0,2
    80001500:	00000097          	auipc	ra,0x0
    80001504:	d3c080e7          	jalr	-708(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    80001508:	00050513          	mv	a0,a0
    return ret;
}
    8000150c:	0005051b          	sext.w	a0,a0
    80001510:	00813083          	ld	ra,8(sp)
    80001514:	00013403          	ld	s0,0(sp)
    80001518:	01010113          	addi	sp,sp,16
    8000151c:	00008067          	ret

0000000080001520 <_Z11thread_exitv>:

int thread_exit(){
    80001520:	ff010113          	addi	sp,sp,-16
    80001524:	00113423          	sd	ra,8(sp)
    80001528:	00813023          	sd	s0,0(sp)
    8000152c:	01010413          	addi	s0,sp,16
    //__asm__ volatile("csrw stvec, %[vector] ": : [vector] "r" (&trap));
    abi_invoker(THREAD_EXIT);
    80001530:	01200513          	li	a0,18
    80001534:	00000097          	auipc	ra,0x0
    80001538:	d08080e7          	jalr	-760(ra) # 8000123c <_Z11abi_invokeriz>

    //povratak
    size_t ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    8000153c:	00050513          	mv	a0,a0
    return ret;
}
    80001540:	0005051b          	sext.w	a0,a0
    80001544:	00813083          	ld	ra,8(sp)
    80001548:	00013403          	ld	s0,0(sp)
    8000154c:	01010113          	addi	sp,sp,16
    80001550:	00008067          	ret

0000000080001554 <_Z13thread_createPP7_threadPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    80001554:	fd010113          	addi	sp,sp,-48
    80001558:	02113423          	sd	ra,40(sp)
    8000155c:	02813023          	sd	s0,32(sp)
    80001560:	00913c23          	sd	s1,24(sp)
    80001564:	01213823          	sd	s2,16(sp)
    80001568:	01313423          	sd	s3,8(sp)
    8000156c:	03010413          	addi	s0,sp,48
    80001570:	00050493          	mv	s1,a0
    80001574:	00058913          	mv	s2,a1
    80001578:	00060993          	mv	s3,a2
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    8000157c:	04100513          	li	a0,65
    80001580:	00001097          	auipc	ra,0x1
    80001584:	e84080e7          	jalr	-380(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
    if (!stack) return -1;
    80001588:	04050263          	beqz	a0,800015cc <_Z13thread_createPP7_threadPFvPvES2_+0x78>
    8000158c:	00050713          	mv	a4,a0

    abi_invoker(THREAD_CREATE, handle, start_routine, arg, stack);
    80001590:	00098693          	mv	a3,s3
    80001594:	00090613          	mv	a2,s2
    80001598:	00048593          	mv	a1,s1
    8000159c:	01100513          	li	a0,17
    800015a0:	00000097          	auipc	ra,0x0
    800015a4:	c9c080e7          	jalr	-868(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    800015a8:	00050513          	mv	a0,a0
    800015ac:	0005051b          	sext.w	a0,a0
    return ret;
}
    800015b0:	02813083          	ld	ra,40(sp)
    800015b4:	02013403          	ld	s0,32(sp)
    800015b8:	01813483          	ld	s1,24(sp)
    800015bc:	01013903          	ld	s2,16(sp)
    800015c0:	00813983          	ld	s3,8(sp)
    800015c4:	03010113          	addi	sp,sp,48
    800015c8:	00008067          	ret
    if (!stack) return -1;
    800015cc:	fff00513          	li	a0,-1
    800015d0:	fe1ff06f          	j	800015b0 <_Z13thread_createPP7_threadPFvPvES2_+0x5c>

00000000800015d4 <_Z15thread_dispatchv>:

void thread_dispatch(){
    800015d4:	ff010113          	addi	sp,sp,-16
    800015d8:	00113423          	sd	ra,8(sp)
    800015dc:	00813023          	sd	s0,0(sp)
    800015e0:	01010413          	addi	s0,sp,16
    abi_invoker(THREAD_DISPATCH);
    800015e4:	01300513          	li	a0,19
    800015e8:	00000097          	auipc	ra,0x0
    800015ec:	c54080e7          	jalr	-940(ra) # 8000123c <_Z11abi_invokeriz>
}
    800015f0:	00813083          	ld	ra,8(sp)
    800015f4:	00013403          	ld	s0,0(sp)
    800015f8:	01010113          	addi	sp,sp,16
    800015fc:	00008067          	ret

0000000080001600 <_Z18thread_create_onlyPP7_threadPFvPvES2_>:

void thread_create_only(thread_t* handle,
                        void(*start_routine)(void*),
                        void* arg){
    80001600:	fd010113          	addi	sp,sp,-48
    80001604:	02113423          	sd	ra,40(sp)
    80001608:	02813023          	sd	s0,32(sp)
    8000160c:	00913c23          	sd	s1,24(sp)
    80001610:	01213823          	sd	s2,16(sp)
    80001614:	01313423          	sd	s3,8(sp)
    80001618:	03010413          	addi	s0,sp,48
    8000161c:	00050493          	mv	s1,a0
    80001620:	00058913          	mv	s2,a1
    80001624:	00060993          	mv	s3,a2
    void * stack = MemoryAllocator::mem_alloc((DEFAULT_STACK_SIZE+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80001628:	04100513          	li	a0,65
    8000162c:	00001097          	auipc	ra,0x1
    80001630:	dd8080e7          	jalr	-552(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
    if (!stack) return ;
    80001634:	02050263          	beqz	a0,80001658 <_Z18thread_create_onlyPP7_threadPFvPvES2_+0x58>
    80001638:	00050713          	mv	a4,a0

    abi_invoker(THREAD_CREATE_ONLY, handle, start_routine, arg, stack);
    8000163c:	00098693          	mv	a3,s3
    80001640:	00090613          	mv	a2,s2
    80001644:	00048593          	mv	a1,s1
    80001648:	01400513          	li	a0,20
    8000164c:	00000097          	auipc	ra,0x0
    80001650:	bf0080e7          	jalr	-1040(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    80001654:	00078513          	mv	a0,a5
}
    80001658:	02813083          	ld	ra,40(sp)
    8000165c:	02013403          	ld	s0,32(sp)
    80001660:	01813483          	ld	s1,24(sp)
    80001664:	01013903          	ld	s2,16(sp)
    80001668:	00813983          	ld	s3,8(sp)
    8000166c:	03010113          	addi	sp,sp,48
    80001670:	00008067          	ret

0000000080001674 <_Z12thread_startP7_thread>:

void thread_start(thread_t handle){
    80001674:	ff010113          	addi	sp,sp,-16
    80001678:	00113423          	sd	ra,8(sp)
    8000167c:	00813023          	sd	s0,0(sp)
    80001680:	01010413          	addi	s0,sp,16
    80001684:	00050593          	mv	a1,a0
    abi_invoker(THREAD_START, handle);
    80001688:	01500513          	li	a0,21
    8000168c:	00000097          	auipc	ra,0x0
    80001690:	bb0080e7          	jalr	-1104(ra) # 8000123c <_Z11abi_invokeriz>
}
    80001694:	00813083          	ld	ra,8(sp)
    80001698:	00013403          	ld	s0,0(sp)
    8000169c:	01010113          	addi	sp,sp,16
    800016a0:	00008067          	ret

00000000800016a4 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned init){
    800016a4:	ff010113          	addi	sp,sp,-16
    800016a8:	00113423          	sd	ra,8(sp)
    800016ac:	00813023          	sd	s0,0(sp)
    800016b0:	01010413          	addi	s0,sp,16
    800016b4:	00058613          	mv	a2,a1
    abi_invoker(SEM_OPEN, handle, init);
    800016b8:	00050593          	mv	a1,a0
    800016bc:	02100513          	li	a0,33
    800016c0:	00000097          	auipc	ra,0x0
    800016c4:	b7c080e7          	jalr	-1156(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile("mv a0, %0": "=r"(ret));
    800016c8:	00050513          	mv	a0,a0
    return ret;
}
    800016cc:	0005051b          	sext.w	a0,a0
    800016d0:	00813083          	ld	ra,8(sp)
    800016d4:	00013403          	ld	s0,0(sp)
    800016d8:	01010113          	addi	sp,sp,16
    800016dc:	00008067          	ret

00000000800016e0 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle){
    800016e0:	ff010113          	addi	sp,sp,-16
    800016e4:	00113423          	sd	ra,8(sp)
    800016e8:	00813023          	sd	s0,0(sp)
    800016ec:	01010413          	addi	s0,sp,16
    800016f0:	00050593          	mv	a1,a0
    abi_invoker(SEM_CLOSE, handle);
    800016f4:	02200513          	li	a0,34
    800016f8:	00000097          	auipc	ra,0x0
    800016fc:	b44080e7          	jalr	-1212(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    80001700:	00050513          	mv	a0,a0
    return ret;
}
    80001704:	0005051b          	sext.w	a0,a0
    80001708:	00813083          	ld	ra,8(sp)
    8000170c:	00013403          	ld	s0,0(sp)
    80001710:	01010113          	addi	sp,sp,16
    80001714:	00008067          	ret

0000000080001718 <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id){
    80001718:	ff010113          	addi	sp,sp,-16
    8000171c:	00113423          	sd	ra,8(sp)
    80001720:	00813023          	sd	s0,0(sp)
    80001724:	01010413          	addi	s0,sp,16
    80001728:	00050593          	mv	a1,a0
    abi_invoker(SEM_WAIT, id);
    8000172c:	02300513          	li	a0,35
    80001730:	00000097          	auipc	ra,0x0
    80001734:	b0c080e7          	jalr	-1268(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    80001738:	00050513          	mv	a0,a0
    return ret;
}
    8000173c:	0005051b          	sext.w	a0,a0
    80001740:	00813083          	ld	ra,8(sp)
    80001744:	00013403          	ld	s0,0(sp)
    80001748:	01010113          	addi	sp,sp,16
    8000174c:	00008067          	ret

0000000080001750 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id){
    80001750:	ff010113          	addi	sp,sp,-16
    80001754:	00113423          	sd	ra,8(sp)
    80001758:	00813023          	sd	s0,0(sp)
    8000175c:	01010413          	addi	s0,sp,16
    80001760:	00050593          	mv	a1,a0
    abi_invoker(SEM_SIGNAL, id);
    80001764:	02400513          	li	a0,36
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	ad4080e7          	jalr	-1324(ra) # 8000123c <_Z11abi_invokeriz>

    int ret;
    __asm__ volatile ("mv a0, %0": "=r"(ret));
    80001770:	00050513          	mv	a0,a0
    return ret;
}
    80001774:	0005051b          	sext.w	a0,a0
    80001778:	00813083          	ld	ra,8(sp)
    8000177c:	00013403          	ld	s0,0(sp)
    80001780:	01010113          	addi	sp,sp,16
    80001784:	00008067          	ret

0000000080001788 <_Z4putcc>:

void putc(char c){
    80001788:	ff010113          	addi	sp,sp,-16
    8000178c:	00113423          	sd	ra,8(sp)
    80001790:	00813023          	sd	s0,0(sp)
    80001794:	01010413          	addi	s0,sp,16
    80001798:	00050593          	mv	a1,a0
    abi_invoker(PUTC, c);
    8000179c:	04200513          	li	a0,66
    800017a0:	00000097          	auipc	ra,0x0
    800017a4:	a9c080e7          	jalr	-1380(ra) # 8000123c <_Z11abi_invokeriz>
}
    800017a8:	00813083          	ld	ra,8(sp)
    800017ac:	00013403          	ld	s0,0(sp)
    800017b0:	01010113          	addi	sp,sp,16
    800017b4:	00008067          	ret

00000000800017b8 <_Z4getcv>:

char getc(){
    800017b8:	ff010113          	addi	sp,sp,-16
    800017bc:	00113423          	sd	ra,8(sp)
    800017c0:	00813023          	sd	s0,0(sp)
    800017c4:	01010413          	addi	s0,sp,16
    abi_invoker(GETC);
    800017c8:	04100513          	li	a0,65
    800017cc:	00000097          	auipc	ra,0x0
    800017d0:	a70080e7          	jalr	-1424(ra) # 8000123c <_Z11abi_invokeriz>
    char ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800017d4:	00050513          	mv	a0,a0
    return ret;
    800017d8:	0ff57513          	andi	a0,a0,255
    800017dc:	00813083          	ld	ra,8(sp)
    800017e0:	00013403          	ld	s0,0(sp)
    800017e4:	01010113          	addi	sp,sp,16
    800017e8:	00008067          	ret

00000000800017ec <_ZN7_thread10threadExitEv>:

_thread *_thread::running = nullptr;

uint64 _thread::timeSliceCounter = 0;

int _thread::threadExit(){
    800017ec:	ff010113          	addi	sp,sp,-16
    800017f0:	00813423          	sd	s0,8(sp)
    800017f4:	01010413          	addi	s0,sp,16
    if (_thread::running == nullptr ) return -1;
    800017f8:	00006797          	auipc	a5,0x6
    800017fc:	0287b783          	ld	a5,40(a5) # 80007820 <_ZN7_thread7runningE>
    80001800:	00078e63          	beqz	a5,8000181c <_ZN7_thread10threadExitEv+0x30>
    bool isFinished() const { return finished; }

    void setFinished(bool value) { finished = value; }

    bool isBlocked() const { return blocked; }

    80001804:	00100713          	li	a4,1
    80001808:	00e78c23          	sb	a4,24(a5)
    _thread::running->setFinished(true);
    return 0;
    8000180c:	00000513          	li	a0,0
}
    80001810:	00813403          	ld	s0,8(sp)
    80001814:	01010113          	addi	sp,sp,16
    80001818:	00008067          	ret
    if (_thread::running == nullptr ) return -1;
    8000181c:	fff00513          	li	a0,-1
    80001820:	ff1ff06f          	j	80001810 <_ZN7_thread10threadExitEv+0x24>

0000000080001824 <_ZN7_thread8dispatchEv>:
    //thread_dispatch();

}

void _thread::dispatch()
{
    80001824:	fe010113          	addi	sp,sp,-32
    80001828:	00113c23          	sd	ra,24(sp)
    8000182c:	00813823          	sd	s0,16(sp)
    80001830:	00913423          	sd	s1,8(sp)
    80001834:	02010413          	addi	s0,sp,32
    _thread *old = running;
    80001838:	00006497          	auipc	s1,0x6
    8000183c:	fe84b483          	ld	s1,-24(s1) # 80007820 <_ZN7_thread7runningE>

    80001840:	0184c783          	lbu	a5,24(s1)
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    80001844:	00079663          	bnez	a5,80001850 <_ZN7_thread8dispatchEv+0x2c>
    void setBlocked(bool value) { blocked = value; }

    80001848:	0194c783          	lbu	a5,25(s1)
    8000184c:	02078c63          	beqz	a5,80001884 <_ZN7_thread8dispatchEv+0x60>
    running = Scheduler::get();
    80001850:	00000097          	auipc	ra,0x0
    80001854:	2e4080e7          	jalr	740(ra) # 80001b34 <_ZN9Scheduler3getEv>
    80001858:	00006797          	auipc	a5,0x6
    8000185c:	fca7b423          	sd	a0,-56(a5) # 80007820 <_ZN7_thread7runningE>
        _thread* tmp = running;
        running = Scheduler::get();
        Scheduler::put(tmp);
    }*/

    _thread::contextSwitch(&old->context, &running->context);
    80001860:	02850593          	addi	a1,a0,40
    80001864:	02848513          	addi	a0,s1,40
    80001868:	00000097          	auipc	ra,0x0
    8000186c:	9c0080e7          	jalr	-1600(ra) # 80001228 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>
}
    80001870:	01813083          	ld	ra,24(sp)
    80001874:	01013403          	ld	s0,16(sp)
    80001878:	00813483          	ld	s1,8(sp)
    8000187c:	02010113          	addi	sp,sp,32
    80001880:	00008067          	ret
    if (!old->isFinished() && !old->isBlocked()) { Scheduler::put(old); }
    80001884:	00048513          	mv	a0,s1
    80001888:	00000097          	auipc	ra,0x0
    8000188c:	314080e7          	jalr	788(ra) # 80001b9c <_ZN9Scheduler3putEP7_thread>
    80001890:	fc1ff06f          	j	80001850 <_ZN7_thread8dispatchEv+0x2c>

0000000080001894 <_ZN7_thread5yieldEv>:
{
    80001894:	ff010113          	addi	sp,sp,-16
    80001898:	00113423          	sd	ra,8(sp)
    8000189c:	00813023          	sd	s0,0(sp)
    800018a0:	01010413          	addi	s0,sp,16
    Riscv::pushRegisters();
    800018a4:	00000097          	auipc	ra,0x0
    800018a8:	88c080e7          	jalr	-1908(ra) # 80001130 <_ZN5Riscv13pushRegistersEv>
    _thread::dispatch();
    800018ac:	00000097          	auipc	ra,0x0
    800018b0:	f78080e7          	jalr	-136(ra) # 80001824 <_ZN7_thread8dispatchEv>
    Riscv::popRegisters();
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	8f8080e7          	jalr	-1800(ra) # 800011ac <_ZN5Riscv12popRegistersEv>
}
    800018bc:	00813083          	ld	ra,8(sp)
    800018c0:	00013403          	ld	s0,0(sp)
    800018c4:	01010113          	addi	sp,sp,16
    800018c8:	00008067          	ret

00000000800018cc <_ZN7_thread13threadWrapperEv>:
    if (running == nullptr) running = this;
    if ( this->body != nullptr) {Scheduler::put(this);}
}

void _thread::threadWrapper()
{
    800018cc:	fe010113          	addi	sp,sp,-32
    800018d0:	00113c23          	sd	ra,24(sp)
    800018d4:	00813823          	sd	s0,16(sp)
    800018d8:	00913423          	sd	s1,8(sp)
    800018dc:	02010413          	addi	s0,sp,32
    Riscv::popSppSpie();
    800018e0:	00001097          	auipc	ra,0x1
    800018e4:	894080e7          	jalr	-1900(ra) # 80002174 <_ZN5Riscv10popSppSpieEv>
    running->body(running->arg);
    800018e8:	00006497          	auipc	s1,0x6
    800018ec:	f3848493          	addi	s1,s1,-200 # 80007820 <_ZN7_thread7runningE>
    800018f0:	0004b783          	ld	a5,0(s1)
    800018f4:	0007b703          	ld	a4,0(a5)
    800018f8:	0207b503          	ld	a0,32(a5)
    800018fc:	000700e7          	jalr	a4
    running->setFinished(true);
    80001900:	0004b783          	ld	a5,0(s1)

    80001904:	00100713          	li	a4,1
    80001908:	00e78c23          	sb	a4,24(a5)
    _thread::yield();
    8000190c:	00000097          	auipc	ra,0x0
    80001910:	f88080e7          	jalr	-120(ra) # 80001894 <_ZN7_thread5yieldEv>
}
    80001914:	01813083          	ld	ra,24(sp)
    80001918:	01013403          	ld	s0,16(sp)
    8000191c:	00813483          	ld	s1,8(sp)
    80001920:	02010113          	addi	sp,sp,32
    80001924:	00008067          	ret

0000000080001928 <_ZN7_thread5startEv>:
    if (running == nullptr) running = this;
    80001928:	00006797          	auipc	a5,0x6
    8000192c:	ef87b783          	ld	a5,-264(a5) # 80007820 <_ZN7_thread7runningE>
    80001930:	02078a63          	beqz	a5,80001964 <_ZN7_thread5startEv+0x3c>
    if ( this->body != nullptr) {Scheduler::put(this);}
    80001934:	00053783          	ld	a5,0(a0)
    80001938:	02078c63          	beqz	a5,80001970 <_ZN7_thread5startEv+0x48>
void _thread::start() {
    8000193c:	ff010113          	addi	sp,sp,-16
    80001940:	00113423          	sd	ra,8(sp)
    80001944:	00813023          	sd	s0,0(sp)
    80001948:	01010413          	addi	s0,sp,16
    if ( this->body != nullptr) {Scheduler::put(this);}
    8000194c:	00000097          	auipc	ra,0x0
    80001950:	250080e7          	jalr	592(ra) # 80001b9c <_ZN9Scheduler3putEP7_thread>
}
    80001954:	00813083          	ld	ra,8(sp)
    80001958:	00013403          	ld	s0,0(sp)
    8000195c:	01010113          	addi	sp,sp,16
    80001960:	00008067          	ret
    if (running == nullptr) running = this;
    80001964:	00006797          	auipc	a5,0x6
    80001968:	eaa7be23          	sd	a0,-324(a5) # 80007820 <_ZN7_thread7runningE>
    8000196c:	fc9ff06f          	j	80001934 <_ZN7_thread5startEv+0xc>
    80001970:	00008067          	ret

0000000080001974 <_ZN7_threadnwEm>:

void* _thread::operator new(size_t sz){
    80001974:	fe010113          	addi	sp,sp,-32
    80001978:	00113c23          	sd	ra,24(sp)
    8000197c:	00813823          	sd	s0,16(sp)
    80001980:	00913423          	sd	s1,8(sp)
    80001984:	02010413          	addi	s0,sp,32
    80001988:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->mem_alloc((sz+
    8000198c:	00001097          	auipc	ra,0x1
    80001990:	bb8080e7          	jalr	-1096(ra) # 80002544 <_ZN15MemoryAllocator11getInstanceEv>
    sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
    80001994:	05748513          	addi	a0,s1,87
    80001998:	00655513          	srli	a0,a0,0x6
    8000199c:	00001097          	auipc	ra,0x1
    800019a0:	a68080e7          	jalr	-1432(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
}
    800019a4:	01813083          	ld	ra,24(sp)
    800019a8:	01013403          	ld	s0,16(sp)
    800019ac:	00813483          	ld	s1,8(sp)
    800019b0:	02010113          	addi	sp,sp,32
    800019b4:	00008067          	ret

00000000800019b8 <_ZN7_threadnaEm>:

void* _thread::operator new[](size_t sz){
    800019b8:	fe010113          	addi	sp,sp,-32
    800019bc:	00113c23          	sd	ra,24(sp)
    800019c0:	00813823          	sd	s0,16(sp)
    800019c4:	00913423          	sd	s1,8(sp)
    800019c8:	02010413          	addi	s0,sp,32
    800019cc:	00050493          	mv	s1,a0
    return MemoryAllocator::getInstance()->mem_alloc((sz+
    800019d0:	00001097          	auipc	ra,0x1
    800019d4:	b74080e7          	jalr	-1164(ra) # 80002544 <_ZN15MemoryAllocator11getInstanceEv>
                                               sizeof(MemoryAllocator::FullMem)+ MEM_BLOCK_SIZE - 1) /MEM_BLOCK_SIZE);
    800019d8:	05748513          	addi	a0,s1,87
    800019dc:	00655513          	srli	a0,a0,0x6
    800019e0:	00001097          	auipc	ra,0x1
    800019e4:	a24080e7          	jalr	-1500(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
}
    800019e8:	01813083          	ld	ra,24(sp)
    800019ec:	01013403          	ld	s0,16(sp)
    800019f0:	00813483          	ld	s1,8(sp)
    800019f4:	02010113          	addi	sp,sp,32
    800019f8:	00008067          	ret

00000000800019fc <_ZN7_thread12createThreadEPFvPvES0_>:
_thread *_thread::createThread(Body body, void* arg){
    800019fc:	fd010113          	addi	sp,sp,-48
    80001a00:	02113423          	sd	ra,40(sp)
    80001a04:	02813023          	sd	s0,32(sp)
    80001a08:	00913c23          	sd	s1,24(sp)
    80001a0c:	01213823          	sd	s2,16(sp)
    80001a10:	01313423          	sd	s3,8(sp)
    80001a14:	03010413          	addi	s0,sp,48
    80001a18:	00050913          	mv	s2,a0
    80001a1c:	00058993          	mv	s3,a1
    _thread* ret = (_thread*)MemoryAllocator::getInstance()->mem_alloc((sizeof(_thread) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80001a20:	00001097          	auipc	ra,0x1
    80001a24:	b24080e7          	jalr	-1244(ra) # 80002544 <_ZN15MemoryAllocator11getInstanceEv>
    80001a28:	00200513          	li	a0,2
    80001a2c:	00001097          	auipc	ra,0x1
    80001a30:	9d8080e7          	jalr	-1576(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
    80001a34:	00050493          	mv	s1,a0
    if (ret == nullptr) return ret;
    80001a38:	04050663          	beqz	a0,80001a84 <_ZN7_thread12createThreadEPFvPvES0_+0x88>
    ret->body = body;
    80001a3c:	01253023          	sd	s2,0(a0)
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE * sizeof(uint64)) : nullptr),
    80001a40:	06090263          	beqz	s2,80001aa4 <_ZN7_thread12createThreadEPFvPvES0_+0xa8>
    80001a44:	00008537          	lui	a0,0x8
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	f70080e7          	jalr	-144(ra) # 800019b8 <_ZN7_threadnaEm>
    80001a50:	00a4b423          	sd	a0,8(s1)
    ret->timeSlice = TIME_SLICE;
    80001a54:	00200793          	li	a5,2
    80001a58:	00f4b823          	sd	a5,16(s1)
    ret->finished = false;
    80001a5c:	00048c23          	sb	zero,24(s1)
    ret->blocked = false;
    80001a60:	00048ca3          	sb	zero,25(s1)
    ret->arg = arg;
    80001a64:	0334b023          	sd	s3,32(s1)
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    80001a68:	04050263          	beqz	a0,80001aac <_ZN7_thread12createThreadEPFvPvES0_+0xb0>
    80001a6c:	000087b7          	lui	a5,0x8
    80001a70:	00f50533          	add	a0,a0,a5
    ret->context = {
    80001a74:	00000797          	auipc	a5,0x0
    80001a78:	e5878793          	addi	a5,a5,-424 # 800018cc <_ZN7_thread13threadWrapperEv>
    80001a7c:	02f4b423          	sd	a5,40(s1)
    80001a80:	02a4b823          	sd	a0,48(s1)
}
    80001a84:	00048513          	mv	a0,s1
    80001a88:	02813083          	ld	ra,40(sp)
    80001a8c:	02013403          	ld	s0,32(sp)
    80001a90:	01813483          	ld	s1,24(sp)
    80001a94:	01013903          	ld	s2,16(sp)
    80001a98:	00813983          	ld	s3,8(sp)
    80001a9c:	03010113          	addi	sp,sp,48
    80001aa0:	00008067          	ret
    ret->stack = static_cast<uint64 *>(body != nullptr ? _thread::operator new[](STACK_SIZE * sizeof(uint64)) : nullptr),
    80001aa4:	00000513          	li	a0,0
    80001aa8:	fa9ff06f          	j	80001a50 <_ZN7_thread12createThreadEPFvPvES0_+0x54>
            ret->stack != nullptr ? (uint64) &(ret->stack[STACK_SIZE]): 0
    80001aac:	00000513          	li	a0,0
    80001ab0:	fc5ff06f          	j	80001a74 <_ZN7_thread12createThreadEPFvPvES0_+0x78>

0000000080001ab4 <_ZN7_threaddlEPv>:
void _thread::operator delete(void* p){
    80001ab4:	fe010113          	addi	sp,sp,-32
    80001ab8:	00113c23          	sd	ra,24(sp)
    80001abc:	00813823          	sd	s0,16(sp)
    80001ac0:	00913423          	sd	s1,8(sp)
    80001ac4:	02010413          	addi	s0,sp,32
    80001ac8:	00050493          	mv	s1,a0
    MemoryAllocator::getInstance()->mem_free(p);
    80001acc:	00001097          	auipc	ra,0x1
    80001ad0:	a78080e7          	jalr	-1416(ra) # 80002544 <_ZN15MemoryAllocator11getInstanceEv>
    80001ad4:	00048513          	mv	a0,s1
    80001ad8:	00001097          	auipc	ra,0x1
    80001adc:	b00080e7          	jalr	-1280(ra) # 800025d8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001ae0:	01813083          	ld	ra,24(sp)
    80001ae4:	01013403          	ld	s0,16(sp)
    80001ae8:	00813483          	ld	s1,8(sp)
    80001aec:	02010113          	addi	sp,sp,32
    80001af0:	00008067          	ret

0000000080001af4 <_ZN7_threaddaEPv>:

void _thread::operator delete[](void* p){
    80001af4:	fe010113          	addi	sp,sp,-32
    80001af8:	00113c23          	sd	ra,24(sp)
    80001afc:	00813823          	sd	s0,16(sp)
    80001b00:	00913423          	sd	s1,8(sp)
    80001b04:	02010413          	addi	s0,sp,32
    80001b08:	00050493          	mv	s1,a0
    MemoryAllocator::getInstance()->mem_free(p);
    80001b0c:	00001097          	auipc	ra,0x1
    80001b10:	a38080e7          	jalr	-1480(ra) # 80002544 <_ZN15MemoryAllocator11getInstanceEv>
    80001b14:	00048513          	mv	a0,s1
    80001b18:	00001097          	auipc	ra,0x1
    80001b1c:	ac0080e7          	jalr	-1344(ra) # 800025d8 <_ZN15MemoryAllocator8mem_freeEPv>
}
    80001b20:	01813083          	ld	ra,24(sp)
    80001b24:	01013403          	ld	s0,16(sp)
    80001b28:	00813483          	ld	s1,8(sp)
    80001b2c:	02010113          	addi	sp,sp,32
    80001b30:	00008067          	ret

0000000080001b34 <_ZN9Scheduler3getEv>:

Scheduler::Elem* Scheduler::head = nullptr;
Scheduler::Elem* Scheduler::tail = nullptr;

_thread *Scheduler::get()
{
    80001b34:	fe010113          	addi	sp,sp,-32
    80001b38:	00113c23          	sd	ra,24(sp)
    80001b3c:	00813823          	sd	s0,16(sp)
    80001b40:	00913423          	sd	s1,8(sp)
    80001b44:	02010413          	addi	s0,sp,32
    if (!head) return nullptr;
    80001b48:	00006517          	auipc	a0,0x6
    80001b4c:	ce853503          	ld	a0,-792(a0) # 80007830 <_ZN9Scheduler4headE>
    80001b50:	04050263          	beqz	a0,80001b94 <_ZN9Scheduler3getEv+0x60>

    Elem* elem = head;
    head = head->next;
    80001b54:	00853783          	ld	a5,8(a0)
    80001b58:	00006717          	auipc	a4,0x6
    80001b5c:	ccf73c23          	sd	a5,-808(a4) # 80007830 <_ZN9Scheduler4headE>
    if (!head) tail = 0;
    80001b60:	02078463          	beqz	a5,80001b88 <_ZN9Scheduler3getEv+0x54>

    _thread *ret = elem->data;
    80001b64:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    80001b68:	00001097          	auipc	ra,0x1
    80001b6c:	a70080e7          	jalr	-1424(ra) # 800025d8 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    80001b70:	00048513          	mv	a0,s1
    80001b74:	01813083          	ld	ra,24(sp)
    80001b78:	01013403          	ld	s0,16(sp)
    80001b7c:	00813483          	ld	s1,8(sp)
    80001b80:	02010113          	addi	sp,sp,32
    80001b84:	00008067          	ret
    if (!head) tail = 0;
    80001b88:	00006797          	auipc	a5,0x6
    80001b8c:	ca07b823          	sd	zero,-848(a5) # 80007838 <_ZN9Scheduler4tailE>
    80001b90:	fd5ff06f          	j	80001b64 <_ZN9Scheduler3getEv+0x30>
    if (!head) return nullptr;
    80001b94:	00050493          	mv	s1,a0
    80001b98:	fd9ff06f          	j	80001b70 <_ZN9Scheduler3getEv+0x3c>

0000000080001b9c <_ZN9Scheduler3putEP7_thread>:

void Scheduler::put(_thread *ccb)
{
    80001b9c:	fe010113          	addi	sp,sp,-32
    80001ba0:	00113c23          	sd	ra,24(sp)
    80001ba4:	00813823          	sd	s0,16(sp)
    80001ba8:	00913423          	sd	s1,8(sp)
    80001bac:	02010413          	addi	s0,sp,32
    80001bb0:	00050493          	mv	s1,a0
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80001bb4:	00100513          	li	a0,1
    80001bb8:	00001097          	auipc	ra,0x1
    80001bbc:	84c080e7          	jalr	-1972(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = ccb;
    80001bc0:	00953023          	sd	s1,0(a0)
    elem->next = nullptr;
    80001bc4:	00053423          	sd	zero,8(a0)
    if(tail){
    80001bc8:	00006797          	auipc	a5,0x6
    80001bcc:	c707b783          	ld	a5,-912(a5) # 80007838 <_ZN9Scheduler4tailE>
    80001bd0:	02078263          	beqz	a5,80001bf4 <_ZN9Scheduler3putEP7_thread+0x58>
        tail->next = elem;
    80001bd4:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    80001bd8:	00006797          	auipc	a5,0x6
    80001bdc:	c6a7b023          	sd	a0,-928(a5) # 80007838 <_ZN9Scheduler4tailE>
    }else{
        head = tail = elem;
    }
    80001be0:	01813083          	ld	ra,24(sp)
    80001be4:	01013403          	ld	s0,16(sp)
    80001be8:	00813483          	ld	s1,8(sp)
    80001bec:	02010113          	addi	sp,sp,32
    80001bf0:	00008067          	ret
        head = tail = elem;
    80001bf4:	00006797          	auipc	a5,0x6
    80001bf8:	c3c78793          	addi	a5,a5,-964 # 80007830 <_ZN9Scheduler4headE>
    80001bfc:	00a7b423          	sd	a0,8(a5)
    80001c00:	00a7b023          	sd	a0,0(a5)
    80001c04:	fddff06f          	j	80001be0 <_ZN9Scheduler3putEP7_thread+0x44>

0000000080001c08 <_Z15wrapperUserMainPv>:
#include "../h/_thread.h"

extern "C" void trap();
void userMain();

void wrapperUserMain(void *){
    80001c08:	ff010113          	addi	sp,sp,-16
    80001c0c:	00113423          	sd	ra,8(sp)
    80001c10:	00813023          	sd	s0,0(sp)
    80001c14:	01010413          	addi	s0,sp,16
    userMain();
    80001c18:	00002097          	auipc	ra,0x2
    80001c1c:	9b8080e7          	jalr	-1608(ra) # 800035d0 <_Z8userMainv>
}
    80001c20:	00813083          	ld	ra,8(sp)
    80001c24:	00013403          	ld	s0,0(sp)
    80001c28:	01010113          	addi	sp,sp,16
    80001c2c:	00008067          	ret

0000000080001c30 <main>:

int main(){
    80001c30:	fe010113          	addi	sp,sp,-32
    80001c34:	00113c23          	sd	ra,24(sp)
    80001c38:	00813823          	sd	s0,16(sp)
    80001c3c:	00913423          	sd	s1,8(sp)
    80001c40:	01213023          	sd	s2,0(sp)
    80001c44:	02010413          	addi	s0,sp,32

    _thread* threads[2];

    threads[0] = _thread::createThread(nullptr, nullptr);
    80001c48:	00000593          	li	a1,0
    80001c4c:	00000513          	li	a0,0
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	dac080e7          	jalr	-596(ra) # 800019fc <_ZN7_thread12createThreadEPFvPvES0_>
    80001c58:	00050913          	mv	s2,a0
    threads[1] = _thread::createThread(&wrapperUserMain, nullptr);
    80001c5c:	00000593          	li	a1,0
    80001c60:	00000517          	auipc	a0,0x0
    80001c64:	fa850513          	addi	a0,a0,-88 # 80001c08 <_Z15wrapperUserMainPv>
    80001c68:	00000097          	auipc	ra,0x0
    80001c6c:	d94080e7          	jalr	-620(ra) # 800019fc <_ZN7_thread12createThreadEPFvPvES0_>
    80001c70:	00050493          	mv	s1,a0
    threads[1]->start();
    80001c74:	00000097          	auipc	ra,0x0
    80001c78:	cb4080e7          	jalr	-844(ra) # 80001928 <_ZN7_thread5startEv>

    Riscv::w_stvec((uint64) &trap);
    80001c7c:	00006797          	auipc	a5,0x6
    80001c80:	b4c7b783          	ld	a5,-1204(a5) # 800077c8 <_GLOBAL_OFFSET_TABLE_+0x20>
    __asm__ volatile ("csrw stvec, %[stvec]" : : [stvec] "r"(stvec));
    80001c84:	10579073          	csrw	stvec,a5
    __asm__ volatile ("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001c88:	00200793          	li	a5,2
    80001c8c:	1007a073          	csrs	sstatus,a5
    Riscv::ms_sstatus(Riscv::SSTATUS_SIE);



    _thread::running = threads[0];
    80001c90:	00006797          	auipc	a5,0x6
    80001c94:	b287b783          	ld	a5,-1240(a5) # 800077b8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001c98:	0127b023          	sd	s2,0(a5)

    80001c9c:	0184c783          	lbu	a5,24(s1)

    while (!(threads[1]->isFinished()))
    80001ca0:	00079863          	bnez	a5,80001cb0 <main+0x80>
    {
        _thread::yield();
    80001ca4:	00000097          	auipc	ra,0x0
    80001ca8:	bf0080e7          	jalr	-1040(ra) # 80001894 <_ZN7_thread5yieldEv>
    80001cac:	ff1ff06f          	j	80001c9c <main+0x6c>
    }
    return 0;
}
    80001cb0:	00000513          	li	a0,0
    80001cb4:	01813083          	ld	ra,24(sp)
    80001cb8:	01013403          	ld	s0,16(sp)
    80001cbc:	00813483          	ld	s1,8(sp)
    80001cc0:	00013903          	ld	s2,0(sp)
    80001cc4:	02010113          	addi	sp,sp,32
    80001cc8:	00008067          	ret

0000000080001ccc <_ZN7Blocked3getEv>:

#include "../h/Blocked.h"


_thread *Blocked::get()
{
    80001ccc:	fe010113          	addi	sp,sp,-32
    80001cd0:	00113c23          	sd	ra,24(sp)
    80001cd4:	00813823          	sd	s0,16(sp)
    80001cd8:	00913423          	sd	s1,8(sp)
    80001cdc:	02010413          	addi	s0,sp,32
    80001ce0:	00050793          	mv	a5,a0
    if (!head) return nullptr;
    80001ce4:	00053503          	ld	a0,0(a0)
    80001ce8:	02050e63          	beqz	a0,80001d24 <_ZN7Blocked3getEv+0x58>

    Elem* elem = head;
    head = head->next;
    80001cec:	00853703          	ld	a4,8(a0)
    80001cf0:	00e7b023          	sd	a4,0(a5)
    if (!head) tail = 0;
    80001cf4:	02070463          	beqz	a4,80001d1c <_ZN7Blocked3getEv+0x50>

    _thread *ret = elem->data;
    80001cf8:	00053483          	ld	s1,0(a0)
    MemoryAllocator::mem_free(elem);
    80001cfc:	00001097          	auipc	ra,0x1
    80001d00:	8dc080e7          	jalr	-1828(ra) # 800025d8 <_ZN15MemoryAllocator8mem_freeEPv>
    return ret;
}
    80001d04:	00048513          	mv	a0,s1
    80001d08:	01813083          	ld	ra,24(sp)
    80001d0c:	01013403          	ld	s0,16(sp)
    80001d10:	00813483          	ld	s1,8(sp)
    80001d14:	02010113          	addi	sp,sp,32
    80001d18:	00008067          	ret
    if (!head) tail = 0;
    80001d1c:	0007b423          	sd	zero,8(a5)
    80001d20:	fd9ff06f          	j	80001cf8 <_ZN7Blocked3getEv+0x2c>
    if (!head) return nullptr;
    80001d24:	00050493          	mv	s1,a0
    80001d28:	fddff06f          	j	80001d04 <_ZN7Blocked3getEv+0x38>

0000000080001d2c <_ZN7Blocked3putEP7_thread>:

void Blocked::put(_thread *blocked)
{
    80001d2c:	fe010113          	addi	sp,sp,-32
    80001d30:	00113c23          	sd	ra,24(sp)
    80001d34:	00813823          	sd	s0,16(sp)
    80001d38:	00913423          	sd	s1,8(sp)
    80001d3c:	01213023          	sd	s2,0(sp)
    80001d40:	02010413          	addi	s0,sp,32
    80001d44:	00050493          	mv	s1,a0
    80001d48:	00058913          	mv	s2,a1
    Elem* elem = (Elem*) MemoryAllocator::mem_alloc((sizeof(Elem)+MEM_BLOCK_SIZE-1+sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    80001d4c:	00100513          	li	a0,1
    80001d50:	00000097          	auipc	ra,0x0
    80001d54:	6b4080e7          	jalr	1716(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
    elem->data = blocked;
    80001d58:	01253023          	sd	s2,0(a0)
    elem->next = nullptr;
    80001d5c:	00053423          	sd	zero,8(a0)
    if(tail){
    80001d60:	0084b783          	ld	a5,8(s1)
    80001d64:	02078263          	beqz	a5,80001d88 <_ZN7Blocked3putEP7_thread+0x5c>
        tail->next = elem;
    80001d68:	00a7b423          	sd	a0,8(a5)
        tail = elem;
    80001d6c:	00a4b423          	sd	a0,8(s1)
    }else{
        head = tail = elem;
    }
    80001d70:	01813083          	ld	ra,24(sp)
    80001d74:	01013403          	ld	s0,16(sp)
    80001d78:	00813483          	ld	s1,8(sp)
    80001d7c:	00013903          	ld	s2,0(sp)
    80001d80:	02010113          	addi	sp,sp,32
    80001d84:	00008067          	ret
        head = tail = elem;
    80001d88:	00a4b423          	sd	a0,8(s1)
    80001d8c:	00a4b023          	sd	a0,0(s1)
    80001d90:	fe1ff06f          	j	80001d70 <_ZN7Blocked3putEP7_thread+0x44>

0000000080001d94 <_Z10wrapperRunPv>:
struct Wrapper {
    ptrOnFun func;
};

void wrapperRun(void* p){
    if(p == nullptr) return;
    80001d94:	02050863          	beqz	a0,80001dc4 <_Z10wrapperRunPv+0x30>
void wrapperRun(void* p){
    80001d98:	ff010113          	addi	sp,sp,-16
    80001d9c:	00113423          	sd	ra,8(sp)
    80001da0:	00813023          	sd	s0,0(sp)
    80001da4:	01010413          	addi	s0,sp,16
    ((Thread*)p)->run();
    80001da8:	00053783          	ld	a5,0(a0)
    80001dac:	0107b783          	ld	a5,16(a5)
    80001db0:	000780e7          	jalr	a5
}
    80001db4:	00813083          	ld	ra,8(sp)
    80001db8:	00013403          	ld	s0,0(sp)
    80001dbc:	01010113          	addi	sp,sp,16
    80001dc0:	00008067          	ret
    80001dc4:	00008067          	ret

0000000080001dc8 <_ZN6ThreadD1Ev>:

Thread::Thread(void (*body)(void *), void *arg) {
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    80001dc8:	fe010113          	addi	sp,sp,-32
    80001dcc:	00113c23          	sd	ra,24(sp)
    80001dd0:	00813823          	sd	s0,16(sp)
    80001dd4:	00913423          	sd	s1,8(sp)
    80001dd8:	02010413          	addi	s0,sp,32
    80001ddc:	00050493          	mv	s1,a0
    80001de0:	00006797          	auipc	a5,0x6
    80001de4:	8d078793          	addi	a5,a5,-1840 # 800076b0 <_ZTV6Thread+0x10>
    80001de8:	00f53023          	sd	a5,0(a0)
    thread_exit();
    80001dec:	fffff097          	auipc	ra,0xfffff
    80001df0:	734080e7          	jalr	1844(ra) # 80001520 <_Z11thread_exitv>
    mem_free(this);
    80001df4:	00048513          	mv	a0,s1
    80001df8:	fffff097          	auipc	ra,0xfffff
    80001dfc:	6f0080e7          	jalr	1776(ra) # 800014e8 <_Z8mem_freePv>
}
    80001e00:	01813083          	ld	ra,24(sp)
    80001e04:	01013403          	ld	s0,16(sp)
    80001e08:	00813483          	ld	s1,8(sp)
    80001e0c:	02010113          	addi	sp,sp,32
    80001e10:	00008067          	ret

0000000080001e14 <_ZN9SemaphoreD1Ev>:

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle, init);
}

Semaphore::~Semaphore() {
    80001e14:	00006797          	auipc	a5,0x6
    80001e18:	8c478793          	addi	a5,a5,-1852 # 800076d8 <_ZTV9Semaphore+0x10>
    80001e1c:	00f53023          	sd	a5,0(a0)
    if (myHandle != nullptr) {
    80001e20:	00853503          	ld	a0,8(a0)
    80001e24:	02050663          	beqz	a0,80001e50 <_ZN9SemaphoreD1Ev+0x3c>
Semaphore::~Semaphore() {
    80001e28:	ff010113          	addi	sp,sp,-16
    80001e2c:	00113423          	sd	ra,8(sp)
    80001e30:	00813023          	sd	s0,0(sp)
    80001e34:	01010413          	addi	s0,sp,16
        sem_close(myHandle);
    80001e38:	00000097          	auipc	ra,0x0
    80001e3c:	8a8080e7          	jalr	-1880(ra) # 800016e0 <_Z9sem_closeP4_sem>
    }
}
    80001e40:	00813083          	ld	ra,8(sp)
    80001e44:	00013403          	ld	s0,0(sp)
    80001e48:	01010113          	addi	sp,sp,16
    80001e4c:	00008067          	ret
    80001e50:	00008067          	ret

0000000080001e54 <_Znwm>:
void* operator new(size_t size){
    80001e54:	ff010113          	addi	sp,sp,-16
    80001e58:	00113423          	sd	ra,8(sp)
    80001e5c:	00813023          	sd	s0,0(sp)
    80001e60:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    80001e64:	fffff097          	auipc	ra,0xfffff
    80001e68:	63c080e7          	jalr	1596(ra) # 800014a0 <_Z9mem_allocm>
}
    80001e6c:	00813083          	ld	ra,8(sp)
    80001e70:	00013403          	ld	s0,0(sp)
    80001e74:	01010113          	addi	sp,sp,16
    80001e78:	00008067          	ret

0000000080001e7c <_Znam>:
void* operator new[](size_t size){
    80001e7c:	ff010113          	addi	sp,sp,-16
    80001e80:	00113423          	sd	ra,8(sp)
    80001e84:	00813023          	sd	s0,0(sp)
    80001e88:	01010413          	addi	s0,sp,16
    void* p = mem_alloc(size);
    80001e8c:	fffff097          	auipc	ra,0xfffff
    80001e90:	614080e7          	jalr	1556(ra) # 800014a0 <_Z9mem_allocm>
}
    80001e94:	00813083          	ld	ra,8(sp)
    80001e98:	00013403          	ld	s0,0(sp)
    80001e9c:	01010113          	addi	sp,sp,16
    80001ea0:	00008067          	ret

0000000080001ea4 <_ZdlPv>:
void operator delete(void * p){
    80001ea4:	ff010113          	addi	sp,sp,-16
    80001ea8:	00113423          	sd	ra,8(sp)
    80001eac:	00813023          	sd	s0,0(sp)
    80001eb0:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001eb4:	fffff097          	auipc	ra,0xfffff
    80001eb8:	634080e7          	jalr	1588(ra) # 800014e8 <_Z8mem_freePv>
}
    80001ebc:	00813083          	ld	ra,8(sp)
    80001ec0:	00013403          	ld	s0,0(sp)
    80001ec4:	01010113          	addi	sp,sp,16
    80001ec8:	00008067          	ret

0000000080001ecc <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001ecc:	fe010113          	addi	sp,sp,-32
    80001ed0:	00113c23          	sd	ra,24(sp)
    80001ed4:	00813823          	sd	s0,16(sp)
    80001ed8:	00913423          	sd	s1,8(sp)
    80001edc:	02010413          	addi	s0,sp,32
    80001ee0:	00050493          	mv	s1,a0
}
    80001ee4:	00000097          	auipc	ra,0x0
    80001ee8:	ee4080e7          	jalr	-284(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    80001eec:	00048513          	mv	a0,s1
    80001ef0:	00000097          	auipc	ra,0x0
    80001ef4:	fb4080e7          	jalr	-76(ra) # 80001ea4 <_ZdlPv>
    80001ef8:	01813083          	ld	ra,24(sp)
    80001efc:	01013403          	ld	s0,16(sp)
    80001f00:	00813483          	ld	s1,8(sp)
    80001f04:	02010113          	addi	sp,sp,32
    80001f08:	00008067          	ret

0000000080001f0c <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001f0c:	fe010113          	addi	sp,sp,-32
    80001f10:	00113c23          	sd	ra,24(sp)
    80001f14:	00813823          	sd	s0,16(sp)
    80001f18:	00913423          	sd	s1,8(sp)
    80001f1c:	02010413          	addi	s0,sp,32
    80001f20:	00050493          	mv	s1,a0
}
    80001f24:	00000097          	auipc	ra,0x0
    80001f28:	ef0080e7          	jalr	-272(ra) # 80001e14 <_ZN9SemaphoreD1Ev>
    80001f2c:	00048513          	mv	a0,s1
    80001f30:	00000097          	auipc	ra,0x0
    80001f34:	f74080e7          	jalr	-140(ra) # 80001ea4 <_ZdlPv>
    80001f38:	01813083          	ld	ra,24(sp)
    80001f3c:	01013403          	ld	s0,16(sp)
    80001f40:	00813483          	ld	s1,8(sp)
    80001f44:	02010113          	addi	sp,sp,32
    80001f48:	00008067          	ret

0000000080001f4c <_ZdaPv>:
void operator delete[](void * p){
    80001f4c:	ff010113          	addi	sp,sp,-16
    80001f50:	00113423          	sd	ra,8(sp)
    80001f54:	00813023          	sd	s0,0(sp)
    80001f58:	01010413          	addi	s0,sp,16
    mem_free(p);
    80001f5c:	fffff097          	auipc	ra,0xfffff
    80001f60:	58c080e7          	jalr	1420(ra) # 800014e8 <_Z8mem_freePv>
}
    80001f64:	00813083          	ld	ra,8(sp)
    80001f68:	00013403          	ld	s0,0(sp)
    80001f6c:	01010113          	addi	sp,sp,16
    80001f70:	00008067          	ret

0000000080001f74 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001f74:	ff010113          	addi	sp,sp,-16
    80001f78:	00113423          	sd	ra,8(sp)
    80001f7c:	00813023          	sd	s0,0(sp)
    80001f80:	01010413          	addi	s0,sp,16
    80001f84:	00005797          	auipc	a5,0x5
    80001f88:	72c78793          	addi	a5,a5,1836 # 800076b0 <_ZTV6Thread+0x10>
    80001f8c:	00f53023          	sd	a5,0(a0)
    thread_create(&myHandle, body, arg);
    80001f90:	00850513          	addi	a0,a0,8
    80001f94:	fffff097          	auipc	ra,0xfffff
    80001f98:	5c0080e7          	jalr	1472(ra) # 80001554 <_Z13thread_createPP7_threadPFvPvES2_>
}
    80001f9c:	00813083          	ld	ra,8(sp)
    80001fa0:	00013403          	ld	s0,0(sp)
    80001fa4:	01010113          	addi	sp,sp,16
    80001fa8:	00008067          	ret

0000000080001fac <_ZN6Thread5startEv>:
int Thread::start() {
    80001fac:	ff010113          	addi	sp,sp,-16
    80001fb0:	00113423          	sd	ra,8(sp)
    80001fb4:	00813023          	sd	s0,0(sp)
    80001fb8:	01010413          	addi	s0,sp,16
    thread_start(myHandle);
    80001fbc:	00853503          	ld	a0,8(a0)
    80001fc0:	fffff097          	auipc	ra,0xfffff
    80001fc4:	6b4080e7          	jalr	1716(ra) # 80001674 <_Z12thread_startP7_thread>
}
    80001fc8:	00000513          	li	a0,0
    80001fcc:	00813083          	ld	ra,8(sp)
    80001fd0:	00013403          	ld	s0,0(sp)
    80001fd4:	01010113          	addi	sp,sp,16
    80001fd8:	00008067          	ret

0000000080001fdc <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001fdc:	ff010113          	addi	sp,sp,-16
    80001fe0:	00113423          	sd	ra,8(sp)
    80001fe4:	00813023          	sd	s0,0(sp)
    80001fe8:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001fec:	fffff097          	auipc	ra,0xfffff
    80001ff0:	5e8080e7          	jalr	1512(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80001ff4:	00813083          	ld	ra,8(sp)
    80001ff8:	00013403          	ld	s0,0(sp)
    80001ffc:	01010113          	addi	sp,sp,16
    80002000:	00008067          	ret

0000000080002004 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t) {
    80002004:	ff010113          	addi	sp,sp,-16
    80002008:	00813423          	sd	s0,8(sp)
    8000200c:	01010413          	addi	s0,sp,16
}
    80002010:	00000513          	li	a0,0
    80002014:	00813403          	ld	s0,8(sp)
    80002018:	01010113          	addi	sp,sp,16
    8000201c:	00008067          	ret

0000000080002020 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002020:	ff010113          	addi	sp,sp,-16
    80002024:	00113423          	sd	ra,8(sp)
    80002028:	00813023          	sd	s0,0(sp)
    8000202c:	01010413          	addi	s0,sp,16
    80002030:	00005797          	auipc	a5,0x5
    80002034:	68078793          	addi	a5,a5,1664 # 800076b0 <_ZTV6Thread+0x10>
    80002038:	00f53023          	sd	a5,0(a0)
    thread_create_only(&myHandle,wrapperRun,this);
    8000203c:	00050613          	mv	a2,a0
    80002040:	00000597          	auipc	a1,0x0
    80002044:	d5458593          	addi	a1,a1,-684 # 80001d94 <_Z10wrapperRunPv>
    80002048:	00850513          	addi	a0,a0,8
    8000204c:	fffff097          	auipc	ra,0xfffff
    80002050:	5b4080e7          	jalr	1460(ra) # 80001600 <_Z18thread_create_onlyPP7_threadPFvPvES2_>
}
    80002054:	00813083          	ld	ra,8(sp)
    80002058:	00013403          	ld	s0,0(sp)
    8000205c:	01010113          	addi	sp,sp,16
    80002060:	00008067          	ret

0000000080002064 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    80002064:	ff010113          	addi	sp,sp,-16
    80002068:	00113423          	sd	ra,8(sp)
    8000206c:	00813023          	sd	s0,0(sp)
    80002070:	01010413          	addi	s0,sp,16
    80002074:	00005797          	auipc	a5,0x5
    80002078:	66478793          	addi	a5,a5,1636 # 800076d8 <_ZTV9Semaphore+0x10>
    8000207c:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle, init);
    80002080:	00850513          	addi	a0,a0,8
    80002084:	fffff097          	auipc	ra,0xfffff
    80002088:	620080e7          	jalr	1568(ra) # 800016a4 <_Z8sem_openPP4_semj>
}
    8000208c:	00813083          	ld	ra,8(sp)
    80002090:	00013403          	ld	s0,0(sp)
    80002094:	01010113          	addi	sp,sp,16
    80002098:	00008067          	ret

000000008000209c <_ZN9Semaphore4waitEv>:

int Semaphore::wait() {
    if (myHandle != nullptr) {
    8000209c:	00853503          	ld	a0,8(a0)
    800020a0:	02050663          	beqz	a0,800020cc <_ZN9Semaphore4waitEv+0x30>
int Semaphore::wait() {
    800020a4:	ff010113          	addi	sp,sp,-16
    800020a8:	00113423          	sd	ra,8(sp)
    800020ac:	00813023          	sd	s0,0(sp)
    800020b0:	01010413          	addi	s0,sp,16
        return sem_wait(myHandle);
    800020b4:	fffff097          	auipc	ra,0xfffff
    800020b8:	664080e7          	jalr	1636(ra) # 80001718 <_Z8sem_waitP4_sem>
    }
    return -1;
}
    800020bc:	00813083          	ld	ra,8(sp)
    800020c0:	00013403          	ld	s0,0(sp)
    800020c4:	01010113          	addi	sp,sp,16
    800020c8:	00008067          	ret
    return -1;
    800020cc:	fff00513          	li	a0,-1
}
    800020d0:	00008067          	ret

00000000800020d4 <_ZN9Semaphore6signalEv>:

int Semaphore::signal() {
    if (myHandle != nullptr) {
    800020d4:	00853503          	ld	a0,8(a0)
    800020d8:	02050663          	beqz	a0,80002104 <_ZN9Semaphore6signalEv+0x30>
int Semaphore::signal() {
    800020dc:	ff010113          	addi	sp,sp,-16
    800020e0:	00113423          	sd	ra,8(sp)
    800020e4:	00813023          	sd	s0,0(sp)
    800020e8:	01010413          	addi	s0,sp,16
        return sem_signal(myHandle);
    800020ec:	fffff097          	auipc	ra,0xfffff
    800020f0:	664080e7          	jalr	1636(ra) # 80001750 <_Z10sem_signalP4_sem>
    }
    return -1;
}
    800020f4:	00813083          	ld	ra,8(sp)
    800020f8:	00013403          	ld	s0,0(sp)
    800020fc:	01010113          	addi	sp,sp,16
    80002100:	00008067          	ret
    return -1;
    80002104:	fff00513          	li	a0,-1
}
    80002108:	00008067          	ret

000000008000210c <_ZN7Console4getcEv>:

char Console::getc() {
    8000210c:	ff010113          	addi	sp,sp,-16
    80002110:	00113423          	sd	ra,8(sp)
    80002114:	00813023          	sd	s0,0(sp)
    80002118:	01010413          	addi	s0,sp,16
    return ::getc();
    8000211c:	fffff097          	auipc	ra,0xfffff
    80002120:	69c080e7          	jalr	1692(ra) # 800017b8 <_Z4getcv>
}
    80002124:	00813083          	ld	ra,8(sp)
    80002128:	00013403          	ld	s0,0(sp)
    8000212c:	01010113          	addi	sp,sp,16
    80002130:	00008067          	ret

0000000080002134 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002134:	ff010113          	addi	sp,sp,-16
    80002138:	00113423          	sd	ra,8(sp)
    8000213c:	00813023          	sd	s0,0(sp)
    80002140:	01010413          	addi	s0,sp,16
    ::putc(c);
    80002144:	fffff097          	auipc	ra,0xfffff
    80002148:	644080e7          	jalr	1604(ra) # 80001788 <_Z4putcc>
    8000214c:	00813083          	ld	ra,8(sp)
    80002150:	00013403          	ld	s0,0(sp)
    80002154:	01010113          	addi	sp,sp,16
    80002158:	00008067          	ret

000000008000215c <_ZN6Thread3runEv>:
    static int sleep(time_t);

    friend void wrapperRun(void* p);
protected:
    Thread();
    virtual void run(){};
    8000215c:	ff010113          	addi	sp,sp,-16
    80002160:	00813423          	sd	s0,8(sp)
    80002164:	01010413          	addi	s0,sp,16
    80002168:	00813403          	ld	s0,8(sp)
    8000216c:	01010113          	addi	sp,sp,16
    80002170:	00008067          	ret

0000000080002174 <_ZN5Riscv10popSppSpieEv>:


#include "../h/riscv.h"

void Riscv::popSppSpie()
{
    80002174:	ff010113          	addi	sp,sp,-16
    80002178:	00813423          	sd	s0,8(sp)
    8000217c:	01010413          	addi	s0,sp,16
    __asm__ volatile ("csrw sepc, ra");
    80002180:	14109073          	csrw	sepc,ra
    80002184:	10000793          	li	a5,256
    80002188:	1007a073          	csrs	sstatus,a5
    ms_sstatus(SSTATUS_SPP);
    __asm__ volatile ("sret");
    8000218c:	10200073          	sret
}
    80002190:	00813403          	ld	s0,8(sp)
    80002194:	01010113          	addi	sp,sp,16
    80002198:	00008067          	ret

000000008000219c <_ZN4_sem7semOpenEj>:
//

#include "../h/_sem.h"


sem_t _sem::semOpen(unsigned init) {
    8000219c:	fe010113          	addi	sp,sp,-32
    800021a0:	00113c23          	sd	ra,24(sp)
    800021a4:	00813823          	sd	s0,16(sp)
    800021a8:	00913423          	sd	s1,8(sp)
    800021ac:	01213023          	sd	s2,0(sp)
    800021b0:	02010413          	addi	s0,sp,32
    800021b4:	00050913          	mv	s2,a0
    _sem* ret = (_sem*)MemoryAllocator::getInstance()->mem_alloc((sizeof(_sem) + MEM_BLOCK_SIZE-1 + sizeof(MemoryAllocator::FullMem))/MEM_BLOCK_SIZE);
    800021b8:	00000097          	auipc	ra,0x0
    800021bc:	38c080e7          	jalr	908(ra) # 80002544 <_ZN15MemoryAllocator11getInstanceEv>
    800021c0:	00100513          	li	a0,1
    800021c4:	00000097          	auipc	ra,0x0
    800021c8:	240080e7          	jalr	576(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
    800021cc:	00050493          	mv	s1,a0
    if (ret == nullptr) return ret;
    800021d0:	02050063          	beqz	a0,800021f0 <_ZN4_sem7semOpenEj+0x54>

    ret->init = init;
    800021d4:	01252023          	sw	s2,0(a0)
    ret->blockedThreads = new Blocked();
    800021d8:	01000513          	li	a0,16
    800021dc:	00000097          	auipc	ra,0x0
    800021e0:	c78080e7          	jalr	-904(ra) # 80001e54 <_Znwm>
    };
    Elem* head;
    Elem* tail;

    Blocked(){
        head = tail = 0;
    800021e4:	00053423          	sd	zero,8(a0)
    800021e8:	00053023          	sd	zero,0(a0)
    800021ec:	00a4b423          	sd	a0,8(s1)
    return ret;
}
    800021f0:	00048513          	mv	a0,s1
    800021f4:	01813083          	ld	ra,24(sp)
    800021f8:	01013403          	ld	s0,16(sp)
    800021fc:	00813483          	ld	s1,8(sp)
    80002200:	00013903          	ld	s2,0(sp)
    80002204:	02010113          	addi	sp,sp,32
    80002208:	00008067          	ret

000000008000220c <_ZN4_sem5blockEv>:
    if (id == nullptr) return -1;
    if (++id->init <= 0) id->deblock();
    return 0;
}

void _sem::block(){
    8000220c:	fe010113          	addi	sp,sp,-32
    80002210:	00113c23          	sd	ra,24(sp)
    80002214:	00813823          	sd	s0,16(sp)
    80002218:	00913423          	sd	s1,8(sp)
    8000221c:	01213023          	sd	s2,0(sp)
    80002220:	02010413          	addi	s0,sp,32

    _thread *old = _thread::running;
    80002224:	00005917          	auipc	s2,0x5
    80002228:	59493903          	ld	s2,1428(s2) # 800077b8 <_GLOBAL_OFFSET_TABLE_+0x10>
    8000222c:	00093483          	ld	s1,0(s2)
    bool isBlocked() const { return blocked; }

    void setBlocked(bool value) { blocked = value; }

    uint64 getTimeSlice() const { return timeSlice; }

    80002230:	00100793          	li	a5,1
    80002234:	00f48ca3          	sb	a5,25(s1)
    old->setBlocked(true);
    this->blockedThreads->put(old);
    80002238:	00048593          	mv	a1,s1
    8000223c:	00853503          	ld	a0,8(a0)
    80002240:	00000097          	auipc	ra,0x0
    80002244:	aec080e7          	jalr	-1300(ra) # 80001d2c <_ZN7Blocked3putEP7_thread>
    _thread::running = Scheduler::get();
    80002248:	00000097          	auipc	ra,0x0
    8000224c:	8ec080e7          	jalr	-1812(ra) # 80001b34 <_ZN9Scheduler3getEv>
    80002250:	00a93023          	sd	a0,0(s2)
    _thread::contextSwitch(&old->context, &_thread::running->context);
    80002254:	02850593          	addi	a1,a0,40
    80002258:	02848513          	addi	a0,s1,40
    8000225c:	fffff097          	auipc	ra,0xfffff
    80002260:	fcc080e7          	jalr	-52(ra) # 80001228 <_ZN7_thread13contextSwitchEPNS_7ContextES1_>

}
    80002264:	01813083          	ld	ra,24(sp)
    80002268:	01013403          	ld	s0,16(sp)
    8000226c:	00813483          	ld	s1,8(sp)
    80002270:	00013903          	ld	s2,0(sp)
    80002274:	02010113          	addi	sp,sp,32
    80002278:	00008067          	ret

000000008000227c <_ZN4_sem7semWaitEPS_>:
    if (id == nullptr) return -1;
    8000227c:	04050663          	beqz	a0,800022c8 <_ZN4_sem7semWaitEPS_+0x4c>
    if (--id->init < 0) id->block();
    80002280:	00052783          	lw	a5,0(a0)
    80002284:	fff7879b          	addiw	a5,a5,-1
    80002288:	00f52023          	sw	a5,0(a0)
    8000228c:	02079713          	slli	a4,a5,0x20
    80002290:	00074663          	bltz	a4,8000229c <_ZN4_sem7semWaitEPS_+0x20>
    return 0;
    80002294:	00000513          	li	a0,0
}
    80002298:	00008067          	ret
int _sem::semWait(sem_t id){
    8000229c:	ff010113          	addi	sp,sp,-16
    800022a0:	00113423          	sd	ra,8(sp)
    800022a4:	00813023          	sd	s0,0(sp)
    800022a8:	01010413          	addi	s0,sp,16
    if (--id->init < 0) id->block();
    800022ac:	00000097          	auipc	ra,0x0
    800022b0:	f60080e7          	jalr	-160(ra) # 8000220c <_ZN4_sem5blockEv>
    return 0;
    800022b4:	00000513          	li	a0,0
}
    800022b8:	00813083          	ld	ra,8(sp)
    800022bc:	00013403          	ld	s0,0(sp)
    800022c0:	01010113          	addi	sp,sp,16
    800022c4:	00008067          	ret
    if (id == nullptr) return -1;
    800022c8:	fff00513          	li	a0,-1
    800022cc:	00008067          	ret

00000000800022d0 <_ZN4_sem7deblockEv>:

void _sem::deblock(){
    800022d0:	ff010113          	addi	sp,sp,-16
    800022d4:	00113423          	sd	ra,8(sp)
    800022d8:	00813023          	sd	s0,0(sp)
    800022dc:	01010413          	addi	s0,sp,16
    _thread* t = this->blockedThreads->get();
    800022e0:	00853503          	ld	a0,8(a0)
    800022e4:	00000097          	auipc	ra,0x0
    800022e8:	9e8080e7          	jalr	-1560(ra) # 80001ccc <_ZN7Blocked3getEv>
    800022ec:	00050ca3          	sb	zero,25(a0)
    t->setBlocked(false);
    Scheduler::put(t);
    800022f0:	00000097          	auipc	ra,0x0
    800022f4:	8ac080e7          	jalr	-1876(ra) # 80001b9c <_ZN9Scheduler3putEP7_thread>
    800022f8:	00813083          	ld	ra,8(sp)
    800022fc:	00013403          	ld	s0,0(sp)
    80002300:	01010113          	addi	sp,sp,16
    80002304:	00008067          	ret

0000000080002308 <_ZN4_sem8semCloseEPS_>:
int _sem::semClose(sem_t handle){
    80002308:	fe010113          	addi	sp,sp,-32
    8000230c:	00113c23          	sd	ra,24(sp)
    80002310:	00813823          	sd	s0,16(sp)
    80002314:	00913423          	sd	s1,8(sp)
    80002318:	02010413          	addi	s0,sp,32
    8000231c:	00050493          	mv	s1,a0
    if (handle == nullptr) return -1;
    80002320:	04050263          	beqz	a0,80002364 <_ZN4_sem8semCloseEPS_+0x5c>
    while (handle->blockedThreads->head != nullptr) handle->deblock();
    80002324:	0084b783          	ld	a5,8(s1)
    80002328:	0007b783          	ld	a5,0(a5)
    8000232c:	00078a63          	beqz	a5,80002340 <_ZN4_sem8semCloseEPS_+0x38>
    80002330:	00048513          	mv	a0,s1
    80002334:	00000097          	auipc	ra,0x0
    80002338:	f9c080e7          	jalr	-100(ra) # 800022d0 <_ZN4_sem7deblockEv>
    8000233c:	fe9ff06f          	j	80002324 <_ZN4_sem8semCloseEPS_+0x1c>
    MemoryAllocator::mem_free(handle);
    80002340:	00048513          	mv	a0,s1
    80002344:	00000097          	auipc	ra,0x0
    80002348:	294080e7          	jalr	660(ra) # 800025d8 <_ZN15MemoryAllocator8mem_freeEPv>
    return 0;
    8000234c:	00000513          	li	a0,0
}
    80002350:	01813083          	ld	ra,24(sp)
    80002354:	01013403          	ld	s0,16(sp)
    80002358:	00813483          	ld	s1,8(sp)
    8000235c:	02010113          	addi	sp,sp,32
    80002360:	00008067          	ret
    if (handle == nullptr) return -1;
    80002364:	fff00513          	li	a0,-1
    80002368:	fe9ff06f          	j	80002350 <_ZN4_sem8semCloseEPS_+0x48>

000000008000236c <_ZN4_sem9semSignalEPS_>:
    if (id == nullptr) return -1;
    8000236c:	04050663          	beqz	a0,800023b8 <_ZN4_sem9semSignalEPS_+0x4c>
    if (++id->init <= 0) id->deblock();
    80002370:	00052783          	lw	a5,0(a0)
    80002374:	0017879b          	addiw	a5,a5,1
    80002378:	0007871b          	sext.w	a4,a5
    8000237c:	00f52023          	sw	a5,0(a0)
    80002380:	00e05663          	blez	a4,8000238c <_ZN4_sem9semSignalEPS_+0x20>
    return 0;
    80002384:	00000513          	li	a0,0
}
    80002388:	00008067          	ret
int _sem::semSignal(sem_t id){
    8000238c:	ff010113          	addi	sp,sp,-16
    80002390:	00113423          	sd	ra,8(sp)
    80002394:	00813023          	sd	s0,0(sp)
    80002398:	01010413          	addi	s0,sp,16
    if (++id->init <= 0) id->deblock();
    8000239c:	00000097          	auipc	ra,0x0
    800023a0:	f34080e7          	jalr	-204(ra) # 800022d0 <_ZN4_sem7deblockEv>
    return 0;
    800023a4:	00000513          	li	a0,0
}
    800023a8:	00813083          	ld	ra,8(sp)
    800023ac:	00013403          	ld	s0,0(sp)
    800023b0:	01010113          	addi	sp,sp,16
    800023b4:	00008067          	ret
    if (id == nullptr) return -1;
    800023b8:	fff00513          	li	a0,-1
    800023bc:	00008067          	ret

00000000800023c0 <_Z41__static_initialization_and_destruction_0ii>:
            if (cur) cur->next = newSeg;
            else fmem_head = newSeg;
            return 0;
        }
    }
}
    800023c0:	ff010113          	addi	sp,sp,-16
    800023c4:	00813423          	sd	s0,8(sp)
    800023c8:	01010413          	addi	s0,sp,16
    800023cc:	00100793          	li	a5,1
    800023d0:	00f50863          	beq	a0,a5,800023e0 <_Z41__static_initialization_and_destruction_0ii+0x20>
    800023d4:	00813403          	ld	s0,8(sp)
    800023d8:	01010113          	addi	sp,sp,16
    800023dc:	00008067          	ret
    800023e0:	000107b7          	lui	a5,0x10
    800023e4:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    800023e8:	fef596e3          	bne	a1,a5,800023d4 <_Z41__static_initialization_and_destruction_0ii+0x14>
MemoryAllocator::FreeMem* MemoryAllocator::fmem_head = (MemoryAllocator::FreeMem*)HEAP_START_ADDR; //stavila onako
    800023ec:	00005797          	auipc	a5,0x5
    800023f0:	3c47b783          	ld	a5,964(a5) # 800077b0 <_GLOBAL_OFFSET_TABLE_+0x8>
    800023f4:	0007b783          	ld	a5,0(a5)
    800023f8:	00005717          	auipc	a4,0x5
    800023fc:	44f73423          	sd	a5,1096(a4) # 80007840 <_ZN15MemoryAllocator9fmem_headE>
}
    80002400:	fd5ff06f          	j	800023d4 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080002404 <_ZN15MemoryAllocator9mem_allocEm>:
void *MemoryAllocator::mem_alloc(size_t size) {
    80002404:	ff010113          	addi	sp,sp,-16
    80002408:	00813423          	sd	s0,8(sp)
    8000240c:	01010413          	addi	s0,sp,16
    if (size <=0) return nullptr;
    80002410:	12050663          	beqz	a0,8000253c <_ZN15MemoryAllocator9mem_allocEm+0x138>
    80002414:	00050793          	mv	a5,a0
    FreeMem* cur = fmem_head;
    80002418:	00005517          	auipc	a0,0x5
    8000241c:	42853503          	ld	a0,1064(a0) # 80007840 <_ZN15MemoryAllocator9fmem_headE>
    for(;cur !=0; cur = cur->next){
    80002420:	0e050e63          	beqz	a0,8000251c <_ZN15MemoryAllocator9mem_allocEm+0x118>
        if(cur->size < (size)*MEM_BLOCK_SIZE) continue;
    80002424:	01053703          	ld	a4,16(a0)
    80002428:	00679693          	slli	a3,a5,0x6
    8000242c:	04d76c63          	bltu	a4,a3,80002484 <_ZN15MemoryAllocator9mem_allocEm+0x80>
        if(cur->size - (size)*MEM_BLOCK_SIZE < sizeof(FreeMem)){
    80002430:	40d70733          	sub	a4,a4,a3
    80002434:	01700793          	li	a5,23
    80002438:	06e7e263          	bltu	a5,a4,8000249c <_ZN15MemoryAllocator9mem_allocEm+0x98>
            if(cur->prev) cur->prev->next = cur->next;
    8000243c:	00853783          	ld	a5,8(a0)
    80002440:	04078663          	beqz	a5,8000248c <_ZN15MemoryAllocator9mem_allocEm+0x88>
    80002444:	00053703          	ld	a4,0(a0)
    80002448:	00e7b023          	sd	a4,0(a5)
            if(cur->next) cur->next->prev = cur->prev;
    8000244c:	00053783          	ld	a5,0(a0)
    80002450:	00078663          	beqz	a5,8000245c <_ZN15MemoryAllocator9mem_allocEm+0x58>
    80002454:	00853703          	ld	a4,8(a0)
    80002458:	00e7b423          	sd	a4,8(a5)
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    8000245c:	00005617          	auipc	a2,0x5
    80002460:	3ec63603          	ld	a2,1004(a2) # 80007848 <_ZN15MemoryAllocator9full_headE>
    80002464:	08060063          	beqz	a2,800024e4 <_ZN15MemoryAllocator9mem_allocEm+0xe0>
    80002468:	08c56263          	bltu	a0,a2,800024ec <_ZN15MemoryAllocator9mem_allocEm+0xe8>
            for (tmp = full_head; tmp->next != nullptr && (char *) cur > (char *) (tmp->next); tmp = tmp->next);
    8000246c:	00060793          	mv	a5,a2
    80002470:	00078713          	mv	a4,a5
    80002474:	0007b783          	ld	a5,0(a5)
    80002478:	06078c63          	beqz	a5,800024f0 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    8000247c:	fea7eae3          	bltu	a5,a0,80002470 <_ZN15MemoryAllocator9mem_allocEm+0x6c>
    80002480:	0700006f          	j	800024f0 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    for(;cur !=0; cur = cur->next){
    80002484:	00053503          	ld	a0,0(a0)
    80002488:	f99ff06f          	j	80002420 <_ZN15MemoryAllocator9mem_allocEm+0x1c>
            else fmem_head = cur->next;
    8000248c:	00053783          	ld	a5,0(a0)
    80002490:	00005717          	auipc	a4,0x5
    80002494:	3af73823          	sd	a5,944(a4) # 80007840 <_ZN15MemoryAllocator9fmem_headE>
    80002498:	fb5ff06f          	j	8000244c <_ZN15MemoryAllocator9mem_allocEm+0x48>
            FreeMem* newfrgm = (FreeMem*)((char*)cur + (size)*MEM_BLOCK_SIZE);
    8000249c:	00d507b3          	add	a5,a0,a3
            newfrgm->prev = cur->prev;
    800024a0:	00853703          	ld	a4,8(a0)
    800024a4:	00e7b423          	sd	a4,8(a5)
            newfrgm->next = cur->next;
    800024a8:	00053703          	ld	a4,0(a0)
    800024ac:	00e7b023          	sd	a4,0(a5)
            newfrgm->size = cur->size - (size)*MEM_BLOCK_SIZE;
    800024b0:	01053703          	ld	a4,16(a0)
    800024b4:	40d70733          	sub	a4,a4,a3
    800024b8:	00e7b823          	sd	a4,16(a5)
            if(cur->prev) cur->prev->next = newfrgm;
    800024bc:	00853703          	ld	a4,8(a0)
    800024c0:	00070c63          	beqz	a4,800024d8 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    800024c4:	00f73023          	sd	a5,0(a4)
            if(cur->next) cur->next->prev = newfrgm;
    800024c8:	00053703          	ld	a4,0(a0)
    800024cc:	f80708e3          	beqz	a4,8000245c <_ZN15MemoryAllocator9mem_allocEm+0x58>
    800024d0:	00f73423          	sd	a5,8(a4)
    800024d4:	f89ff06f          	j	8000245c <_ZN15MemoryAllocator9mem_allocEm+0x58>
            else fmem_head = newfrgm;
    800024d8:	00005717          	auipc	a4,0x5
    800024dc:	36f73423          	sd	a5,872(a4) # 80007840 <_ZN15MemoryAllocator9fmem_headE>
    800024e0:	fe9ff06f          	j	800024c8 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
        if (!full_head || (char*)cur < (char*)full_head) tmp = 0;
    800024e4:	00060713          	mv	a4,a2
    800024e8:	0080006f          	j	800024f0 <_ZN15MemoryAllocator9mem_allocEm+0xec>
    800024ec:	00000713          	li	a4,0
        newSeg->size = (size)*MEM_BLOCK_SIZE ;
    800024f0:	00d53823          	sd	a3,16(a0)
        newSeg->prev = tmp;
    800024f4:	00e53423          	sd	a4,8(a0)
        if (tmp) newSeg->next = tmp->next;
    800024f8:	02070863          	beqz	a4,80002528 <_ZN15MemoryAllocator9mem_allocEm+0x124>
    800024fc:	00073783          	ld	a5,0(a4)
    80002500:	00f53023          	sd	a5,0(a0)
        if(newSeg->next) newSeg->next->prev = newSeg;
    80002504:	00053783          	ld	a5,0(a0)
    80002508:	00078463          	beqz	a5,80002510 <_ZN15MemoryAllocator9mem_allocEm+0x10c>
    8000250c:	00a7b423          	sd	a0,8(a5)
        if (tmp) tmp->next = newSeg;
    80002510:	02070063          	beqz	a4,80002530 <_ZN15MemoryAllocator9mem_allocEm+0x12c>
    80002514:	00a73023          	sd	a0,0(a4)
        return (void*)((char*)cur+headSize);
    80002518:	01850513          	addi	a0,a0,24
}
    8000251c:	00813403          	ld	s0,8(sp)
    80002520:	01010113          	addi	sp,sp,16
    80002524:	00008067          	ret
        else newSeg->next = full_head;
    80002528:	00c53023          	sd	a2,0(a0)
    8000252c:	fd9ff06f          	j	80002504 <_ZN15MemoryAllocator9mem_allocEm+0x100>
        else full_head = newSeg;
    80002530:	00005797          	auipc	a5,0x5
    80002534:	30a7bc23          	sd	a0,792(a5) # 80007848 <_ZN15MemoryAllocator9full_headE>
    80002538:	fe1ff06f          	j	80002518 <_ZN15MemoryAllocator9mem_allocEm+0x114>
    if (size <=0) return nullptr;
    8000253c:	00000513          	li	a0,0
    80002540:	fddff06f          	j	8000251c <_ZN15MemoryAllocator9mem_allocEm+0x118>

0000000080002544 <_ZN15MemoryAllocator11getInstanceEv>:
    if (memoryAllocator == nullptr) {
    80002544:	00005797          	auipc	a5,0x5
    80002548:	30c7b783          	ld	a5,780(a5) # 80007850 <_ZN15MemoryAllocator15memoryAllocatorE>
    8000254c:	00078863          	beqz	a5,8000255c <_ZN15MemoryAllocator11getInstanceEv+0x18>
}
    80002550:	00005517          	auipc	a0,0x5
    80002554:	30053503          	ld	a0,768(a0) # 80007850 <_ZN15MemoryAllocator15memoryAllocatorE>
    80002558:	00008067          	ret
MemoryAllocator *MemoryAllocator::getInstance() {
    8000255c:	fe010113          	addi	sp,sp,-32
    80002560:	00113c23          	sd	ra,24(sp)
    80002564:	00813823          	sd	s0,16(sp)
    80002568:	00913423          	sd	s1,8(sp)
    8000256c:	02010413          	addi	s0,sp,32
        fmem_head = (FreeMem*)HEAP_START_ADDR;
    80002570:	00005697          	auipc	a3,0x5
    80002574:	2406b683          	ld	a3,576(a3) # 800077b0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002578:	0006b783          	ld	a5,0(a3)
    8000257c:	00005497          	auipc	s1,0x5
    80002580:	2c448493          	addi	s1,s1,708 # 80007840 <_ZN15MemoryAllocator9fmem_headE>
    80002584:	00f4b023          	sd	a5,0(s1)
        fmem_head->next = nullptr;
    80002588:	0007b023          	sd	zero,0(a5)
        fmem_head->prev = nullptr;
    8000258c:	0004b703          	ld	a4,0(s1)
    80002590:	00073423          	sd	zero,8(a4)
        fmem_head->size = (size_t)HEAP_END_ADDR -(size_t )HEAP_START_ADDR;
    80002594:	00005797          	auipc	a5,0x5
    80002598:	23c7b783          	ld	a5,572(a5) # 800077d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000259c:	0007b783          	ld	a5,0(a5)
    800025a0:	0006b683          	ld	a3,0(a3)
    800025a4:	40d787b3          	sub	a5,a5,a3
    800025a8:	00f73823          	sd	a5,16(a4)
        memoryAllocator = (MemoryAllocator*)MemoryAllocator::mem_alloc((sizeof(MemoryAllocator)+MEM_BLOCK_SIZE-1)/MEM_BLOCK_SIZE);
    800025ac:	00100513          	li	a0,1
    800025b0:	00000097          	auipc	ra,0x0
    800025b4:	e54080e7          	jalr	-428(ra) # 80002404 <_ZN15MemoryAllocator9mem_allocEm>
    800025b8:	00a4b823          	sd	a0,16(s1)
}
    800025bc:	00005517          	auipc	a0,0x5
    800025c0:	29453503          	ld	a0,660(a0) # 80007850 <_ZN15MemoryAllocator15memoryAllocatorE>
    800025c4:	01813083          	ld	ra,24(sp)
    800025c8:	01013403          	ld	s0,16(sp)
    800025cc:	00813483          	ld	s1,8(sp)
    800025d0:	02010113          	addi	sp,sp,32
    800025d4:	00008067          	ret

00000000800025d8 <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void *addr) {
    800025d8:	ff010113          	addi	sp,sp,-16
    800025dc:	00813423          	sd	s0,8(sp)
    800025e0:	01010413          	addi	s0,sp,16
    if (addr == nullptr) return -2;
    800025e4:	1a050063          	beqz	a0,80002784 <_ZN15MemoryAllocator8mem_freeEPv+0x1ac>
    addr = (void*)((char*)addr-headSize);
    800025e8:	fe850713          	addi	a4,a0,-24
    FullMem* tmp = full_head;
    800025ec:	00005797          	auipc	a5,0x5
    800025f0:	25c7b783          	ld	a5,604(a5) # 80007848 <_ZN15MemoryAllocator9full_headE>
    bool flag = false;
    800025f4:	0080006f          	j	800025fc <_ZN15MemoryAllocator8mem_freeEPv+0x24>
    for(; tmp && dSeg>=tmp; tmp = tmp->next){
    800025f8:	0007b783          	ld	a5,0(a5)
    800025fc:	00078a63          	beqz	a5,80002610 <_ZN15MemoryAllocator8mem_freeEPv+0x38>
    80002600:	08f76663          	bltu	a4,a5,8000268c <_ZN15MemoryAllocator8mem_freeEPv+0xb4>
        if(tmp == dSeg) {
    80002604:	fee79ae3          	bne	a5,a4,800025f8 <_ZN15MemoryAllocator8mem_freeEPv+0x20>
            flag = true;
    80002608:	00100693          	li	a3,1
    8000260c:	0080006f          	j	80002614 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    bool flag = false;
    80002610:	00000693          	li	a3,0
    if (!flag) return -1;
    80002614:	16068c63          	beqz	a3,8000278c <_ZN15MemoryAllocator8mem_freeEPv+0x1b4>
    if (tmp->prev) tmp->prev->next = tmp->next;
    80002618:	0087b683          	ld	a3,8(a5)
    8000261c:	06068c63          	beqz	a3,80002694 <_ZN15MemoryAllocator8mem_freeEPv+0xbc>
    80002620:	0007b603          	ld	a2,0(a5)
    80002624:	00c6b023          	sd	a2,0(a3)
    if (tmp->next) tmp->next->prev = tmp->prev;
    80002628:	0007b683          	ld	a3,0(a5)
    8000262c:	00068663          	beqz	a3,80002638 <_ZN15MemoryAllocator8mem_freeEPv+0x60>
    80002630:	0087b603          	ld	a2,8(a5)
    80002634:	00c6b423          	sd	a2,8(a3)
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    80002638:	00005597          	auipc	a1,0x5
    8000263c:	2085b583          	ld	a1,520(a1) # 80007840 <_ZN15MemoryAllocator9fmem_headE>
    80002640:	08058263          	beqz	a1,800026c4 <_ZN15MemoryAllocator8mem_freeEPv+0xec>
    80002644:	08b76463          	bltu	a4,a1,800026cc <_ZN15MemoryAllocator8mem_freeEPv+0xf4>
        for (cur = fmem_head; cur->next != nullptr && (char*)addr>(char*)(cur->next); cur = cur->next);
    80002648:	00058693          	mv	a3,a1
    8000264c:	00068613          	mv	a2,a3
    80002650:	0006b683          	ld	a3,0(a3)
    80002654:	00068463          	beqz	a3,8000265c <_ZN15MemoryAllocator8mem_freeEPv+0x84>
    80002658:	fee6eae3          	bltu	a3,a4,8000264c <_ZN15MemoryAllocator8mem_freeEPv+0x74>
    if(cur && (char*)cur+cur->size == addr){
    8000265c:	06060a63          	beqz	a2,800026d0 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    80002660:	01063803          	ld	a6,16(a2)
    80002664:	010608b3          	add	a7,a2,a6
    80002668:	06e89463          	bne	a7,a4,800026d0 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
        cur->size += tmp->size;
    8000266c:	0107b783          	ld	a5,16(a5)
    80002670:	00f80833          	add	a6,a6,a5
    80002674:	01063823          	sd	a6,16(a2)
        if (cur->next && (char*)((char*)cur+ cur->size) == (char*)(cur->next)){
    80002678:	00068663          	beqz	a3,80002684 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    8000267c:	010607b3          	add	a5,a2,a6
    80002680:	02f68263          	beq	a3,a5,800026a4 <_ZN15MemoryAllocator8mem_freeEPv+0xcc>
        return 0;
    80002684:	00000513          	li	a0,0
    80002688:	0900006f          	j	80002718 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    bool flag = false;
    8000268c:	00000693          	li	a3,0
    80002690:	f85ff06f          	j	80002614 <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
    else full_head = tmp->next;
    80002694:	0007b683          	ld	a3,0(a5)
    80002698:	00005617          	auipc	a2,0x5
    8000269c:	1ad63823          	sd	a3,432(a2) # 80007848 <_ZN15MemoryAllocator9full_headE>
    800026a0:	f89ff06f          	j	80002628 <_ZN15MemoryAllocator8mem_freeEPv+0x50>
            cur->size += cur->next->size;
    800026a4:	0106b783          	ld	a5,16(a3)
    800026a8:	00f80833          	add	a6,a6,a5
    800026ac:	01063823          	sd	a6,16(a2)
            cur->next = cur->next->next;
    800026b0:	0006b783          	ld	a5,0(a3)
    800026b4:	00f63023          	sd	a5,0(a2)
            if (cur->next) cur->next->prev = cur;
    800026b8:	fc0786e3          	beqz	a5,80002684 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    800026bc:	00c7b423          	sd	a2,8(a5)
    800026c0:	fc5ff06f          	j	80002684 <_ZN15MemoryAllocator8mem_freeEPv+0xac>
    if(!fmem_head || (char*)addr < (char*)fmem_head) cur = nullptr;
    800026c4:	00058613          	mv	a2,a1
    800026c8:	0080006f          	j	800026d0 <_ZN15MemoryAllocator8mem_freeEPv+0xf8>
    800026cc:	00000613          	li	a2,0
        FreeMem* nxtSeg = cur?cur->next:fmem_head;
    800026d0:	00060463          	beqz	a2,800026d8 <_ZN15MemoryAllocator8mem_freeEPv+0x100>
    800026d4:	00063583          	ld	a1,0(a2)
        if(nxtSeg && (char*)((char*)tmp + tmp->size) == (char*) nxtSeg){
    800026d8:	00058863          	beqz	a1,800026e8 <_ZN15MemoryAllocator8mem_freeEPv+0x110>
    800026dc:	0107b683          	ld	a3,16(a5)
    800026e0:	00d78833          	add	a6,a5,a3
    800026e4:	04b80063          	beq	a6,a1,80002724 <_ZN15MemoryAllocator8mem_freeEPv+0x14c>
            newSeg->size = tmp->size;
    800026e8:	0107b783          	ld	a5,16(a5)
    800026ec:	fef53c23          	sd	a5,-8(a0)
            newSeg->prev = cur;
    800026f0:	fec53823          	sd	a2,-16(a0)
            if(cur) newSeg->next = cur->next;
    800026f4:	06060a63          	beqz	a2,80002768 <_ZN15MemoryAllocator8mem_freeEPv+0x190>
    800026f8:	00063783          	ld	a5,0(a2)
    800026fc:	fef53423          	sd	a5,-24(a0)
            if(newSeg->next) newSeg->next->prev = newSeg;
    80002700:	fe853783          	ld	a5,-24(a0)
    80002704:	00078463          	beqz	a5,8000270c <_ZN15MemoryAllocator8mem_freeEPv+0x134>
    80002708:	00e7b423          	sd	a4,8(a5)
            if (cur) cur->next = newSeg;
    8000270c:	06060663          	beqz	a2,80002778 <_ZN15MemoryAllocator8mem_freeEPv+0x1a0>
    80002710:	00e63023          	sd	a4,0(a2)
            return 0;
    80002714:	00000513          	li	a0,0
}
    80002718:	00813403          	ld	s0,8(sp)
    8000271c:	01010113          	addi	sp,sp,16
    80002720:	00008067          	ret
            newSeg->size = nxtSeg->size + tmp->size;
    80002724:	0105b783          	ld	a5,16(a1)
    80002728:	00f686b3          	add	a3,a3,a5
    8000272c:	fed53c23          	sd	a3,-8(a0)
            newSeg->prev = nxtSeg->prev;
    80002730:	0085b783          	ld	a5,8(a1)
    80002734:	fef53823          	sd	a5,-16(a0)
            newSeg->next = nxtSeg->next;
    80002738:	0005b783          	ld	a5,0(a1)
    8000273c:	fef53423          	sd	a5,-24(a0)
            if(nxtSeg->next) nxtSeg->next->prev = newSeg;
    80002740:	00078463          	beqz	a5,80002748 <_ZN15MemoryAllocator8mem_freeEPv+0x170>
    80002744:	00e7b423          	sd	a4,8(a5)
            if(nxtSeg->prev) nxtSeg->prev->next = newSeg;
    80002748:	0085b783          	ld	a5,8(a1)
    8000274c:	00078863          	beqz	a5,8000275c <_ZN15MemoryAllocator8mem_freeEPv+0x184>
    80002750:	00e7b023          	sd	a4,0(a5)
            return 0;
    80002754:	00000513          	li	a0,0
    80002758:	fc1ff06f          	j	80002718 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
            else fmem_head = newSeg;
    8000275c:	00005797          	auipc	a5,0x5
    80002760:	0ee7b223          	sd	a4,228(a5) # 80007840 <_ZN15MemoryAllocator9fmem_headE>
    80002764:	ff1ff06f          	j	80002754 <_ZN15MemoryAllocator8mem_freeEPv+0x17c>
            else newSeg->next =fmem_head;
    80002768:	00005797          	auipc	a5,0x5
    8000276c:	0d87b783          	ld	a5,216(a5) # 80007840 <_ZN15MemoryAllocator9fmem_headE>
    80002770:	fef53423          	sd	a5,-24(a0)
    80002774:	f8dff06f          	j	80002700 <_ZN15MemoryAllocator8mem_freeEPv+0x128>
            else fmem_head = newSeg;
    80002778:	00005797          	auipc	a5,0x5
    8000277c:	0ce7b423          	sd	a4,200(a5) # 80007840 <_ZN15MemoryAllocator9fmem_headE>
    80002780:	f95ff06f          	j	80002714 <_ZN15MemoryAllocator8mem_freeEPv+0x13c>
    if (addr == nullptr) return -2;
    80002784:	ffe00513          	li	a0,-2
    80002788:	f91ff06f          	j	80002718 <_ZN15MemoryAllocator8mem_freeEPv+0x140>
    if (!flag) return -1;
    8000278c:	fff00513          	li	a0,-1
    80002790:	f89ff06f          	j	80002718 <_ZN15MemoryAllocator8mem_freeEPv+0x140>

0000000080002794 <_GLOBAL__sub_I__ZN15MemoryAllocator9fmem_headE>:
}
    80002794:	ff010113          	addi	sp,sp,-16
    80002798:	00113423          	sd	ra,8(sp)
    8000279c:	00813023          	sd	s0,0(sp)
    800027a0:	01010413          	addi	s0,sp,16
    800027a4:	000105b7          	lui	a1,0x10
    800027a8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800027ac:	00100513          	li	a0,1
    800027b0:	00000097          	auipc	ra,0x0
    800027b4:	c10080e7          	jalr	-1008(ra) # 800023c0 <_Z41__static_initialization_and_destruction_0ii>
    800027b8:	00813083          	ld	ra,8(sp)
    800027bc:	00013403          	ld	s0,0(sp)
    800027c0:	01010113          	addi	sp,sp,16
    800027c4:	00008067          	ret

00000000800027c8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1))
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    800027c8:	fe010113          	addi	sp,sp,-32
    800027cc:	00113c23          	sd	ra,24(sp)
    800027d0:	00813823          	sd	s0,16(sp)
    800027d4:	00913423          	sd	s1,8(sp)
    800027d8:	02010413          	addi	s0,sp,32
    800027dc:	00050493          	mv	s1,a0
    LOCK();
    800027e0:	00100613          	li	a2,1
    800027e4:	00000593          	li	a1,0
    800027e8:	00005517          	auipc	a0,0x5
    800027ec:	07050513          	addi	a0,a0,112 # 80007858 <lockPrint>
    800027f0:	fffff097          	auipc	ra,0xfffff
    800027f4:	920080e7          	jalr	-1760(ra) # 80001110 <copy_and_swap>
    800027f8:	fe0514e3          	bnez	a0,800027e0 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    800027fc:	0004c503          	lbu	a0,0(s1)
    80002800:	00050a63          	beqz	a0,80002814 <_Z11printStringPKc+0x4c>
    {
        __putc(*string);
    80002804:	00003097          	auipc	ra,0x3
    80002808:	488080e7          	jalr	1160(ra) # 80005c8c <__putc>
        string++;
    8000280c:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80002810:	fedff06f          	j	800027fc <_Z11printStringPKc+0x34>
    }
    UNLOCK();
    80002814:	00000613          	li	a2,0
    80002818:	00100593          	li	a1,1
    8000281c:	00005517          	auipc	a0,0x5
    80002820:	03c50513          	addi	a0,a0,60 # 80007858 <lockPrint>
    80002824:	fffff097          	auipc	ra,0xfffff
    80002828:	8ec080e7          	jalr	-1812(ra) # 80001110 <copy_and_swap>
    8000282c:	fe0514e3          	bnez	a0,80002814 <_Z11printStringPKc+0x4c>
}
    80002830:	01813083          	ld	ra,24(sp)
    80002834:	01013403          	ld	s0,16(sp)
    80002838:	00813483          	ld	s1,8(sp)
    8000283c:	02010113          	addi	sp,sp,32
    80002840:	00008067          	ret

0000000080002844 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80002844:	fd010113          	addi	sp,sp,-48
    80002848:	02113423          	sd	ra,40(sp)
    8000284c:	02813023          	sd	s0,32(sp)
    80002850:	00913c23          	sd	s1,24(sp)
    80002854:	01213823          	sd	s2,16(sp)
    80002858:	01313423          	sd	s3,8(sp)
    8000285c:	01413023          	sd	s4,0(sp)
    80002860:	03010413          	addi	s0,sp,48
    80002864:	00050993          	mv	s3,a0
    80002868:	00058a13          	mv	s4,a1
    LOCK();
    8000286c:	00100613          	li	a2,1
    80002870:	00000593          	li	a1,0
    80002874:	00005517          	auipc	a0,0x5
    80002878:	fe450513          	addi	a0,a0,-28 # 80007858 <lockPrint>
    8000287c:	fffff097          	auipc	ra,0xfffff
    80002880:	894080e7          	jalr	-1900(ra) # 80001110 <copy_and_swap>
    80002884:	fe0514e3          	bnez	a0,8000286c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80002888:	00000913          	li	s2,0
    8000288c:	00090493          	mv	s1,s2
    80002890:	0019091b          	addiw	s2,s2,1
    80002894:	03495a63          	bge	s2,s4,800028c8 <_Z9getStringPci+0x84>
        cc = __getc();
    80002898:	00003097          	auipc	ra,0x3
    8000289c:	430080e7          	jalr	1072(ra) # 80005cc8 <__getc>
        if(cc < 1)
    800028a0:	02050463          	beqz	a0,800028c8 <_Z9getStringPci+0x84>
            break;
        c = cc;
        buf[i++] = c;
    800028a4:	009984b3          	add	s1,s3,s1
    800028a8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800028ac:	00a00793          	li	a5,10
    800028b0:	00f50a63          	beq	a0,a5,800028c4 <_Z9getStringPci+0x80>
    800028b4:	00d00793          	li	a5,13
    800028b8:	fcf51ae3          	bne	a0,a5,8000288c <_Z9getStringPci+0x48>
        buf[i++] = c;
    800028bc:	00090493          	mv	s1,s2
    800028c0:	0080006f          	j	800028c8 <_Z9getStringPci+0x84>
    800028c4:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800028c8:	009984b3          	add	s1,s3,s1
    800028cc:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800028d0:	00000613          	li	a2,0
    800028d4:	00100593          	li	a1,1
    800028d8:	00005517          	auipc	a0,0x5
    800028dc:	f8050513          	addi	a0,a0,-128 # 80007858 <lockPrint>
    800028e0:	fffff097          	auipc	ra,0xfffff
    800028e4:	830080e7          	jalr	-2000(ra) # 80001110 <copy_and_swap>
    800028e8:	fe0514e3          	bnez	a0,800028d0 <_Z9getStringPci+0x8c>
    return buf;
}
    800028ec:	00098513          	mv	a0,s3
    800028f0:	02813083          	ld	ra,40(sp)
    800028f4:	02013403          	ld	s0,32(sp)
    800028f8:	01813483          	ld	s1,24(sp)
    800028fc:	01013903          	ld	s2,16(sp)
    80002900:	00813983          	ld	s3,8(sp)
    80002904:	00013a03          	ld	s4,0(sp)
    80002908:	03010113          	addi	sp,sp,48
    8000290c:	00008067          	ret

0000000080002910 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80002910:	ff010113          	addi	sp,sp,-16
    80002914:	00813423          	sd	s0,8(sp)
    80002918:	01010413          	addi	s0,sp,16
    8000291c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80002920:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80002924:	0006c603          	lbu	a2,0(a3)
    80002928:	fd06071b          	addiw	a4,a2,-48
    8000292c:	0ff77713          	andi	a4,a4,255
    80002930:	00900793          	li	a5,9
    80002934:	02e7e063          	bltu	a5,a4,80002954 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80002938:	0025179b          	slliw	a5,a0,0x2
    8000293c:	00a787bb          	addw	a5,a5,a0
    80002940:	0017979b          	slliw	a5,a5,0x1
    80002944:	00168693          	addi	a3,a3,1
    80002948:	00c787bb          	addw	a5,a5,a2
    8000294c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80002950:	fd5ff06f          	j	80002924 <_Z11stringToIntPKc+0x14>
    return n;
}
    80002954:	00813403          	ld	s0,8(sp)
    80002958:	01010113          	addi	sp,sp,16
    8000295c:	00008067          	ret

0000000080002960 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80002960:	fc010113          	addi	sp,sp,-64
    80002964:	02113c23          	sd	ra,56(sp)
    80002968:	02813823          	sd	s0,48(sp)
    8000296c:	02913423          	sd	s1,40(sp)
    80002970:	03213023          	sd	s2,32(sp)
    80002974:	01313c23          	sd	s3,24(sp)
    80002978:	04010413          	addi	s0,sp,64
    8000297c:	00050493          	mv	s1,a0
    80002980:	00058913          	mv	s2,a1
    80002984:	00060993          	mv	s3,a2
    LOCK();
    80002988:	00100613          	li	a2,1
    8000298c:	00000593          	li	a1,0
    80002990:	00005517          	auipc	a0,0x5
    80002994:	ec850513          	addi	a0,a0,-312 # 80007858 <lockPrint>
    80002998:	ffffe097          	auipc	ra,0xffffe
    8000299c:	778080e7          	jalr	1912(ra) # 80001110 <copy_and_swap>
    800029a0:	fe0514e3          	bnez	a0,80002988 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    800029a4:	00098463          	beqz	s3,800029ac <_Z8printIntiii+0x4c>
    800029a8:	0804c463          	bltz	s1,80002a30 <_Z8printIntiii+0xd0>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800029ac:	0004851b          	sext.w	a0,s1
    neg = 0;
    800029b0:	00000593          	li	a1,0
    }

    i = 0;
    800029b4:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800029b8:	0009079b          	sext.w	a5,s2
    800029bc:	0325773b          	remuw	a4,a0,s2
    800029c0:	00048613          	mv	a2,s1
    800029c4:	0014849b          	addiw	s1,s1,1
    800029c8:	02071693          	slli	a3,a4,0x20
    800029cc:	0206d693          	srli	a3,a3,0x20
    800029d0:	00005717          	auipc	a4,0x5
    800029d4:	d2070713          	addi	a4,a4,-736 # 800076f0 <digits>
    800029d8:	00d70733          	add	a4,a4,a3
    800029dc:	00074683          	lbu	a3,0(a4)
    800029e0:	fd040713          	addi	a4,s0,-48
    800029e4:	00c70733          	add	a4,a4,a2
    800029e8:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800029ec:	0005071b          	sext.w	a4,a0
    800029f0:	0325553b          	divuw	a0,a0,s2
    800029f4:	fcf772e3          	bgeu	a4,a5,800029b8 <_Z8printIntiii+0x58>
    if(neg)
    800029f8:	00058c63          	beqz	a1,80002a10 <_Z8printIntiii+0xb0>
        buf[i++] = '-';
    800029fc:	fd040793          	addi	a5,s0,-48
    80002a00:	009784b3          	add	s1,a5,s1
    80002a04:	02d00793          	li	a5,45
    80002a08:	fef48823          	sb	a5,-16(s1)
    80002a0c:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80002a10:	fff4849b          	addiw	s1,s1,-1
    80002a14:	0204c463          	bltz	s1,80002a3c <_Z8printIntiii+0xdc>
        __putc(buf[i]);
    80002a18:	fd040793          	addi	a5,s0,-48
    80002a1c:	009787b3          	add	a5,a5,s1
    80002a20:	ff07c503          	lbu	a0,-16(a5)
    80002a24:	00003097          	auipc	ra,0x3
    80002a28:	268080e7          	jalr	616(ra) # 80005c8c <__putc>
    80002a2c:	fe5ff06f          	j	80002a10 <_Z8printIntiii+0xb0>
        x = -xx;
    80002a30:	4090053b          	negw	a0,s1
        neg = 1;
    80002a34:	00100593          	li	a1,1
        x = -xx;
    80002a38:	f7dff06f          	j	800029b4 <_Z8printIntiii+0x54>

    UNLOCK();
    80002a3c:	00000613          	li	a2,0
    80002a40:	00100593          	li	a1,1
    80002a44:	00005517          	auipc	a0,0x5
    80002a48:	e1450513          	addi	a0,a0,-492 # 80007858 <lockPrint>
    80002a4c:	ffffe097          	auipc	ra,0xffffe
    80002a50:	6c4080e7          	jalr	1732(ra) # 80001110 <copy_and_swap>
    80002a54:	fe0514e3          	bnez	a0,80002a3c <_Z8printIntiii+0xdc>
    80002a58:	03813083          	ld	ra,56(sp)
    80002a5c:	03013403          	ld	s0,48(sp)
    80002a60:	02813483          	ld	s1,40(sp)
    80002a64:	02013903          	ld	s2,32(sp)
    80002a68:	01813983          	ld	s3,24(sp)
    80002a6c:	04010113          	addi	sp,sp,64
    80002a70:	00008067          	ret

0000000080002a74 <_ZN9BufferCPPC1Ei>:
//
// Created by os on 6/28/22.
//
#include "buffer_CPP_API.h"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80002a74:	fd010113          	addi	sp,sp,-48
    80002a78:	02113423          	sd	ra,40(sp)
    80002a7c:	02813023          	sd	s0,32(sp)
    80002a80:	00913c23          	sd	s1,24(sp)
    80002a84:	01213823          	sd	s2,16(sp)
    80002a88:	01313423          	sd	s3,8(sp)
    80002a8c:	03010413          	addi	s0,sp,48
    80002a90:	00050493          	mv	s1,a0
    80002a94:	00058913          	mv	s2,a1
    80002a98:	0015879b          	addiw	a5,a1,1
    80002a9c:	0007851b          	sext.w	a0,a5
    80002aa0:	00f4a023          	sw	a5,0(s1)
    80002aa4:	0004a823          	sw	zero,16(s1)
    80002aa8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80002aac:	00251513          	slli	a0,a0,0x2
    80002ab0:	fffff097          	auipc	ra,0xfffff
    80002ab4:	9f0080e7          	jalr	-1552(ra) # 800014a0 <_Z9mem_allocm>
    80002ab8:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80002abc:	01000513          	li	a0,16
    80002ac0:	fffff097          	auipc	ra,0xfffff
    80002ac4:	394080e7          	jalr	916(ra) # 80001e54 <_Znwm>
    80002ac8:	00050993          	mv	s3,a0
    80002acc:	00000593          	li	a1,0
    80002ad0:	fffff097          	auipc	ra,0xfffff
    80002ad4:	594080e7          	jalr	1428(ra) # 80002064 <_ZN9SemaphoreC1Ej>
    80002ad8:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80002adc:	01000513          	li	a0,16
    80002ae0:	fffff097          	auipc	ra,0xfffff
    80002ae4:	374080e7          	jalr	884(ra) # 80001e54 <_Znwm>
    80002ae8:	00050993          	mv	s3,a0
    80002aec:	00090593          	mv	a1,s2
    80002af0:	fffff097          	auipc	ra,0xfffff
    80002af4:	574080e7          	jalr	1396(ra) # 80002064 <_ZN9SemaphoreC1Ej>
    80002af8:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80002afc:	01000513          	li	a0,16
    80002b00:	fffff097          	auipc	ra,0xfffff
    80002b04:	354080e7          	jalr	852(ra) # 80001e54 <_Znwm>
    80002b08:	00050913          	mv	s2,a0
    80002b0c:	00100593          	li	a1,1
    80002b10:	fffff097          	auipc	ra,0xfffff
    80002b14:	554080e7          	jalr	1364(ra) # 80002064 <_ZN9SemaphoreC1Ej>
    80002b18:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80002b1c:	01000513          	li	a0,16
    80002b20:	fffff097          	auipc	ra,0xfffff
    80002b24:	334080e7          	jalr	820(ra) # 80001e54 <_Znwm>
    80002b28:	00050913          	mv	s2,a0
    80002b2c:	00100593          	li	a1,1
    80002b30:	fffff097          	auipc	ra,0xfffff
    80002b34:	534080e7          	jalr	1332(ra) # 80002064 <_ZN9SemaphoreC1Ej>
    80002b38:	0324b823          	sd	s2,48(s1)
}
    80002b3c:	02813083          	ld	ra,40(sp)
    80002b40:	02013403          	ld	s0,32(sp)
    80002b44:	01813483          	ld	s1,24(sp)
    80002b48:	01013903          	ld	s2,16(sp)
    80002b4c:	00813983          	ld	s3,8(sp)
    80002b50:	03010113          	addi	sp,sp,48
    80002b54:	00008067          	ret
    80002b58:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80002b5c:	00098513          	mv	a0,s3
    80002b60:	fffff097          	auipc	ra,0xfffff
    80002b64:	344080e7          	jalr	836(ra) # 80001ea4 <_ZdlPv>
    80002b68:	00048513          	mv	a0,s1
    80002b6c:	00006097          	auipc	ra,0x6
    80002b70:	dcc080e7          	jalr	-564(ra) # 80008938 <_Unwind_Resume>
    80002b74:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80002b78:	00098513          	mv	a0,s3
    80002b7c:	fffff097          	auipc	ra,0xfffff
    80002b80:	328080e7          	jalr	808(ra) # 80001ea4 <_ZdlPv>
    80002b84:	00048513          	mv	a0,s1
    80002b88:	00006097          	auipc	ra,0x6
    80002b8c:	db0080e7          	jalr	-592(ra) # 80008938 <_Unwind_Resume>
    80002b90:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80002b94:	00090513          	mv	a0,s2
    80002b98:	fffff097          	auipc	ra,0xfffff
    80002b9c:	30c080e7          	jalr	780(ra) # 80001ea4 <_ZdlPv>
    80002ba0:	00048513          	mv	a0,s1
    80002ba4:	00006097          	auipc	ra,0x6
    80002ba8:	d94080e7          	jalr	-620(ra) # 80008938 <_Unwind_Resume>
    80002bac:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80002bb0:	00090513          	mv	a0,s2
    80002bb4:	fffff097          	auipc	ra,0xfffff
    80002bb8:	2f0080e7          	jalr	752(ra) # 80001ea4 <_ZdlPv>
    80002bbc:	00048513          	mv	a0,s1
    80002bc0:	00006097          	auipc	ra,0x6
    80002bc4:	d78080e7          	jalr	-648(ra) # 80008938 <_Unwind_Resume>

0000000080002bc8 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80002bc8:	fe010113          	addi	sp,sp,-32
    80002bcc:	00113c23          	sd	ra,24(sp)
    80002bd0:	00813823          	sd	s0,16(sp)
    80002bd4:	00913423          	sd	s1,8(sp)
    80002bd8:	01213023          	sd	s2,0(sp)
    80002bdc:	02010413          	addi	s0,sp,32
    80002be0:	00050493          	mv	s1,a0
    80002be4:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80002be8:	01853503          	ld	a0,24(a0)
    80002bec:	fffff097          	auipc	ra,0xfffff
    80002bf0:	4b0080e7          	jalr	1200(ra) # 8000209c <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80002bf4:	0304b503          	ld	a0,48(s1)
    80002bf8:	fffff097          	auipc	ra,0xfffff
    80002bfc:	4a4080e7          	jalr	1188(ra) # 8000209c <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80002c00:	0084b783          	ld	a5,8(s1)
    80002c04:	0144a703          	lw	a4,20(s1)
    80002c08:	00271713          	slli	a4,a4,0x2
    80002c0c:	00e787b3          	add	a5,a5,a4
    80002c10:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80002c14:	0144a783          	lw	a5,20(s1)
    80002c18:	0017879b          	addiw	a5,a5,1
    80002c1c:	0004a703          	lw	a4,0(s1)
    80002c20:	02e7e7bb          	remw	a5,a5,a4
    80002c24:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80002c28:	0304b503          	ld	a0,48(s1)
    80002c2c:	fffff097          	auipc	ra,0xfffff
    80002c30:	4a8080e7          	jalr	1192(ra) # 800020d4 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80002c34:	0204b503          	ld	a0,32(s1)
    80002c38:	fffff097          	auipc	ra,0xfffff
    80002c3c:	49c080e7          	jalr	1180(ra) # 800020d4 <_ZN9Semaphore6signalEv>

}
    80002c40:	01813083          	ld	ra,24(sp)
    80002c44:	01013403          	ld	s0,16(sp)
    80002c48:	00813483          	ld	s1,8(sp)
    80002c4c:	00013903          	ld	s2,0(sp)
    80002c50:	02010113          	addi	sp,sp,32
    80002c54:	00008067          	ret

0000000080002c58 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80002c58:	fe010113          	addi	sp,sp,-32
    80002c5c:	00113c23          	sd	ra,24(sp)
    80002c60:	00813823          	sd	s0,16(sp)
    80002c64:	00913423          	sd	s1,8(sp)
    80002c68:	01213023          	sd	s2,0(sp)
    80002c6c:	02010413          	addi	s0,sp,32
    80002c70:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80002c74:	02053503          	ld	a0,32(a0)
    80002c78:	fffff097          	auipc	ra,0xfffff
    80002c7c:	424080e7          	jalr	1060(ra) # 8000209c <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80002c80:	0284b503          	ld	a0,40(s1)
    80002c84:	fffff097          	auipc	ra,0xfffff
    80002c88:	418080e7          	jalr	1048(ra) # 8000209c <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80002c8c:	0084b703          	ld	a4,8(s1)
    80002c90:	0104a783          	lw	a5,16(s1)
    80002c94:	00279693          	slli	a3,a5,0x2
    80002c98:	00d70733          	add	a4,a4,a3
    80002c9c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80002ca0:	0017879b          	addiw	a5,a5,1
    80002ca4:	0004a703          	lw	a4,0(s1)
    80002ca8:	02e7e7bb          	remw	a5,a5,a4
    80002cac:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80002cb0:	0284b503          	ld	a0,40(s1)
    80002cb4:	fffff097          	auipc	ra,0xfffff
    80002cb8:	420080e7          	jalr	1056(ra) # 800020d4 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80002cbc:	0184b503          	ld	a0,24(s1)
    80002cc0:	fffff097          	auipc	ra,0xfffff
    80002cc4:	414080e7          	jalr	1044(ra) # 800020d4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80002cc8:	00090513          	mv	a0,s2
    80002ccc:	01813083          	ld	ra,24(sp)
    80002cd0:	01013403          	ld	s0,16(sp)
    80002cd4:	00813483          	ld	s1,8(sp)
    80002cd8:	00013903          	ld	s2,0(sp)
    80002cdc:	02010113          	addi	sp,sp,32
    80002ce0:	00008067          	ret

0000000080002ce4 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80002ce4:	fe010113          	addi	sp,sp,-32
    80002ce8:	00113c23          	sd	ra,24(sp)
    80002cec:	00813823          	sd	s0,16(sp)
    80002cf0:	00913423          	sd	s1,8(sp)
    80002cf4:	01213023          	sd	s2,0(sp)
    80002cf8:	02010413          	addi	s0,sp,32
    80002cfc:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80002d00:	02853503          	ld	a0,40(a0)
    80002d04:	fffff097          	auipc	ra,0xfffff
    80002d08:	398080e7          	jalr	920(ra) # 8000209c <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80002d0c:	0304b503          	ld	a0,48(s1)
    80002d10:	fffff097          	auipc	ra,0xfffff
    80002d14:	38c080e7          	jalr	908(ra) # 8000209c <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80002d18:	0144a783          	lw	a5,20(s1)
    80002d1c:	0104a903          	lw	s2,16(s1)
    80002d20:	0327ce63          	blt	a5,s2,80002d5c <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80002d24:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80002d28:	0304b503          	ld	a0,48(s1)
    80002d2c:	fffff097          	auipc	ra,0xfffff
    80002d30:	3a8080e7          	jalr	936(ra) # 800020d4 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80002d34:	0284b503          	ld	a0,40(s1)
    80002d38:	fffff097          	auipc	ra,0xfffff
    80002d3c:	39c080e7          	jalr	924(ra) # 800020d4 <_ZN9Semaphore6signalEv>

    return ret;
    80002d40:	00090513          	mv	a0,s2
    80002d44:	01813083          	ld	ra,24(sp)
    80002d48:	01013403          	ld	s0,16(sp)
    80002d4c:	00813483          	ld	s1,8(sp)
    80002d50:	00013903          	ld	s2,0(sp)
    80002d54:	02010113          	addi	sp,sp,32
    80002d58:	00008067          	ret
        ret = cap - head + tail;
    80002d5c:	0004a703          	lw	a4,0(s1)
    80002d60:	4127093b          	subw	s2,a4,s2
    80002d64:	00f9093b          	addw	s2,s2,a5
    80002d68:	fc1ff06f          	j	80002d28 <_ZN9BufferCPP6getCntEv+0x44>

0000000080002d6c <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80002d6c:	fe010113          	addi	sp,sp,-32
    80002d70:	00113c23          	sd	ra,24(sp)
    80002d74:	00813823          	sd	s0,16(sp)
    80002d78:	00913423          	sd	s1,8(sp)
    80002d7c:	02010413          	addi	s0,sp,32
    80002d80:	00050493          	mv	s1,a0
    Console::putc('\n');
    80002d84:	00a00513          	li	a0,10
    80002d88:	fffff097          	auipc	ra,0xfffff
    80002d8c:	3ac080e7          	jalr	940(ra) # 80002134 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80002d90:	00003517          	auipc	a0,0x3
    80002d94:	3a050513          	addi	a0,a0,928 # 80006130 <CONSOLE_STATUS+0x120>
    80002d98:	00000097          	auipc	ra,0x0
    80002d9c:	a30080e7          	jalr	-1488(ra) # 800027c8 <_Z11printStringPKc>
    while (getCnt()) {
    80002da0:	00048513          	mv	a0,s1
    80002da4:	00000097          	auipc	ra,0x0
    80002da8:	f40080e7          	jalr	-192(ra) # 80002ce4 <_ZN9BufferCPP6getCntEv>
    80002dac:	02050c63          	beqz	a0,80002de4 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80002db0:	0084b783          	ld	a5,8(s1)
    80002db4:	0104a703          	lw	a4,16(s1)
    80002db8:	00271713          	slli	a4,a4,0x2
    80002dbc:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80002dc0:	0007c503          	lbu	a0,0(a5)
    80002dc4:	fffff097          	auipc	ra,0xfffff
    80002dc8:	370080e7          	jalr	880(ra) # 80002134 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80002dcc:	0104a783          	lw	a5,16(s1)
    80002dd0:	0017879b          	addiw	a5,a5,1
    80002dd4:	0004a703          	lw	a4,0(s1)
    80002dd8:	02e7e7bb          	remw	a5,a5,a4
    80002ddc:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80002de0:	fc1ff06f          	j	80002da0 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80002de4:	02100513          	li	a0,33
    80002de8:	fffff097          	auipc	ra,0xfffff
    80002dec:	34c080e7          	jalr	844(ra) # 80002134 <_ZN7Console4putcEc>
    Console::putc('\n');
    80002df0:	00a00513          	li	a0,10
    80002df4:	fffff097          	auipc	ra,0xfffff
    80002df8:	340080e7          	jalr	832(ra) # 80002134 <_ZN7Console4putcEc>
    mem_free(buffer);
    80002dfc:	0084b503          	ld	a0,8(s1)
    80002e00:	ffffe097          	auipc	ra,0xffffe
    80002e04:	6e8080e7          	jalr	1768(ra) # 800014e8 <_Z8mem_freePv>
    delete itemAvailable;
    80002e08:	0204b503          	ld	a0,32(s1)
    80002e0c:	00050863          	beqz	a0,80002e1c <_ZN9BufferCPPD1Ev+0xb0>
    80002e10:	00053783          	ld	a5,0(a0)
    80002e14:	0087b783          	ld	a5,8(a5)
    80002e18:	000780e7          	jalr	a5
    delete spaceAvailable;
    80002e1c:	0184b503          	ld	a0,24(s1)
    80002e20:	00050863          	beqz	a0,80002e30 <_ZN9BufferCPPD1Ev+0xc4>
    80002e24:	00053783          	ld	a5,0(a0)
    80002e28:	0087b783          	ld	a5,8(a5)
    80002e2c:	000780e7          	jalr	a5
    delete mutexTail;
    80002e30:	0304b503          	ld	a0,48(s1)
    80002e34:	00050863          	beqz	a0,80002e44 <_ZN9BufferCPPD1Ev+0xd8>
    80002e38:	00053783          	ld	a5,0(a0)
    80002e3c:	0087b783          	ld	a5,8(a5)
    80002e40:	000780e7          	jalr	a5
    delete mutexHead;
    80002e44:	0284b503          	ld	a0,40(s1)
    80002e48:	00050863          	beqz	a0,80002e58 <_ZN9BufferCPPD1Ev+0xec>
    80002e4c:	00053783          	ld	a5,0(a0)
    80002e50:	0087b783          	ld	a5,8(a5)
    80002e54:	000780e7          	jalr	a5
}
    80002e58:	01813083          	ld	ra,24(sp)
    80002e5c:	01013403          	ld	s0,16(sp)
    80002e60:	00813483          	ld	s1,8(sp)
    80002e64:	02010113          	addi	sp,sp,32
    80002e68:	00008067          	ret

0000000080002e6c <_Z9fibonaccim>:
bool finishedA = false;
bool finishedB = false;
bool finishedC = false;
bool finishedD = false;

uint64 fibonacci(uint64 n) {
    80002e6c:	fe010113          	addi	sp,sp,-32
    80002e70:	00113c23          	sd	ra,24(sp)
    80002e74:	00813823          	sd	s0,16(sp)
    80002e78:	00913423          	sd	s1,8(sp)
    80002e7c:	01213023          	sd	s2,0(sp)
    80002e80:	02010413          	addi	s0,sp,32
    80002e84:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80002e88:	00100793          	li	a5,1
    80002e8c:	02a7f863          	bgeu	a5,a0,80002ebc <_Z9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80002e90:	00a00793          	li	a5,10
    80002e94:	02f577b3          	remu	a5,a0,a5
    80002e98:	02078e63          	beqz	a5,80002ed4 <_Z9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80002e9c:	fff48513          	addi	a0,s1,-1
    80002ea0:	00000097          	auipc	ra,0x0
    80002ea4:	fcc080e7          	jalr	-52(ra) # 80002e6c <_Z9fibonaccim>
    80002ea8:	00050913          	mv	s2,a0
    80002eac:	ffe48513          	addi	a0,s1,-2
    80002eb0:	00000097          	auipc	ra,0x0
    80002eb4:	fbc080e7          	jalr	-68(ra) # 80002e6c <_Z9fibonaccim>
    80002eb8:	00a90533          	add	a0,s2,a0
}
    80002ebc:	01813083          	ld	ra,24(sp)
    80002ec0:	01013403          	ld	s0,16(sp)
    80002ec4:	00813483          	ld	s1,8(sp)
    80002ec8:	00013903          	ld	s2,0(sp)
    80002ecc:	02010113          	addi	sp,sp,32
    80002ed0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80002ed4:	ffffe097          	auipc	ra,0xffffe
    80002ed8:	700080e7          	jalr	1792(ra) # 800015d4 <_Z15thread_dispatchv>
    80002edc:	fc1ff06f          	j	80002e9c <_Z9fibonaccim+0x30>

0000000080002ee0 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80002ee0:	fe010113          	addi	sp,sp,-32
    80002ee4:	00113c23          	sd	ra,24(sp)
    80002ee8:	00813823          	sd	s0,16(sp)
    80002eec:	00913423          	sd	s1,8(sp)
    80002ef0:	01213023          	sd	s2,0(sp)
    80002ef4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80002ef8:	00000913          	li	s2,0
    80002efc:	0380006f          	j	80002f34 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002f00:	ffffe097          	auipc	ra,0xffffe
    80002f04:	6d4080e7          	jalr	1748(ra) # 800015d4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002f08:	00148493          	addi	s1,s1,1
    80002f0c:	000027b7          	lui	a5,0x2
    80002f10:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002f14:	0097ee63          	bltu	a5,s1,80002f30 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002f18:	00000713          	li	a4,0
    80002f1c:	000077b7          	lui	a5,0x7
    80002f20:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002f24:	fce7eee3          	bltu	a5,a4,80002f00 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80002f28:	00170713          	addi	a4,a4,1
    80002f2c:	ff1ff06f          	j	80002f1c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80002f30:	00190913          	addi	s2,s2,1
    80002f34:	00900793          	li	a5,9
    80002f38:	0527e063          	bltu	a5,s2,80002f78 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80002f3c:	00003517          	auipc	a0,0x3
    80002f40:	20c50513          	addi	a0,a0,524 # 80006148 <CONSOLE_STATUS+0x138>
    80002f44:	00000097          	auipc	ra,0x0
    80002f48:	884080e7          	jalr	-1916(ra) # 800027c8 <_Z11printStringPKc>
    80002f4c:	00000613          	li	a2,0
    80002f50:	00a00593          	li	a1,10
    80002f54:	0009051b          	sext.w	a0,s2
    80002f58:	00000097          	auipc	ra,0x0
    80002f5c:	a08080e7          	jalr	-1528(ra) # 80002960 <_Z8printIntiii>
    80002f60:	00003517          	auipc	a0,0x3
    80002f64:	40050513          	addi	a0,a0,1024 # 80006360 <CONSOLE_STATUS+0x350>
    80002f68:	00000097          	auipc	ra,0x0
    80002f6c:	860080e7          	jalr	-1952(ra) # 800027c8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80002f70:	00000493          	li	s1,0
    80002f74:	f99ff06f          	j	80002f0c <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80002f78:	00003517          	auipc	a0,0x3
    80002f7c:	1d850513          	addi	a0,a0,472 # 80006150 <CONSOLE_STATUS+0x140>
    80002f80:	00000097          	auipc	ra,0x0
    80002f84:	848080e7          	jalr	-1976(ra) # 800027c8 <_Z11printStringPKc>
    finishedA = true;
    80002f88:	00100793          	li	a5,1
    80002f8c:	00005717          	auipc	a4,0x5
    80002f90:	8cf70a23          	sb	a5,-1836(a4) # 80007860 <finishedA>
    //thread_exit();
    thread_dispatch();
    80002f94:	ffffe097          	auipc	ra,0xffffe
    80002f98:	640080e7          	jalr	1600(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80002f9c:	01813083          	ld	ra,24(sp)
    80002fa0:	01013403          	ld	s0,16(sp)
    80002fa4:	00813483          	ld	s1,8(sp)
    80002fa8:	00013903          	ld	s2,0(sp)
    80002fac:	02010113          	addi	sp,sp,32
    80002fb0:	00008067          	ret

0000000080002fb4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80002fb4:	fe010113          	addi	sp,sp,-32
    80002fb8:	00113c23          	sd	ra,24(sp)
    80002fbc:	00813823          	sd	s0,16(sp)
    80002fc0:	00913423          	sd	s1,8(sp)
    80002fc4:	01213023          	sd	s2,0(sp)
    80002fc8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80002fcc:	00000913          	li	s2,0
    80002fd0:	0380006f          	j	80003008 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80002fd4:	ffffe097          	auipc	ra,0xffffe
    80002fd8:	600080e7          	jalr	1536(ra) # 800015d4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80002fdc:	00148493          	addi	s1,s1,1
    80002fe0:	000027b7          	lui	a5,0x2
    80002fe4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80002fe8:	0097ee63          	bltu	a5,s1,80003004 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80002fec:	00000713          	li	a4,0
    80002ff0:	000077b7          	lui	a5,0x7
    80002ff4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80002ff8:	fce7eee3          	bltu	a5,a4,80002fd4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80002ffc:	00170713          	addi	a4,a4,1
    80003000:	ff1ff06f          	j	80002ff0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003004:	00190913          	addi	s2,s2,1
    80003008:	00f00793          	li	a5,15
    8000300c:	0527e063          	bltu	a5,s2,8000304c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003010:	00003517          	auipc	a0,0x3
    80003014:	15050513          	addi	a0,a0,336 # 80006160 <CONSOLE_STATUS+0x150>
    80003018:	fffff097          	auipc	ra,0xfffff
    8000301c:	7b0080e7          	jalr	1968(ra) # 800027c8 <_Z11printStringPKc>
    80003020:	00000613          	li	a2,0
    80003024:	00a00593          	li	a1,10
    80003028:	0009051b          	sext.w	a0,s2
    8000302c:	00000097          	auipc	ra,0x0
    80003030:	934080e7          	jalr	-1740(ra) # 80002960 <_Z8printIntiii>
    80003034:	00003517          	auipc	a0,0x3
    80003038:	32c50513          	addi	a0,a0,812 # 80006360 <CONSOLE_STATUS+0x350>
    8000303c:	fffff097          	auipc	ra,0xfffff
    80003040:	78c080e7          	jalr	1932(ra) # 800027c8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003044:	00000493          	li	s1,0
    80003048:	f99ff06f          	j	80002fe0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    8000304c:	00003517          	auipc	a0,0x3
    80003050:	11c50513          	addi	a0,a0,284 # 80006168 <CONSOLE_STATUS+0x158>
    80003054:	fffff097          	auipc	ra,0xfffff
    80003058:	774080e7          	jalr	1908(ra) # 800027c8 <_Z11printStringPKc>
    finishedB = true;
    8000305c:	00100793          	li	a5,1
    80003060:	00005717          	auipc	a4,0x5
    80003064:	80f700a3          	sb	a5,-2047(a4) # 80007861 <finishedB>
    //thread_exit();
    thread_dispatch();
    80003068:	ffffe097          	auipc	ra,0xffffe
    8000306c:	56c080e7          	jalr	1388(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80003070:	01813083          	ld	ra,24(sp)
    80003074:	01013403          	ld	s0,16(sp)
    80003078:	00813483          	ld	s1,8(sp)
    8000307c:	00013903          	ld	s2,0(sp)
    80003080:	02010113          	addi	sp,sp,32
    80003084:	00008067          	ret

0000000080003088 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003088:	fe010113          	addi	sp,sp,-32
    8000308c:	00113c23          	sd	ra,24(sp)
    80003090:	00813823          	sd	s0,16(sp)
    80003094:	00913423          	sd	s1,8(sp)
    80003098:	01213023          	sd	s2,0(sp)
    8000309c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800030a0:	00000493          	li	s1,0
    800030a4:	0400006f          	j	800030e4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800030a8:	00003517          	auipc	a0,0x3
    800030ac:	0d050513          	addi	a0,a0,208 # 80006178 <CONSOLE_STATUS+0x168>
    800030b0:	fffff097          	auipc	ra,0xfffff
    800030b4:	718080e7          	jalr	1816(ra) # 800027c8 <_Z11printStringPKc>
    800030b8:	00000613          	li	a2,0
    800030bc:	00a00593          	li	a1,10
    800030c0:	00048513          	mv	a0,s1
    800030c4:	00000097          	auipc	ra,0x0
    800030c8:	89c080e7          	jalr	-1892(ra) # 80002960 <_Z8printIntiii>
    800030cc:	00003517          	auipc	a0,0x3
    800030d0:	29450513          	addi	a0,a0,660 # 80006360 <CONSOLE_STATUS+0x350>
    800030d4:	fffff097          	auipc	ra,0xfffff
    800030d8:	6f4080e7          	jalr	1780(ra) # 800027c8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800030dc:	0014849b          	addiw	s1,s1,1
    800030e0:	0ff4f493          	andi	s1,s1,255
    800030e4:	00200793          	li	a5,2
    800030e8:	fc97f0e3          	bgeu	a5,s1,800030a8 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800030ec:	00003517          	auipc	a0,0x3
    800030f0:	09450513          	addi	a0,a0,148 # 80006180 <CONSOLE_STATUS+0x170>
    800030f4:	fffff097          	auipc	ra,0xfffff
    800030f8:	6d4080e7          	jalr	1748(ra) # 800027c8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800030fc:	00700313          	li	t1,7
    thread_dispatch();
    80003100:	ffffe097          	auipc	ra,0xffffe
    80003104:	4d4080e7          	jalr	1236(ra) # 800015d4 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003108:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    8000310c:	00003517          	auipc	a0,0x3
    80003110:	08450513          	addi	a0,a0,132 # 80006190 <CONSOLE_STATUS+0x180>
    80003114:	fffff097          	auipc	ra,0xfffff
    80003118:	6b4080e7          	jalr	1716(ra) # 800027c8 <_Z11printStringPKc>
    8000311c:	00000613          	li	a2,0
    80003120:	00a00593          	li	a1,10
    80003124:	0009051b          	sext.w	a0,s2
    80003128:	00000097          	auipc	ra,0x0
    8000312c:	838080e7          	jalr	-1992(ra) # 80002960 <_Z8printIntiii>
    80003130:	00003517          	auipc	a0,0x3
    80003134:	23050513          	addi	a0,a0,560 # 80006360 <CONSOLE_STATUS+0x350>
    80003138:	fffff097          	auipc	ra,0xfffff
    8000313c:	690080e7          	jalr	1680(ra) # 800027c8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003140:	00c00513          	li	a0,12
    80003144:	00000097          	auipc	ra,0x0
    80003148:	d28080e7          	jalr	-728(ra) # 80002e6c <_Z9fibonaccim>
    8000314c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003150:	00003517          	auipc	a0,0x3
    80003154:	04850513          	addi	a0,a0,72 # 80006198 <CONSOLE_STATUS+0x188>
    80003158:	fffff097          	auipc	ra,0xfffff
    8000315c:	670080e7          	jalr	1648(ra) # 800027c8 <_Z11printStringPKc>
    80003160:	00000613          	li	a2,0
    80003164:	00a00593          	li	a1,10
    80003168:	0009051b          	sext.w	a0,s2
    8000316c:	fffff097          	auipc	ra,0xfffff
    80003170:	7f4080e7          	jalr	2036(ra) # 80002960 <_Z8printIntiii>
    80003174:	00003517          	auipc	a0,0x3
    80003178:	1ec50513          	addi	a0,a0,492 # 80006360 <CONSOLE_STATUS+0x350>
    8000317c:	fffff097          	auipc	ra,0xfffff
    80003180:	64c080e7          	jalr	1612(ra) # 800027c8 <_Z11printStringPKc>
    80003184:	0400006f          	j	800031c4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003188:	00003517          	auipc	a0,0x3
    8000318c:	ff050513          	addi	a0,a0,-16 # 80006178 <CONSOLE_STATUS+0x168>
    80003190:	fffff097          	auipc	ra,0xfffff
    80003194:	638080e7          	jalr	1592(ra) # 800027c8 <_Z11printStringPKc>
    80003198:	00000613          	li	a2,0
    8000319c:	00a00593          	li	a1,10
    800031a0:	00048513          	mv	a0,s1
    800031a4:	fffff097          	auipc	ra,0xfffff
    800031a8:	7bc080e7          	jalr	1980(ra) # 80002960 <_Z8printIntiii>
    800031ac:	00003517          	auipc	a0,0x3
    800031b0:	1b450513          	addi	a0,a0,436 # 80006360 <CONSOLE_STATUS+0x350>
    800031b4:	fffff097          	auipc	ra,0xfffff
    800031b8:	614080e7          	jalr	1556(ra) # 800027c8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800031bc:	0014849b          	addiw	s1,s1,1
    800031c0:	0ff4f493          	andi	s1,s1,255
    800031c4:	00500793          	li	a5,5
    800031c8:	fc97f0e3          	bgeu	a5,s1,80003188 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("C finished!\n");
    800031cc:	00003517          	auipc	a0,0x3
    800031d0:	fdc50513          	addi	a0,a0,-36 # 800061a8 <CONSOLE_STATUS+0x198>
    800031d4:	fffff097          	auipc	ra,0xfffff
    800031d8:	5f4080e7          	jalr	1524(ra) # 800027c8 <_Z11printStringPKc>
    finishedC = true;
    800031dc:	00100793          	li	a5,1
    800031e0:	00004717          	auipc	a4,0x4
    800031e4:	68f70123          	sb	a5,1666(a4) # 80007862 <finishedC>
    //thread_exit();
    thread_dispatch();
    800031e8:	ffffe097          	auipc	ra,0xffffe
    800031ec:	3ec080e7          	jalr	1004(ra) # 800015d4 <_Z15thread_dispatchv>
}
    800031f0:	01813083          	ld	ra,24(sp)
    800031f4:	01013403          	ld	s0,16(sp)
    800031f8:	00813483          	ld	s1,8(sp)
    800031fc:	00013903          	ld	s2,0(sp)
    80003200:	02010113          	addi	sp,sp,32
    80003204:	00008067          	ret

0000000080003208 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003208:	fe010113          	addi	sp,sp,-32
    8000320c:	00113c23          	sd	ra,24(sp)
    80003210:	00813823          	sd	s0,16(sp)
    80003214:	00913423          	sd	s1,8(sp)
    80003218:	01213023          	sd	s2,0(sp)
    8000321c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003220:	00a00493          	li	s1,10
    80003224:	0400006f          	j	80003264 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003228:	00003517          	auipc	a0,0x3
    8000322c:	f9050513          	addi	a0,a0,-112 # 800061b8 <CONSOLE_STATUS+0x1a8>
    80003230:	fffff097          	auipc	ra,0xfffff
    80003234:	598080e7          	jalr	1432(ra) # 800027c8 <_Z11printStringPKc>
    80003238:	00000613          	li	a2,0
    8000323c:	00a00593          	li	a1,10
    80003240:	00048513          	mv	a0,s1
    80003244:	fffff097          	auipc	ra,0xfffff
    80003248:	71c080e7          	jalr	1820(ra) # 80002960 <_Z8printIntiii>
    8000324c:	00003517          	auipc	a0,0x3
    80003250:	11450513          	addi	a0,a0,276 # 80006360 <CONSOLE_STATUS+0x350>
    80003254:	fffff097          	auipc	ra,0xfffff
    80003258:	574080e7          	jalr	1396(ra) # 800027c8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    8000325c:	0014849b          	addiw	s1,s1,1
    80003260:	0ff4f493          	andi	s1,s1,255
    80003264:	00c00793          	li	a5,12
    80003268:	fc97f0e3          	bgeu	a5,s1,80003228 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    8000326c:	00003517          	auipc	a0,0x3
    80003270:	f5450513          	addi	a0,a0,-172 # 800061c0 <CONSOLE_STATUS+0x1b0>
    80003274:	fffff097          	auipc	ra,0xfffff
    80003278:	554080e7          	jalr	1364(ra) # 800027c8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    8000327c:	00500313          	li	t1,5
    thread_dispatch();
    80003280:	ffffe097          	auipc	ra,0xffffe
    80003284:	354080e7          	jalr	852(ra) # 800015d4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003288:	01000513          	li	a0,16
    8000328c:	00000097          	auipc	ra,0x0
    80003290:	be0080e7          	jalr	-1056(ra) # 80002e6c <_Z9fibonaccim>
    80003294:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003298:	00003517          	auipc	a0,0x3
    8000329c:	f3850513          	addi	a0,a0,-200 # 800061d0 <CONSOLE_STATUS+0x1c0>
    800032a0:	fffff097          	auipc	ra,0xfffff
    800032a4:	528080e7          	jalr	1320(ra) # 800027c8 <_Z11printStringPKc>
    800032a8:	00000613          	li	a2,0
    800032ac:	00a00593          	li	a1,10
    800032b0:	0009051b          	sext.w	a0,s2
    800032b4:	fffff097          	auipc	ra,0xfffff
    800032b8:	6ac080e7          	jalr	1708(ra) # 80002960 <_Z8printIntiii>
    800032bc:	00003517          	auipc	a0,0x3
    800032c0:	0a450513          	addi	a0,a0,164 # 80006360 <CONSOLE_STATUS+0x350>
    800032c4:	fffff097          	auipc	ra,0xfffff
    800032c8:	504080e7          	jalr	1284(ra) # 800027c8 <_Z11printStringPKc>
    800032cc:	0400006f          	j	8000330c <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800032d0:	00003517          	auipc	a0,0x3
    800032d4:	ee850513          	addi	a0,a0,-280 # 800061b8 <CONSOLE_STATUS+0x1a8>
    800032d8:	fffff097          	auipc	ra,0xfffff
    800032dc:	4f0080e7          	jalr	1264(ra) # 800027c8 <_Z11printStringPKc>
    800032e0:	00000613          	li	a2,0
    800032e4:	00a00593          	li	a1,10
    800032e8:	00048513          	mv	a0,s1
    800032ec:	fffff097          	auipc	ra,0xfffff
    800032f0:	674080e7          	jalr	1652(ra) # 80002960 <_Z8printIntiii>
    800032f4:	00003517          	auipc	a0,0x3
    800032f8:	06c50513          	addi	a0,a0,108 # 80006360 <CONSOLE_STATUS+0x350>
    800032fc:	fffff097          	auipc	ra,0xfffff
    80003300:	4cc080e7          	jalr	1228(ra) # 800027c8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003304:	0014849b          	addiw	s1,s1,1
    80003308:	0ff4f493          	andi	s1,s1,255
    8000330c:	00f00793          	li	a5,15
    80003310:	fc97f0e3          	bgeu	a5,s1,800032d0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80003314:	00003517          	auipc	a0,0x3
    80003318:	ecc50513          	addi	a0,a0,-308 # 800061e0 <CONSOLE_STATUS+0x1d0>
    8000331c:	fffff097          	auipc	ra,0xfffff
    80003320:	4ac080e7          	jalr	1196(ra) # 800027c8 <_Z11printStringPKc>
    finishedD = true;
    80003324:	00100793          	li	a5,1
    80003328:	00004717          	auipc	a4,0x4
    8000332c:	52f70da3          	sb	a5,1339(a4) # 80007863 <finishedD>
    //thread_exit();
    thread_dispatch();
    80003330:	ffffe097          	auipc	ra,0xffffe
    80003334:	2a4080e7          	jalr	676(ra) # 800015d4 <_Z15thread_dispatchv>
}
    80003338:	01813083          	ld	ra,24(sp)
    8000333c:	01013403          	ld	s0,16(sp)
    80003340:	00813483          	ld	s1,8(sp)
    80003344:	00013903          	ld	s2,0(sp)
    80003348:	02010113          	addi	sp,sp,32
    8000334c:	00008067          	ret

0000000080003350 <_Z4bodyPv>:
void body(void *p){
    80003350:	fe010113          	addi	sp,sp,-32
    80003354:	00113c23          	sd	ra,24(sp)
    80003358:	00813823          	sd	s0,16(sp)
    8000335c:	00913423          	sd	s1,8(sp)
    80003360:	02010413          	addi	s0,sp,32
    int i = 0;
    80003364:	00000493          	li	s1,0
    80003368:	03c0006f          	j	800033a4 <_Z4bodyPv+0x54>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000336c:	00003517          	auipc	a0,0x3
    80003370:	e4c50513          	addi	a0,a0,-436 # 800061b8 <CONSOLE_STATUS+0x1a8>
    80003374:	fffff097          	auipc	ra,0xfffff
    80003378:	454080e7          	jalr	1108(ra) # 800027c8 <_Z11printStringPKc>
    8000337c:	00000613          	li	a2,0
    80003380:	00a00593          	li	a1,10
    80003384:	00048513          	mv	a0,s1
    80003388:	fffff097          	auipc	ra,0xfffff
    8000338c:	5d8080e7          	jalr	1496(ra) # 80002960 <_Z8printIntiii>
    80003390:	00003517          	auipc	a0,0x3
    80003394:	fd050513          	addi	a0,a0,-48 # 80006360 <CONSOLE_STATUS+0x350>
    80003398:	fffff097          	auipc	ra,0xfffff
    8000339c:	430080e7          	jalr	1072(ra) # 800027c8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800033a0:	0014849b          	addiw	s1,s1,1
    800033a4:	00c00793          	li	a5,12
    800033a8:	fc97d2e3          	bge	a5,s1,8000336c <_Z4bodyPv+0x1c>
    }
}
    800033ac:	01813083          	ld	ra,24(sp)
    800033b0:	01013403          	ld	s0,16(sp)
    800033b4:	00813483          	ld	s1,8(sp)
    800033b8:	02010113          	addi	sp,sp,32
    800033bc:	00008067          	ret

00000000800033c0 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800033c0:	fc010113          	addi	sp,sp,-64
    800033c4:	02113c23          	sd	ra,56(sp)
    800033c8:	02813823          	sd	s0,48(sp)
    800033cc:	02913423          	sd	s1,40(sp)
    800033d0:	03213023          	sd	s2,32(sp)
    800033d4:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    800033d8:	01000513          	li	a0,16
    800033dc:	fffff097          	auipc	ra,0xfffff
    800033e0:	a78080e7          	jalr	-1416(ra) # 80001e54 <_Znwm>
    800033e4:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    800033e8:	fffff097          	auipc	ra,0xfffff
    800033ec:	c38080e7          	jalr	-968(ra) # 80002020 <_ZN6ThreadC1Ev>
    800033f0:	00004797          	auipc	a5,0x4
    800033f4:	32878793          	addi	a5,a5,808 # 80007718 <_ZTV7WorkerA+0x10>
    800033f8:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    800033fc:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003400:	00003517          	auipc	a0,0x3
    80003404:	df050513          	addi	a0,a0,-528 # 800061f0 <CONSOLE_STATUS+0x1e0>
    80003408:	fffff097          	auipc	ra,0xfffff
    8000340c:	3c0080e7          	jalr	960(ra) # 800027c8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003410:	01000513          	li	a0,16
    80003414:	fffff097          	auipc	ra,0xfffff
    80003418:	a40080e7          	jalr	-1472(ra) # 80001e54 <_Znwm>
    8000341c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003420:	fffff097          	auipc	ra,0xfffff
    80003424:	c00080e7          	jalr	-1024(ra) # 80002020 <_ZN6ThreadC1Ev>
    80003428:	00004797          	auipc	a5,0x4
    8000342c:	31878793          	addi	a5,a5,792 # 80007740 <_ZTV7WorkerB+0x10>
    80003430:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003434:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    80003438:	00003517          	auipc	a0,0x3
    8000343c:	dd050513          	addi	a0,a0,-560 # 80006208 <CONSOLE_STATUS+0x1f8>
    80003440:	fffff097          	auipc	ra,0xfffff
    80003444:	388080e7          	jalr	904(ra) # 800027c8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    80003448:	01000513          	li	a0,16
    8000344c:	fffff097          	auipc	ra,0xfffff
    80003450:	a08080e7          	jalr	-1528(ra) # 80001e54 <_Znwm>
    80003454:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    80003458:	fffff097          	auipc	ra,0xfffff
    8000345c:	bc8080e7          	jalr	-1080(ra) # 80002020 <_ZN6ThreadC1Ev>
    80003460:	00004797          	auipc	a5,0x4
    80003464:	30878793          	addi	a5,a5,776 # 80007768 <_ZTV7WorkerC+0x10>
    80003468:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    8000346c:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003470:	00003517          	auipc	a0,0x3
    80003474:	db050513          	addi	a0,a0,-592 # 80006220 <CONSOLE_STATUS+0x210>
    80003478:	fffff097          	auipc	ra,0xfffff
    8000347c:	350080e7          	jalr	848(ra) # 800027c8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003480:	01000513          	li	a0,16
    80003484:	fffff097          	auipc	ra,0xfffff
    80003488:	9d0080e7          	jalr	-1584(ra) # 80001e54 <_Znwm>
    8000348c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003490:	fffff097          	auipc	ra,0xfffff
    80003494:	b90080e7          	jalr	-1136(ra) # 80002020 <_ZN6ThreadC1Ev>
    80003498:	00004797          	auipc	a5,0x4
    8000349c:	2f878793          	addi	a5,a5,760 # 80007790 <_ZTV7WorkerD+0x10>
    800034a0:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800034a4:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800034a8:	00003517          	auipc	a0,0x3
    800034ac:	d9050513          	addi	a0,a0,-624 # 80006238 <CONSOLE_STATUS+0x228>
    800034b0:	fffff097          	auipc	ra,0xfffff
    800034b4:	318080e7          	jalr	792(ra) # 800027c8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800034b8:	00000493          	li	s1,0
    800034bc:	00300793          	li	a5,3
    800034c0:	0297c663          	blt	a5,s1,800034ec <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800034c4:	00349793          	slli	a5,s1,0x3
    800034c8:	fe040713          	addi	a4,s0,-32
    800034cc:	00f707b3          	add	a5,a4,a5
    800034d0:	fe07b503          	ld	a0,-32(a5)
    800034d4:	fffff097          	auipc	ra,0xfffff
    800034d8:	ad8080e7          	jalr	-1320(ra) # 80001fac <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    800034dc:	0014849b          	addiw	s1,s1,1
    800034e0:	fddff06f          	j	800034bc <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    800034e4:	fffff097          	auipc	ra,0xfffff
    800034e8:	af8080e7          	jalr	-1288(ra) # 80001fdc <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800034ec:	00004797          	auipc	a5,0x4
    800034f0:	3747c783          	lbu	a5,884(a5) # 80007860 <finishedA>
    800034f4:	fe0788e3          	beqz	a5,800034e4 <_Z20Threads_CPP_API_testv+0x124>
    800034f8:	00004797          	auipc	a5,0x4
    800034fc:	3697c783          	lbu	a5,873(a5) # 80007861 <finishedB>
    80003500:	fe0782e3          	beqz	a5,800034e4 <_Z20Threads_CPP_API_testv+0x124>
    80003504:	00004797          	auipc	a5,0x4
    80003508:	35e7c783          	lbu	a5,862(a5) # 80007862 <finishedC>
    8000350c:	fc078ce3          	beqz	a5,800034e4 <_Z20Threads_CPP_API_testv+0x124>
    80003510:	00004797          	auipc	a5,0x4
    80003514:	3537c783          	lbu	a5,851(a5) # 80007863 <finishedD>
    80003518:	fc0786e3          	beqz	a5,800034e4 <_Z20Threads_CPP_API_testv+0x124>
    }

    for (auto thread: threads) { delete thread; }
    8000351c:	fc040493          	addi	s1,s0,-64
    80003520:	0080006f          	j	80003528 <_Z20Threads_CPP_API_testv+0x168>
    80003524:	00848493          	addi	s1,s1,8
    80003528:	fe040793          	addi	a5,s0,-32
    8000352c:	08f48663          	beq	s1,a5,800035b8 <_Z20Threads_CPP_API_testv+0x1f8>
    80003530:	0004b503          	ld	a0,0(s1)
    80003534:	fe0508e3          	beqz	a0,80003524 <_Z20Threads_CPP_API_testv+0x164>
    80003538:	00053783          	ld	a5,0(a0)
    8000353c:	0087b783          	ld	a5,8(a5)
    80003540:	000780e7          	jalr	a5
    80003544:	fe1ff06f          	j	80003524 <_Z20Threads_CPP_API_testv+0x164>
    80003548:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    8000354c:	00048513          	mv	a0,s1
    80003550:	fffff097          	auipc	ra,0xfffff
    80003554:	954080e7          	jalr	-1708(ra) # 80001ea4 <_ZdlPv>
    80003558:	00090513          	mv	a0,s2
    8000355c:	00005097          	auipc	ra,0x5
    80003560:	3dc080e7          	jalr	988(ra) # 80008938 <_Unwind_Resume>
    80003564:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003568:	00048513          	mv	a0,s1
    8000356c:	fffff097          	auipc	ra,0xfffff
    80003570:	938080e7          	jalr	-1736(ra) # 80001ea4 <_ZdlPv>
    80003574:	00090513          	mv	a0,s2
    80003578:	00005097          	auipc	ra,0x5
    8000357c:	3c0080e7          	jalr	960(ra) # 80008938 <_Unwind_Resume>
    80003580:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003584:	00048513          	mv	a0,s1
    80003588:	fffff097          	auipc	ra,0xfffff
    8000358c:	91c080e7          	jalr	-1764(ra) # 80001ea4 <_ZdlPv>
    80003590:	00090513          	mv	a0,s2
    80003594:	00005097          	auipc	ra,0x5
    80003598:	3a4080e7          	jalr	932(ra) # 80008938 <_Unwind_Resume>
    8000359c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800035a0:	00048513          	mv	a0,s1
    800035a4:	fffff097          	auipc	ra,0xfffff
    800035a8:	900080e7          	jalr	-1792(ra) # 80001ea4 <_ZdlPv>
    800035ac:	00090513          	mv	a0,s2
    800035b0:	00005097          	auipc	ra,0x5
    800035b4:	388080e7          	jalr	904(ra) # 80008938 <_Unwind_Resume>
}
    800035b8:	03813083          	ld	ra,56(sp)
    800035bc:	03013403          	ld	s0,48(sp)
    800035c0:	02813483          	ld	s1,40(sp)
    800035c4:	02013903          	ld	s2,32(sp)
    800035c8:	04010113          	addi	sp,sp,64
    800035cc:	00008067          	ret

00000000800035d0 <_Z8userMainv>:
//#include "../test/ConsumerProducer_CPP_Sync_API_test.h" // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

//#include "../test/ThreadSleep_C_API_test.hpp" // thread_sleep test C API
//#include "../test/ConsumerProducer_CPP_API_test.hpp" // zadatak 4. CPP API i asinhrona promena konteksta

void userMain() {
    800035d0:	ff010113          	addi	sp,sp,-16
    800035d4:	00113423          	sd	ra,8(sp)
    800035d8:	00813023          	sd	s0,0(sp)
    800035dc:	01010413          	addi	s0,sp,16
    //Threads_C_API_test(); // zadatak 2., niti C API i sinhrona promena konteksta
    Threads_CPP_API_test(); // zadatak 2., niti CPP API i sinhrona promena konteksta
    800035e0:	00000097          	auipc	ra,0x0
    800035e4:	de0080e7          	jalr	-544(ra) # 800033c0 <_Z20Threads_CPP_API_testv>
    //producerConsumer_CPP_Sync_API(); // zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta

    //testSleeping(); // thread_sleep test C API
//    ConsumerProducerCPP::testConsumerProducer(); // zadatak 4. CPP API i asinhrona promena konteksta, kompletan test svega

}
    800035e8:	00813083          	ld	ra,8(sp)
    800035ec:	00013403          	ld	s0,0(sp)
    800035f0:	01010113          	addi	sp,sp,16
    800035f4:	00008067          	ret

00000000800035f8 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    800035f8:	ff010113          	addi	sp,sp,-16
    800035fc:	00113423          	sd	ra,8(sp)
    80003600:	00813023          	sd	s0,0(sp)
    80003604:	01010413          	addi	s0,sp,16
    80003608:	00004797          	auipc	a5,0x4
    8000360c:	11078793          	addi	a5,a5,272 # 80007718 <_ZTV7WorkerA+0x10>
    80003610:	00f53023          	sd	a5,0(a0)
    80003614:	ffffe097          	auipc	ra,0xffffe
    80003618:	7b4080e7          	jalr	1972(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    8000361c:	00813083          	ld	ra,8(sp)
    80003620:	00013403          	ld	s0,0(sp)
    80003624:	01010113          	addi	sp,sp,16
    80003628:	00008067          	ret

000000008000362c <_ZN7WorkerAD0Ev>:
    8000362c:	fe010113          	addi	sp,sp,-32
    80003630:	00113c23          	sd	ra,24(sp)
    80003634:	00813823          	sd	s0,16(sp)
    80003638:	00913423          	sd	s1,8(sp)
    8000363c:	02010413          	addi	s0,sp,32
    80003640:	00050493          	mv	s1,a0
    80003644:	00004797          	auipc	a5,0x4
    80003648:	0d478793          	addi	a5,a5,212 # 80007718 <_ZTV7WorkerA+0x10>
    8000364c:	00f53023          	sd	a5,0(a0)
    80003650:	ffffe097          	auipc	ra,0xffffe
    80003654:	778080e7          	jalr	1912(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    80003658:	00048513          	mv	a0,s1
    8000365c:	fffff097          	auipc	ra,0xfffff
    80003660:	848080e7          	jalr	-1976(ra) # 80001ea4 <_ZdlPv>
    80003664:	01813083          	ld	ra,24(sp)
    80003668:	01013403          	ld	s0,16(sp)
    8000366c:	00813483          	ld	s1,8(sp)
    80003670:	02010113          	addi	sp,sp,32
    80003674:	00008067          	ret

0000000080003678 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003678:	ff010113          	addi	sp,sp,-16
    8000367c:	00113423          	sd	ra,8(sp)
    80003680:	00813023          	sd	s0,0(sp)
    80003684:	01010413          	addi	s0,sp,16
    80003688:	00004797          	auipc	a5,0x4
    8000368c:	0b878793          	addi	a5,a5,184 # 80007740 <_ZTV7WorkerB+0x10>
    80003690:	00f53023          	sd	a5,0(a0)
    80003694:	ffffe097          	auipc	ra,0xffffe
    80003698:	734080e7          	jalr	1844(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    8000369c:	00813083          	ld	ra,8(sp)
    800036a0:	00013403          	ld	s0,0(sp)
    800036a4:	01010113          	addi	sp,sp,16
    800036a8:	00008067          	ret

00000000800036ac <_ZN7WorkerBD0Ev>:
    800036ac:	fe010113          	addi	sp,sp,-32
    800036b0:	00113c23          	sd	ra,24(sp)
    800036b4:	00813823          	sd	s0,16(sp)
    800036b8:	00913423          	sd	s1,8(sp)
    800036bc:	02010413          	addi	s0,sp,32
    800036c0:	00050493          	mv	s1,a0
    800036c4:	00004797          	auipc	a5,0x4
    800036c8:	07c78793          	addi	a5,a5,124 # 80007740 <_ZTV7WorkerB+0x10>
    800036cc:	00f53023          	sd	a5,0(a0)
    800036d0:	ffffe097          	auipc	ra,0xffffe
    800036d4:	6f8080e7          	jalr	1784(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    800036d8:	00048513          	mv	a0,s1
    800036dc:	ffffe097          	auipc	ra,0xffffe
    800036e0:	7c8080e7          	jalr	1992(ra) # 80001ea4 <_ZdlPv>
    800036e4:	01813083          	ld	ra,24(sp)
    800036e8:	01013403          	ld	s0,16(sp)
    800036ec:	00813483          	ld	s1,8(sp)
    800036f0:	02010113          	addi	sp,sp,32
    800036f4:	00008067          	ret

00000000800036f8 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    800036f8:	ff010113          	addi	sp,sp,-16
    800036fc:	00113423          	sd	ra,8(sp)
    80003700:	00813023          	sd	s0,0(sp)
    80003704:	01010413          	addi	s0,sp,16
    80003708:	00004797          	auipc	a5,0x4
    8000370c:	06078793          	addi	a5,a5,96 # 80007768 <_ZTV7WorkerC+0x10>
    80003710:	00f53023          	sd	a5,0(a0)
    80003714:	ffffe097          	auipc	ra,0xffffe
    80003718:	6b4080e7          	jalr	1716(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    8000371c:	00813083          	ld	ra,8(sp)
    80003720:	00013403          	ld	s0,0(sp)
    80003724:	01010113          	addi	sp,sp,16
    80003728:	00008067          	ret

000000008000372c <_ZN7WorkerCD0Ev>:
    8000372c:	fe010113          	addi	sp,sp,-32
    80003730:	00113c23          	sd	ra,24(sp)
    80003734:	00813823          	sd	s0,16(sp)
    80003738:	00913423          	sd	s1,8(sp)
    8000373c:	02010413          	addi	s0,sp,32
    80003740:	00050493          	mv	s1,a0
    80003744:	00004797          	auipc	a5,0x4
    80003748:	02478793          	addi	a5,a5,36 # 80007768 <_ZTV7WorkerC+0x10>
    8000374c:	00f53023          	sd	a5,0(a0)
    80003750:	ffffe097          	auipc	ra,0xffffe
    80003754:	678080e7          	jalr	1656(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    80003758:	00048513          	mv	a0,s1
    8000375c:	ffffe097          	auipc	ra,0xffffe
    80003760:	748080e7          	jalr	1864(ra) # 80001ea4 <_ZdlPv>
    80003764:	01813083          	ld	ra,24(sp)
    80003768:	01013403          	ld	s0,16(sp)
    8000376c:	00813483          	ld	s1,8(sp)
    80003770:	02010113          	addi	sp,sp,32
    80003774:	00008067          	ret

0000000080003778 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003778:	ff010113          	addi	sp,sp,-16
    8000377c:	00113423          	sd	ra,8(sp)
    80003780:	00813023          	sd	s0,0(sp)
    80003784:	01010413          	addi	s0,sp,16
    80003788:	00004797          	auipc	a5,0x4
    8000378c:	00878793          	addi	a5,a5,8 # 80007790 <_ZTV7WorkerD+0x10>
    80003790:	00f53023          	sd	a5,0(a0)
    80003794:	ffffe097          	auipc	ra,0xffffe
    80003798:	634080e7          	jalr	1588(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    8000379c:	00813083          	ld	ra,8(sp)
    800037a0:	00013403          	ld	s0,0(sp)
    800037a4:	01010113          	addi	sp,sp,16
    800037a8:	00008067          	ret

00000000800037ac <_ZN7WorkerDD0Ev>:
    800037ac:	fe010113          	addi	sp,sp,-32
    800037b0:	00113c23          	sd	ra,24(sp)
    800037b4:	00813823          	sd	s0,16(sp)
    800037b8:	00913423          	sd	s1,8(sp)
    800037bc:	02010413          	addi	s0,sp,32
    800037c0:	00050493          	mv	s1,a0
    800037c4:	00004797          	auipc	a5,0x4
    800037c8:	fcc78793          	addi	a5,a5,-52 # 80007790 <_ZTV7WorkerD+0x10>
    800037cc:	00f53023          	sd	a5,0(a0)
    800037d0:	ffffe097          	auipc	ra,0xffffe
    800037d4:	5f8080e7          	jalr	1528(ra) # 80001dc8 <_ZN6ThreadD1Ev>
    800037d8:	00048513          	mv	a0,s1
    800037dc:	ffffe097          	auipc	ra,0xffffe
    800037e0:	6c8080e7          	jalr	1736(ra) # 80001ea4 <_ZdlPv>
    800037e4:	01813083          	ld	ra,24(sp)
    800037e8:	01013403          	ld	s0,16(sp)
    800037ec:	00813483          	ld	s1,8(sp)
    800037f0:	02010113          	addi	sp,sp,32
    800037f4:	00008067          	ret

00000000800037f8 <_ZN7WorkerA3runEv>:
    void run() override {
    800037f8:	ff010113          	addi	sp,sp,-16
    800037fc:	00113423          	sd	ra,8(sp)
    80003800:	00813023          	sd	s0,0(sp)
    80003804:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003808:	00000593          	li	a1,0
    8000380c:	fffff097          	auipc	ra,0xfffff
    80003810:	6d4080e7          	jalr	1748(ra) # 80002ee0 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003814:	00813083          	ld	ra,8(sp)
    80003818:	00013403          	ld	s0,0(sp)
    8000381c:	01010113          	addi	sp,sp,16
    80003820:	00008067          	ret

0000000080003824 <_ZN7WorkerB3runEv>:
    void run() override {
    80003824:	ff010113          	addi	sp,sp,-16
    80003828:	00113423          	sd	ra,8(sp)
    8000382c:	00813023          	sd	s0,0(sp)
    80003830:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003834:	00000593          	li	a1,0
    80003838:	fffff097          	auipc	ra,0xfffff
    8000383c:	77c080e7          	jalr	1916(ra) # 80002fb4 <_ZN7WorkerB11workerBodyBEPv>
    }
    80003840:	00813083          	ld	ra,8(sp)
    80003844:	00013403          	ld	s0,0(sp)
    80003848:	01010113          	addi	sp,sp,16
    8000384c:	00008067          	ret

0000000080003850 <_ZN7WorkerC3runEv>:
    void run() override {
    80003850:	ff010113          	addi	sp,sp,-16
    80003854:	00113423          	sd	ra,8(sp)
    80003858:	00813023          	sd	s0,0(sp)
    8000385c:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003860:	00000593          	li	a1,0
    80003864:	00000097          	auipc	ra,0x0
    80003868:	824080e7          	jalr	-2012(ra) # 80003088 <_ZN7WorkerC11workerBodyCEPv>
    }
    8000386c:	00813083          	ld	ra,8(sp)
    80003870:	00013403          	ld	s0,0(sp)
    80003874:	01010113          	addi	sp,sp,16
    80003878:	00008067          	ret

000000008000387c <_ZN7WorkerD3runEv>:
    void run() override {
    8000387c:	ff010113          	addi	sp,sp,-16
    80003880:	00113423          	sd	ra,8(sp)
    80003884:	00813023          	sd	s0,0(sp)
    80003888:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    8000388c:	00000593          	li	a1,0
    80003890:	00000097          	auipc	ra,0x0
    80003894:	978080e7          	jalr	-1672(ra) # 80003208 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003898:	00813083          	ld	ra,8(sp)
    8000389c:	00013403          	ld	s0,0(sp)
    800038a0:	01010113          	addi	sp,sp,16
    800038a4:	00008067          	ret

00000000800038a8 <_ZN6BufferC1Ei>:
// Created by os on 6/26/22.
//

#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800038a8:	fe010113          	addi	sp,sp,-32
    800038ac:	00113c23          	sd	ra,24(sp)
    800038b0:	00813823          	sd	s0,16(sp)
    800038b4:	00913423          	sd	s1,8(sp)
    800038b8:	01213023          	sd	s2,0(sp)
    800038bc:	02010413          	addi	s0,sp,32
    800038c0:	00050493          	mv	s1,a0
    800038c4:	00058913          	mv	s2,a1
    800038c8:	0015879b          	addiw	a5,a1,1
    800038cc:	0007851b          	sext.w	a0,a5
    800038d0:	00f4a023          	sw	a5,0(s1)
    800038d4:	0004a823          	sw	zero,16(s1)
    800038d8:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800038dc:	00251513          	slli	a0,a0,0x2
    800038e0:	ffffe097          	auipc	ra,0xffffe
    800038e4:	bc0080e7          	jalr	-1088(ra) # 800014a0 <_Z9mem_allocm>
    800038e8:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    800038ec:	00000593          	li	a1,0
    800038f0:	02048513          	addi	a0,s1,32
    800038f4:	ffffe097          	auipc	ra,0xffffe
    800038f8:	db0080e7          	jalr	-592(ra) # 800016a4 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    800038fc:	00090593          	mv	a1,s2
    80003900:	01848513          	addi	a0,s1,24
    80003904:	ffffe097          	auipc	ra,0xffffe
    80003908:	da0080e7          	jalr	-608(ra) # 800016a4 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    8000390c:	00100593          	li	a1,1
    80003910:	02848513          	addi	a0,s1,40
    80003914:	ffffe097          	auipc	ra,0xffffe
    80003918:	d90080e7          	jalr	-624(ra) # 800016a4 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    8000391c:	00100593          	li	a1,1
    80003920:	03048513          	addi	a0,s1,48
    80003924:	ffffe097          	auipc	ra,0xffffe
    80003928:	d80080e7          	jalr	-640(ra) # 800016a4 <_Z8sem_openPP4_semj>
}
    8000392c:	01813083          	ld	ra,24(sp)
    80003930:	01013403          	ld	s0,16(sp)
    80003934:	00813483          	ld	s1,8(sp)
    80003938:	00013903          	ld	s2,0(sp)
    8000393c:	02010113          	addi	sp,sp,32
    80003940:	00008067          	ret

0000000080003944 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80003944:	fe010113          	addi	sp,sp,-32
    80003948:	00113c23          	sd	ra,24(sp)
    8000394c:	00813823          	sd	s0,16(sp)
    80003950:	00913423          	sd	s1,8(sp)
    80003954:	01213023          	sd	s2,0(sp)
    80003958:	02010413          	addi	s0,sp,32
    8000395c:	00050493          	mv	s1,a0
    80003960:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80003964:	01853503          	ld	a0,24(a0)
    80003968:	ffffe097          	auipc	ra,0xffffe
    8000396c:	db0080e7          	jalr	-592(ra) # 80001718 <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80003970:	0304b503          	ld	a0,48(s1)
    80003974:	ffffe097          	auipc	ra,0xffffe
    80003978:	da4080e7          	jalr	-604(ra) # 80001718 <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    8000397c:	0084b783          	ld	a5,8(s1)
    80003980:	0144a703          	lw	a4,20(s1)
    80003984:	00271713          	slli	a4,a4,0x2
    80003988:	00e787b3          	add	a5,a5,a4
    8000398c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80003990:	0144a783          	lw	a5,20(s1)
    80003994:	0017879b          	addiw	a5,a5,1
    80003998:	0004a703          	lw	a4,0(s1)
    8000399c:	02e7e7bb          	remw	a5,a5,a4
    800039a0:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    800039a4:	0304b503          	ld	a0,48(s1)
    800039a8:	ffffe097          	auipc	ra,0xffffe
    800039ac:	da8080e7          	jalr	-600(ra) # 80001750 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    800039b0:	0204b503          	ld	a0,32(s1)
    800039b4:	ffffe097          	auipc	ra,0xffffe
    800039b8:	d9c080e7          	jalr	-612(ra) # 80001750 <_Z10sem_signalP4_sem>

}
    800039bc:	01813083          	ld	ra,24(sp)
    800039c0:	01013403          	ld	s0,16(sp)
    800039c4:	00813483          	ld	s1,8(sp)
    800039c8:	00013903          	ld	s2,0(sp)
    800039cc:	02010113          	addi	sp,sp,32
    800039d0:	00008067          	ret

00000000800039d4 <_ZN6Buffer3getEv>:

int Buffer::get() {
    800039d4:	fe010113          	addi	sp,sp,-32
    800039d8:	00113c23          	sd	ra,24(sp)
    800039dc:	00813823          	sd	s0,16(sp)
    800039e0:	00913423          	sd	s1,8(sp)
    800039e4:	01213023          	sd	s2,0(sp)
    800039e8:	02010413          	addi	s0,sp,32
    800039ec:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    800039f0:	02053503          	ld	a0,32(a0)
    800039f4:	ffffe097          	auipc	ra,0xffffe
    800039f8:	d24080e7          	jalr	-732(ra) # 80001718 <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    800039fc:	0284b503          	ld	a0,40(s1)
    80003a00:	ffffe097          	auipc	ra,0xffffe
    80003a04:	d18080e7          	jalr	-744(ra) # 80001718 <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80003a08:	0084b703          	ld	a4,8(s1)
    80003a0c:	0104a783          	lw	a5,16(s1)
    80003a10:	00279693          	slli	a3,a5,0x2
    80003a14:	00d70733          	add	a4,a4,a3
    80003a18:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80003a1c:	0017879b          	addiw	a5,a5,1
    80003a20:	0004a703          	lw	a4,0(s1)
    80003a24:	02e7e7bb          	remw	a5,a5,a4
    80003a28:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80003a2c:	0284b503          	ld	a0,40(s1)
    80003a30:	ffffe097          	auipc	ra,0xffffe
    80003a34:	d20080e7          	jalr	-736(ra) # 80001750 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80003a38:	0184b503          	ld	a0,24(s1)
    80003a3c:	ffffe097          	auipc	ra,0xffffe
    80003a40:	d14080e7          	jalr	-748(ra) # 80001750 <_Z10sem_signalP4_sem>

    return ret;
}
    80003a44:	00090513          	mv	a0,s2
    80003a48:	01813083          	ld	ra,24(sp)
    80003a4c:	01013403          	ld	s0,16(sp)
    80003a50:	00813483          	ld	s1,8(sp)
    80003a54:	00013903          	ld	s2,0(sp)
    80003a58:	02010113          	addi	sp,sp,32
    80003a5c:	00008067          	ret

0000000080003a60 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80003a60:	fe010113          	addi	sp,sp,-32
    80003a64:	00113c23          	sd	ra,24(sp)
    80003a68:	00813823          	sd	s0,16(sp)
    80003a6c:	00913423          	sd	s1,8(sp)
    80003a70:	01213023          	sd	s2,0(sp)
    80003a74:	02010413          	addi	s0,sp,32
    80003a78:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80003a7c:	02853503          	ld	a0,40(a0)
    80003a80:	ffffe097          	auipc	ra,0xffffe
    80003a84:	c98080e7          	jalr	-872(ra) # 80001718 <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80003a88:	0304b503          	ld	a0,48(s1)
    80003a8c:	ffffe097          	auipc	ra,0xffffe
    80003a90:	c8c080e7          	jalr	-884(ra) # 80001718 <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80003a94:	0144a783          	lw	a5,20(s1)
    80003a98:	0104a903          	lw	s2,16(s1)
    80003a9c:	0327ce63          	blt	a5,s2,80003ad8 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80003aa0:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80003aa4:	0304b503          	ld	a0,48(s1)
    80003aa8:	ffffe097          	auipc	ra,0xffffe
    80003aac:	ca8080e7          	jalr	-856(ra) # 80001750 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80003ab0:	0284b503          	ld	a0,40(s1)
    80003ab4:	ffffe097          	auipc	ra,0xffffe
    80003ab8:	c9c080e7          	jalr	-868(ra) # 80001750 <_Z10sem_signalP4_sem>

    return ret;
    80003abc:	00090513          	mv	a0,s2
    80003ac0:	01813083          	ld	ra,24(sp)
    80003ac4:	01013403          	ld	s0,16(sp)
    80003ac8:	00813483          	ld	s1,8(sp)
    80003acc:	00013903          	ld	s2,0(sp)
    80003ad0:	02010113          	addi	sp,sp,32
    80003ad4:	00008067          	ret
        ret = cap - head + tail;
    80003ad8:	0004a703          	lw	a4,0(s1)
    80003adc:	4127093b          	subw	s2,a4,s2
    80003ae0:	00f9093b          	addw	s2,s2,a5
    80003ae4:	fc1ff06f          	j	80003aa4 <_ZN6Buffer6getCntEv+0x44>

0000000080003ae8 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80003ae8:	fe010113          	addi	sp,sp,-32
    80003aec:	00113c23          	sd	ra,24(sp)
    80003af0:	00813823          	sd	s0,16(sp)
    80003af4:	00913423          	sd	s1,8(sp)
    80003af8:	02010413          	addi	s0,sp,32
    80003afc:	00050493          	mv	s1,a0
    putc('\n');
    80003b00:	00a00513          	li	a0,10
    80003b04:	ffffe097          	auipc	ra,0xffffe
    80003b08:	c84080e7          	jalr	-892(ra) # 80001788 <_Z4putcc>
    printString("Buffer deleted!\n");
    80003b0c:	00002517          	auipc	a0,0x2
    80003b10:	62450513          	addi	a0,a0,1572 # 80006130 <CONSOLE_STATUS+0x120>
    80003b14:	fffff097          	auipc	ra,0xfffff
    80003b18:	cb4080e7          	jalr	-844(ra) # 800027c8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80003b1c:	00048513          	mv	a0,s1
    80003b20:	00000097          	auipc	ra,0x0
    80003b24:	f40080e7          	jalr	-192(ra) # 80003a60 <_ZN6Buffer6getCntEv>
    80003b28:	02a05c63          	blez	a0,80003b60 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80003b2c:	0084b783          	ld	a5,8(s1)
    80003b30:	0104a703          	lw	a4,16(s1)
    80003b34:	00271713          	slli	a4,a4,0x2
    80003b38:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80003b3c:	0007c503          	lbu	a0,0(a5)
    80003b40:	ffffe097          	auipc	ra,0xffffe
    80003b44:	c48080e7          	jalr	-952(ra) # 80001788 <_Z4putcc>
        head = (head + 1) % cap;
    80003b48:	0104a783          	lw	a5,16(s1)
    80003b4c:	0017879b          	addiw	a5,a5,1
    80003b50:	0004a703          	lw	a4,0(s1)
    80003b54:	02e7e7bb          	remw	a5,a5,a4
    80003b58:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80003b5c:	fc1ff06f          	j	80003b1c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80003b60:	02100513          	li	a0,33
    80003b64:	ffffe097          	auipc	ra,0xffffe
    80003b68:	c24080e7          	jalr	-988(ra) # 80001788 <_Z4putcc>
    putc('\n');
    80003b6c:	00a00513          	li	a0,10
    80003b70:	ffffe097          	auipc	ra,0xffffe
    80003b74:	c18080e7          	jalr	-1000(ra) # 80001788 <_Z4putcc>
    mem_free(buffer);
    80003b78:	0084b503          	ld	a0,8(s1)
    80003b7c:	ffffe097          	auipc	ra,0xffffe
    80003b80:	96c080e7          	jalr	-1684(ra) # 800014e8 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80003b84:	0204b503          	ld	a0,32(s1)
    80003b88:	ffffe097          	auipc	ra,0xffffe
    80003b8c:	b58080e7          	jalr	-1192(ra) # 800016e0 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80003b90:	0184b503          	ld	a0,24(s1)
    80003b94:	ffffe097          	auipc	ra,0xffffe
    80003b98:	b4c080e7          	jalr	-1204(ra) # 800016e0 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80003b9c:	0304b503          	ld	a0,48(s1)
    80003ba0:	ffffe097          	auipc	ra,0xffffe
    80003ba4:	b40080e7          	jalr	-1216(ra) # 800016e0 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80003ba8:	0284b503          	ld	a0,40(s1)
    80003bac:	ffffe097          	auipc	ra,0xffffe
    80003bb0:	b34080e7          	jalr	-1228(ra) # 800016e0 <_Z9sem_closeP4_sem>
}
    80003bb4:	01813083          	ld	ra,24(sp)
    80003bb8:	01013403          	ld	s0,16(sp)
    80003bbc:	00813483          	ld	s1,8(sp)
    80003bc0:	02010113          	addi	sp,sp,32
    80003bc4:	00008067          	ret

0000000080003bc8 <start>:
    80003bc8:	ff010113          	addi	sp,sp,-16
    80003bcc:	00813423          	sd	s0,8(sp)
    80003bd0:	01010413          	addi	s0,sp,16
    80003bd4:	300027f3          	csrr	a5,mstatus
    80003bd8:	ffffe737          	lui	a4,0xffffe
    80003bdc:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff5d2f>
    80003be0:	00e7f7b3          	and	a5,a5,a4
    80003be4:	00001737          	lui	a4,0x1
    80003be8:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80003bec:	00e7e7b3          	or	a5,a5,a4
    80003bf0:	30079073          	csrw	mstatus,a5
    80003bf4:	00000797          	auipc	a5,0x0
    80003bf8:	16078793          	addi	a5,a5,352 # 80003d54 <system_main>
    80003bfc:	34179073          	csrw	mepc,a5
    80003c00:	00000793          	li	a5,0
    80003c04:	18079073          	csrw	satp,a5
    80003c08:	000107b7          	lui	a5,0x10
    80003c0c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003c10:	30279073          	csrw	medeleg,a5
    80003c14:	30379073          	csrw	mideleg,a5
    80003c18:	104027f3          	csrr	a5,sie
    80003c1c:	2227e793          	ori	a5,a5,546
    80003c20:	10479073          	csrw	sie,a5
    80003c24:	fff00793          	li	a5,-1
    80003c28:	00a7d793          	srli	a5,a5,0xa
    80003c2c:	3b079073          	csrw	pmpaddr0,a5
    80003c30:	00f00793          	li	a5,15
    80003c34:	3a079073          	csrw	pmpcfg0,a5
    80003c38:	f14027f3          	csrr	a5,mhartid
    80003c3c:	0200c737          	lui	a4,0x200c
    80003c40:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003c44:	0007869b          	sext.w	a3,a5
    80003c48:	00269713          	slli	a4,a3,0x2
    80003c4c:	000f4637          	lui	a2,0xf4
    80003c50:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003c54:	00d70733          	add	a4,a4,a3
    80003c58:	0037979b          	slliw	a5,a5,0x3
    80003c5c:	020046b7          	lui	a3,0x2004
    80003c60:	00d787b3          	add	a5,a5,a3
    80003c64:	00c585b3          	add	a1,a1,a2
    80003c68:	00371693          	slli	a3,a4,0x3
    80003c6c:	00004717          	auipc	a4,0x4
    80003c70:	c0470713          	addi	a4,a4,-1020 # 80007870 <timer_scratch>
    80003c74:	00b7b023          	sd	a1,0(a5)
    80003c78:	00d70733          	add	a4,a4,a3
    80003c7c:	00f73c23          	sd	a5,24(a4)
    80003c80:	02c73023          	sd	a2,32(a4)
    80003c84:	34071073          	csrw	mscratch,a4
    80003c88:	00000797          	auipc	a5,0x0
    80003c8c:	6e878793          	addi	a5,a5,1768 # 80004370 <timervec>
    80003c90:	30579073          	csrw	mtvec,a5
    80003c94:	300027f3          	csrr	a5,mstatus
    80003c98:	0087e793          	ori	a5,a5,8
    80003c9c:	30079073          	csrw	mstatus,a5
    80003ca0:	304027f3          	csrr	a5,mie
    80003ca4:	0807e793          	ori	a5,a5,128
    80003ca8:	30479073          	csrw	mie,a5
    80003cac:	f14027f3          	csrr	a5,mhartid
    80003cb0:	0007879b          	sext.w	a5,a5
    80003cb4:	00078213          	mv	tp,a5
    80003cb8:	30200073          	mret
    80003cbc:	00813403          	ld	s0,8(sp)
    80003cc0:	01010113          	addi	sp,sp,16
    80003cc4:	00008067          	ret

0000000080003cc8 <timerinit>:
    80003cc8:	ff010113          	addi	sp,sp,-16
    80003ccc:	00813423          	sd	s0,8(sp)
    80003cd0:	01010413          	addi	s0,sp,16
    80003cd4:	f14027f3          	csrr	a5,mhartid
    80003cd8:	0200c737          	lui	a4,0x200c
    80003cdc:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80003ce0:	0007869b          	sext.w	a3,a5
    80003ce4:	00269713          	slli	a4,a3,0x2
    80003ce8:	000f4637          	lui	a2,0xf4
    80003cec:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80003cf0:	00d70733          	add	a4,a4,a3
    80003cf4:	0037979b          	slliw	a5,a5,0x3
    80003cf8:	020046b7          	lui	a3,0x2004
    80003cfc:	00d787b3          	add	a5,a5,a3
    80003d00:	00c585b3          	add	a1,a1,a2
    80003d04:	00371693          	slli	a3,a4,0x3
    80003d08:	00004717          	auipc	a4,0x4
    80003d0c:	b6870713          	addi	a4,a4,-1176 # 80007870 <timer_scratch>
    80003d10:	00b7b023          	sd	a1,0(a5)
    80003d14:	00d70733          	add	a4,a4,a3
    80003d18:	00f73c23          	sd	a5,24(a4)
    80003d1c:	02c73023          	sd	a2,32(a4)
    80003d20:	34071073          	csrw	mscratch,a4
    80003d24:	00000797          	auipc	a5,0x0
    80003d28:	64c78793          	addi	a5,a5,1612 # 80004370 <timervec>
    80003d2c:	30579073          	csrw	mtvec,a5
    80003d30:	300027f3          	csrr	a5,mstatus
    80003d34:	0087e793          	ori	a5,a5,8
    80003d38:	30079073          	csrw	mstatus,a5
    80003d3c:	304027f3          	csrr	a5,mie
    80003d40:	0807e793          	ori	a5,a5,128
    80003d44:	30479073          	csrw	mie,a5
    80003d48:	00813403          	ld	s0,8(sp)
    80003d4c:	01010113          	addi	sp,sp,16
    80003d50:	00008067          	ret

0000000080003d54 <system_main>:
    80003d54:	fe010113          	addi	sp,sp,-32
    80003d58:	00813823          	sd	s0,16(sp)
    80003d5c:	00913423          	sd	s1,8(sp)
    80003d60:	00113c23          	sd	ra,24(sp)
    80003d64:	02010413          	addi	s0,sp,32
    80003d68:	00000097          	auipc	ra,0x0
    80003d6c:	0c4080e7          	jalr	196(ra) # 80003e2c <cpuid>
    80003d70:	00004497          	auipc	s1,0x4
    80003d74:	a8048493          	addi	s1,s1,-1408 # 800077f0 <started>
    80003d78:	02050263          	beqz	a0,80003d9c <system_main+0x48>
    80003d7c:	0004a783          	lw	a5,0(s1)
    80003d80:	0007879b          	sext.w	a5,a5
    80003d84:	fe078ce3          	beqz	a5,80003d7c <system_main+0x28>
    80003d88:	0ff0000f          	fence
    80003d8c:	00002517          	auipc	a0,0x2
    80003d90:	4f450513          	addi	a0,a0,1268 # 80006280 <CONSOLE_STATUS+0x270>
    80003d94:	00001097          	auipc	ra,0x1
    80003d98:	a78080e7          	jalr	-1416(ra) # 8000480c <panic>
    80003d9c:	00001097          	auipc	ra,0x1
    80003da0:	9cc080e7          	jalr	-1588(ra) # 80004768 <consoleinit>
    80003da4:	00001097          	auipc	ra,0x1
    80003da8:	158080e7          	jalr	344(ra) # 80004efc <printfinit>
    80003dac:	00002517          	auipc	a0,0x2
    80003db0:	5b450513          	addi	a0,a0,1460 # 80006360 <CONSOLE_STATUS+0x350>
    80003db4:	00001097          	auipc	ra,0x1
    80003db8:	ab4080e7          	jalr	-1356(ra) # 80004868 <__printf>
    80003dbc:	00002517          	auipc	a0,0x2
    80003dc0:	49450513          	addi	a0,a0,1172 # 80006250 <CONSOLE_STATUS+0x240>
    80003dc4:	00001097          	auipc	ra,0x1
    80003dc8:	aa4080e7          	jalr	-1372(ra) # 80004868 <__printf>
    80003dcc:	00002517          	auipc	a0,0x2
    80003dd0:	59450513          	addi	a0,a0,1428 # 80006360 <CONSOLE_STATUS+0x350>
    80003dd4:	00001097          	auipc	ra,0x1
    80003dd8:	a94080e7          	jalr	-1388(ra) # 80004868 <__printf>
    80003ddc:	00001097          	auipc	ra,0x1
    80003de0:	4ac080e7          	jalr	1196(ra) # 80005288 <kinit>
    80003de4:	00000097          	auipc	ra,0x0
    80003de8:	148080e7          	jalr	328(ra) # 80003f2c <trapinit>
    80003dec:	00000097          	auipc	ra,0x0
    80003df0:	16c080e7          	jalr	364(ra) # 80003f58 <trapinithart>
    80003df4:	00000097          	auipc	ra,0x0
    80003df8:	5bc080e7          	jalr	1468(ra) # 800043b0 <plicinit>
    80003dfc:	00000097          	auipc	ra,0x0
    80003e00:	5dc080e7          	jalr	1500(ra) # 800043d8 <plicinithart>
    80003e04:	00000097          	auipc	ra,0x0
    80003e08:	078080e7          	jalr	120(ra) # 80003e7c <userinit>
    80003e0c:	0ff0000f          	fence
    80003e10:	00100793          	li	a5,1
    80003e14:	00002517          	auipc	a0,0x2
    80003e18:	45450513          	addi	a0,a0,1108 # 80006268 <CONSOLE_STATUS+0x258>
    80003e1c:	00f4a023          	sw	a5,0(s1)
    80003e20:	00001097          	auipc	ra,0x1
    80003e24:	a48080e7          	jalr	-1464(ra) # 80004868 <__printf>
    80003e28:	0000006f          	j	80003e28 <system_main+0xd4>

0000000080003e2c <cpuid>:
    80003e2c:	ff010113          	addi	sp,sp,-16
    80003e30:	00813423          	sd	s0,8(sp)
    80003e34:	01010413          	addi	s0,sp,16
    80003e38:	00020513          	mv	a0,tp
    80003e3c:	00813403          	ld	s0,8(sp)
    80003e40:	0005051b          	sext.w	a0,a0
    80003e44:	01010113          	addi	sp,sp,16
    80003e48:	00008067          	ret

0000000080003e4c <mycpu>:
    80003e4c:	ff010113          	addi	sp,sp,-16
    80003e50:	00813423          	sd	s0,8(sp)
    80003e54:	01010413          	addi	s0,sp,16
    80003e58:	00020793          	mv	a5,tp
    80003e5c:	00813403          	ld	s0,8(sp)
    80003e60:	0007879b          	sext.w	a5,a5
    80003e64:	00779793          	slli	a5,a5,0x7
    80003e68:	00005517          	auipc	a0,0x5
    80003e6c:	a3850513          	addi	a0,a0,-1480 # 800088a0 <cpus>
    80003e70:	00f50533          	add	a0,a0,a5
    80003e74:	01010113          	addi	sp,sp,16
    80003e78:	00008067          	ret

0000000080003e7c <userinit>:
    80003e7c:	ff010113          	addi	sp,sp,-16
    80003e80:	00813423          	sd	s0,8(sp)
    80003e84:	01010413          	addi	s0,sp,16
    80003e88:	00813403          	ld	s0,8(sp)
    80003e8c:	01010113          	addi	sp,sp,16
    80003e90:	ffffe317          	auipc	t1,0xffffe
    80003e94:	da030067          	jr	-608(t1) # 80001c30 <main>

0000000080003e98 <either_copyout>:
    80003e98:	ff010113          	addi	sp,sp,-16
    80003e9c:	00813023          	sd	s0,0(sp)
    80003ea0:	00113423          	sd	ra,8(sp)
    80003ea4:	01010413          	addi	s0,sp,16
    80003ea8:	02051663          	bnez	a0,80003ed4 <either_copyout+0x3c>
    80003eac:	00058513          	mv	a0,a1
    80003eb0:	00060593          	mv	a1,a2
    80003eb4:	0006861b          	sext.w	a2,a3
    80003eb8:	00002097          	auipc	ra,0x2
    80003ebc:	c5c080e7          	jalr	-932(ra) # 80005b14 <__memmove>
    80003ec0:	00813083          	ld	ra,8(sp)
    80003ec4:	00013403          	ld	s0,0(sp)
    80003ec8:	00000513          	li	a0,0
    80003ecc:	01010113          	addi	sp,sp,16
    80003ed0:	00008067          	ret
    80003ed4:	00002517          	auipc	a0,0x2
    80003ed8:	3d450513          	addi	a0,a0,980 # 800062a8 <CONSOLE_STATUS+0x298>
    80003edc:	00001097          	auipc	ra,0x1
    80003ee0:	930080e7          	jalr	-1744(ra) # 8000480c <panic>

0000000080003ee4 <either_copyin>:
    80003ee4:	ff010113          	addi	sp,sp,-16
    80003ee8:	00813023          	sd	s0,0(sp)
    80003eec:	00113423          	sd	ra,8(sp)
    80003ef0:	01010413          	addi	s0,sp,16
    80003ef4:	02059463          	bnez	a1,80003f1c <either_copyin+0x38>
    80003ef8:	00060593          	mv	a1,a2
    80003efc:	0006861b          	sext.w	a2,a3
    80003f00:	00002097          	auipc	ra,0x2
    80003f04:	c14080e7          	jalr	-1004(ra) # 80005b14 <__memmove>
    80003f08:	00813083          	ld	ra,8(sp)
    80003f0c:	00013403          	ld	s0,0(sp)
    80003f10:	00000513          	li	a0,0
    80003f14:	01010113          	addi	sp,sp,16
    80003f18:	00008067          	ret
    80003f1c:	00002517          	auipc	a0,0x2
    80003f20:	3b450513          	addi	a0,a0,948 # 800062d0 <CONSOLE_STATUS+0x2c0>
    80003f24:	00001097          	auipc	ra,0x1
    80003f28:	8e8080e7          	jalr	-1816(ra) # 8000480c <panic>

0000000080003f2c <trapinit>:
    80003f2c:	ff010113          	addi	sp,sp,-16
    80003f30:	00813423          	sd	s0,8(sp)
    80003f34:	01010413          	addi	s0,sp,16
    80003f38:	00813403          	ld	s0,8(sp)
    80003f3c:	00002597          	auipc	a1,0x2
    80003f40:	3bc58593          	addi	a1,a1,956 # 800062f8 <CONSOLE_STATUS+0x2e8>
    80003f44:	00005517          	auipc	a0,0x5
    80003f48:	9dc50513          	addi	a0,a0,-1572 # 80008920 <tickslock>
    80003f4c:	01010113          	addi	sp,sp,16
    80003f50:	00001317          	auipc	t1,0x1
    80003f54:	5c830067          	jr	1480(t1) # 80005518 <initlock>

0000000080003f58 <trapinithart>:
    80003f58:	ff010113          	addi	sp,sp,-16
    80003f5c:	00813423          	sd	s0,8(sp)
    80003f60:	01010413          	addi	s0,sp,16
    80003f64:	00000797          	auipc	a5,0x0
    80003f68:	2fc78793          	addi	a5,a5,764 # 80004260 <kernelvec>
    80003f6c:	10579073          	csrw	stvec,a5
    80003f70:	00813403          	ld	s0,8(sp)
    80003f74:	01010113          	addi	sp,sp,16
    80003f78:	00008067          	ret

0000000080003f7c <usertrap>:
    80003f7c:	ff010113          	addi	sp,sp,-16
    80003f80:	00813423          	sd	s0,8(sp)
    80003f84:	01010413          	addi	s0,sp,16
    80003f88:	00813403          	ld	s0,8(sp)
    80003f8c:	01010113          	addi	sp,sp,16
    80003f90:	00008067          	ret

0000000080003f94 <usertrapret>:
    80003f94:	ff010113          	addi	sp,sp,-16
    80003f98:	00813423          	sd	s0,8(sp)
    80003f9c:	01010413          	addi	s0,sp,16
    80003fa0:	00813403          	ld	s0,8(sp)
    80003fa4:	01010113          	addi	sp,sp,16
    80003fa8:	00008067          	ret

0000000080003fac <kerneltrap>:
    80003fac:	fe010113          	addi	sp,sp,-32
    80003fb0:	00813823          	sd	s0,16(sp)
    80003fb4:	00113c23          	sd	ra,24(sp)
    80003fb8:	00913423          	sd	s1,8(sp)
    80003fbc:	02010413          	addi	s0,sp,32
    80003fc0:	142025f3          	csrr	a1,scause
    80003fc4:	100027f3          	csrr	a5,sstatus
    80003fc8:	0027f793          	andi	a5,a5,2
    80003fcc:	10079c63          	bnez	a5,800040e4 <kerneltrap+0x138>
    80003fd0:	142027f3          	csrr	a5,scause
    80003fd4:	0207ce63          	bltz	a5,80004010 <kerneltrap+0x64>
    80003fd8:	00002517          	auipc	a0,0x2
    80003fdc:	36850513          	addi	a0,a0,872 # 80006340 <CONSOLE_STATUS+0x330>
    80003fe0:	00001097          	auipc	ra,0x1
    80003fe4:	888080e7          	jalr	-1912(ra) # 80004868 <__printf>
    80003fe8:	141025f3          	csrr	a1,sepc
    80003fec:	14302673          	csrr	a2,stval
    80003ff0:	00002517          	auipc	a0,0x2
    80003ff4:	36050513          	addi	a0,a0,864 # 80006350 <CONSOLE_STATUS+0x340>
    80003ff8:	00001097          	auipc	ra,0x1
    80003ffc:	870080e7          	jalr	-1936(ra) # 80004868 <__printf>
    80004000:	00002517          	auipc	a0,0x2
    80004004:	36850513          	addi	a0,a0,872 # 80006368 <CONSOLE_STATUS+0x358>
    80004008:	00001097          	auipc	ra,0x1
    8000400c:	804080e7          	jalr	-2044(ra) # 8000480c <panic>
    80004010:	0ff7f713          	andi	a4,a5,255
    80004014:	00900693          	li	a3,9
    80004018:	04d70063          	beq	a4,a3,80004058 <kerneltrap+0xac>
    8000401c:	fff00713          	li	a4,-1
    80004020:	03f71713          	slli	a4,a4,0x3f
    80004024:	00170713          	addi	a4,a4,1
    80004028:	fae798e3          	bne	a5,a4,80003fd8 <kerneltrap+0x2c>
    8000402c:	00000097          	auipc	ra,0x0
    80004030:	e00080e7          	jalr	-512(ra) # 80003e2c <cpuid>
    80004034:	06050663          	beqz	a0,800040a0 <kerneltrap+0xf4>
    80004038:	144027f3          	csrr	a5,sip
    8000403c:	ffd7f793          	andi	a5,a5,-3
    80004040:	14479073          	csrw	sip,a5
    80004044:	01813083          	ld	ra,24(sp)
    80004048:	01013403          	ld	s0,16(sp)
    8000404c:	00813483          	ld	s1,8(sp)
    80004050:	02010113          	addi	sp,sp,32
    80004054:	00008067          	ret
    80004058:	00000097          	auipc	ra,0x0
    8000405c:	3cc080e7          	jalr	972(ra) # 80004424 <plic_claim>
    80004060:	00a00793          	li	a5,10
    80004064:	00050493          	mv	s1,a0
    80004068:	06f50863          	beq	a0,a5,800040d8 <kerneltrap+0x12c>
    8000406c:	fc050ce3          	beqz	a0,80004044 <kerneltrap+0x98>
    80004070:	00050593          	mv	a1,a0
    80004074:	00002517          	auipc	a0,0x2
    80004078:	2ac50513          	addi	a0,a0,684 # 80006320 <CONSOLE_STATUS+0x310>
    8000407c:	00000097          	auipc	ra,0x0
    80004080:	7ec080e7          	jalr	2028(ra) # 80004868 <__printf>
    80004084:	01013403          	ld	s0,16(sp)
    80004088:	01813083          	ld	ra,24(sp)
    8000408c:	00048513          	mv	a0,s1
    80004090:	00813483          	ld	s1,8(sp)
    80004094:	02010113          	addi	sp,sp,32
    80004098:	00000317          	auipc	t1,0x0
    8000409c:	3c430067          	jr	964(t1) # 8000445c <plic_complete>
    800040a0:	00005517          	auipc	a0,0x5
    800040a4:	88050513          	addi	a0,a0,-1920 # 80008920 <tickslock>
    800040a8:	00001097          	auipc	ra,0x1
    800040ac:	494080e7          	jalr	1172(ra) # 8000553c <acquire>
    800040b0:	00003717          	auipc	a4,0x3
    800040b4:	74470713          	addi	a4,a4,1860 # 800077f4 <ticks>
    800040b8:	00072783          	lw	a5,0(a4)
    800040bc:	00005517          	auipc	a0,0x5
    800040c0:	86450513          	addi	a0,a0,-1948 # 80008920 <tickslock>
    800040c4:	0017879b          	addiw	a5,a5,1
    800040c8:	00f72023          	sw	a5,0(a4)
    800040cc:	00001097          	auipc	ra,0x1
    800040d0:	53c080e7          	jalr	1340(ra) # 80005608 <release>
    800040d4:	f65ff06f          	j	80004038 <kerneltrap+0x8c>
    800040d8:	00001097          	auipc	ra,0x1
    800040dc:	098080e7          	jalr	152(ra) # 80005170 <uartintr>
    800040e0:	fa5ff06f          	j	80004084 <kerneltrap+0xd8>
    800040e4:	00002517          	auipc	a0,0x2
    800040e8:	21c50513          	addi	a0,a0,540 # 80006300 <CONSOLE_STATUS+0x2f0>
    800040ec:	00000097          	auipc	ra,0x0
    800040f0:	720080e7          	jalr	1824(ra) # 8000480c <panic>

00000000800040f4 <clockintr>:
    800040f4:	fe010113          	addi	sp,sp,-32
    800040f8:	00813823          	sd	s0,16(sp)
    800040fc:	00913423          	sd	s1,8(sp)
    80004100:	00113c23          	sd	ra,24(sp)
    80004104:	02010413          	addi	s0,sp,32
    80004108:	00005497          	auipc	s1,0x5
    8000410c:	81848493          	addi	s1,s1,-2024 # 80008920 <tickslock>
    80004110:	00048513          	mv	a0,s1
    80004114:	00001097          	auipc	ra,0x1
    80004118:	428080e7          	jalr	1064(ra) # 8000553c <acquire>
    8000411c:	00003717          	auipc	a4,0x3
    80004120:	6d870713          	addi	a4,a4,1752 # 800077f4 <ticks>
    80004124:	00072783          	lw	a5,0(a4)
    80004128:	01013403          	ld	s0,16(sp)
    8000412c:	01813083          	ld	ra,24(sp)
    80004130:	00048513          	mv	a0,s1
    80004134:	0017879b          	addiw	a5,a5,1
    80004138:	00813483          	ld	s1,8(sp)
    8000413c:	00f72023          	sw	a5,0(a4)
    80004140:	02010113          	addi	sp,sp,32
    80004144:	00001317          	auipc	t1,0x1
    80004148:	4c430067          	jr	1220(t1) # 80005608 <release>

000000008000414c <devintr>:
    8000414c:	142027f3          	csrr	a5,scause
    80004150:	00000513          	li	a0,0
    80004154:	0007c463          	bltz	a5,8000415c <devintr+0x10>
    80004158:	00008067          	ret
    8000415c:	fe010113          	addi	sp,sp,-32
    80004160:	00813823          	sd	s0,16(sp)
    80004164:	00113c23          	sd	ra,24(sp)
    80004168:	00913423          	sd	s1,8(sp)
    8000416c:	02010413          	addi	s0,sp,32
    80004170:	0ff7f713          	andi	a4,a5,255
    80004174:	00900693          	li	a3,9
    80004178:	04d70c63          	beq	a4,a3,800041d0 <devintr+0x84>
    8000417c:	fff00713          	li	a4,-1
    80004180:	03f71713          	slli	a4,a4,0x3f
    80004184:	00170713          	addi	a4,a4,1
    80004188:	00e78c63          	beq	a5,a4,800041a0 <devintr+0x54>
    8000418c:	01813083          	ld	ra,24(sp)
    80004190:	01013403          	ld	s0,16(sp)
    80004194:	00813483          	ld	s1,8(sp)
    80004198:	02010113          	addi	sp,sp,32
    8000419c:	00008067          	ret
    800041a0:	00000097          	auipc	ra,0x0
    800041a4:	c8c080e7          	jalr	-884(ra) # 80003e2c <cpuid>
    800041a8:	06050663          	beqz	a0,80004214 <devintr+0xc8>
    800041ac:	144027f3          	csrr	a5,sip
    800041b0:	ffd7f793          	andi	a5,a5,-3
    800041b4:	14479073          	csrw	sip,a5
    800041b8:	01813083          	ld	ra,24(sp)
    800041bc:	01013403          	ld	s0,16(sp)
    800041c0:	00813483          	ld	s1,8(sp)
    800041c4:	00200513          	li	a0,2
    800041c8:	02010113          	addi	sp,sp,32
    800041cc:	00008067          	ret
    800041d0:	00000097          	auipc	ra,0x0
    800041d4:	254080e7          	jalr	596(ra) # 80004424 <plic_claim>
    800041d8:	00a00793          	li	a5,10
    800041dc:	00050493          	mv	s1,a0
    800041e0:	06f50663          	beq	a0,a5,8000424c <devintr+0x100>
    800041e4:	00100513          	li	a0,1
    800041e8:	fa0482e3          	beqz	s1,8000418c <devintr+0x40>
    800041ec:	00048593          	mv	a1,s1
    800041f0:	00002517          	auipc	a0,0x2
    800041f4:	13050513          	addi	a0,a0,304 # 80006320 <CONSOLE_STATUS+0x310>
    800041f8:	00000097          	auipc	ra,0x0
    800041fc:	670080e7          	jalr	1648(ra) # 80004868 <__printf>
    80004200:	00048513          	mv	a0,s1
    80004204:	00000097          	auipc	ra,0x0
    80004208:	258080e7          	jalr	600(ra) # 8000445c <plic_complete>
    8000420c:	00100513          	li	a0,1
    80004210:	f7dff06f          	j	8000418c <devintr+0x40>
    80004214:	00004517          	auipc	a0,0x4
    80004218:	70c50513          	addi	a0,a0,1804 # 80008920 <tickslock>
    8000421c:	00001097          	auipc	ra,0x1
    80004220:	320080e7          	jalr	800(ra) # 8000553c <acquire>
    80004224:	00003717          	auipc	a4,0x3
    80004228:	5d070713          	addi	a4,a4,1488 # 800077f4 <ticks>
    8000422c:	00072783          	lw	a5,0(a4)
    80004230:	00004517          	auipc	a0,0x4
    80004234:	6f050513          	addi	a0,a0,1776 # 80008920 <tickslock>
    80004238:	0017879b          	addiw	a5,a5,1
    8000423c:	00f72023          	sw	a5,0(a4)
    80004240:	00001097          	auipc	ra,0x1
    80004244:	3c8080e7          	jalr	968(ra) # 80005608 <release>
    80004248:	f65ff06f          	j	800041ac <devintr+0x60>
    8000424c:	00001097          	auipc	ra,0x1
    80004250:	f24080e7          	jalr	-220(ra) # 80005170 <uartintr>
    80004254:	fadff06f          	j	80004200 <devintr+0xb4>
	...

0000000080004260 <kernelvec>:
    80004260:	f0010113          	addi	sp,sp,-256
    80004264:	00113023          	sd	ra,0(sp)
    80004268:	00213423          	sd	sp,8(sp)
    8000426c:	00313823          	sd	gp,16(sp)
    80004270:	00413c23          	sd	tp,24(sp)
    80004274:	02513023          	sd	t0,32(sp)
    80004278:	02613423          	sd	t1,40(sp)
    8000427c:	02713823          	sd	t2,48(sp)
    80004280:	02813c23          	sd	s0,56(sp)
    80004284:	04913023          	sd	s1,64(sp)
    80004288:	04a13423          	sd	a0,72(sp)
    8000428c:	04b13823          	sd	a1,80(sp)
    80004290:	04c13c23          	sd	a2,88(sp)
    80004294:	06d13023          	sd	a3,96(sp)
    80004298:	06e13423          	sd	a4,104(sp)
    8000429c:	06f13823          	sd	a5,112(sp)
    800042a0:	07013c23          	sd	a6,120(sp)
    800042a4:	09113023          	sd	a7,128(sp)
    800042a8:	09213423          	sd	s2,136(sp)
    800042ac:	09313823          	sd	s3,144(sp)
    800042b0:	09413c23          	sd	s4,152(sp)
    800042b4:	0b513023          	sd	s5,160(sp)
    800042b8:	0b613423          	sd	s6,168(sp)
    800042bc:	0b713823          	sd	s7,176(sp)
    800042c0:	0b813c23          	sd	s8,184(sp)
    800042c4:	0d913023          	sd	s9,192(sp)
    800042c8:	0da13423          	sd	s10,200(sp)
    800042cc:	0db13823          	sd	s11,208(sp)
    800042d0:	0dc13c23          	sd	t3,216(sp)
    800042d4:	0fd13023          	sd	t4,224(sp)
    800042d8:	0fe13423          	sd	t5,232(sp)
    800042dc:	0ff13823          	sd	t6,240(sp)
    800042e0:	ccdff0ef          	jal	ra,80003fac <kerneltrap>
    800042e4:	00013083          	ld	ra,0(sp)
    800042e8:	00813103          	ld	sp,8(sp)
    800042ec:	01013183          	ld	gp,16(sp)
    800042f0:	02013283          	ld	t0,32(sp)
    800042f4:	02813303          	ld	t1,40(sp)
    800042f8:	03013383          	ld	t2,48(sp)
    800042fc:	03813403          	ld	s0,56(sp)
    80004300:	04013483          	ld	s1,64(sp)
    80004304:	04813503          	ld	a0,72(sp)
    80004308:	05013583          	ld	a1,80(sp)
    8000430c:	05813603          	ld	a2,88(sp)
    80004310:	06013683          	ld	a3,96(sp)
    80004314:	06813703          	ld	a4,104(sp)
    80004318:	07013783          	ld	a5,112(sp)
    8000431c:	07813803          	ld	a6,120(sp)
    80004320:	08013883          	ld	a7,128(sp)
    80004324:	08813903          	ld	s2,136(sp)
    80004328:	09013983          	ld	s3,144(sp)
    8000432c:	09813a03          	ld	s4,152(sp)
    80004330:	0a013a83          	ld	s5,160(sp)
    80004334:	0a813b03          	ld	s6,168(sp)
    80004338:	0b013b83          	ld	s7,176(sp)
    8000433c:	0b813c03          	ld	s8,184(sp)
    80004340:	0c013c83          	ld	s9,192(sp)
    80004344:	0c813d03          	ld	s10,200(sp)
    80004348:	0d013d83          	ld	s11,208(sp)
    8000434c:	0d813e03          	ld	t3,216(sp)
    80004350:	0e013e83          	ld	t4,224(sp)
    80004354:	0e813f03          	ld	t5,232(sp)
    80004358:	0f013f83          	ld	t6,240(sp)
    8000435c:	10010113          	addi	sp,sp,256
    80004360:	10200073          	sret
    80004364:	00000013          	nop
    80004368:	00000013          	nop
    8000436c:	00000013          	nop

0000000080004370 <timervec>:
    80004370:	34051573          	csrrw	a0,mscratch,a0
    80004374:	00b53023          	sd	a1,0(a0)
    80004378:	00c53423          	sd	a2,8(a0)
    8000437c:	00d53823          	sd	a3,16(a0)
    80004380:	01853583          	ld	a1,24(a0)
    80004384:	02053603          	ld	a2,32(a0)
    80004388:	0005b683          	ld	a3,0(a1)
    8000438c:	00c686b3          	add	a3,a3,a2
    80004390:	00d5b023          	sd	a3,0(a1)
    80004394:	00200593          	li	a1,2
    80004398:	14459073          	csrw	sip,a1
    8000439c:	01053683          	ld	a3,16(a0)
    800043a0:	00853603          	ld	a2,8(a0)
    800043a4:	00053583          	ld	a1,0(a0)
    800043a8:	34051573          	csrrw	a0,mscratch,a0
    800043ac:	30200073          	mret

00000000800043b0 <plicinit>:
    800043b0:	ff010113          	addi	sp,sp,-16
    800043b4:	00813423          	sd	s0,8(sp)
    800043b8:	01010413          	addi	s0,sp,16
    800043bc:	00813403          	ld	s0,8(sp)
    800043c0:	0c0007b7          	lui	a5,0xc000
    800043c4:	00100713          	li	a4,1
    800043c8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800043cc:	00e7a223          	sw	a4,4(a5)
    800043d0:	01010113          	addi	sp,sp,16
    800043d4:	00008067          	ret

00000000800043d8 <plicinithart>:
    800043d8:	ff010113          	addi	sp,sp,-16
    800043dc:	00813023          	sd	s0,0(sp)
    800043e0:	00113423          	sd	ra,8(sp)
    800043e4:	01010413          	addi	s0,sp,16
    800043e8:	00000097          	auipc	ra,0x0
    800043ec:	a44080e7          	jalr	-1468(ra) # 80003e2c <cpuid>
    800043f0:	0085171b          	slliw	a4,a0,0x8
    800043f4:	0c0027b7          	lui	a5,0xc002
    800043f8:	00e787b3          	add	a5,a5,a4
    800043fc:	40200713          	li	a4,1026
    80004400:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80004404:	00813083          	ld	ra,8(sp)
    80004408:	00013403          	ld	s0,0(sp)
    8000440c:	00d5151b          	slliw	a0,a0,0xd
    80004410:	0c2017b7          	lui	a5,0xc201
    80004414:	00a78533          	add	a0,a5,a0
    80004418:	00052023          	sw	zero,0(a0)
    8000441c:	01010113          	addi	sp,sp,16
    80004420:	00008067          	ret

0000000080004424 <plic_claim>:
    80004424:	ff010113          	addi	sp,sp,-16
    80004428:	00813023          	sd	s0,0(sp)
    8000442c:	00113423          	sd	ra,8(sp)
    80004430:	01010413          	addi	s0,sp,16
    80004434:	00000097          	auipc	ra,0x0
    80004438:	9f8080e7          	jalr	-1544(ra) # 80003e2c <cpuid>
    8000443c:	00813083          	ld	ra,8(sp)
    80004440:	00013403          	ld	s0,0(sp)
    80004444:	00d5151b          	slliw	a0,a0,0xd
    80004448:	0c2017b7          	lui	a5,0xc201
    8000444c:	00a78533          	add	a0,a5,a0
    80004450:	00452503          	lw	a0,4(a0)
    80004454:	01010113          	addi	sp,sp,16
    80004458:	00008067          	ret

000000008000445c <plic_complete>:
    8000445c:	fe010113          	addi	sp,sp,-32
    80004460:	00813823          	sd	s0,16(sp)
    80004464:	00913423          	sd	s1,8(sp)
    80004468:	00113c23          	sd	ra,24(sp)
    8000446c:	02010413          	addi	s0,sp,32
    80004470:	00050493          	mv	s1,a0
    80004474:	00000097          	auipc	ra,0x0
    80004478:	9b8080e7          	jalr	-1608(ra) # 80003e2c <cpuid>
    8000447c:	01813083          	ld	ra,24(sp)
    80004480:	01013403          	ld	s0,16(sp)
    80004484:	00d5179b          	slliw	a5,a0,0xd
    80004488:	0c201737          	lui	a4,0xc201
    8000448c:	00f707b3          	add	a5,a4,a5
    80004490:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80004494:	00813483          	ld	s1,8(sp)
    80004498:	02010113          	addi	sp,sp,32
    8000449c:	00008067          	ret

00000000800044a0 <consolewrite>:
    800044a0:	fb010113          	addi	sp,sp,-80
    800044a4:	04813023          	sd	s0,64(sp)
    800044a8:	04113423          	sd	ra,72(sp)
    800044ac:	02913c23          	sd	s1,56(sp)
    800044b0:	03213823          	sd	s2,48(sp)
    800044b4:	03313423          	sd	s3,40(sp)
    800044b8:	03413023          	sd	s4,32(sp)
    800044bc:	01513c23          	sd	s5,24(sp)
    800044c0:	05010413          	addi	s0,sp,80
    800044c4:	06c05c63          	blez	a2,8000453c <consolewrite+0x9c>
    800044c8:	00060993          	mv	s3,a2
    800044cc:	00050a13          	mv	s4,a0
    800044d0:	00058493          	mv	s1,a1
    800044d4:	00000913          	li	s2,0
    800044d8:	fff00a93          	li	s5,-1
    800044dc:	01c0006f          	j	800044f8 <consolewrite+0x58>
    800044e0:	fbf44503          	lbu	a0,-65(s0)
    800044e4:	0019091b          	addiw	s2,s2,1
    800044e8:	00148493          	addi	s1,s1,1
    800044ec:	00001097          	auipc	ra,0x1
    800044f0:	a9c080e7          	jalr	-1380(ra) # 80004f88 <uartputc>
    800044f4:	03298063          	beq	s3,s2,80004514 <consolewrite+0x74>
    800044f8:	00048613          	mv	a2,s1
    800044fc:	00100693          	li	a3,1
    80004500:	000a0593          	mv	a1,s4
    80004504:	fbf40513          	addi	a0,s0,-65
    80004508:	00000097          	auipc	ra,0x0
    8000450c:	9dc080e7          	jalr	-1572(ra) # 80003ee4 <either_copyin>
    80004510:	fd5518e3          	bne	a0,s5,800044e0 <consolewrite+0x40>
    80004514:	04813083          	ld	ra,72(sp)
    80004518:	04013403          	ld	s0,64(sp)
    8000451c:	03813483          	ld	s1,56(sp)
    80004520:	02813983          	ld	s3,40(sp)
    80004524:	02013a03          	ld	s4,32(sp)
    80004528:	01813a83          	ld	s5,24(sp)
    8000452c:	00090513          	mv	a0,s2
    80004530:	03013903          	ld	s2,48(sp)
    80004534:	05010113          	addi	sp,sp,80
    80004538:	00008067          	ret
    8000453c:	00000913          	li	s2,0
    80004540:	fd5ff06f          	j	80004514 <consolewrite+0x74>

0000000080004544 <consoleread>:
    80004544:	f9010113          	addi	sp,sp,-112
    80004548:	06813023          	sd	s0,96(sp)
    8000454c:	04913c23          	sd	s1,88(sp)
    80004550:	05213823          	sd	s2,80(sp)
    80004554:	05313423          	sd	s3,72(sp)
    80004558:	05413023          	sd	s4,64(sp)
    8000455c:	03513c23          	sd	s5,56(sp)
    80004560:	03613823          	sd	s6,48(sp)
    80004564:	03713423          	sd	s7,40(sp)
    80004568:	03813023          	sd	s8,32(sp)
    8000456c:	06113423          	sd	ra,104(sp)
    80004570:	01913c23          	sd	s9,24(sp)
    80004574:	07010413          	addi	s0,sp,112
    80004578:	00060b93          	mv	s7,a2
    8000457c:	00050913          	mv	s2,a0
    80004580:	00058c13          	mv	s8,a1
    80004584:	00060b1b          	sext.w	s6,a2
    80004588:	00004497          	auipc	s1,0x4
    8000458c:	3c048493          	addi	s1,s1,960 # 80008948 <cons>
    80004590:	00400993          	li	s3,4
    80004594:	fff00a13          	li	s4,-1
    80004598:	00a00a93          	li	s5,10
    8000459c:	05705e63          	blez	s7,800045f8 <consoleread+0xb4>
    800045a0:	09c4a703          	lw	a4,156(s1)
    800045a4:	0984a783          	lw	a5,152(s1)
    800045a8:	0007071b          	sext.w	a4,a4
    800045ac:	08e78463          	beq	a5,a4,80004634 <consoleread+0xf0>
    800045b0:	07f7f713          	andi	a4,a5,127
    800045b4:	00e48733          	add	a4,s1,a4
    800045b8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    800045bc:	0017869b          	addiw	a3,a5,1
    800045c0:	08d4ac23          	sw	a3,152(s1)
    800045c4:	00070c9b          	sext.w	s9,a4
    800045c8:	0b370663          	beq	a4,s3,80004674 <consoleread+0x130>
    800045cc:	00100693          	li	a3,1
    800045d0:	f9f40613          	addi	a2,s0,-97
    800045d4:	000c0593          	mv	a1,s8
    800045d8:	00090513          	mv	a0,s2
    800045dc:	f8e40fa3          	sb	a4,-97(s0)
    800045e0:	00000097          	auipc	ra,0x0
    800045e4:	8b8080e7          	jalr	-1864(ra) # 80003e98 <either_copyout>
    800045e8:	01450863          	beq	a0,s4,800045f8 <consoleread+0xb4>
    800045ec:	001c0c13          	addi	s8,s8,1
    800045f0:	fffb8b9b          	addiw	s7,s7,-1
    800045f4:	fb5c94e3          	bne	s9,s5,8000459c <consoleread+0x58>
    800045f8:	000b851b          	sext.w	a0,s7
    800045fc:	06813083          	ld	ra,104(sp)
    80004600:	06013403          	ld	s0,96(sp)
    80004604:	05813483          	ld	s1,88(sp)
    80004608:	05013903          	ld	s2,80(sp)
    8000460c:	04813983          	ld	s3,72(sp)
    80004610:	04013a03          	ld	s4,64(sp)
    80004614:	03813a83          	ld	s5,56(sp)
    80004618:	02813b83          	ld	s7,40(sp)
    8000461c:	02013c03          	ld	s8,32(sp)
    80004620:	01813c83          	ld	s9,24(sp)
    80004624:	40ab053b          	subw	a0,s6,a0
    80004628:	03013b03          	ld	s6,48(sp)
    8000462c:	07010113          	addi	sp,sp,112
    80004630:	00008067          	ret
    80004634:	00001097          	auipc	ra,0x1
    80004638:	1d8080e7          	jalr	472(ra) # 8000580c <push_on>
    8000463c:	0984a703          	lw	a4,152(s1)
    80004640:	09c4a783          	lw	a5,156(s1)
    80004644:	0007879b          	sext.w	a5,a5
    80004648:	fef70ce3          	beq	a4,a5,80004640 <consoleread+0xfc>
    8000464c:	00001097          	auipc	ra,0x1
    80004650:	234080e7          	jalr	564(ra) # 80005880 <pop_on>
    80004654:	0984a783          	lw	a5,152(s1)
    80004658:	07f7f713          	andi	a4,a5,127
    8000465c:	00e48733          	add	a4,s1,a4
    80004660:	01874703          	lbu	a4,24(a4)
    80004664:	0017869b          	addiw	a3,a5,1
    80004668:	08d4ac23          	sw	a3,152(s1)
    8000466c:	00070c9b          	sext.w	s9,a4
    80004670:	f5371ee3          	bne	a4,s3,800045cc <consoleread+0x88>
    80004674:	000b851b          	sext.w	a0,s7
    80004678:	f96bf2e3          	bgeu	s7,s6,800045fc <consoleread+0xb8>
    8000467c:	08f4ac23          	sw	a5,152(s1)
    80004680:	f7dff06f          	j	800045fc <consoleread+0xb8>

0000000080004684 <consputc>:
    80004684:	10000793          	li	a5,256
    80004688:	00f50663          	beq	a0,a5,80004694 <consputc+0x10>
    8000468c:	00001317          	auipc	t1,0x1
    80004690:	9f430067          	jr	-1548(t1) # 80005080 <uartputc_sync>
    80004694:	ff010113          	addi	sp,sp,-16
    80004698:	00113423          	sd	ra,8(sp)
    8000469c:	00813023          	sd	s0,0(sp)
    800046a0:	01010413          	addi	s0,sp,16
    800046a4:	00800513          	li	a0,8
    800046a8:	00001097          	auipc	ra,0x1
    800046ac:	9d8080e7          	jalr	-1576(ra) # 80005080 <uartputc_sync>
    800046b0:	02000513          	li	a0,32
    800046b4:	00001097          	auipc	ra,0x1
    800046b8:	9cc080e7          	jalr	-1588(ra) # 80005080 <uartputc_sync>
    800046bc:	00013403          	ld	s0,0(sp)
    800046c0:	00813083          	ld	ra,8(sp)
    800046c4:	00800513          	li	a0,8
    800046c8:	01010113          	addi	sp,sp,16
    800046cc:	00001317          	auipc	t1,0x1
    800046d0:	9b430067          	jr	-1612(t1) # 80005080 <uartputc_sync>

00000000800046d4 <consoleintr>:
    800046d4:	fe010113          	addi	sp,sp,-32
    800046d8:	00813823          	sd	s0,16(sp)
    800046dc:	00913423          	sd	s1,8(sp)
    800046e0:	01213023          	sd	s2,0(sp)
    800046e4:	00113c23          	sd	ra,24(sp)
    800046e8:	02010413          	addi	s0,sp,32
    800046ec:	00004917          	auipc	s2,0x4
    800046f0:	25c90913          	addi	s2,s2,604 # 80008948 <cons>
    800046f4:	00050493          	mv	s1,a0
    800046f8:	00090513          	mv	a0,s2
    800046fc:	00001097          	auipc	ra,0x1
    80004700:	e40080e7          	jalr	-448(ra) # 8000553c <acquire>
    80004704:	02048c63          	beqz	s1,8000473c <consoleintr+0x68>
    80004708:	0a092783          	lw	a5,160(s2)
    8000470c:	09892703          	lw	a4,152(s2)
    80004710:	07f00693          	li	a3,127
    80004714:	40e7873b          	subw	a4,a5,a4
    80004718:	02e6e263          	bltu	a3,a4,8000473c <consoleintr+0x68>
    8000471c:	00d00713          	li	a4,13
    80004720:	04e48063          	beq	s1,a4,80004760 <consoleintr+0x8c>
    80004724:	07f7f713          	andi	a4,a5,127
    80004728:	00e90733          	add	a4,s2,a4
    8000472c:	0017879b          	addiw	a5,a5,1
    80004730:	0af92023          	sw	a5,160(s2)
    80004734:	00970c23          	sb	s1,24(a4)
    80004738:	08f92e23          	sw	a5,156(s2)
    8000473c:	01013403          	ld	s0,16(sp)
    80004740:	01813083          	ld	ra,24(sp)
    80004744:	00813483          	ld	s1,8(sp)
    80004748:	00013903          	ld	s2,0(sp)
    8000474c:	00004517          	auipc	a0,0x4
    80004750:	1fc50513          	addi	a0,a0,508 # 80008948 <cons>
    80004754:	02010113          	addi	sp,sp,32
    80004758:	00001317          	auipc	t1,0x1
    8000475c:	eb030067          	jr	-336(t1) # 80005608 <release>
    80004760:	00a00493          	li	s1,10
    80004764:	fc1ff06f          	j	80004724 <consoleintr+0x50>

0000000080004768 <consoleinit>:
    80004768:	fe010113          	addi	sp,sp,-32
    8000476c:	00113c23          	sd	ra,24(sp)
    80004770:	00813823          	sd	s0,16(sp)
    80004774:	00913423          	sd	s1,8(sp)
    80004778:	02010413          	addi	s0,sp,32
    8000477c:	00004497          	auipc	s1,0x4
    80004780:	1cc48493          	addi	s1,s1,460 # 80008948 <cons>
    80004784:	00048513          	mv	a0,s1
    80004788:	00002597          	auipc	a1,0x2
    8000478c:	bf058593          	addi	a1,a1,-1040 # 80006378 <CONSOLE_STATUS+0x368>
    80004790:	00001097          	auipc	ra,0x1
    80004794:	d88080e7          	jalr	-632(ra) # 80005518 <initlock>
    80004798:	00000097          	auipc	ra,0x0
    8000479c:	7ac080e7          	jalr	1964(ra) # 80004f44 <uartinit>
    800047a0:	01813083          	ld	ra,24(sp)
    800047a4:	01013403          	ld	s0,16(sp)
    800047a8:	00000797          	auipc	a5,0x0
    800047ac:	d9c78793          	addi	a5,a5,-612 # 80004544 <consoleread>
    800047b0:	0af4bc23          	sd	a5,184(s1)
    800047b4:	00000797          	auipc	a5,0x0
    800047b8:	cec78793          	addi	a5,a5,-788 # 800044a0 <consolewrite>
    800047bc:	0cf4b023          	sd	a5,192(s1)
    800047c0:	00813483          	ld	s1,8(sp)
    800047c4:	02010113          	addi	sp,sp,32
    800047c8:	00008067          	ret

00000000800047cc <console_read>:
    800047cc:	ff010113          	addi	sp,sp,-16
    800047d0:	00813423          	sd	s0,8(sp)
    800047d4:	01010413          	addi	s0,sp,16
    800047d8:	00813403          	ld	s0,8(sp)
    800047dc:	00004317          	auipc	t1,0x4
    800047e0:	22433303          	ld	t1,548(t1) # 80008a00 <devsw+0x10>
    800047e4:	01010113          	addi	sp,sp,16
    800047e8:	00030067          	jr	t1

00000000800047ec <console_write>:
    800047ec:	ff010113          	addi	sp,sp,-16
    800047f0:	00813423          	sd	s0,8(sp)
    800047f4:	01010413          	addi	s0,sp,16
    800047f8:	00813403          	ld	s0,8(sp)
    800047fc:	00004317          	auipc	t1,0x4
    80004800:	20c33303          	ld	t1,524(t1) # 80008a08 <devsw+0x18>
    80004804:	01010113          	addi	sp,sp,16
    80004808:	00030067          	jr	t1

000000008000480c <panic>:
    8000480c:	fe010113          	addi	sp,sp,-32
    80004810:	00113c23          	sd	ra,24(sp)
    80004814:	00813823          	sd	s0,16(sp)
    80004818:	00913423          	sd	s1,8(sp)
    8000481c:	02010413          	addi	s0,sp,32
    80004820:	00050493          	mv	s1,a0
    80004824:	00002517          	auipc	a0,0x2
    80004828:	b5c50513          	addi	a0,a0,-1188 # 80006380 <CONSOLE_STATUS+0x370>
    8000482c:	00004797          	auipc	a5,0x4
    80004830:	2607ae23          	sw	zero,636(a5) # 80008aa8 <pr+0x18>
    80004834:	00000097          	auipc	ra,0x0
    80004838:	034080e7          	jalr	52(ra) # 80004868 <__printf>
    8000483c:	00048513          	mv	a0,s1
    80004840:	00000097          	auipc	ra,0x0
    80004844:	028080e7          	jalr	40(ra) # 80004868 <__printf>
    80004848:	00002517          	auipc	a0,0x2
    8000484c:	b1850513          	addi	a0,a0,-1256 # 80006360 <CONSOLE_STATUS+0x350>
    80004850:	00000097          	auipc	ra,0x0
    80004854:	018080e7          	jalr	24(ra) # 80004868 <__printf>
    80004858:	00100793          	li	a5,1
    8000485c:	00003717          	auipc	a4,0x3
    80004860:	f8f72e23          	sw	a5,-100(a4) # 800077f8 <panicked>
    80004864:	0000006f          	j	80004864 <panic+0x58>

0000000080004868 <__printf>:
    80004868:	f3010113          	addi	sp,sp,-208
    8000486c:	08813023          	sd	s0,128(sp)
    80004870:	07313423          	sd	s3,104(sp)
    80004874:	09010413          	addi	s0,sp,144
    80004878:	05813023          	sd	s8,64(sp)
    8000487c:	08113423          	sd	ra,136(sp)
    80004880:	06913c23          	sd	s1,120(sp)
    80004884:	07213823          	sd	s2,112(sp)
    80004888:	07413023          	sd	s4,96(sp)
    8000488c:	05513c23          	sd	s5,88(sp)
    80004890:	05613823          	sd	s6,80(sp)
    80004894:	05713423          	sd	s7,72(sp)
    80004898:	03913c23          	sd	s9,56(sp)
    8000489c:	03a13823          	sd	s10,48(sp)
    800048a0:	03b13423          	sd	s11,40(sp)
    800048a4:	00004317          	auipc	t1,0x4
    800048a8:	1ec30313          	addi	t1,t1,492 # 80008a90 <pr>
    800048ac:	01832c03          	lw	s8,24(t1)
    800048b0:	00b43423          	sd	a1,8(s0)
    800048b4:	00c43823          	sd	a2,16(s0)
    800048b8:	00d43c23          	sd	a3,24(s0)
    800048bc:	02e43023          	sd	a4,32(s0)
    800048c0:	02f43423          	sd	a5,40(s0)
    800048c4:	03043823          	sd	a6,48(s0)
    800048c8:	03143c23          	sd	a7,56(s0)
    800048cc:	00050993          	mv	s3,a0
    800048d0:	4a0c1663          	bnez	s8,80004d7c <__printf+0x514>
    800048d4:	60098c63          	beqz	s3,80004eec <__printf+0x684>
    800048d8:	0009c503          	lbu	a0,0(s3)
    800048dc:	00840793          	addi	a5,s0,8
    800048e0:	f6f43c23          	sd	a5,-136(s0)
    800048e4:	00000493          	li	s1,0
    800048e8:	22050063          	beqz	a0,80004b08 <__printf+0x2a0>
    800048ec:	00002a37          	lui	s4,0x2
    800048f0:	00018ab7          	lui	s5,0x18
    800048f4:	000f4b37          	lui	s6,0xf4
    800048f8:	00989bb7          	lui	s7,0x989
    800048fc:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80004900:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80004904:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80004908:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000490c:	00148c9b          	addiw	s9,s1,1
    80004910:	02500793          	li	a5,37
    80004914:	01998933          	add	s2,s3,s9
    80004918:	38f51263          	bne	a0,a5,80004c9c <__printf+0x434>
    8000491c:	00094783          	lbu	a5,0(s2)
    80004920:	00078c9b          	sext.w	s9,a5
    80004924:	1e078263          	beqz	a5,80004b08 <__printf+0x2a0>
    80004928:	0024849b          	addiw	s1,s1,2
    8000492c:	07000713          	li	a4,112
    80004930:	00998933          	add	s2,s3,s1
    80004934:	38e78a63          	beq	a5,a4,80004cc8 <__printf+0x460>
    80004938:	20f76863          	bltu	a4,a5,80004b48 <__printf+0x2e0>
    8000493c:	42a78863          	beq	a5,a0,80004d6c <__printf+0x504>
    80004940:	06400713          	li	a4,100
    80004944:	40e79663          	bne	a5,a4,80004d50 <__printf+0x4e8>
    80004948:	f7843783          	ld	a5,-136(s0)
    8000494c:	0007a603          	lw	a2,0(a5)
    80004950:	00878793          	addi	a5,a5,8
    80004954:	f6f43c23          	sd	a5,-136(s0)
    80004958:	42064a63          	bltz	a2,80004d8c <__printf+0x524>
    8000495c:	00a00713          	li	a4,10
    80004960:	02e677bb          	remuw	a5,a2,a4
    80004964:	00002d97          	auipc	s11,0x2
    80004968:	a44d8d93          	addi	s11,s11,-1468 # 800063a8 <digits>
    8000496c:	00900593          	li	a1,9
    80004970:	0006051b          	sext.w	a0,a2
    80004974:	00000c93          	li	s9,0
    80004978:	02079793          	slli	a5,a5,0x20
    8000497c:	0207d793          	srli	a5,a5,0x20
    80004980:	00fd87b3          	add	a5,s11,a5
    80004984:	0007c783          	lbu	a5,0(a5)
    80004988:	02e656bb          	divuw	a3,a2,a4
    8000498c:	f8f40023          	sb	a5,-128(s0)
    80004990:	14c5d863          	bge	a1,a2,80004ae0 <__printf+0x278>
    80004994:	06300593          	li	a1,99
    80004998:	00100c93          	li	s9,1
    8000499c:	02e6f7bb          	remuw	a5,a3,a4
    800049a0:	02079793          	slli	a5,a5,0x20
    800049a4:	0207d793          	srli	a5,a5,0x20
    800049a8:	00fd87b3          	add	a5,s11,a5
    800049ac:	0007c783          	lbu	a5,0(a5)
    800049b0:	02e6d73b          	divuw	a4,a3,a4
    800049b4:	f8f400a3          	sb	a5,-127(s0)
    800049b8:	12a5f463          	bgeu	a1,a0,80004ae0 <__printf+0x278>
    800049bc:	00a00693          	li	a3,10
    800049c0:	00900593          	li	a1,9
    800049c4:	02d777bb          	remuw	a5,a4,a3
    800049c8:	02079793          	slli	a5,a5,0x20
    800049cc:	0207d793          	srli	a5,a5,0x20
    800049d0:	00fd87b3          	add	a5,s11,a5
    800049d4:	0007c503          	lbu	a0,0(a5)
    800049d8:	02d757bb          	divuw	a5,a4,a3
    800049dc:	f8a40123          	sb	a0,-126(s0)
    800049e0:	48e5f263          	bgeu	a1,a4,80004e64 <__printf+0x5fc>
    800049e4:	06300513          	li	a0,99
    800049e8:	02d7f5bb          	remuw	a1,a5,a3
    800049ec:	02059593          	slli	a1,a1,0x20
    800049f0:	0205d593          	srli	a1,a1,0x20
    800049f4:	00bd85b3          	add	a1,s11,a1
    800049f8:	0005c583          	lbu	a1,0(a1)
    800049fc:	02d7d7bb          	divuw	a5,a5,a3
    80004a00:	f8b401a3          	sb	a1,-125(s0)
    80004a04:	48e57263          	bgeu	a0,a4,80004e88 <__printf+0x620>
    80004a08:	3e700513          	li	a0,999
    80004a0c:	02d7f5bb          	remuw	a1,a5,a3
    80004a10:	02059593          	slli	a1,a1,0x20
    80004a14:	0205d593          	srli	a1,a1,0x20
    80004a18:	00bd85b3          	add	a1,s11,a1
    80004a1c:	0005c583          	lbu	a1,0(a1)
    80004a20:	02d7d7bb          	divuw	a5,a5,a3
    80004a24:	f8b40223          	sb	a1,-124(s0)
    80004a28:	46e57663          	bgeu	a0,a4,80004e94 <__printf+0x62c>
    80004a2c:	02d7f5bb          	remuw	a1,a5,a3
    80004a30:	02059593          	slli	a1,a1,0x20
    80004a34:	0205d593          	srli	a1,a1,0x20
    80004a38:	00bd85b3          	add	a1,s11,a1
    80004a3c:	0005c583          	lbu	a1,0(a1)
    80004a40:	02d7d7bb          	divuw	a5,a5,a3
    80004a44:	f8b402a3          	sb	a1,-123(s0)
    80004a48:	46ea7863          	bgeu	s4,a4,80004eb8 <__printf+0x650>
    80004a4c:	02d7f5bb          	remuw	a1,a5,a3
    80004a50:	02059593          	slli	a1,a1,0x20
    80004a54:	0205d593          	srli	a1,a1,0x20
    80004a58:	00bd85b3          	add	a1,s11,a1
    80004a5c:	0005c583          	lbu	a1,0(a1)
    80004a60:	02d7d7bb          	divuw	a5,a5,a3
    80004a64:	f8b40323          	sb	a1,-122(s0)
    80004a68:	3eeaf863          	bgeu	s5,a4,80004e58 <__printf+0x5f0>
    80004a6c:	02d7f5bb          	remuw	a1,a5,a3
    80004a70:	02059593          	slli	a1,a1,0x20
    80004a74:	0205d593          	srli	a1,a1,0x20
    80004a78:	00bd85b3          	add	a1,s11,a1
    80004a7c:	0005c583          	lbu	a1,0(a1)
    80004a80:	02d7d7bb          	divuw	a5,a5,a3
    80004a84:	f8b403a3          	sb	a1,-121(s0)
    80004a88:	42eb7e63          	bgeu	s6,a4,80004ec4 <__printf+0x65c>
    80004a8c:	02d7f5bb          	remuw	a1,a5,a3
    80004a90:	02059593          	slli	a1,a1,0x20
    80004a94:	0205d593          	srli	a1,a1,0x20
    80004a98:	00bd85b3          	add	a1,s11,a1
    80004a9c:	0005c583          	lbu	a1,0(a1)
    80004aa0:	02d7d7bb          	divuw	a5,a5,a3
    80004aa4:	f8b40423          	sb	a1,-120(s0)
    80004aa8:	42ebfc63          	bgeu	s7,a4,80004ee0 <__printf+0x678>
    80004aac:	02079793          	slli	a5,a5,0x20
    80004ab0:	0207d793          	srli	a5,a5,0x20
    80004ab4:	00fd8db3          	add	s11,s11,a5
    80004ab8:	000dc703          	lbu	a4,0(s11)
    80004abc:	00a00793          	li	a5,10
    80004ac0:	00900c93          	li	s9,9
    80004ac4:	f8e404a3          	sb	a4,-119(s0)
    80004ac8:	00065c63          	bgez	a2,80004ae0 <__printf+0x278>
    80004acc:	f9040713          	addi	a4,s0,-112
    80004ad0:	00f70733          	add	a4,a4,a5
    80004ad4:	02d00693          	li	a3,45
    80004ad8:	fed70823          	sb	a3,-16(a4)
    80004adc:	00078c93          	mv	s9,a5
    80004ae0:	f8040793          	addi	a5,s0,-128
    80004ae4:	01978cb3          	add	s9,a5,s9
    80004ae8:	f7f40d13          	addi	s10,s0,-129
    80004aec:	000cc503          	lbu	a0,0(s9)
    80004af0:	fffc8c93          	addi	s9,s9,-1
    80004af4:	00000097          	auipc	ra,0x0
    80004af8:	b90080e7          	jalr	-1136(ra) # 80004684 <consputc>
    80004afc:	ffac98e3          	bne	s9,s10,80004aec <__printf+0x284>
    80004b00:	00094503          	lbu	a0,0(s2)
    80004b04:	e00514e3          	bnez	a0,8000490c <__printf+0xa4>
    80004b08:	1a0c1663          	bnez	s8,80004cb4 <__printf+0x44c>
    80004b0c:	08813083          	ld	ra,136(sp)
    80004b10:	08013403          	ld	s0,128(sp)
    80004b14:	07813483          	ld	s1,120(sp)
    80004b18:	07013903          	ld	s2,112(sp)
    80004b1c:	06813983          	ld	s3,104(sp)
    80004b20:	06013a03          	ld	s4,96(sp)
    80004b24:	05813a83          	ld	s5,88(sp)
    80004b28:	05013b03          	ld	s6,80(sp)
    80004b2c:	04813b83          	ld	s7,72(sp)
    80004b30:	04013c03          	ld	s8,64(sp)
    80004b34:	03813c83          	ld	s9,56(sp)
    80004b38:	03013d03          	ld	s10,48(sp)
    80004b3c:	02813d83          	ld	s11,40(sp)
    80004b40:	0d010113          	addi	sp,sp,208
    80004b44:	00008067          	ret
    80004b48:	07300713          	li	a4,115
    80004b4c:	1ce78a63          	beq	a5,a4,80004d20 <__printf+0x4b8>
    80004b50:	07800713          	li	a4,120
    80004b54:	1ee79e63          	bne	a5,a4,80004d50 <__printf+0x4e8>
    80004b58:	f7843783          	ld	a5,-136(s0)
    80004b5c:	0007a703          	lw	a4,0(a5)
    80004b60:	00878793          	addi	a5,a5,8
    80004b64:	f6f43c23          	sd	a5,-136(s0)
    80004b68:	28074263          	bltz	a4,80004dec <__printf+0x584>
    80004b6c:	00002d97          	auipc	s11,0x2
    80004b70:	83cd8d93          	addi	s11,s11,-1988 # 800063a8 <digits>
    80004b74:	00f77793          	andi	a5,a4,15
    80004b78:	00fd87b3          	add	a5,s11,a5
    80004b7c:	0007c683          	lbu	a3,0(a5)
    80004b80:	00f00613          	li	a2,15
    80004b84:	0007079b          	sext.w	a5,a4
    80004b88:	f8d40023          	sb	a3,-128(s0)
    80004b8c:	0047559b          	srliw	a1,a4,0x4
    80004b90:	0047569b          	srliw	a3,a4,0x4
    80004b94:	00000c93          	li	s9,0
    80004b98:	0ee65063          	bge	a2,a4,80004c78 <__printf+0x410>
    80004b9c:	00f6f693          	andi	a3,a3,15
    80004ba0:	00dd86b3          	add	a3,s11,a3
    80004ba4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80004ba8:	0087d79b          	srliw	a5,a5,0x8
    80004bac:	00100c93          	li	s9,1
    80004bb0:	f8d400a3          	sb	a3,-127(s0)
    80004bb4:	0cb67263          	bgeu	a2,a1,80004c78 <__printf+0x410>
    80004bb8:	00f7f693          	andi	a3,a5,15
    80004bbc:	00dd86b3          	add	a3,s11,a3
    80004bc0:	0006c583          	lbu	a1,0(a3)
    80004bc4:	00f00613          	li	a2,15
    80004bc8:	0047d69b          	srliw	a3,a5,0x4
    80004bcc:	f8b40123          	sb	a1,-126(s0)
    80004bd0:	0047d593          	srli	a1,a5,0x4
    80004bd4:	28f67e63          	bgeu	a2,a5,80004e70 <__printf+0x608>
    80004bd8:	00f6f693          	andi	a3,a3,15
    80004bdc:	00dd86b3          	add	a3,s11,a3
    80004be0:	0006c503          	lbu	a0,0(a3)
    80004be4:	0087d813          	srli	a6,a5,0x8
    80004be8:	0087d69b          	srliw	a3,a5,0x8
    80004bec:	f8a401a3          	sb	a0,-125(s0)
    80004bf0:	28b67663          	bgeu	a2,a1,80004e7c <__printf+0x614>
    80004bf4:	00f6f693          	andi	a3,a3,15
    80004bf8:	00dd86b3          	add	a3,s11,a3
    80004bfc:	0006c583          	lbu	a1,0(a3)
    80004c00:	00c7d513          	srli	a0,a5,0xc
    80004c04:	00c7d69b          	srliw	a3,a5,0xc
    80004c08:	f8b40223          	sb	a1,-124(s0)
    80004c0c:	29067a63          	bgeu	a2,a6,80004ea0 <__printf+0x638>
    80004c10:	00f6f693          	andi	a3,a3,15
    80004c14:	00dd86b3          	add	a3,s11,a3
    80004c18:	0006c583          	lbu	a1,0(a3)
    80004c1c:	0107d813          	srli	a6,a5,0x10
    80004c20:	0107d69b          	srliw	a3,a5,0x10
    80004c24:	f8b402a3          	sb	a1,-123(s0)
    80004c28:	28a67263          	bgeu	a2,a0,80004eac <__printf+0x644>
    80004c2c:	00f6f693          	andi	a3,a3,15
    80004c30:	00dd86b3          	add	a3,s11,a3
    80004c34:	0006c683          	lbu	a3,0(a3)
    80004c38:	0147d79b          	srliw	a5,a5,0x14
    80004c3c:	f8d40323          	sb	a3,-122(s0)
    80004c40:	21067663          	bgeu	a2,a6,80004e4c <__printf+0x5e4>
    80004c44:	02079793          	slli	a5,a5,0x20
    80004c48:	0207d793          	srli	a5,a5,0x20
    80004c4c:	00fd8db3          	add	s11,s11,a5
    80004c50:	000dc683          	lbu	a3,0(s11)
    80004c54:	00800793          	li	a5,8
    80004c58:	00700c93          	li	s9,7
    80004c5c:	f8d403a3          	sb	a3,-121(s0)
    80004c60:	00075c63          	bgez	a4,80004c78 <__printf+0x410>
    80004c64:	f9040713          	addi	a4,s0,-112
    80004c68:	00f70733          	add	a4,a4,a5
    80004c6c:	02d00693          	li	a3,45
    80004c70:	fed70823          	sb	a3,-16(a4)
    80004c74:	00078c93          	mv	s9,a5
    80004c78:	f8040793          	addi	a5,s0,-128
    80004c7c:	01978cb3          	add	s9,a5,s9
    80004c80:	f7f40d13          	addi	s10,s0,-129
    80004c84:	000cc503          	lbu	a0,0(s9)
    80004c88:	fffc8c93          	addi	s9,s9,-1
    80004c8c:	00000097          	auipc	ra,0x0
    80004c90:	9f8080e7          	jalr	-1544(ra) # 80004684 <consputc>
    80004c94:	ff9d18e3          	bne	s10,s9,80004c84 <__printf+0x41c>
    80004c98:	0100006f          	j	80004ca8 <__printf+0x440>
    80004c9c:	00000097          	auipc	ra,0x0
    80004ca0:	9e8080e7          	jalr	-1560(ra) # 80004684 <consputc>
    80004ca4:	000c8493          	mv	s1,s9
    80004ca8:	00094503          	lbu	a0,0(s2)
    80004cac:	c60510e3          	bnez	a0,8000490c <__printf+0xa4>
    80004cb0:	e40c0ee3          	beqz	s8,80004b0c <__printf+0x2a4>
    80004cb4:	00004517          	auipc	a0,0x4
    80004cb8:	ddc50513          	addi	a0,a0,-548 # 80008a90 <pr>
    80004cbc:	00001097          	auipc	ra,0x1
    80004cc0:	94c080e7          	jalr	-1716(ra) # 80005608 <release>
    80004cc4:	e49ff06f          	j	80004b0c <__printf+0x2a4>
    80004cc8:	f7843783          	ld	a5,-136(s0)
    80004ccc:	03000513          	li	a0,48
    80004cd0:	01000d13          	li	s10,16
    80004cd4:	00878713          	addi	a4,a5,8
    80004cd8:	0007bc83          	ld	s9,0(a5)
    80004cdc:	f6e43c23          	sd	a4,-136(s0)
    80004ce0:	00000097          	auipc	ra,0x0
    80004ce4:	9a4080e7          	jalr	-1628(ra) # 80004684 <consputc>
    80004ce8:	07800513          	li	a0,120
    80004cec:	00000097          	auipc	ra,0x0
    80004cf0:	998080e7          	jalr	-1640(ra) # 80004684 <consputc>
    80004cf4:	00001d97          	auipc	s11,0x1
    80004cf8:	6b4d8d93          	addi	s11,s11,1716 # 800063a8 <digits>
    80004cfc:	03ccd793          	srli	a5,s9,0x3c
    80004d00:	00fd87b3          	add	a5,s11,a5
    80004d04:	0007c503          	lbu	a0,0(a5)
    80004d08:	fffd0d1b          	addiw	s10,s10,-1
    80004d0c:	004c9c93          	slli	s9,s9,0x4
    80004d10:	00000097          	auipc	ra,0x0
    80004d14:	974080e7          	jalr	-1676(ra) # 80004684 <consputc>
    80004d18:	fe0d12e3          	bnez	s10,80004cfc <__printf+0x494>
    80004d1c:	f8dff06f          	j	80004ca8 <__printf+0x440>
    80004d20:	f7843783          	ld	a5,-136(s0)
    80004d24:	0007bc83          	ld	s9,0(a5)
    80004d28:	00878793          	addi	a5,a5,8
    80004d2c:	f6f43c23          	sd	a5,-136(s0)
    80004d30:	000c9a63          	bnez	s9,80004d44 <__printf+0x4dc>
    80004d34:	1080006f          	j	80004e3c <__printf+0x5d4>
    80004d38:	001c8c93          	addi	s9,s9,1
    80004d3c:	00000097          	auipc	ra,0x0
    80004d40:	948080e7          	jalr	-1720(ra) # 80004684 <consputc>
    80004d44:	000cc503          	lbu	a0,0(s9)
    80004d48:	fe0518e3          	bnez	a0,80004d38 <__printf+0x4d0>
    80004d4c:	f5dff06f          	j	80004ca8 <__printf+0x440>
    80004d50:	02500513          	li	a0,37
    80004d54:	00000097          	auipc	ra,0x0
    80004d58:	930080e7          	jalr	-1744(ra) # 80004684 <consputc>
    80004d5c:	000c8513          	mv	a0,s9
    80004d60:	00000097          	auipc	ra,0x0
    80004d64:	924080e7          	jalr	-1756(ra) # 80004684 <consputc>
    80004d68:	f41ff06f          	j	80004ca8 <__printf+0x440>
    80004d6c:	02500513          	li	a0,37
    80004d70:	00000097          	auipc	ra,0x0
    80004d74:	914080e7          	jalr	-1772(ra) # 80004684 <consputc>
    80004d78:	f31ff06f          	j	80004ca8 <__printf+0x440>
    80004d7c:	00030513          	mv	a0,t1
    80004d80:	00000097          	auipc	ra,0x0
    80004d84:	7bc080e7          	jalr	1980(ra) # 8000553c <acquire>
    80004d88:	b4dff06f          	j	800048d4 <__printf+0x6c>
    80004d8c:	40c0053b          	negw	a0,a2
    80004d90:	00a00713          	li	a4,10
    80004d94:	02e576bb          	remuw	a3,a0,a4
    80004d98:	00001d97          	auipc	s11,0x1
    80004d9c:	610d8d93          	addi	s11,s11,1552 # 800063a8 <digits>
    80004da0:	ff700593          	li	a1,-9
    80004da4:	02069693          	slli	a3,a3,0x20
    80004da8:	0206d693          	srli	a3,a3,0x20
    80004dac:	00dd86b3          	add	a3,s11,a3
    80004db0:	0006c683          	lbu	a3,0(a3)
    80004db4:	02e557bb          	divuw	a5,a0,a4
    80004db8:	f8d40023          	sb	a3,-128(s0)
    80004dbc:	10b65e63          	bge	a2,a1,80004ed8 <__printf+0x670>
    80004dc0:	06300593          	li	a1,99
    80004dc4:	02e7f6bb          	remuw	a3,a5,a4
    80004dc8:	02069693          	slli	a3,a3,0x20
    80004dcc:	0206d693          	srli	a3,a3,0x20
    80004dd0:	00dd86b3          	add	a3,s11,a3
    80004dd4:	0006c683          	lbu	a3,0(a3)
    80004dd8:	02e7d73b          	divuw	a4,a5,a4
    80004ddc:	00200793          	li	a5,2
    80004de0:	f8d400a3          	sb	a3,-127(s0)
    80004de4:	bca5ece3          	bltu	a1,a0,800049bc <__printf+0x154>
    80004de8:	ce5ff06f          	j	80004acc <__printf+0x264>
    80004dec:	40e007bb          	negw	a5,a4
    80004df0:	00001d97          	auipc	s11,0x1
    80004df4:	5b8d8d93          	addi	s11,s11,1464 # 800063a8 <digits>
    80004df8:	00f7f693          	andi	a3,a5,15
    80004dfc:	00dd86b3          	add	a3,s11,a3
    80004e00:	0006c583          	lbu	a1,0(a3)
    80004e04:	ff100613          	li	a2,-15
    80004e08:	0047d69b          	srliw	a3,a5,0x4
    80004e0c:	f8b40023          	sb	a1,-128(s0)
    80004e10:	0047d59b          	srliw	a1,a5,0x4
    80004e14:	0ac75e63          	bge	a4,a2,80004ed0 <__printf+0x668>
    80004e18:	00f6f693          	andi	a3,a3,15
    80004e1c:	00dd86b3          	add	a3,s11,a3
    80004e20:	0006c603          	lbu	a2,0(a3)
    80004e24:	00f00693          	li	a3,15
    80004e28:	0087d79b          	srliw	a5,a5,0x8
    80004e2c:	f8c400a3          	sb	a2,-127(s0)
    80004e30:	d8b6e4e3          	bltu	a3,a1,80004bb8 <__printf+0x350>
    80004e34:	00200793          	li	a5,2
    80004e38:	e2dff06f          	j	80004c64 <__printf+0x3fc>
    80004e3c:	00001c97          	auipc	s9,0x1
    80004e40:	54cc8c93          	addi	s9,s9,1356 # 80006388 <CONSOLE_STATUS+0x378>
    80004e44:	02800513          	li	a0,40
    80004e48:	ef1ff06f          	j	80004d38 <__printf+0x4d0>
    80004e4c:	00700793          	li	a5,7
    80004e50:	00600c93          	li	s9,6
    80004e54:	e0dff06f          	j	80004c60 <__printf+0x3f8>
    80004e58:	00700793          	li	a5,7
    80004e5c:	00600c93          	li	s9,6
    80004e60:	c69ff06f          	j	80004ac8 <__printf+0x260>
    80004e64:	00300793          	li	a5,3
    80004e68:	00200c93          	li	s9,2
    80004e6c:	c5dff06f          	j	80004ac8 <__printf+0x260>
    80004e70:	00300793          	li	a5,3
    80004e74:	00200c93          	li	s9,2
    80004e78:	de9ff06f          	j	80004c60 <__printf+0x3f8>
    80004e7c:	00400793          	li	a5,4
    80004e80:	00300c93          	li	s9,3
    80004e84:	dddff06f          	j	80004c60 <__printf+0x3f8>
    80004e88:	00400793          	li	a5,4
    80004e8c:	00300c93          	li	s9,3
    80004e90:	c39ff06f          	j	80004ac8 <__printf+0x260>
    80004e94:	00500793          	li	a5,5
    80004e98:	00400c93          	li	s9,4
    80004e9c:	c2dff06f          	j	80004ac8 <__printf+0x260>
    80004ea0:	00500793          	li	a5,5
    80004ea4:	00400c93          	li	s9,4
    80004ea8:	db9ff06f          	j	80004c60 <__printf+0x3f8>
    80004eac:	00600793          	li	a5,6
    80004eb0:	00500c93          	li	s9,5
    80004eb4:	dadff06f          	j	80004c60 <__printf+0x3f8>
    80004eb8:	00600793          	li	a5,6
    80004ebc:	00500c93          	li	s9,5
    80004ec0:	c09ff06f          	j	80004ac8 <__printf+0x260>
    80004ec4:	00800793          	li	a5,8
    80004ec8:	00700c93          	li	s9,7
    80004ecc:	bfdff06f          	j	80004ac8 <__printf+0x260>
    80004ed0:	00100793          	li	a5,1
    80004ed4:	d91ff06f          	j	80004c64 <__printf+0x3fc>
    80004ed8:	00100793          	li	a5,1
    80004edc:	bf1ff06f          	j	80004acc <__printf+0x264>
    80004ee0:	00900793          	li	a5,9
    80004ee4:	00800c93          	li	s9,8
    80004ee8:	be1ff06f          	j	80004ac8 <__printf+0x260>
    80004eec:	00001517          	auipc	a0,0x1
    80004ef0:	4a450513          	addi	a0,a0,1188 # 80006390 <CONSOLE_STATUS+0x380>
    80004ef4:	00000097          	auipc	ra,0x0
    80004ef8:	918080e7          	jalr	-1768(ra) # 8000480c <panic>

0000000080004efc <printfinit>:
    80004efc:	fe010113          	addi	sp,sp,-32
    80004f00:	00813823          	sd	s0,16(sp)
    80004f04:	00913423          	sd	s1,8(sp)
    80004f08:	00113c23          	sd	ra,24(sp)
    80004f0c:	02010413          	addi	s0,sp,32
    80004f10:	00004497          	auipc	s1,0x4
    80004f14:	b8048493          	addi	s1,s1,-1152 # 80008a90 <pr>
    80004f18:	00048513          	mv	a0,s1
    80004f1c:	00001597          	auipc	a1,0x1
    80004f20:	48458593          	addi	a1,a1,1156 # 800063a0 <CONSOLE_STATUS+0x390>
    80004f24:	00000097          	auipc	ra,0x0
    80004f28:	5f4080e7          	jalr	1524(ra) # 80005518 <initlock>
    80004f2c:	01813083          	ld	ra,24(sp)
    80004f30:	01013403          	ld	s0,16(sp)
    80004f34:	0004ac23          	sw	zero,24(s1)
    80004f38:	00813483          	ld	s1,8(sp)
    80004f3c:	02010113          	addi	sp,sp,32
    80004f40:	00008067          	ret

0000000080004f44 <uartinit>:
    80004f44:	ff010113          	addi	sp,sp,-16
    80004f48:	00813423          	sd	s0,8(sp)
    80004f4c:	01010413          	addi	s0,sp,16
    80004f50:	100007b7          	lui	a5,0x10000
    80004f54:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80004f58:	f8000713          	li	a4,-128
    80004f5c:	00e781a3          	sb	a4,3(a5)
    80004f60:	00300713          	li	a4,3
    80004f64:	00e78023          	sb	a4,0(a5)
    80004f68:	000780a3          	sb	zero,1(a5)
    80004f6c:	00e781a3          	sb	a4,3(a5)
    80004f70:	00700693          	li	a3,7
    80004f74:	00d78123          	sb	a3,2(a5)
    80004f78:	00e780a3          	sb	a4,1(a5)
    80004f7c:	00813403          	ld	s0,8(sp)
    80004f80:	01010113          	addi	sp,sp,16
    80004f84:	00008067          	ret

0000000080004f88 <uartputc>:
    80004f88:	00003797          	auipc	a5,0x3
    80004f8c:	8707a783          	lw	a5,-1936(a5) # 800077f8 <panicked>
    80004f90:	00078463          	beqz	a5,80004f98 <uartputc+0x10>
    80004f94:	0000006f          	j	80004f94 <uartputc+0xc>
    80004f98:	fd010113          	addi	sp,sp,-48
    80004f9c:	02813023          	sd	s0,32(sp)
    80004fa0:	00913c23          	sd	s1,24(sp)
    80004fa4:	01213823          	sd	s2,16(sp)
    80004fa8:	01313423          	sd	s3,8(sp)
    80004fac:	02113423          	sd	ra,40(sp)
    80004fb0:	03010413          	addi	s0,sp,48
    80004fb4:	00003917          	auipc	s2,0x3
    80004fb8:	84c90913          	addi	s2,s2,-1972 # 80007800 <uart_tx_r>
    80004fbc:	00093783          	ld	a5,0(s2)
    80004fc0:	00003497          	auipc	s1,0x3
    80004fc4:	84848493          	addi	s1,s1,-1976 # 80007808 <uart_tx_w>
    80004fc8:	0004b703          	ld	a4,0(s1)
    80004fcc:	02078693          	addi	a3,a5,32
    80004fd0:	00050993          	mv	s3,a0
    80004fd4:	02e69c63          	bne	a3,a4,8000500c <uartputc+0x84>
    80004fd8:	00001097          	auipc	ra,0x1
    80004fdc:	834080e7          	jalr	-1996(ra) # 8000580c <push_on>
    80004fe0:	00093783          	ld	a5,0(s2)
    80004fe4:	0004b703          	ld	a4,0(s1)
    80004fe8:	02078793          	addi	a5,a5,32
    80004fec:	00e79463          	bne	a5,a4,80004ff4 <uartputc+0x6c>
    80004ff0:	0000006f          	j	80004ff0 <uartputc+0x68>
    80004ff4:	00001097          	auipc	ra,0x1
    80004ff8:	88c080e7          	jalr	-1908(ra) # 80005880 <pop_on>
    80004ffc:	00093783          	ld	a5,0(s2)
    80005000:	0004b703          	ld	a4,0(s1)
    80005004:	02078693          	addi	a3,a5,32
    80005008:	fce688e3          	beq	a3,a4,80004fd8 <uartputc+0x50>
    8000500c:	01f77693          	andi	a3,a4,31
    80005010:	00004597          	auipc	a1,0x4
    80005014:	aa058593          	addi	a1,a1,-1376 # 80008ab0 <uart_tx_buf>
    80005018:	00d586b3          	add	a3,a1,a3
    8000501c:	00170713          	addi	a4,a4,1
    80005020:	01368023          	sb	s3,0(a3)
    80005024:	00e4b023          	sd	a4,0(s1)
    80005028:	10000637          	lui	a2,0x10000
    8000502c:	02f71063          	bne	a4,a5,8000504c <uartputc+0xc4>
    80005030:	0340006f          	j	80005064 <uartputc+0xdc>
    80005034:	00074703          	lbu	a4,0(a4)
    80005038:	00f93023          	sd	a5,0(s2)
    8000503c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80005040:	00093783          	ld	a5,0(s2)
    80005044:	0004b703          	ld	a4,0(s1)
    80005048:	00f70e63          	beq	a4,a5,80005064 <uartputc+0xdc>
    8000504c:	00564683          	lbu	a3,5(a2)
    80005050:	01f7f713          	andi	a4,a5,31
    80005054:	00e58733          	add	a4,a1,a4
    80005058:	0206f693          	andi	a3,a3,32
    8000505c:	00178793          	addi	a5,a5,1
    80005060:	fc069ae3          	bnez	a3,80005034 <uartputc+0xac>
    80005064:	02813083          	ld	ra,40(sp)
    80005068:	02013403          	ld	s0,32(sp)
    8000506c:	01813483          	ld	s1,24(sp)
    80005070:	01013903          	ld	s2,16(sp)
    80005074:	00813983          	ld	s3,8(sp)
    80005078:	03010113          	addi	sp,sp,48
    8000507c:	00008067          	ret

0000000080005080 <uartputc_sync>:
    80005080:	ff010113          	addi	sp,sp,-16
    80005084:	00813423          	sd	s0,8(sp)
    80005088:	01010413          	addi	s0,sp,16
    8000508c:	00002717          	auipc	a4,0x2
    80005090:	76c72703          	lw	a4,1900(a4) # 800077f8 <panicked>
    80005094:	02071663          	bnez	a4,800050c0 <uartputc_sync+0x40>
    80005098:	00050793          	mv	a5,a0
    8000509c:	100006b7          	lui	a3,0x10000
    800050a0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800050a4:	02077713          	andi	a4,a4,32
    800050a8:	fe070ce3          	beqz	a4,800050a0 <uartputc_sync+0x20>
    800050ac:	0ff7f793          	andi	a5,a5,255
    800050b0:	00f68023          	sb	a5,0(a3)
    800050b4:	00813403          	ld	s0,8(sp)
    800050b8:	01010113          	addi	sp,sp,16
    800050bc:	00008067          	ret
    800050c0:	0000006f          	j	800050c0 <uartputc_sync+0x40>

00000000800050c4 <uartstart>:
    800050c4:	ff010113          	addi	sp,sp,-16
    800050c8:	00813423          	sd	s0,8(sp)
    800050cc:	01010413          	addi	s0,sp,16
    800050d0:	00002617          	auipc	a2,0x2
    800050d4:	73060613          	addi	a2,a2,1840 # 80007800 <uart_tx_r>
    800050d8:	00002517          	auipc	a0,0x2
    800050dc:	73050513          	addi	a0,a0,1840 # 80007808 <uart_tx_w>
    800050e0:	00063783          	ld	a5,0(a2)
    800050e4:	00053703          	ld	a4,0(a0)
    800050e8:	04f70263          	beq	a4,a5,8000512c <uartstart+0x68>
    800050ec:	100005b7          	lui	a1,0x10000
    800050f0:	00004817          	auipc	a6,0x4
    800050f4:	9c080813          	addi	a6,a6,-1600 # 80008ab0 <uart_tx_buf>
    800050f8:	01c0006f          	j	80005114 <uartstart+0x50>
    800050fc:	0006c703          	lbu	a4,0(a3)
    80005100:	00f63023          	sd	a5,0(a2)
    80005104:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80005108:	00063783          	ld	a5,0(a2)
    8000510c:	00053703          	ld	a4,0(a0)
    80005110:	00f70e63          	beq	a4,a5,8000512c <uartstart+0x68>
    80005114:	01f7f713          	andi	a4,a5,31
    80005118:	00e806b3          	add	a3,a6,a4
    8000511c:	0055c703          	lbu	a4,5(a1)
    80005120:	00178793          	addi	a5,a5,1
    80005124:	02077713          	andi	a4,a4,32
    80005128:	fc071ae3          	bnez	a4,800050fc <uartstart+0x38>
    8000512c:	00813403          	ld	s0,8(sp)
    80005130:	01010113          	addi	sp,sp,16
    80005134:	00008067          	ret

0000000080005138 <uartgetc>:
    80005138:	ff010113          	addi	sp,sp,-16
    8000513c:	00813423          	sd	s0,8(sp)
    80005140:	01010413          	addi	s0,sp,16
    80005144:	10000737          	lui	a4,0x10000
    80005148:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000514c:	0017f793          	andi	a5,a5,1
    80005150:	00078c63          	beqz	a5,80005168 <uartgetc+0x30>
    80005154:	00074503          	lbu	a0,0(a4)
    80005158:	0ff57513          	andi	a0,a0,255
    8000515c:	00813403          	ld	s0,8(sp)
    80005160:	01010113          	addi	sp,sp,16
    80005164:	00008067          	ret
    80005168:	fff00513          	li	a0,-1
    8000516c:	ff1ff06f          	j	8000515c <uartgetc+0x24>

0000000080005170 <uartintr>:
    80005170:	100007b7          	lui	a5,0x10000
    80005174:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80005178:	0017f793          	andi	a5,a5,1
    8000517c:	0a078463          	beqz	a5,80005224 <uartintr+0xb4>
    80005180:	fe010113          	addi	sp,sp,-32
    80005184:	00813823          	sd	s0,16(sp)
    80005188:	00913423          	sd	s1,8(sp)
    8000518c:	00113c23          	sd	ra,24(sp)
    80005190:	02010413          	addi	s0,sp,32
    80005194:	100004b7          	lui	s1,0x10000
    80005198:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000519c:	0ff57513          	andi	a0,a0,255
    800051a0:	fffff097          	auipc	ra,0xfffff
    800051a4:	534080e7          	jalr	1332(ra) # 800046d4 <consoleintr>
    800051a8:	0054c783          	lbu	a5,5(s1)
    800051ac:	0017f793          	andi	a5,a5,1
    800051b0:	fe0794e3          	bnez	a5,80005198 <uartintr+0x28>
    800051b4:	00002617          	auipc	a2,0x2
    800051b8:	64c60613          	addi	a2,a2,1612 # 80007800 <uart_tx_r>
    800051bc:	00002517          	auipc	a0,0x2
    800051c0:	64c50513          	addi	a0,a0,1612 # 80007808 <uart_tx_w>
    800051c4:	00063783          	ld	a5,0(a2)
    800051c8:	00053703          	ld	a4,0(a0)
    800051cc:	04f70263          	beq	a4,a5,80005210 <uartintr+0xa0>
    800051d0:	100005b7          	lui	a1,0x10000
    800051d4:	00004817          	auipc	a6,0x4
    800051d8:	8dc80813          	addi	a6,a6,-1828 # 80008ab0 <uart_tx_buf>
    800051dc:	01c0006f          	j	800051f8 <uartintr+0x88>
    800051e0:	0006c703          	lbu	a4,0(a3)
    800051e4:	00f63023          	sd	a5,0(a2)
    800051e8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800051ec:	00063783          	ld	a5,0(a2)
    800051f0:	00053703          	ld	a4,0(a0)
    800051f4:	00f70e63          	beq	a4,a5,80005210 <uartintr+0xa0>
    800051f8:	01f7f713          	andi	a4,a5,31
    800051fc:	00e806b3          	add	a3,a6,a4
    80005200:	0055c703          	lbu	a4,5(a1)
    80005204:	00178793          	addi	a5,a5,1
    80005208:	02077713          	andi	a4,a4,32
    8000520c:	fc071ae3          	bnez	a4,800051e0 <uartintr+0x70>
    80005210:	01813083          	ld	ra,24(sp)
    80005214:	01013403          	ld	s0,16(sp)
    80005218:	00813483          	ld	s1,8(sp)
    8000521c:	02010113          	addi	sp,sp,32
    80005220:	00008067          	ret
    80005224:	00002617          	auipc	a2,0x2
    80005228:	5dc60613          	addi	a2,a2,1500 # 80007800 <uart_tx_r>
    8000522c:	00002517          	auipc	a0,0x2
    80005230:	5dc50513          	addi	a0,a0,1500 # 80007808 <uart_tx_w>
    80005234:	00063783          	ld	a5,0(a2)
    80005238:	00053703          	ld	a4,0(a0)
    8000523c:	04f70263          	beq	a4,a5,80005280 <uartintr+0x110>
    80005240:	100005b7          	lui	a1,0x10000
    80005244:	00004817          	auipc	a6,0x4
    80005248:	86c80813          	addi	a6,a6,-1940 # 80008ab0 <uart_tx_buf>
    8000524c:	01c0006f          	j	80005268 <uartintr+0xf8>
    80005250:	0006c703          	lbu	a4,0(a3)
    80005254:	00f63023          	sd	a5,0(a2)
    80005258:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000525c:	00063783          	ld	a5,0(a2)
    80005260:	00053703          	ld	a4,0(a0)
    80005264:	02f70063          	beq	a4,a5,80005284 <uartintr+0x114>
    80005268:	01f7f713          	andi	a4,a5,31
    8000526c:	00e806b3          	add	a3,a6,a4
    80005270:	0055c703          	lbu	a4,5(a1)
    80005274:	00178793          	addi	a5,a5,1
    80005278:	02077713          	andi	a4,a4,32
    8000527c:	fc071ae3          	bnez	a4,80005250 <uartintr+0xe0>
    80005280:	00008067          	ret
    80005284:	00008067          	ret

0000000080005288 <kinit>:
    80005288:	fc010113          	addi	sp,sp,-64
    8000528c:	02913423          	sd	s1,40(sp)
    80005290:	fffff7b7          	lui	a5,0xfffff
    80005294:	00005497          	auipc	s1,0x5
    80005298:	83b48493          	addi	s1,s1,-1989 # 80009acf <end+0xfff>
    8000529c:	02813823          	sd	s0,48(sp)
    800052a0:	01313c23          	sd	s3,24(sp)
    800052a4:	00f4f4b3          	and	s1,s1,a5
    800052a8:	02113c23          	sd	ra,56(sp)
    800052ac:	03213023          	sd	s2,32(sp)
    800052b0:	01413823          	sd	s4,16(sp)
    800052b4:	01513423          	sd	s5,8(sp)
    800052b8:	04010413          	addi	s0,sp,64
    800052bc:	000017b7          	lui	a5,0x1
    800052c0:	01100993          	li	s3,17
    800052c4:	00f487b3          	add	a5,s1,a5
    800052c8:	01b99993          	slli	s3,s3,0x1b
    800052cc:	06f9e063          	bltu	s3,a5,8000532c <kinit+0xa4>
    800052d0:	00004a97          	auipc	s5,0x4
    800052d4:	800a8a93          	addi	s5,s5,-2048 # 80008ad0 <end>
    800052d8:	0754ec63          	bltu	s1,s5,80005350 <kinit+0xc8>
    800052dc:	0734fa63          	bgeu	s1,s3,80005350 <kinit+0xc8>
    800052e0:	00088a37          	lui	s4,0x88
    800052e4:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    800052e8:	00002917          	auipc	s2,0x2
    800052ec:	52890913          	addi	s2,s2,1320 # 80007810 <kmem>
    800052f0:	00ca1a13          	slli	s4,s4,0xc
    800052f4:	0140006f          	j	80005308 <kinit+0x80>
    800052f8:	000017b7          	lui	a5,0x1
    800052fc:	00f484b3          	add	s1,s1,a5
    80005300:	0554e863          	bltu	s1,s5,80005350 <kinit+0xc8>
    80005304:	0534f663          	bgeu	s1,s3,80005350 <kinit+0xc8>
    80005308:	00001637          	lui	a2,0x1
    8000530c:	00100593          	li	a1,1
    80005310:	00048513          	mv	a0,s1
    80005314:	00000097          	auipc	ra,0x0
    80005318:	5e4080e7          	jalr	1508(ra) # 800058f8 <__memset>
    8000531c:	00093783          	ld	a5,0(s2)
    80005320:	00f4b023          	sd	a5,0(s1)
    80005324:	00993023          	sd	s1,0(s2)
    80005328:	fd4498e3          	bne	s1,s4,800052f8 <kinit+0x70>
    8000532c:	03813083          	ld	ra,56(sp)
    80005330:	03013403          	ld	s0,48(sp)
    80005334:	02813483          	ld	s1,40(sp)
    80005338:	02013903          	ld	s2,32(sp)
    8000533c:	01813983          	ld	s3,24(sp)
    80005340:	01013a03          	ld	s4,16(sp)
    80005344:	00813a83          	ld	s5,8(sp)
    80005348:	04010113          	addi	sp,sp,64
    8000534c:	00008067          	ret
    80005350:	00001517          	auipc	a0,0x1
    80005354:	07050513          	addi	a0,a0,112 # 800063c0 <digits+0x18>
    80005358:	fffff097          	auipc	ra,0xfffff
    8000535c:	4b4080e7          	jalr	1204(ra) # 8000480c <panic>

0000000080005360 <freerange>:
    80005360:	fc010113          	addi	sp,sp,-64
    80005364:	000017b7          	lui	a5,0x1
    80005368:	02913423          	sd	s1,40(sp)
    8000536c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80005370:	009504b3          	add	s1,a0,s1
    80005374:	fffff537          	lui	a0,0xfffff
    80005378:	02813823          	sd	s0,48(sp)
    8000537c:	02113c23          	sd	ra,56(sp)
    80005380:	03213023          	sd	s2,32(sp)
    80005384:	01313c23          	sd	s3,24(sp)
    80005388:	01413823          	sd	s4,16(sp)
    8000538c:	01513423          	sd	s5,8(sp)
    80005390:	01613023          	sd	s6,0(sp)
    80005394:	04010413          	addi	s0,sp,64
    80005398:	00a4f4b3          	and	s1,s1,a0
    8000539c:	00f487b3          	add	a5,s1,a5
    800053a0:	06f5e463          	bltu	a1,a5,80005408 <freerange+0xa8>
    800053a4:	00003a97          	auipc	s5,0x3
    800053a8:	72ca8a93          	addi	s5,s5,1836 # 80008ad0 <end>
    800053ac:	0954e263          	bltu	s1,s5,80005430 <freerange+0xd0>
    800053b0:	01100993          	li	s3,17
    800053b4:	01b99993          	slli	s3,s3,0x1b
    800053b8:	0734fc63          	bgeu	s1,s3,80005430 <freerange+0xd0>
    800053bc:	00058a13          	mv	s4,a1
    800053c0:	00002917          	auipc	s2,0x2
    800053c4:	45090913          	addi	s2,s2,1104 # 80007810 <kmem>
    800053c8:	00002b37          	lui	s6,0x2
    800053cc:	0140006f          	j	800053e0 <freerange+0x80>
    800053d0:	000017b7          	lui	a5,0x1
    800053d4:	00f484b3          	add	s1,s1,a5
    800053d8:	0554ec63          	bltu	s1,s5,80005430 <freerange+0xd0>
    800053dc:	0534fa63          	bgeu	s1,s3,80005430 <freerange+0xd0>
    800053e0:	00001637          	lui	a2,0x1
    800053e4:	00100593          	li	a1,1
    800053e8:	00048513          	mv	a0,s1
    800053ec:	00000097          	auipc	ra,0x0
    800053f0:	50c080e7          	jalr	1292(ra) # 800058f8 <__memset>
    800053f4:	00093703          	ld	a4,0(s2)
    800053f8:	016487b3          	add	a5,s1,s6
    800053fc:	00e4b023          	sd	a4,0(s1)
    80005400:	00993023          	sd	s1,0(s2)
    80005404:	fcfa76e3          	bgeu	s4,a5,800053d0 <freerange+0x70>
    80005408:	03813083          	ld	ra,56(sp)
    8000540c:	03013403          	ld	s0,48(sp)
    80005410:	02813483          	ld	s1,40(sp)
    80005414:	02013903          	ld	s2,32(sp)
    80005418:	01813983          	ld	s3,24(sp)
    8000541c:	01013a03          	ld	s4,16(sp)
    80005420:	00813a83          	ld	s5,8(sp)
    80005424:	00013b03          	ld	s6,0(sp)
    80005428:	04010113          	addi	sp,sp,64
    8000542c:	00008067          	ret
    80005430:	00001517          	auipc	a0,0x1
    80005434:	f9050513          	addi	a0,a0,-112 # 800063c0 <digits+0x18>
    80005438:	fffff097          	auipc	ra,0xfffff
    8000543c:	3d4080e7          	jalr	980(ra) # 8000480c <panic>

0000000080005440 <kfree>:
    80005440:	fe010113          	addi	sp,sp,-32
    80005444:	00813823          	sd	s0,16(sp)
    80005448:	00113c23          	sd	ra,24(sp)
    8000544c:	00913423          	sd	s1,8(sp)
    80005450:	02010413          	addi	s0,sp,32
    80005454:	03451793          	slli	a5,a0,0x34
    80005458:	04079c63          	bnez	a5,800054b0 <kfree+0x70>
    8000545c:	00003797          	auipc	a5,0x3
    80005460:	67478793          	addi	a5,a5,1652 # 80008ad0 <end>
    80005464:	00050493          	mv	s1,a0
    80005468:	04f56463          	bltu	a0,a5,800054b0 <kfree+0x70>
    8000546c:	01100793          	li	a5,17
    80005470:	01b79793          	slli	a5,a5,0x1b
    80005474:	02f57e63          	bgeu	a0,a5,800054b0 <kfree+0x70>
    80005478:	00001637          	lui	a2,0x1
    8000547c:	00100593          	li	a1,1
    80005480:	00000097          	auipc	ra,0x0
    80005484:	478080e7          	jalr	1144(ra) # 800058f8 <__memset>
    80005488:	00002797          	auipc	a5,0x2
    8000548c:	38878793          	addi	a5,a5,904 # 80007810 <kmem>
    80005490:	0007b703          	ld	a4,0(a5)
    80005494:	01813083          	ld	ra,24(sp)
    80005498:	01013403          	ld	s0,16(sp)
    8000549c:	00e4b023          	sd	a4,0(s1)
    800054a0:	0097b023          	sd	s1,0(a5)
    800054a4:	00813483          	ld	s1,8(sp)
    800054a8:	02010113          	addi	sp,sp,32
    800054ac:	00008067          	ret
    800054b0:	00001517          	auipc	a0,0x1
    800054b4:	f1050513          	addi	a0,a0,-240 # 800063c0 <digits+0x18>
    800054b8:	fffff097          	auipc	ra,0xfffff
    800054bc:	354080e7          	jalr	852(ra) # 8000480c <panic>

00000000800054c0 <kalloc>:
    800054c0:	fe010113          	addi	sp,sp,-32
    800054c4:	00813823          	sd	s0,16(sp)
    800054c8:	00913423          	sd	s1,8(sp)
    800054cc:	00113c23          	sd	ra,24(sp)
    800054d0:	02010413          	addi	s0,sp,32
    800054d4:	00002797          	auipc	a5,0x2
    800054d8:	33c78793          	addi	a5,a5,828 # 80007810 <kmem>
    800054dc:	0007b483          	ld	s1,0(a5)
    800054e0:	02048063          	beqz	s1,80005500 <kalloc+0x40>
    800054e4:	0004b703          	ld	a4,0(s1)
    800054e8:	00001637          	lui	a2,0x1
    800054ec:	00500593          	li	a1,5
    800054f0:	00048513          	mv	a0,s1
    800054f4:	00e7b023          	sd	a4,0(a5)
    800054f8:	00000097          	auipc	ra,0x0
    800054fc:	400080e7          	jalr	1024(ra) # 800058f8 <__memset>
    80005500:	01813083          	ld	ra,24(sp)
    80005504:	01013403          	ld	s0,16(sp)
    80005508:	00048513          	mv	a0,s1
    8000550c:	00813483          	ld	s1,8(sp)
    80005510:	02010113          	addi	sp,sp,32
    80005514:	00008067          	ret

0000000080005518 <initlock>:
    80005518:	ff010113          	addi	sp,sp,-16
    8000551c:	00813423          	sd	s0,8(sp)
    80005520:	01010413          	addi	s0,sp,16
    80005524:	00813403          	ld	s0,8(sp)
    80005528:	00b53423          	sd	a1,8(a0)
    8000552c:	00052023          	sw	zero,0(a0)
    80005530:	00053823          	sd	zero,16(a0)
    80005534:	01010113          	addi	sp,sp,16
    80005538:	00008067          	ret

000000008000553c <acquire>:
    8000553c:	fe010113          	addi	sp,sp,-32
    80005540:	00813823          	sd	s0,16(sp)
    80005544:	00913423          	sd	s1,8(sp)
    80005548:	00113c23          	sd	ra,24(sp)
    8000554c:	01213023          	sd	s2,0(sp)
    80005550:	02010413          	addi	s0,sp,32
    80005554:	00050493          	mv	s1,a0
    80005558:	10002973          	csrr	s2,sstatus
    8000555c:	100027f3          	csrr	a5,sstatus
    80005560:	ffd7f793          	andi	a5,a5,-3
    80005564:	10079073          	csrw	sstatus,a5
    80005568:	fffff097          	auipc	ra,0xfffff
    8000556c:	8e4080e7          	jalr	-1820(ra) # 80003e4c <mycpu>
    80005570:	07852783          	lw	a5,120(a0)
    80005574:	06078e63          	beqz	a5,800055f0 <acquire+0xb4>
    80005578:	fffff097          	auipc	ra,0xfffff
    8000557c:	8d4080e7          	jalr	-1836(ra) # 80003e4c <mycpu>
    80005580:	07852783          	lw	a5,120(a0)
    80005584:	0004a703          	lw	a4,0(s1)
    80005588:	0017879b          	addiw	a5,a5,1
    8000558c:	06f52c23          	sw	a5,120(a0)
    80005590:	04071063          	bnez	a4,800055d0 <acquire+0x94>
    80005594:	00100713          	li	a4,1
    80005598:	00070793          	mv	a5,a4
    8000559c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    800055a0:	0007879b          	sext.w	a5,a5
    800055a4:	fe079ae3          	bnez	a5,80005598 <acquire+0x5c>
    800055a8:	0ff0000f          	fence
    800055ac:	fffff097          	auipc	ra,0xfffff
    800055b0:	8a0080e7          	jalr	-1888(ra) # 80003e4c <mycpu>
    800055b4:	01813083          	ld	ra,24(sp)
    800055b8:	01013403          	ld	s0,16(sp)
    800055bc:	00a4b823          	sd	a0,16(s1)
    800055c0:	00013903          	ld	s2,0(sp)
    800055c4:	00813483          	ld	s1,8(sp)
    800055c8:	02010113          	addi	sp,sp,32
    800055cc:	00008067          	ret
    800055d0:	0104b903          	ld	s2,16(s1)
    800055d4:	fffff097          	auipc	ra,0xfffff
    800055d8:	878080e7          	jalr	-1928(ra) # 80003e4c <mycpu>
    800055dc:	faa91ce3          	bne	s2,a0,80005594 <acquire+0x58>
    800055e0:	00001517          	auipc	a0,0x1
    800055e4:	de850513          	addi	a0,a0,-536 # 800063c8 <digits+0x20>
    800055e8:	fffff097          	auipc	ra,0xfffff
    800055ec:	224080e7          	jalr	548(ra) # 8000480c <panic>
    800055f0:	00195913          	srli	s2,s2,0x1
    800055f4:	fffff097          	auipc	ra,0xfffff
    800055f8:	858080e7          	jalr	-1960(ra) # 80003e4c <mycpu>
    800055fc:	00197913          	andi	s2,s2,1
    80005600:	07252e23          	sw	s2,124(a0)
    80005604:	f75ff06f          	j	80005578 <acquire+0x3c>

0000000080005608 <release>:
    80005608:	fe010113          	addi	sp,sp,-32
    8000560c:	00813823          	sd	s0,16(sp)
    80005610:	00113c23          	sd	ra,24(sp)
    80005614:	00913423          	sd	s1,8(sp)
    80005618:	01213023          	sd	s2,0(sp)
    8000561c:	02010413          	addi	s0,sp,32
    80005620:	00052783          	lw	a5,0(a0)
    80005624:	00079a63          	bnez	a5,80005638 <release+0x30>
    80005628:	00001517          	auipc	a0,0x1
    8000562c:	da850513          	addi	a0,a0,-600 # 800063d0 <digits+0x28>
    80005630:	fffff097          	auipc	ra,0xfffff
    80005634:	1dc080e7          	jalr	476(ra) # 8000480c <panic>
    80005638:	01053903          	ld	s2,16(a0)
    8000563c:	00050493          	mv	s1,a0
    80005640:	fffff097          	auipc	ra,0xfffff
    80005644:	80c080e7          	jalr	-2036(ra) # 80003e4c <mycpu>
    80005648:	fea910e3          	bne	s2,a0,80005628 <release+0x20>
    8000564c:	0004b823          	sd	zero,16(s1)
    80005650:	0ff0000f          	fence
    80005654:	0f50000f          	fence	iorw,ow
    80005658:	0804a02f          	amoswap.w	zero,zero,(s1)
    8000565c:	ffffe097          	auipc	ra,0xffffe
    80005660:	7f0080e7          	jalr	2032(ra) # 80003e4c <mycpu>
    80005664:	100027f3          	csrr	a5,sstatus
    80005668:	0027f793          	andi	a5,a5,2
    8000566c:	04079a63          	bnez	a5,800056c0 <release+0xb8>
    80005670:	07852783          	lw	a5,120(a0)
    80005674:	02f05e63          	blez	a5,800056b0 <release+0xa8>
    80005678:	fff7871b          	addiw	a4,a5,-1
    8000567c:	06e52c23          	sw	a4,120(a0)
    80005680:	00071c63          	bnez	a4,80005698 <release+0x90>
    80005684:	07c52783          	lw	a5,124(a0)
    80005688:	00078863          	beqz	a5,80005698 <release+0x90>
    8000568c:	100027f3          	csrr	a5,sstatus
    80005690:	0027e793          	ori	a5,a5,2
    80005694:	10079073          	csrw	sstatus,a5
    80005698:	01813083          	ld	ra,24(sp)
    8000569c:	01013403          	ld	s0,16(sp)
    800056a0:	00813483          	ld	s1,8(sp)
    800056a4:	00013903          	ld	s2,0(sp)
    800056a8:	02010113          	addi	sp,sp,32
    800056ac:	00008067          	ret
    800056b0:	00001517          	auipc	a0,0x1
    800056b4:	d4050513          	addi	a0,a0,-704 # 800063f0 <digits+0x48>
    800056b8:	fffff097          	auipc	ra,0xfffff
    800056bc:	154080e7          	jalr	340(ra) # 8000480c <panic>
    800056c0:	00001517          	auipc	a0,0x1
    800056c4:	d1850513          	addi	a0,a0,-744 # 800063d8 <digits+0x30>
    800056c8:	fffff097          	auipc	ra,0xfffff
    800056cc:	144080e7          	jalr	324(ra) # 8000480c <panic>

00000000800056d0 <holding>:
    800056d0:	00052783          	lw	a5,0(a0)
    800056d4:	00079663          	bnez	a5,800056e0 <holding+0x10>
    800056d8:	00000513          	li	a0,0
    800056dc:	00008067          	ret
    800056e0:	fe010113          	addi	sp,sp,-32
    800056e4:	00813823          	sd	s0,16(sp)
    800056e8:	00913423          	sd	s1,8(sp)
    800056ec:	00113c23          	sd	ra,24(sp)
    800056f0:	02010413          	addi	s0,sp,32
    800056f4:	01053483          	ld	s1,16(a0)
    800056f8:	ffffe097          	auipc	ra,0xffffe
    800056fc:	754080e7          	jalr	1876(ra) # 80003e4c <mycpu>
    80005700:	01813083          	ld	ra,24(sp)
    80005704:	01013403          	ld	s0,16(sp)
    80005708:	40a48533          	sub	a0,s1,a0
    8000570c:	00153513          	seqz	a0,a0
    80005710:	00813483          	ld	s1,8(sp)
    80005714:	02010113          	addi	sp,sp,32
    80005718:	00008067          	ret

000000008000571c <push_off>:
    8000571c:	fe010113          	addi	sp,sp,-32
    80005720:	00813823          	sd	s0,16(sp)
    80005724:	00113c23          	sd	ra,24(sp)
    80005728:	00913423          	sd	s1,8(sp)
    8000572c:	02010413          	addi	s0,sp,32
    80005730:	100024f3          	csrr	s1,sstatus
    80005734:	100027f3          	csrr	a5,sstatus
    80005738:	ffd7f793          	andi	a5,a5,-3
    8000573c:	10079073          	csrw	sstatus,a5
    80005740:	ffffe097          	auipc	ra,0xffffe
    80005744:	70c080e7          	jalr	1804(ra) # 80003e4c <mycpu>
    80005748:	07852783          	lw	a5,120(a0)
    8000574c:	02078663          	beqz	a5,80005778 <push_off+0x5c>
    80005750:	ffffe097          	auipc	ra,0xffffe
    80005754:	6fc080e7          	jalr	1788(ra) # 80003e4c <mycpu>
    80005758:	07852783          	lw	a5,120(a0)
    8000575c:	01813083          	ld	ra,24(sp)
    80005760:	01013403          	ld	s0,16(sp)
    80005764:	0017879b          	addiw	a5,a5,1
    80005768:	06f52c23          	sw	a5,120(a0)
    8000576c:	00813483          	ld	s1,8(sp)
    80005770:	02010113          	addi	sp,sp,32
    80005774:	00008067          	ret
    80005778:	0014d493          	srli	s1,s1,0x1
    8000577c:	ffffe097          	auipc	ra,0xffffe
    80005780:	6d0080e7          	jalr	1744(ra) # 80003e4c <mycpu>
    80005784:	0014f493          	andi	s1,s1,1
    80005788:	06952e23          	sw	s1,124(a0)
    8000578c:	fc5ff06f          	j	80005750 <push_off+0x34>

0000000080005790 <pop_off>:
    80005790:	ff010113          	addi	sp,sp,-16
    80005794:	00813023          	sd	s0,0(sp)
    80005798:	00113423          	sd	ra,8(sp)
    8000579c:	01010413          	addi	s0,sp,16
    800057a0:	ffffe097          	auipc	ra,0xffffe
    800057a4:	6ac080e7          	jalr	1708(ra) # 80003e4c <mycpu>
    800057a8:	100027f3          	csrr	a5,sstatus
    800057ac:	0027f793          	andi	a5,a5,2
    800057b0:	04079663          	bnez	a5,800057fc <pop_off+0x6c>
    800057b4:	07852783          	lw	a5,120(a0)
    800057b8:	02f05a63          	blez	a5,800057ec <pop_off+0x5c>
    800057bc:	fff7871b          	addiw	a4,a5,-1
    800057c0:	06e52c23          	sw	a4,120(a0)
    800057c4:	00071c63          	bnez	a4,800057dc <pop_off+0x4c>
    800057c8:	07c52783          	lw	a5,124(a0)
    800057cc:	00078863          	beqz	a5,800057dc <pop_off+0x4c>
    800057d0:	100027f3          	csrr	a5,sstatus
    800057d4:	0027e793          	ori	a5,a5,2
    800057d8:	10079073          	csrw	sstatus,a5
    800057dc:	00813083          	ld	ra,8(sp)
    800057e0:	00013403          	ld	s0,0(sp)
    800057e4:	01010113          	addi	sp,sp,16
    800057e8:	00008067          	ret
    800057ec:	00001517          	auipc	a0,0x1
    800057f0:	c0450513          	addi	a0,a0,-1020 # 800063f0 <digits+0x48>
    800057f4:	fffff097          	auipc	ra,0xfffff
    800057f8:	018080e7          	jalr	24(ra) # 8000480c <panic>
    800057fc:	00001517          	auipc	a0,0x1
    80005800:	bdc50513          	addi	a0,a0,-1060 # 800063d8 <digits+0x30>
    80005804:	fffff097          	auipc	ra,0xfffff
    80005808:	008080e7          	jalr	8(ra) # 8000480c <panic>

000000008000580c <push_on>:
    8000580c:	fe010113          	addi	sp,sp,-32
    80005810:	00813823          	sd	s0,16(sp)
    80005814:	00113c23          	sd	ra,24(sp)
    80005818:	00913423          	sd	s1,8(sp)
    8000581c:	02010413          	addi	s0,sp,32
    80005820:	100024f3          	csrr	s1,sstatus
    80005824:	100027f3          	csrr	a5,sstatus
    80005828:	0027e793          	ori	a5,a5,2
    8000582c:	10079073          	csrw	sstatus,a5
    80005830:	ffffe097          	auipc	ra,0xffffe
    80005834:	61c080e7          	jalr	1564(ra) # 80003e4c <mycpu>
    80005838:	07852783          	lw	a5,120(a0)
    8000583c:	02078663          	beqz	a5,80005868 <push_on+0x5c>
    80005840:	ffffe097          	auipc	ra,0xffffe
    80005844:	60c080e7          	jalr	1548(ra) # 80003e4c <mycpu>
    80005848:	07852783          	lw	a5,120(a0)
    8000584c:	01813083          	ld	ra,24(sp)
    80005850:	01013403          	ld	s0,16(sp)
    80005854:	0017879b          	addiw	a5,a5,1
    80005858:	06f52c23          	sw	a5,120(a0)
    8000585c:	00813483          	ld	s1,8(sp)
    80005860:	02010113          	addi	sp,sp,32
    80005864:	00008067          	ret
    80005868:	0014d493          	srli	s1,s1,0x1
    8000586c:	ffffe097          	auipc	ra,0xffffe
    80005870:	5e0080e7          	jalr	1504(ra) # 80003e4c <mycpu>
    80005874:	0014f493          	andi	s1,s1,1
    80005878:	06952e23          	sw	s1,124(a0)
    8000587c:	fc5ff06f          	j	80005840 <push_on+0x34>

0000000080005880 <pop_on>:
    80005880:	ff010113          	addi	sp,sp,-16
    80005884:	00813023          	sd	s0,0(sp)
    80005888:	00113423          	sd	ra,8(sp)
    8000588c:	01010413          	addi	s0,sp,16
    80005890:	ffffe097          	auipc	ra,0xffffe
    80005894:	5bc080e7          	jalr	1468(ra) # 80003e4c <mycpu>
    80005898:	100027f3          	csrr	a5,sstatus
    8000589c:	0027f793          	andi	a5,a5,2
    800058a0:	04078463          	beqz	a5,800058e8 <pop_on+0x68>
    800058a4:	07852783          	lw	a5,120(a0)
    800058a8:	02f05863          	blez	a5,800058d8 <pop_on+0x58>
    800058ac:	fff7879b          	addiw	a5,a5,-1
    800058b0:	06f52c23          	sw	a5,120(a0)
    800058b4:	07853783          	ld	a5,120(a0)
    800058b8:	00079863          	bnez	a5,800058c8 <pop_on+0x48>
    800058bc:	100027f3          	csrr	a5,sstatus
    800058c0:	ffd7f793          	andi	a5,a5,-3
    800058c4:	10079073          	csrw	sstatus,a5
    800058c8:	00813083          	ld	ra,8(sp)
    800058cc:	00013403          	ld	s0,0(sp)
    800058d0:	01010113          	addi	sp,sp,16
    800058d4:	00008067          	ret
    800058d8:	00001517          	auipc	a0,0x1
    800058dc:	b4050513          	addi	a0,a0,-1216 # 80006418 <digits+0x70>
    800058e0:	fffff097          	auipc	ra,0xfffff
    800058e4:	f2c080e7          	jalr	-212(ra) # 8000480c <panic>
    800058e8:	00001517          	auipc	a0,0x1
    800058ec:	b1050513          	addi	a0,a0,-1264 # 800063f8 <digits+0x50>
    800058f0:	fffff097          	auipc	ra,0xfffff
    800058f4:	f1c080e7          	jalr	-228(ra) # 8000480c <panic>

00000000800058f8 <__memset>:
    800058f8:	ff010113          	addi	sp,sp,-16
    800058fc:	00813423          	sd	s0,8(sp)
    80005900:	01010413          	addi	s0,sp,16
    80005904:	1a060e63          	beqz	a2,80005ac0 <__memset+0x1c8>
    80005908:	40a007b3          	neg	a5,a0
    8000590c:	0077f793          	andi	a5,a5,7
    80005910:	00778693          	addi	a3,a5,7
    80005914:	00b00813          	li	a6,11
    80005918:	0ff5f593          	andi	a1,a1,255
    8000591c:	fff6071b          	addiw	a4,a2,-1
    80005920:	1b06e663          	bltu	a3,a6,80005acc <__memset+0x1d4>
    80005924:	1cd76463          	bltu	a4,a3,80005aec <__memset+0x1f4>
    80005928:	1a078e63          	beqz	a5,80005ae4 <__memset+0x1ec>
    8000592c:	00b50023          	sb	a1,0(a0)
    80005930:	00100713          	li	a4,1
    80005934:	1ae78463          	beq	a5,a4,80005adc <__memset+0x1e4>
    80005938:	00b500a3          	sb	a1,1(a0)
    8000593c:	00200713          	li	a4,2
    80005940:	1ae78a63          	beq	a5,a4,80005af4 <__memset+0x1fc>
    80005944:	00b50123          	sb	a1,2(a0)
    80005948:	00300713          	li	a4,3
    8000594c:	18e78463          	beq	a5,a4,80005ad4 <__memset+0x1dc>
    80005950:	00b501a3          	sb	a1,3(a0)
    80005954:	00400713          	li	a4,4
    80005958:	1ae78263          	beq	a5,a4,80005afc <__memset+0x204>
    8000595c:	00b50223          	sb	a1,4(a0)
    80005960:	00500713          	li	a4,5
    80005964:	1ae78063          	beq	a5,a4,80005b04 <__memset+0x20c>
    80005968:	00b502a3          	sb	a1,5(a0)
    8000596c:	00700713          	li	a4,7
    80005970:	18e79e63          	bne	a5,a4,80005b0c <__memset+0x214>
    80005974:	00b50323          	sb	a1,6(a0)
    80005978:	00700e93          	li	t4,7
    8000597c:	00859713          	slli	a4,a1,0x8
    80005980:	00e5e733          	or	a4,a1,a4
    80005984:	01059e13          	slli	t3,a1,0x10
    80005988:	01c76e33          	or	t3,a4,t3
    8000598c:	01859313          	slli	t1,a1,0x18
    80005990:	006e6333          	or	t1,t3,t1
    80005994:	02059893          	slli	a7,a1,0x20
    80005998:	40f60e3b          	subw	t3,a2,a5
    8000599c:	011368b3          	or	a7,t1,a7
    800059a0:	02859813          	slli	a6,a1,0x28
    800059a4:	0108e833          	or	a6,a7,a6
    800059a8:	03059693          	slli	a3,a1,0x30
    800059ac:	003e589b          	srliw	a7,t3,0x3
    800059b0:	00d866b3          	or	a3,a6,a3
    800059b4:	03859713          	slli	a4,a1,0x38
    800059b8:	00389813          	slli	a6,a7,0x3
    800059bc:	00f507b3          	add	a5,a0,a5
    800059c0:	00e6e733          	or	a4,a3,a4
    800059c4:	000e089b          	sext.w	a7,t3
    800059c8:	00f806b3          	add	a3,a6,a5
    800059cc:	00e7b023          	sd	a4,0(a5)
    800059d0:	00878793          	addi	a5,a5,8
    800059d4:	fed79ce3          	bne	a5,a3,800059cc <__memset+0xd4>
    800059d8:	ff8e7793          	andi	a5,t3,-8
    800059dc:	0007871b          	sext.w	a4,a5
    800059e0:	01d787bb          	addw	a5,a5,t4
    800059e4:	0ce88e63          	beq	a7,a4,80005ac0 <__memset+0x1c8>
    800059e8:	00f50733          	add	a4,a0,a5
    800059ec:	00b70023          	sb	a1,0(a4)
    800059f0:	0017871b          	addiw	a4,a5,1
    800059f4:	0cc77663          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    800059f8:	00e50733          	add	a4,a0,a4
    800059fc:	00b70023          	sb	a1,0(a4)
    80005a00:	0027871b          	addiw	a4,a5,2
    80005a04:	0ac77e63          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a08:	00e50733          	add	a4,a0,a4
    80005a0c:	00b70023          	sb	a1,0(a4)
    80005a10:	0037871b          	addiw	a4,a5,3
    80005a14:	0ac77663          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a18:	00e50733          	add	a4,a0,a4
    80005a1c:	00b70023          	sb	a1,0(a4)
    80005a20:	0047871b          	addiw	a4,a5,4
    80005a24:	08c77e63          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a28:	00e50733          	add	a4,a0,a4
    80005a2c:	00b70023          	sb	a1,0(a4)
    80005a30:	0057871b          	addiw	a4,a5,5
    80005a34:	08c77663          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a38:	00e50733          	add	a4,a0,a4
    80005a3c:	00b70023          	sb	a1,0(a4)
    80005a40:	0067871b          	addiw	a4,a5,6
    80005a44:	06c77e63          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a48:	00e50733          	add	a4,a0,a4
    80005a4c:	00b70023          	sb	a1,0(a4)
    80005a50:	0077871b          	addiw	a4,a5,7
    80005a54:	06c77663          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a58:	00e50733          	add	a4,a0,a4
    80005a5c:	00b70023          	sb	a1,0(a4)
    80005a60:	0087871b          	addiw	a4,a5,8
    80005a64:	04c77e63          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a68:	00e50733          	add	a4,a0,a4
    80005a6c:	00b70023          	sb	a1,0(a4)
    80005a70:	0097871b          	addiw	a4,a5,9
    80005a74:	04c77663          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a78:	00e50733          	add	a4,a0,a4
    80005a7c:	00b70023          	sb	a1,0(a4)
    80005a80:	00a7871b          	addiw	a4,a5,10
    80005a84:	02c77e63          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a88:	00e50733          	add	a4,a0,a4
    80005a8c:	00b70023          	sb	a1,0(a4)
    80005a90:	00b7871b          	addiw	a4,a5,11
    80005a94:	02c77663          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005a98:	00e50733          	add	a4,a0,a4
    80005a9c:	00b70023          	sb	a1,0(a4)
    80005aa0:	00c7871b          	addiw	a4,a5,12
    80005aa4:	00c77e63          	bgeu	a4,a2,80005ac0 <__memset+0x1c8>
    80005aa8:	00e50733          	add	a4,a0,a4
    80005aac:	00b70023          	sb	a1,0(a4)
    80005ab0:	00d7879b          	addiw	a5,a5,13
    80005ab4:	00c7f663          	bgeu	a5,a2,80005ac0 <__memset+0x1c8>
    80005ab8:	00f507b3          	add	a5,a0,a5
    80005abc:	00b78023          	sb	a1,0(a5)
    80005ac0:	00813403          	ld	s0,8(sp)
    80005ac4:	01010113          	addi	sp,sp,16
    80005ac8:	00008067          	ret
    80005acc:	00b00693          	li	a3,11
    80005ad0:	e55ff06f          	j	80005924 <__memset+0x2c>
    80005ad4:	00300e93          	li	t4,3
    80005ad8:	ea5ff06f          	j	8000597c <__memset+0x84>
    80005adc:	00100e93          	li	t4,1
    80005ae0:	e9dff06f          	j	8000597c <__memset+0x84>
    80005ae4:	00000e93          	li	t4,0
    80005ae8:	e95ff06f          	j	8000597c <__memset+0x84>
    80005aec:	00000793          	li	a5,0
    80005af0:	ef9ff06f          	j	800059e8 <__memset+0xf0>
    80005af4:	00200e93          	li	t4,2
    80005af8:	e85ff06f          	j	8000597c <__memset+0x84>
    80005afc:	00400e93          	li	t4,4
    80005b00:	e7dff06f          	j	8000597c <__memset+0x84>
    80005b04:	00500e93          	li	t4,5
    80005b08:	e75ff06f          	j	8000597c <__memset+0x84>
    80005b0c:	00600e93          	li	t4,6
    80005b10:	e6dff06f          	j	8000597c <__memset+0x84>

0000000080005b14 <__memmove>:
    80005b14:	ff010113          	addi	sp,sp,-16
    80005b18:	00813423          	sd	s0,8(sp)
    80005b1c:	01010413          	addi	s0,sp,16
    80005b20:	0e060863          	beqz	a2,80005c10 <__memmove+0xfc>
    80005b24:	fff6069b          	addiw	a3,a2,-1
    80005b28:	0006881b          	sext.w	a6,a3
    80005b2c:	0ea5e863          	bltu	a1,a0,80005c1c <__memmove+0x108>
    80005b30:	00758713          	addi	a4,a1,7
    80005b34:	00a5e7b3          	or	a5,a1,a0
    80005b38:	40a70733          	sub	a4,a4,a0
    80005b3c:	0077f793          	andi	a5,a5,7
    80005b40:	00f73713          	sltiu	a4,a4,15
    80005b44:	00174713          	xori	a4,a4,1
    80005b48:	0017b793          	seqz	a5,a5
    80005b4c:	00e7f7b3          	and	a5,a5,a4
    80005b50:	10078863          	beqz	a5,80005c60 <__memmove+0x14c>
    80005b54:	00900793          	li	a5,9
    80005b58:	1107f463          	bgeu	a5,a6,80005c60 <__memmove+0x14c>
    80005b5c:	0036581b          	srliw	a6,a2,0x3
    80005b60:	fff8081b          	addiw	a6,a6,-1
    80005b64:	02081813          	slli	a6,a6,0x20
    80005b68:	01d85893          	srli	a7,a6,0x1d
    80005b6c:	00858813          	addi	a6,a1,8
    80005b70:	00058793          	mv	a5,a1
    80005b74:	00050713          	mv	a4,a0
    80005b78:	01088833          	add	a6,a7,a6
    80005b7c:	0007b883          	ld	a7,0(a5)
    80005b80:	00878793          	addi	a5,a5,8
    80005b84:	00870713          	addi	a4,a4,8
    80005b88:	ff173c23          	sd	a7,-8(a4)
    80005b8c:	ff0798e3          	bne	a5,a6,80005b7c <__memmove+0x68>
    80005b90:	ff867713          	andi	a4,a2,-8
    80005b94:	02071793          	slli	a5,a4,0x20
    80005b98:	0207d793          	srli	a5,a5,0x20
    80005b9c:	00f585b3          	add	a1,a1,a5
    80005ba0:	40e686bb          	subw	a3,a3,a4
    80005ba4:	00f507b3          	add	a5,a0,a5
    80005ba8:	06e60463          	beq	a2,a4,80005c10 <__memmove+0xfc>
    80005bac:	0005c703          	lbu	a4,0(a1)
    80005bb0:	00e78023          	sb	a4,0(a5)
    80005bb4:	04068e63          	beqz	a3,80005c10 <__memmove+0xfc>
    80005bb8:	0015c603          	lbu	a2,1(a1)
    80005bbc:	00100713          	li	a4,1
    80005bc0:	00c780a3          	sb	a2,1(a5)
    80005bc4:	04e68663          	beq	a3,a4,80005c10 <__memmove+0xfc>
    80005bc8:	0025c603          	lbu	a2,2(a1)
    80005bcc:	00200713          	li	a4,2
    80005bd0:	00c78123          	sb	a2,2(a5)
    80005bd4:	02e68e63          	beq	a3,a4,80005c10 <__memmove+0xfc>
    80005bd8:	0035c603          	lbu	a2,3(a1)
    80005bdc:	00300713          	li	a4,3
    80005be0:	00c781a3          	sb	a2,3(a5)
    80005be4:	02e68663          	beq	a3,a4,80005c10 <__memmove+0xfc>
    80005be8:	0045c603          	lbu	a2,4(a1)
    80005bec:	00400713          	li	a4,4
    80005bf0:	00c78223          	sb	a2,4(a5)
    80005bf4:	00e68e63          	beq	a3,a4,80005c10 <__memmove+0xfc>
    80005bf8:	0055c603          	lbu	a2,5(a1)
    80005bfc:	00500713          	li	a4,5
    80005c00:	00c782a3          	sb	a2,5(a5)
    80005c04:	00e68663          	beq	a3,a4,80005c10 <__memmove+0xfc>
    80005c08:	0065c703          	lbu	a4,6(a1)
    80005c0c:	00e78323          	sb	a4,6(a5)
    80005c10:	00813403          	ld	s0,8(sp)
    80005c14:	01010113          	addi	sp,sp,16
    80005c18:	00008067          	ret
    80005c1c:	02061713          	slli	a4,a2,0x20
    80005c20:	02075713          	srli	a4,a4,0x20
    80005c24:	00e587b3          	add	a5,a1,a4
    80005c28:	f0f574e3          	bgeu	a0,a5,80005b30 <__memmove+0x1c>
    80005c2c:	02069613          	slli	a2,a3,0x20
    80005c30:	02065613          	srli	a2,a2,0x20
    80005c34:	fff64613          	not	a2,a2
    80005c38:	00e50733          	add	a4,a0,a4
    80005c3c:	00c78633          	add	a2,a5,a2
    80005c40:	fff7c683          	lbu	a3,-1(a5)
    80005c44:	fff78793          	addi	a5,a5,-1
    80005c48:	fff70713          	addi	a4,a4,-1
    80005c4c:	00d70023          	sb	a3,0(a4)
    80005c50:	fec798e3          	bne	a5,a2,80005c40 <__memmove+0x12c>
    80005c54:	00813403          	ld	s0,8(sp)
    80005c58:	01010113          	addi	sp,sp,16
    80005c5c:	00008067          	ret
    80005c60:	02069713          	slli	a4,a3,0x20
    80005c64:	02075713          	srli	a4,a4,0x20
    80005c68:	00170713          	addi	a4,a4,1
    80005c6c:	00e50733          	add	a4,a0,a4
    80005c70:	00050793          	mv	a5,a0
    80005c74:	0005c683          	lbu	a3,0(a1)
    80005c78:	00178793          	addi	a5,a5,1
    80005c7c:	00158593          	addi	a1,a1,1
    80005c80:	fed78fa3          	sb	a3,-1(a5)
    80005c84:	fee798e3          	bne	a5,a4,80005c74 <__memmove+0x160>
    80005c88:	f89ff06f          	j	80005c10 <__memmove+0xfc>

0000000080005c8c <__putc>:
    80005c8c:	fe010113          	addi	sp,sp,-32
    80005c90:	00813823          	sd	s0,16(sp)
    80005c94:	00113c23          	sd	ra,24(sp)
    80005c98:	02010413          	addi	s0,sp,32
    80005c9c:	00050793          	mv	a5,a0
    80005ca0:	fef40593          	addi	a1,s0,-17
    80005ca4:	00100613          	li	a2,1
    80005ca8:	00000513          	li	a0,0
    80005cac:	fef407a3          	sb	a5,-17(s0)
    80005cb0:	fffff097          	auipc	ra,0xfffff
    80005cb4:	b3c080e7          	jalr	-1220(ra) # 800047ec <console_write>
    80005cb8:	01813083          	ld	ra,24(sp)
    80005cbc:	01013403          	ld	s0,16(sp)
    80005cc0:	02010113          	addi	sp,sp,32
    80005cc4:	00008067          	ret

0000000080005cc8 <__getc>:
    80005cc8:	fe010113          	addi	sp,sp,-32
    80005ccc:	00813823          	sd	s0,16(sp)
    80005cd0:	00113c23          	sd	ra,24(sp)
    80005cd4:	02010413          	addi	s0,sp,32
    80005cd8:	fe840593          	addi	a1,s0,-24
    80005cdc:	00100613          	li	a2,1
    80005ce0:	00000513          	li	a0,0
    80005ce4:	fffff097          	auipc	ra,0xfffff
    80005ce8:	ae8080e7          	jalr	-1304(ra) # 800047cc <console_read>
    80005cec:	fe844503          	lbu	a0,-24(s0)
    80005cf0:	01813083          	ld	ra,24(sp)
    80005cf4:	01013403          	ld	s0,16(sp)
    80005cf8:	02010113          	addi	sp,sp,32
    80005cfc:	00008067          	ret

0000000080005d00 <console_handler>:
    80005d00:	fe010113          	addi	sp,sp,-32
    80005d04:	00813823          	sd	s0,16(sp)
    80005d08:	00113c23          	sd	ra,24(sp)
    80005d0c:	00913423          	sd	s1,8(sp)
    80005d10:	02010413          	addi	s0,sp,32
    80005d14:	14202773          	csrr	a4,scause
    80005d18:	100027f3          	csrr	a5,sstatus
    80005d1c:	0027f793          	andi	a5,a5,2
    80005d20:	06079e63          	bnez	a5,80005d9c <console_handler+0x9c>
    80005d24:	00074c63          	bltz	a4,80005d3c <console_handler+0x3c>
    80005d28:	01813083          	ld	ra,24(sp)
    80005d2c:	01013403          	ld	s0,16(sp)
    80005d30:	00813483          	ld	s1,8(sp)
    80005d34:	02010113          	addi	sp,sp,32
    80005d38:	00008067          	ret
    80005d3c:	0ff77713          	andi	a4,a4,255
    80005d40:	00900793          	li	a5,9
    80005d44:	fef712e3          	bne	a4,a5,80005d28 <console_handler+0x28>
    80005d48:	ffffe097          	auipc	ra,0xffffe
    80005d4c:	6dc080e7          	jalr	1756(ra) # 80004424 <plic_claim>
    80005d50:	00a00793          	li	a5,10
    80005d54:	00050493          	mv	s1,a0
    80005d58:	02f50c63          	beq	a0,a5,80005d90 <console_handler+0x90>
    80005d5c:	fc0506e3          	beqz	a0,80005d28 <console_handler+0x28>
    80005d60:	00050593          	mv	a1,a0
    80005d64:	00000517          	auipc	a0,0x0
    80005d68:	5bc50513          	addi	a0,a0,1468 # 80006320 <CONSOLE_STATUS+0x310>
    80005d6c:	fffff097          	auipc	ra,0xfffff
    80005d70:	afc080e7          	jalr	-1284(ra) # 80004868 <__printf>
    80005d74:	01013403          	ld	s0,16(sp)
    80005d78:	01813083          	ld	ra,24(sp)
    80005d7c:	00048513          	mv	a0,s1
    80005d80:	00813483          	ld	s1,8(sp)
    80005d84:	02010113          	addi	sp,sp,32
    80005d88:	ffffe317          	auipc	t1,0xffffe
    80005d8c:	6d430067          	jr	1748(t1) # 8000445c <plic_complete>
    80005d90:	fffff097          	auipc	ra,0xfffff
    80005d94:	3e0080e7          	jalr	992(ra) # 80005170 <uartintr>
    80005d98:	fddff06f          	j	80005d74 <console_handler+0x74>
    80005d9c:	00000517          	auipc	a0,0x0
    80005da0:	68450513          	addi	a0,a0,1668 # 80006420 <digits+0x78>
    80005da4:	fffff097          	auipc	ra,0xfffff
    80005da8:	a68080e7          	jalr	-1432(ra) # 8000480c <panic>
	...
