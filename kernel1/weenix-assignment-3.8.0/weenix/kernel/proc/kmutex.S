	.file	"kmutex.c"
	.text
.Ltext0:
	.type	equals, @function
equals:
.LFB0:
	.file 1 "include/util/debug.h"
	.loc 1 235 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 1 235 0
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	sete	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	equals, .-equals
	.type	notequals, @function
notequals:
.LFB1:
	.loc 1 236 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 1 236 0
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	setne	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	notequals, .-notequals
	.type	lessthan, @function
lessthan:
.LFB2:
	.loc 1 237 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 1 237 0
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	setl	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	lessthan, .-lessthan
	.type	greaterthan, @function
greaterthan:
.LFB3:
	.loc 1 238 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 1 238 0
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	setg	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	greaterthan, .-greaterthan
	.type	lessthaneq, @function
lessthaneq:
.LFB4:
	.loc 1 239 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 1 239 0
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	setle	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE4:
	.size	lessthaneq, .-lessthaneq
	.type	greaterthaneq, @function
greaterthaneq:
.LFB5:
	.loc 1 240 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 1 240 0
	movl	8(%ebp), %eax
	cmpl	12(%ebp), %eax
	setge	%al
	movzbl	%al, %eax
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	greaterthaneq, .-greaterthaneq
	.section	.rodata
.LC0:
	.string	"proc/kmutex.c"
.LC1:
	.string	"PROCS: kmutex_init"
	.align 4
.LC2:
	.string	"Not yet implemented: %s, file %s, line %d\n"
	.text
	.globl	kmutex_init
	.type	kmutex_init, @function
kmutex_init:
.LFB6:
	.file 2 "proc/kmutex.c"
	.loc 2 35 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 2 36 0
	movl	$36, 12(%esp)
	leal	.LC0@GOTOFF(%eax), %edx
	movl	%edx, 8(%esp)
	leal	.LC1@GOTOFF(%eax), %edx
	movl	%edx, 4(%esp)
	leal	.LC2@GOTOFF(%eax), %edx
	movl	%edx, (%esp)
	movl	%eax, %ebx
	call	dbg_print@PLT
	.loc 2 37 0
	nop
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE6:
	.size	kmutex_init, .-kmutex_init
	.section	.rodata
.LC3:
	.string	"PROCS: kmutex_lock"
	.text
	.globl	kmutex_lock
	.type	kmutex_lock, @function
kmutex_lock:
.LFB7:
	.loc 2 47 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 2 48 0
	movl	$48, 12(%esp)
	leal	.LC0@GOTOFF(%eax), %edx
	movl	%edx, 8(%esp)
	leal	.LC3@GOTOFF(%eax), %edx
	movl	%edx, 4(%esp)
	leal	.LC2@GOTOFF(%eax), %edx
	movl	%edx, (%esp)
	movl	%eax, %ebx
	call	dbg_print@PLT
	.loc 2 49 0
	nop
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE7:
	.size	kmutex_lock, .-kmutex_lock
	.section	.rodata
	.align 4
.LC4:
	.string	"PROCS: kmutex_lock_cancellable"
	.text
	.globl	kmutex_lock_cancellable
	.type	kmutex_lock_cancellable, @function
kmutex_lock_cancellable:
.LFB8:
	.loc 2 57 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 2 58 0
	movl	$58, 12(%esp)
	leal	.LC0@GOTOFF(%eax), %edx
	movl	%edx, 8(%esp)
	leal	.LC4@GOTOFF(%eax), %edx
	movl	%edx, 4(%esp)
	leal	.LC2@GOTOFF(%eax), %edx
	movl	%edx, (%esp)
	movl	%eax, %ebx
	call	dbg_print@PLT
	.loc 2 59 0
	movl	$0, %eax
	.loc 2 60 0
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE8:
	.size	kmutex_lock_cancellable, .-kmutex_lock_cancellable
	.section	.rodata
.LC5:
	.string	"PROCS: kmutex_unlock"
	.text
	.globl	kmutex_unlock
	.type	kmutex_unlock, @function
kmutex_unlock:
.LFB9:
	.loc 2 77 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	pushl	%ebx
	subl	$20, %esp
	.cfi_offset 3, -12
	call	__x86.get_pc_thunk.ax
	addl	$_GLOBAL_OFFSET_TABLE_, %eax
	.loc 2 78 0
	movl	$78, 12(%esp)
	leal	.LC0@GOTOFF(%eax), %edx
	movl	%edx, 8(%esp)
	leal	.LC5@GOTOFF(%eax), %edx
	movl	%edx, 4(%esp)
	leal	.LC2@GOTOFF(%eax), %edx
	movl	%edx, (%esp)
	movl	%eax, %ebx
	call	dbg_print@PLT
	.loc 2 79 0
	nop
	addl	$20, %esp
	popl	%ebx
	.cfi_restore 3
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	kmutex_unlock, .-kmutex_unlock
	.section	.text.__x86.get_pc_thunk.ax,"axG",@progbits,__x86.get_pc_thunk.ax,comdat
	.globl	__x86.get_pc_thunk.ax
	.hidden	__x86.get_pc_thunk.ax
	.type	__x86.get_pc_thunk.ax, @function
__x86.get_pc_thunk.ax:
.LFB10:
	.cfi_startproc
	movl	(%esp), %eax
	ret
	.cfi_endproc
.LFE10:
	.text
.Letext0:
	.file 3 "include/types.h"
	.file 4 "include/kernel.h"
	.file 5 "include/util/list.h"
	.file 6 "include/proc/sched.h"
	.file 7 "include/mm/pagetable.h"
	.file 8 "include/proc/context.h"
	.file 9 "include/proc/kthread.h"
	.file 10 "include/proc/proc.h"
	.file 11 "include/vm/vmmap.h"
	.file 12 "include/globals.h"
	.file 13 "include/proc/kmutex.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x6ab
	.value	0x3
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF716
	.byte	0xc
	.long	.LASF717
	.long	.LASF718
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.long	.Ldebug_macro0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF613
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF614
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF615
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF616
	.uleb128 0x3
	.long	.LASF617
	.byte	0x3
	.byte	0x1d
	.long	0x50
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF618
	.byte	0x3
	.byte	0x1e
	.long	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF619
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF620
	.uleb128 0x3
	.long	.LASF621
	.byte	0x3
	.byte	0x21
	.long	0x7b
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF622
	.uleb128 0x3
	.long	.LASF623
	.byte	0x3
	.byte	0x23
	.long	0x62
	.uleb128 0x3
	.long	.LASF624
	.byte	0x3
	.byte	0x2b
	.long	0x57
	.uleb128 0x3
	.long	.LASF625
	.byte	0x3
	.byte	0x2f
	.long	0x45
	.uleb128 0x5
	.long	.LASF626
	.byte	0x4
	.byte	0x1e
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x6
	.byte	0x4
	.uleb128 0x5
	.long	.LASF627
	.byte	0x4
	.byte	0x1f
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF628
	.byte	0x4
	.byte	0x20
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF629
	.byte	0x4
	.byte	0x21
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF630
	.byte	0x4
	.byte	0x22
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF631
	.byte	0x4
	.byte	0x23
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF632
	.byte	0x4
	.byte	0x24
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF633
	.byte	0x4
	.byte	0x25
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF634
	.byte	0x4
	.byte	0x26
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF635
	.byte	0x4
	.byte	0x27
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x5
	.long	.LASF636
	.byte	0x4
	.byte	0x28
	.long	0xb0
	.byte	0x1
	.byte	0x1
	.uleb128 0x7
	.long	.LASF641
	.byte	0x8
	.byte	0x5
	.byte	0x45
	.long	0x159
	.uleb128 0x8
	.long	.LASF637
	.byte	0x5
	.byte	0x46
	.long	0x159
	.byte	0
	.uleb128 0x8
	.long	.LASF638
	.byte	0x5
	.byte	0x47
	.long	0x159
	.byte	0x4
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x134
	.uleb128 0x3
	.long	.LASF639
	.byte	0x5
	.byte	0x48
	.long	0x134
	.uleb128 0x3
	.long	.LASF640
	.byte	0x5
	.byte	0x48
	.long	0x134
	.uleb128 0x7
	.long	.LASF642
	.byte	0xc
	.byte	0x6
	.byte	0x18
	.long	0x19a
	.uleb128 0x8
	.long	.LASF643
	.byte	0x6
	.byte	0x19
	.long	0x15f
	.byte	0
	.uleb128 0x8
	.long	.LASF644
	.byte	0x6
	.byte	0x1a
	.long	0x50
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF645
	.byte	0x6
	.byte	0x1b
	.long	0x175
	.uleb128 0x3
	.long	.LASF646
	.byte	0x7
	.byte	0x29
	.long	0x1b0
	.uleb128 0xa
	.long	.LASF697
	.byte	0x1
	.uleb128 0x7
	.long	.LASF647
	.byte	0x18
	.byte	0x8
	.byte	0x1f
	.long	0x20b
	.uleb128 0x8
	.long	.LASF648
	.byte	0x8
	.byte	0x20
	.long	0x57
	.byte	0
	.uleb128 0x8
	.long	.LASF649
	.byte	0x8
	.byte	0x21
	.long	0x57
	.byte	0x4
	.uleb128 0x8
	.long	.LASF650
	.byte	0x8
	.byte	0x22
	.long	0x57
	.byte	0x8
	.uleb128 0x8
	.long	.LASF651
	.byte	0x8
	.byte	0x24
	.long	0x20b
	.byte	0xc
	.uleb128 0x8
	.long	.LASF652
	.byte	0x8
	.byte	0x26
	.long	0x82
	.byte	0x10
	.uleb128 0x8
	.long	.LASF653
	.byte	0x8
	.byte	0x27
	.long	0x8d
	.byte	0x14
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x1a5
	.uleb128 0x3
	.long	.LASF654
	.byte	0x8
	.byte	0x28
	.long	0x1b6
	.uleb128 0xb
	.byte	0x7
	.byte	0x4
	.long	0x62
	.byte	0x9
	.byte	0x23
	.long	0x248
	.uleb128 0xc
	.long	.LASF655
	.byte	0
	.uleb128 0xc
	.long	.LASF656
	.byte	0x1
	.uleb128 0xc
	.long	.LASF657
	.byte	0x2
	.uleb128 0xc
	.long	.LASF658
	.byte	0x3
	.uleb128 0xc
	.long	.LASF659
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.long	.LASF660
	.byte	0x9
	.byte	0x29
	.long	0x21c
	.uleb128 0x7
	.long	.LASF661
	.byte	0x44
	.byte	0x9
	.byte	0x2c
	.long	0x2d8
	.uleb128 0x8
	.long	.LASF662
	.byte	0x9
	.byte	0x2d
	.long	0x211
	.byte	0
	.uleb128 0x8
	.long	.LASF663
	.byte	0x9
	.byte	0x2e
	.long	0x2d8
	.byte	0x18
	.uleb128 0x8
	.long	.LASF664
	.byte	0x9
	.byte	0x2f
	.long	0xb0
	.byte	0x1c
	.uleb128 0x8
	.long	.LASF665
	.byte	0x9
	.byte	0x30
	.long	0x50
	.byte	0x20
	.uleb128 0x8
	.long	.LASF666
	.byte	0x9
	.byte	0x31
	.long	0x3c1
	.byte	0x24
	.uleb128 0x8
	.long	.LASF667
	.byte	0x9
	.byte	0x33
	.long	0x50
	.byte	0x28
	.uleb128 0x8
	.long	.LASF668
	.byte	0x9
	.byte	0x34
	.long	0x3c7
	.byte	0x2c
	.uleb128 0x8
	.long	.LASF669
	.byte	0x9
	.byte	0x35
	.long	0x248
	.byte	0x30
	.uleb128 0x8
	.long	.LASF670
	.byte	0x9
	.byte	0x3c
	.long	0x16a
	.byte	0x34
	.uleb128 0x8
	.long	.LASF671
	.byte	0x9
	.byte	0x3d
	.long	0x16a
	.byte	0x3c
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x2de
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF672
	.uleb128 0xd
	.long	.LASF673
	.value	0x1d0
	.byte	0xa
	.byte	0x2b
	.long	0x3c1
	.uleb128 0x8
	.long	.LASF674
	.byte	0xa
	.byte	0x2c
	.long	0x98
	.byte	0
	.uleb128 0x8
	.long	.LASF675
	.byte	0xa
	.byte	0x2d
	.long	0x428
	.byte	0x4
	.uleb128 0xe
	.long	.LASF676
	.byte	0xa
	.byte	0x2f
	.long	0x15f
	.value	0x104
	.uleb128 0xe
	.long	.LASF677
	.byte	0xa
	.byte	0x30
	.long	0x15f
	.value	0x10c
	.uleb128 0xe
	.long	.LASF678
	.byte	0xa
	.byte	0x31
	.long	0x3c1
	.value	0x114
	.uleb128 0xe
	.long	.LASF679
	.byte	0xa
	.byte	0x33
	.long	0x50
	.value	0x118
	.uleb128 0xe
	.long	.LASF680
	.byte	0xa
	.byte	0x34
	.long	0x41d
	.value	0x11c
	.uleb128 0xe
	.long	.LASF681
	.byte	0xa
	.byte	0x3d
	.long	0x19a
	.value	0x120
	.uleb128 0xe
	.long	.LASF682
	.byte	0xa
	.byte	0x3f
	.long	0x20b
	.value	0x12c
	.uleb128 0xe
	.long	.LASF683
	.byte	0xa
	.byte	0x41
	.long	0x16a
	.value	0x130
	.uleb128 0xe
	.long	.LASF684
	.byte	0xa
	.byte	0x42
	.long	0x16a
	.value	0x138
	.uleb128 0xe
	.long	.LASF685
	.byte	0xa
	.byte	0x45
	.long	0x438
	.value	0x140
	.uleb128 0xe
	.long	.LASF686
	.byte	0xa
	.byte	0x46
	.long	0x45a
	.value	0x1c0
	.uleb128 0xe
	.long	.LASF687
	.byte	0xa
	.byte	0x49
	.long	0xb0
	.value	0x1c4
	.uleb128 0xe
	.long	.LASF688
	.byte	0xa
	.byte	0x4a
	.long	0xb0
	.value	0x1c8
	.uleb128 0xe
	.long	.LASF689
	.byte	0xa
	.byte	0x4b
	.long	0x3fd
	.value	0x1cc
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x2e5
	.uleb128 0x9
	.byte	0x4
	.long	0x19a
	.uleb128 0x3
	.long	.LASF690
	.byte	0x9
	.byte	0x42
	.long	0x253
	.uleb128 0x7
	.long	.LASF691
	.byte	0xc
	.byte	0xb
	.byte	0x20
	.long	0x3fd
	.uleb128 0x8
	.long	.LASF692
	.byte	0xb
	.byte	0x21
	.long	0x15f
	.byte	0
	.uleb128 0x8
	.long	.LASF693
	.byte	0xb
	.byte	0x22
	.long	0x3c1
	.byte	0x8
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x3d8
	.uleb128 0xb
	.byte	0x7
	.byte	0x4
	.long	0x62
	.byte	0xa
	.byte	0x26
	.long	0x41d
	.uleb128 0xc
	.long	.LASF694
	.byte	0
	.uleb128 0xc
	.long	.LASF695
	.byte	0x1
	.byte	0
	.uleb128 0x3
	.long	.LASF696
	.byte	0xa
	.byte	0x29
	.long	0x403
	.uleb128 0xf
	.long	0x2de
	.long	0x438
	.uleb128 0x10
	.long	0x62
	.byte	0xff
	.byte	0
	.uleb128 0xf
	.long	0x448
	.long	0x448
	.uleb128 0x10
	.long	0x62
	.byte	0x1f
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x44e
	.uleb128 0xa
	.long	.LASF698
	.byte	0x1
	.uleb128 0xa
	.long	.LASF699
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x454
	.uleb128 0x3
	.long	.LASF700
	.byte	0xa
	.byte	0x4e
	.long	0x2e5
	.uleb128 0x5
	.long	.LASF701
	.byte	0xc
	.byte	0x18
	.long	0x478
	.byte	0x1
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x3cd
	.uleb128 0x5
	.long	.LASF702
	.byte	0xc
	.byte	0x19
	.long	0x48b
	.byte	0x1
	.byte	0x1
	.uleb128 0x9
	.byte	0x4
	.long	0x460
	.uleb128 0x5
	.long	.LASF703
	.byte	0x1
	.byte	0xa3
	.long	0x70
	.byte	0x1
	.byte	0x1
	.uleb128 0x7
	.long	.LASF704
	.byte	0x10
	.byte	0xd
	.byte	0x17
	.long	0x4c3
	.uleb128 0x8
	.long	.LASF705
	.byte	0xd
	.byte	0x18
	.long	0x19a
	.byte	0
	.uleb128 0x8
	.long	.LASF706
	.byte	0xd
	.byte	0x19
	.long	0x4c3
	.byte	0xc
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x253
	.uleb128 0x3
	.long	.LASF707
	.byte	0xd
	.byte	0x1a
	.long	0x49e
	.uleb128 0x11
	.byte	0x1
	.long	.LASF708
	.byte	0x2
	.byte	0x4c
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x4fb
	.uleb128 0x12
	.string	"mtx"
	.byte	0x2
	.byte	0x4c
	.long	0x4fb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x9
	.byte	0x4
	.long	0x4c9
	.uleb128 0x13
	.byte	0x1
	.long	.LASF719
	.byte	0x2
	.byte	0x38
	.byte	0x1
	.long	0x50
	.long	.LFB8
	.long	.LFE8
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x52c
	.uleb128 0x12
	.string	"mtx"
	.byte	0x2
	.byte	0x38
	.long	0x4fb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF709
	.byte	0x2
	.byte	0x2e
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x553
	.uleb128 0x12
	.string	"mtx"
	.byte	0x2
	.byte	0x2e
	.long	0x4fb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF710
	.byte	0x2
	.byte	0x22
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x57a
	.uleb128 0x12
	.string	"mtx"
	.byte	0x2
	.byte	0x22
	.long	0x4fb
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x14
	.long	.LASF711
	.byte	0x1
	.byte	0xf0
	.byte	0x1
	.long	0x50
	.long	.LFB5
	.long	.LFE5
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x5ae
	.uleb128 0x12
	.string	"l"
	.byte	0x1
	.byte	0xf0
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.string	"r"
	.byte	0x1
	.byte	0xf0
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x14
	.long	.LASF712
	.byte	0x1
	.byte	0xef
	.byte	0x1
	.long	0x50
	.long	.LFB4
	.long	.LFE4
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x5e2
	.uleb128 0x12
	.string	"l"
	.byte	0x1
	.byte	0xef
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.string	"r"
	.byte	0x1
	.byte	0xef
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x14
	.long	.LASF713
	.byte	0x1
	.byte	0xee
	.byte	0x1
	.long	0x50
	.long	.LFB3
	.long	.LFE3
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x616
	.uleb128 0x12
	.string	"l"
	.byte	0x1
	.byte	0xee
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.string	"r"
	.byte	0x1
	.byte	0xee
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x14
	.long	.LASF714
	.byte	0x1
	.byte	0xed
	.byte	0x1
	.long	0x50
	.long	.LFB2
	.long	.LFE2
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x64a
	.uleb128 0x12
	.string	"l"
	.byte	0x1
	.byte	0xed
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.string	"r"
	.byte	0x1
	.byte	0xed
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x14
	.long	.LASF715
	.byte	0x1
	.byte	0xec
	.byte	0x1
	.long	0x50
	.long	.LFB1
	.long	.LFE1
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.long	0x67e
	.uleb128 0x12
	.string	"l"
	.byte	0x1
	.byte	0xec
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.string	"r"
	.byte	0x1
	.byte	0xec
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.uleb128 0x15
	.long	.LASF720
	.byte	0x1
	.byte	0xeb
	.byte	0x1
	.long	0x50
	.long	.LFB0
	.long	.LFE0
	.byte	0x1
	.byte	0x9c
	.byte	0x1
	.uleb128 0x12
	.string	"l"
	.byte	0x1
	.byte	0xeb
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x12
	.string	"r"
	.byte	0x1
	.byte	0xeb
	.long	0x50
	.byte	0x2
	.byte	0x91
	.sleb128 4
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.uleb128 0x2119
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0x5
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2116
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_macro,"",@progbits
.Ldebug_macro0:
	.value	0x4
	.byte	0x2
	.long	.Ldebug_line0
	.byte	0x7
	.long	.Ldebug_macro1
	.byte	0x3
	.uleb128 0
	.uleb128 0x2
	.byte	0x3
	.uleb128 0x13
	.uleb128 0xc
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x9
	.byte	0x3
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x4
	.byte	0x3
	.uleb128 0x15
	.uleb128 0x3
	.byte	0x5
	.uleb128 0x17
	.long	.LASF338
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro2
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro3
	.byte	0x4
	.byte	0x3
	.uleb128 0x1c
	.uleb128 0x6
	.byte	0x4
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0x8
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x7
	.byte	0x7
	.long	.Ldebug_macro4
	.byte	0x4
	.byte	0x4
	.byte	0x4
	.byte	0x3
	.uleb128 0x16
	.uleb128 0xa
	.byte	0x3
	.uleb128 0x1b
	.uleb128 0xb
	.byte	0x7
	.long	.Ldebug_macro5
	.byte	0x4
	.file 14 "include/config.h"
	.byte	0x3
	.uleb128 0x1d
	.uleb128 0xe
	.byte	0x7
	.long	.Ldebug_macro6
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro7
	.byte	0x4
	.byte	0x4
	.file 15 "include/errno.h"
	.byte	0x3
	.uleb128 0x14
	.uleb128 0xf
	.byte	0x7
	.long	.Ldebug_macro8
	.byte	0x4
	.byte	0x3
	.uleb128 0x16
	.uleb128 0x1
	.file 16 "include/mm/page.h"
	.byte	0x3
	.uleb128 0x17
	.uleb128 0x10
	.byte	0x7
	.long	.Ldebug_macro9
	.byte	0x4
	.byte	0x7
	.long	.Ldebug_macro10
	.byte	0x4
	.byte	0x3
	.uleb128 0x19
	.uleb128 0xd
	.byte	0x4
	.byte	0x4
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.0.dcefc2036eca131d23d2d0a30e57067c,comdat
.Ldebug_macro1:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0
	.long	.LASF0
	.byte	0x5
	.uleb128 0
	.long	.LASF1
	.byte	0x5
	.uleb128 0
	.long	.LASF2
	.byte	0x5
	.uleb128 0
	.long	.LASF3
	.byte	0x5
	.uleb128 0
	.long	.LASF4
	.byte	0x5
	.uleb128 0
	.long	.LASF5
	.byte	0x5
	.uleb128 0
	.long	.LASF6
	.byte	0x5
	.uleb128 0
	.long	.LASF7
	.byte	0x5
	.uleb128 0
	.long	.LASF8
	.byte	0x5
	.uleb128 0
	.long	.LASF9
	.byte	0x5
	.uleb128 0
	.long	.LASF10
	.byte	0x5
	.uleb128 0
	.long	.LASF11
	.byte	0x5
	.uleb128 0
	.long	.LASF12
	.byte	0x5
	.uleb128 0
	.long	.LASF13
	.byte	0x5
	.uleb128 0
	.long	.LASF14
	.byte	0x5
	.uleb128 0
	.long	.LASF15
	.byte	0x5
	.uleb128 0
	.long	.LASF16
	.byte	0x5
	.uleb128 0
	.long	.LASF17
	.byte	0x5
	.uleb128 0
	.long	.LASF18
	.byte	0x5
	.uleb128 0
	.long	.LASF19
	.byte	0x5
	.uleb128 0
	.long	.LASF20
	.byte	0x5
	.uleb128 0
	.long	.LASF21
	.byte	0x5
	.uleb128 0
	.long	.LASF22
	.byte	0x5
	.uleb128 0
	.long	.LASF23
	.byte	0x5
	.uleb128 0
	.long	.LASF24
	.byte	0x5
	.uleb128 0
	.long	.LASF25
	.byte	0x5
	.uleb128 0
	.long	.LASF26
	.byte	0x5
	.uleb128 0
	.long	.LASF27
	.byte	0x5
	.uleb128 0
	.long	.LASF28
	.byte	0x5
	.uleb128 0
	.long	.LASF29
	.byte	0x5
	.uleb128 0
	.long	.LASF30
	.byte	0x5
	.uleb128 0
	.long	.LASF31
	.byte	0x5
	.uleb128 0
	.long	.LASF32
	.byte	0x5
	.uleb128 0
	.long	.LASF33
	.byte	0x5
	.uleb128 0
	.long	.LASF34
	.byte	0x5
	.uleb128 0
	.long	.LASF35
	.byte	0x5
	.uleb128 0
	.long	.LASF36
	.byte	0x5
	.uleb128 0
	.long	.LASF37
	.byte	0x5
	.uleb128 0
	.long	.LASF38
	.byte	0x5
	.uleb128 0
	.long	.LASF39
	.byte	0x5
	.uleb128 0
	.long	.LASF40
	.byte	0x5
	.uleb128 0
	.long	.LASF41
	.byte	0x5
	.uleb128 0
	.long	.LASF42
	.byte	0x5
	.uleb128 0
	.long	.LASF43
	.byte	0x5
	.uleb128 0
	.long	.LASF44
	.byte	0x5
	.uleb128 0
	.long	.LASF45
	.byte	0x5
	.uleb128 0
	.long	.LASF46
	.byte	0x5
	.uleb128 0
	.long	.LASF47
	.byte	0x5
	.uleb128 0
	.long	.LASF48
	.byte	0x5
	.uleb128 0
	.long	.LASF49
	.byte	0x5
	.uleb128 0
	.long	.LASF50
	.byte	0x5
	.uleb128 0
	.long	.LASF51
	.byte	0x5
	.uleb128 0
	.long	.LASF52
	.byte	0x5
	.uleb128 0
	.long	.LASF53
	.byte	0x5
	.uleb128 0
	.long	.LASF54
	.byte	0x5
	.uleb128 0
	.long	.LASF55
	.byte	0x5
	.uleb128 0
	.long	.LASF56
	.byte	0x5
	.uleb128 0
	.long	.LASF57
	.byte	0x5
	.uleb128 0
	.long	.LASF58
	.byte	0x5
	.uleb128 0
	.long	.LASF59
	.byte	0x5
	.uleb128 0
	.long	.LASF60
	.byte	0x5
	.uleb128 0
	.long	.LASF61
	.byte	0x5
	.uleb128 0
	.long	.LASF62
	.byte	0x5
	.uleb128 0
	.long	.LASF63
	.byte	0x5
	.uleb128 0
	.long	.LASF64
	.byte	0x5
	.uleb128 0
	.long	.LASF65
	.byte	0x5
	.uleb128 0
	.long	.LASF66
	.byte	0x5
	.uleb128 0
	.long	.LASF67
	.byte	0x5
	.uleb128 0
	.long	.LASF68
	.byte	0x5
	.uleb128 0
	.long	.LASF69
	.byte	0x5
	.uleb128 0
	.long	.LASF70
	.byte	0x5
	.uleb128 0
	.long	.LASF71
	.byte	0x5
	.uleb128 0
	.long	.LASF72
	.byte	0x5
	.uleb128 0
	.long	.LASF73
	.byte	0x5
	.uleb128 0
	.long	.LASF74
	.byte	0x5
	.uleb128 0
	.long	.LASF75
	.byte	0x5
	.uleb128 0
	.long	.LASF76
	.byte	0x5
	.uleb128 0
	.long	.LASF77
	.byte	0x5
	.uleb128 0
	.long	.LASF78
	.byte	0x5
	.uleb128 0
	.long	.LASF79
	.byte	0x5
	.uleb128 0
	.long	.LASF80
	.byte	0x5
	.uleb128 0
	.long	.LASF81
	.byte	0x5
	.uleb128 0
	.long	.LASF82
	.byte	0x5
	.uleb128 0
	.long	.LASF83
	.byte	0x5
	.uleb128 0
	.long	.LASF84
	.byte	0x5
	.uleb128 0
	.long	.LASF85
	.byte	0x5
	.uleb128 0
	.long	.LASF86
	.byte	0x5
	.uleb128 0
	.long	.LASF87
	.byte	0x5
	.uleb128 0
	.long	.LASF88
	.byte	0x5
	.uleb128 0
	.long	.LASF89
	.byte	0x5
	.uleb128 0
	.long	.LASF90
	.byte	0x5
	.uleb128 0
	.long	.LASF91
	.byte	0x5
	.uleb128 0
	.long	.LASF92
	.byte	0x5
	.uleb128 0
	.long	.LASF93
	.byte	0x5
	.uleb128 0
	.long	.LASF94
	.byte	0x5
	.uleb128 0
	.long	.LASF95
	.byte	0x5
	.uleb128 0
	.long	.LASF96
	.byte	0x5
	.uleb128 0
	.long	.LASF97
	.byte	0x5
	.uleb128 0
	.long	.LASF98
	.byte	0x5
	.uleb128 0
	.long	.LASF99
	.byte	0x5
	.uleb128 0
	.long	.LASF100
	.byte	0x5
	.uleb128 0
	.long	.LASF101
	.byte	0x5
	.uleb128 0
	.long	.LASF102
	.byte	0x5
	.uleb128 0
	.long	.LASF103
	.byte	0x5
	.uleb128 0
	.long	.LASF104
	.byte	0x5
	.uleb128 0
	.long	.LASF105
	.byte	0x5
	.uleb128 0
	.long	.LASF106
	.byte	0x5
	.uleb128 0
	.long	.LASF107
	.byte	0x5
	.uleb128 0
	.long	.LASF108
	.byte	0x5
	.uleb128 0
	.long	.LASF109
	.byte	0x5
	.uleb128 0
	.long	.LASF110
	.byte	0x5
	.uleb128 0
	.long	.LASF111
	.byte	0x5
	.uleb128 0
	.long	.LASF112
	.byte	0x5
	.uleb128 0
	.long	.LASF113
	.byte	0x5
	.uleb128 0
	.long	.LASF114
	.byte	0x5
	.uleb128 0
	.long	.LASF115
	.byte	0x5
	.uleb128 0
	.long	.LASF116
	.byte	0x5
	.uleb128 0
	.long	.LASF117
	.byte	0x5
	.uleb128 0
	.long	.LASF118
	.byte	0x5
	.uleb128 0
	.long	.LASF119
	.byte	0x5
	.uleb128 0
	.long	.LASF120
	.byte	0x5
	.uleb128 0
	.long	.LASF121
	.byte	0x5
	.uleb128 0
	.long	.LASF122
	.byte	0x5
	.uleb128 0
	.long	.LASF123
	.byte	0x5
	.uleb128 0
	.long	.LASF124
	.byte	0x5
	.uleb128 0
	.long	.LASF125
	.byte	0x5
	.uleb128 0
	.long	.LASF126
	.byte	0x5
	.uleb128 0
	.long	.LASF127
	.byte	0x5
	.uleb128 0
	.long	.LASF128
	.byte	0x5
	.uleb128 0
	.long	.LASF129
	.byte	0x5
	.uleb128 0
	.long	.LASF130
	.byte	0x5
	.uleb128 0
	.long	.LASF131
	.byte	0x5
	.uleb128 0
	.long	.LASF132
	.byte	0x5
	.uleb128 0
	.long	.LASF133
	.byte	0x5
	.uleb128 0
	.long	.LASF134
	.byte	0x5
	.uleb128 0
	.long	.LASF135
	.byte	0x5
	.uleb128 0
	.long	.LASF136
	.byte	0x5
	.uleb128 0
	.long	.LASF137
	.byte	0x5
	.uleb128 0
	.long	.LASF138
	.byte	0x5
	.uleb128 0
	.long	.LASF139
	.byte	0x5
	.uleb128 0
	.long	.LASF140
	.byte	0x5
	.uleb128 0
	.long	.LASF141
	.byte	0x5
	.uleb128 0
	.long	.LASF142
	.byte	0x5
	.uleb128 0
	.long	.LASF143
	.byte	0x5
	.uleb128 0
	.long	.LASF144
	.byte	0x5
	.uleb128 0
	.long	.LASF145
	.byte	0x5
	.uleb128 0
	.long	.LASF146
	.byte	0x5
	.uleb128 0
	.long	.LASF147
	.byte	0x5
	.uleb128 0
	.long	.LASF148
	.byte	0x5
	.uleb128 0
	.long	.LASF149
	.byte	0x5
	.uleb128 0
	.long	.LASF150
	.byte	0x5
	.uleb128 0
	.long	.LASF151
	.byte	0x5
	.uleb128 0
	.long	.LASF152
	.byte	0x5
	.uleb128 0
	.long	.LASF153
	.byte	0x5
	.uleb128 0
	.long	.LASF154
	.byte	0x5
	.uleb128 0
	.long	.LASF155
	.byte	0x5
	.uleb128 0
	.long	.LASF156
	.byte	0x5
	.uleb128 0
	.long	.LASF157
	.byte	0x5
	.uleb128 0
	.long	.LASF158
	.byte	0x5
	.uleb128 0
	.long	.LASF159
	.byte	0x5
	.uleb128 0
	.long	.LASF160
	.byte	0x5
	.uleb128 0
	.long	.LASF161
	.byte	0x5
	.uleb128 0
	.long	.LASF162
	.byte	0x5
	.uleb128 0
	.long	.LASF163
	.byte	0x5
	.uleb128 0
	.long	.LASF164
	.byte	0x5
	.uleb128 0
	.long	.LASF165
	.byte	0x5
	.uleb128 0
	.long	.LASF166
	.byte	0x5
	.uleb128 0
	.long	.LASF167
	.byte	0x5
	.uleb128 0
	.long	.LASF168
	.byte	0x5
	.uleb128 0
	.long	.LASF169
	.byte	0x5
	.uleb128 0
	.long	.LASF170
	.byte	0x5
	.uleb128 0
	.long	.LASF171
	.byte	0x5
	.uleb128 0
	.long	.LASF172
	.byte	0x5
	.uleb128 0
	.long	.LASF173
	.byte	0x5
	.uleb128 0
	.long	.LASF174
	.byte	0x5
	.uleb128 0
	.long	.LASF175
	.byte	0x5
	.uleb128 0
	.long	.LASF176
	.byte	0x5
	.uleb128 0
	.long	.LASF177
	.byte	0x5
	.uleb128 0
	.long	.LASF178
	.byte	0x5
	.uleb128 0
	.long	.LASF179
	.byte	0x5
	.uleb128 0
	.long	.LASF180
	.byte	0x5
	.uleb128 0
	.long	.LASF181
	.byte	0x5
	.uleb128 0
	.long	.LASF182
	.byte	0x5
	.uleb128 0
	.long	.LASF183
	.byte	0x5
	.uleb128 0
	.long	.LASF184
	.byte	0x5
	.uleb128 0
	.long	.LASF185
	.byte	0x5
	.uleb128 0
	.long	.LASF186
	.byte	0x5
	.uleb128 0
	.long	.LASF187
	.byte	0x5
	.uleb128 0
	.long	.LASF188
	.byte	0x5
	.uleb128 0
	.long	.LASF189
	.byte	0x5
	.uleb128 0
	.long	.LASF190
	.byte	0x5
	.uleb128 0
	.long	.LASF191
	.byte	0x5
	.uleb128 0
	.long	.LASF192
	.byte	0x5
	.uleb128 0
	.long	.LASF193
	.byte	0x5
	.uleb128 0
	.long	.LASF194
	.byte	0x5
	.uleb128 0
	.long	.LASF195
	.byte	0x5
	.uleb128 0
	.long	.LASF196
	.byte	0x5
	.uleb128 0
	.long	.LASF197
	.byte	0x5
	.uleb128 0
	.long	.LASF198
	.byte	0x5
	.uleb128 0
	.long	.LASF199
	.byte	0x5
	.uleb128 0
	.long	.LASF200
	.byte	0x5
	.uleb128 0
	.long	.LASF201
	.byte	0x5
	.uleb128 0
	.long	.LASF202
	.byte	0x5
	.uleb128 0
	.long	.LASF203
	.byte	0x5
	.uleb128 0
	.long	.LASF204
	.byte	0x5
	.uleb128 0
	.long	.LASF205
	.byte	0x5
	.uleb128 0
	.long	.LASF206
	.byte	0x5
	.uleb128 0
	.long	.LASF207
	.byte	0x5
	.uleb128 0
	.long	.LASF208
	.byte	0x5
	.uleb128 0
	.long	.LASF209
	.byte	0x5
	.uleb128 0
	.long	.LASF210
	.byte	0x5
	.uleb128 0
	.long	.LASF211
	.byte	0x5
	.uleb128 0
	.long	.LASF212
	.byte	0x5
	.uleb128 0
	.long	.LASF213
	.byte	0x5
	.uleb128 0
	.long	.LASF214
	.byte	0x5
	.uleb128 0
	.long	.LASF215
	.byte	0x5
	.uleb128 0
	.long	.LASF216
	.byte	0x5
	.uleb128 0
	.long	.LASF217
	.byte	0x5
	.uleb128 0
	.long	.LASF218
	.byte	0x5
	.uleb128 0
	.long	.LASF219
	.byte	0x5
	.uleb128 0
	.long	.LASF220
	.byte	0x5
	.uleb128 0
	.long	.LASF221
	.byte	0x5
	.uleb128 0
	.long	.LASF222
	.byte	0x5
	.uleb128 0
	.long	.LASF223
	.byte	0x5
	.uleb128 0
	.long	.LASF224
	.byte	0x5
	.uleb128 0
	.long	.LASF225
	.byte	0x5
	.uleb128 0
	.long	.LASF226
	.byte	0x5
	.uleb128 0
	.long	.LASF227
	.byte	0x5
	.uleb128 0
	.long	.LASF228
	.byte	0x5
	.uleb128 0
	.long	.LASF229
	.byte	0x5
	.uleb128 0
	.long	.LASF230
	.byte	0x5
	.uleb128 0
	.long	.LASF231
	.byte	0x5
	.uleb128 0
	.long	.LASF232
	.byte	0x5
	.uleb128 0
	.long	.LASF233
	.byte	0x5
	.uleb128 0
	.long	.LASF234
	.byte	0x5
	.uleb128 0
	.long	.LASF235
	.byte	0x5
	.uleb128 0
	.long	.LASF236
	.byte	0x5
	.uleb128 0
	.long	.LASF237
	.byte	0x5
	.uleb128 0
	.long	.LASF238
	.byte	0x5
	.uleb128 0
	.long	.LASF239
	.byte	0x5
	.uleb128 0
	.long	.LASF240
	.byte	0x5
	.uleb128 0
	.long	.LASF241
	.byte	0x5
	.uleb128 0
	.long	.LASF242
	.byte	0x5
	.uleb128 0
	.long	.LASF243
	.byte	0x5
	.uleb128 0
	.long	.LASF244
	.byte	0x5
	.uleb128 0
	.long	.LASF245
	.byte	0x5
	.uleb128 0
	.long	.LASF246
	.byte	0x5
	.uleb128 0
	.long	.LASF247
	.byte	0x5
	.uleb128 0
	.long	.LASF248
	.byte	0x5
	.uleb128 0
	.long	.LASF249
	.byte	0x5
	.uleb128 0
	.long	.LASF250
	.byte	0x5
	.uleb128 0
	.long	.LASF251
	.byte	0x5
	.uleb128 0
	.long	.LASF252
	.byte	0x5
	.uleb128 0
	.long	.LASF253
	.byte	0x5
	.uleb128 0
	.long	.LASF254
	.byte	0x5
	.uleb128 0
	.long	.LASF255
	.byte	0x5
	.uleb128 0
	.long	.LASF256
	.byte	0x5
	.uleb128 0
	.long	.LASF257
	.byte	0x5
	.uleb128 0
	.long	.LASF258
	.byte	0x5
	.uleb128 0
	.long	.LASF259
	.byte	0x5
	.uleb128 0
	.long	.LASF260
	.byte	0x5
	.uleb128 0
	.long	.LASF261
	.byte	0x5
	.uleb128 0
	.long	.LASF262
	.byte	0x5
	.uleb128 0
	.long	.LASF263
	.byte	0x5
	.uleb128 0
	.long	.LASF264
	.byte	0x5
	.uleb128 0
	.long	.LASF265
	.byte	0x5
	.uleb128 0
	.long	.LASF266
	.byte	0x5
	.uleb128 0
	.long	.LASF267
	.byte	0x5
	.uleb128 0
	.long	.LASF268
	.byte	0x5
	.uleb128 0
	.long	.LASF269
	.byte	0x5
	.uleb128 0
	.long	.LASF270
	.byte	0x5
	.uleb128 0
	.long	.LASF271
	.byte	0x5
	.uleb128 0
	.long	.LASF272
	.byte	0x5
	.uleb128 0
	.long	.LASF273
	.byte	0x5
	.uleb128 0
	.long	.LASF274
	.byte	0x5
	.uleb128 0
	.long	.LASF275
	.byte	0x5
	.uleb128 0
	.long	.LASF276
	.byte	0x5
	.uleb128 0
	.long	.LASF277
	.byte	0x5
	.uleb128 0
	.long	.LASF278
	.byte	0x5
	.uleb128 0
	.long	.LASF279
	.byte	0x5
	.uleb128 0
	.long	.LASF280
	.byte	0x5
	.uleb128 0
	.long	.LASF281
	.byte	0x5
	.uleb128 0
	.long	.LASF282
	.byte	0x5
	.uleb128 0
	.long	.LASF283
	.byte	0x5
	.uleb128 0
	.long	.LASF284
	.byte	0x5
	.uleb128 0
	.long	.LASF285
	.byte	0x5
	.uleb128 0
	.long	.LASF286
	.byte	0x5
	.uleb128 0
	.long	.LASF287
	.byte	0x5
	.uleb128 0
	.long	.LASF288
	.byte	0x5
	.uleb128 0
	.long	.LASF289
	.byte	0x5
	.uleb128 0
	.long	.LASF290
	.byte	0x5
	.uleb128 0
	.long	.LASF291
	.byte	0x5
	.uleb128 0
	.long	.LASF292
	.byte	0x5
	.uleb128 0
	.long	.LASF293
	.byte	0x5
	.uleb128 0
	.long	.LASF294
	.byte	0x5
	.uleb128 0
	.long	.LASF295
	.byte	0x5
	.uleb128 0
	.long	.LASF296
	.byte	0x5
	.uleb128 0
	.long	.LASF297
	.byte	0x5
	.uleb128 0
	.long	.LASF298
	.byte	0x5
	.uleb128 0
	.long	.LASF299
	.byte	0x5
	.uleb128 0
	.long	.LASF300
	.byte	0x5
	.uleb128 0
	.long	.LASF301
	.byte	0x5
	.uleb128 0
	.long	.LASF302
	.byte	0x5
	.uleb128 0
	.long	.LASF303
	.byte	0x5
	.uleb128 0
	.long	.LASF304
	.byte	0x5
	.uleb128 0
	.long	.LASF305
	.byte	0x5
	.uleb128 0
	.long	.LASF306
	.byte	0x5
	.uleb128 0
	.long	.LASF307
	.byte	0x5
	.uleb128 0
	.long	.LASF308
	.byte	0x5
	.uleb128 0
	.long	.LASF309
	.byte	0x5
	.uleb128 0
	.long	.LASF310
	.byte	0x5
	.uleb128 0
	.long	.LASF311
	.byte	0x5
	.uleb128 0
	.long	.LASF312
	.byte	0x5
	.uleb128 0
	.long	.LASF313
	.byte	0x5
	.uleb128 0
	.long	.LASF314
	.byte	0x5
	.uleb128 0
	.long	.LASF315
	.byte	0x5
	.uleb128 0
	.long	.LASF316
	.byte	0x5
	.uleb128 0
	.long	.LASF317
	.byte	0x5
	.uleb128 0
	.long	.LASF318
	.byte	0x5
	.uleb128 0
	.long	.LASF319
	.byte	0x5
	.uleb128 0
	.long	.LASF320
	.byte	0x5
	.uleb128 0
	.long	.LASF321
	.byte	0x5
	.uleb128 0
	.long	.LASF322
	.byte	0x5
	.uleb128 0
	.long	.LASF323
	.byte	0x5
	.uleb128 0
	.long	.LASF324
	.byte	0x5
	.uleb128 0
	.long	.LASF325
	.byte	0x5
	.uleb128 0
	.long	.LASF326
	.byte	0x5
	.uleb128 0
	.long	.LASF327
	.byte	0x5
	.uleb128 0
	.long	.LASF328
	.byte	0x5
	.uleb128 0
	.long	.LASF329
	.byte	0x5
	.uleb128 0
	.long	.LASF330
	.byte	0x5
	.uleb128 0
	.long	.LASF331
	.byte	0x5
	.uleb128 0
	.long	.LASF332
	.byte	0x5
	.uleb128 0
	.long	.LASF333
	.byte	0x5
	.uleb128 0
	.long	.LASF334
	.byte	0x5
	.uleb128 0
	.long	.LASF335
	.byte	0x5
	.uleb128 0
	.long	.LASF336
	.byte	0x5
	.uleb128 0
	.long	.LASF337
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.kernel.h.42.ef81c40607fb4b50bc36151e2d9b7464,comdat
.Ldebug_macro2:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF339
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF340
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF341
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF342
	.byte	0x5
	.uleb128 0x31
	.long	.LASF343
	.byte	0x5
	.uleb128 0x36
	.long	.LASF344
	.byte	0x5
	.uleb128 0x39
	.long	.LASF345
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF346
	.byte	0x5
	.uleb128 0x47
	.long	.LASF347
	.byte	0x5
	.uleb128 0x48
	.long	.LASF348
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF349
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.list.h.74.e893a2db0b9482089e43ef16892a09f3,comdat
.Ldebug_macro3:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF350
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF351
	.byte	0x5
	.uleb128 0x52
	.long	.LASF352
	.byte	0x5
	.uleb128 0x57
	.long	.LASF353
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF354
	.byte	0x5
	.uleb128 0x64
	.long	.LASF355
	.byte	0x5
	.uleb128 0x67
	.long	.LASF356
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF357
	.byte	0x5
	.uleb128 0x74
	.long	.LASF358
	.byte	0x5
	.uleb128 0x77
	.long	.LASF359
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF360
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF361
	.byte	0x5
	.uleb128 0x80
	.long	.LASF362
	.byte	0x5
	.uleb128 0x83
	.long	.LASF363
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF364
	.byte	0x5
	.uleb128 0x99
	.long	.LASF365
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.pagetable.h.21.7984d0fb6b9a4732a0dd1518d8ba3ea7,comdat
.Ldebug_macro4:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x15
	.long	.LASF366
	.byte	0x5
	.uleb128 0x16
	.long	.LASF367
	.byte	0x5
	.uleb128 0x17
	.long	.LASF368
	.byte	0x5
	.uleb128 0x18
	.long	.LASF369
	.byte	0x5
	.uleb128 0x19
	.long	.LASF370
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF371
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF372
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF373
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF374
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF375
	.byte	0x5
	.uleb128 0x20
	.long	.LASF376
	.byte	0x5
	.uleb128 0x21
	.long	.LASF377
	.byte	0x5
	.uleb128 0x22
	.long	.LASF378
	.byte	0x5
	.uleb128 0x23
	.long	.LASF379
	.byte	0x5
	.uleb128 0x24
	.long	.LASF380
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.vmmap.h.25.115d35caca53c7b0de9c750bc4fa47ec,comdat
.Ldebug_macro5:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x19
	.long	.LASF381
	.byte	0x5
	.uleb128 0x1a
	.long	.LASF382
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.config.h.32.51ca44199f8ad46c63980589bd3247aa,comdat
.Ldebug_macro6:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x20
	.long	.LASF383
	.byte	0x5
	.uleb128 0x21
	.long	.LASF384
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF385
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF386
	.byte	0x5
	.uleb128 0x30
	.long	.LASF387
	.byte	0x5
	.uleb128 0x31
	.long	.LASF388
	.byte	0x5
	.uleb128 0x38
	.long	.LASF389
	.byte	0x5
	.uleb128 0x39
	.long	.LASF390
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF391
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF392
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF393
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF394
	.byte	0x5
	.uleb128 0x40
	.long	.LASF395
	.byte	0x5
	.uleb128 0x46
	.long	.LASF396
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.proc.h.31.0010f01140e497165662ba65048ec29f,comdat
.Ldebug_macro7:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF397
	.byte	0x5
	.uleb128 0x20
	.long	.LASF398
	.byte	0x5
	.uleb128 0x51
	.long	.LASF399
	.byte	0x5
	.uleb128 0x52
	.long	.LASF400
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.errno.h.30.897102df9ec48b93d2dca829e18760d3,comdat
.Ldebug_macro8:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF401
	.byte	0x5
	.uleb128 0x1f
	.long	.LASF402
	.byte	0x5
	.uleb128 0x20
	.long	.LASF403
	.byte	0x5
	.uleb128 0x21
	.long	.LASF404
	.byte	0x5
	.uleb128 0x22
	.long	.LASF405
	.byte	0x5
	.uleb128 0x23
	.long	.LASF406
	.byte	0x5
	.uleb128 0x24
	.long	.LASF407
	.byte	0x5
	.uleb128 0x25
	.long	.LASF408
	.byte	0x5
	.uleb128 0x26
	.long	.LASF409
	.byte	0x5
	.uleb128 0x27
	.long	.LASF410
	.byte	0x5
	.uleb128 0x28
	.long	.LASF411
	.byte	0x5
	.uleb128 0x29
	.long	.LASF412
	.byte	0x5
	.uleb128 0x2a
	.long	.LASF413
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF414
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF415
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF416
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF417
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF418
	.byte	0x5
	.uleb128 0x30
	.long	.LASF419
	.byte	0x5
	.uleb128 0x31
	.long	.LASF420
	.byte	0x5
	.uleb128 0x32
	.long	.LASF421
	.byte	0x5
	.uleb128 0x33
	.long	.LASF422
	.byte	0x5
	.uleb128 0x34
	.long	.LASF423
	.byte	0x5
	.uleb128 0x35
	.long	.LASF424
	.byte	0x5
	.uleb128 0x36
	.long	.LASF425
	.byte	0x5
	.uleb128 0x37
	.long	.LASF426
	.byte	0x5
	.uleb128 0x38
	.long	.LASF427
	.byte	0x5
	.uleb128 0x39
	.long	.LASF428
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF429
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF430
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF431
	.byte	0x5
	.uleb128 0x3d
	.long	.LASF432
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF433
	.byte	0x5
	.uleb128 0x3f
	.long	.LASF434
	.byte	0x5
	.uleb128 0x41
	.long	.LASF435
	.byte	0x5
	.uleb128 0x42
	.long	.LASF436
	.byte	0x5
	.uleb128 0x43
	.long	.LASF437
	.byte	0x5
	.uleb128 0x44
	.long	.LASF438
	.byte	0x5
	.uleb128 0x45
	.long	.LASF439
	.byte	0x5
	.uleb128 0x46
	.long	.LASF440
	.byte	0x5
	.uleb128 0x47
	.long	.LASF441
	.byte	0x5
	.uleb128 0x48
	.long	.LASF442
	.byte	0x5
	.uleb128 0x49
	.long	.LASF443
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF444
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF445
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF446
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF447
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF448
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF449
	.byte	0x5
	.uleb128 0x50
	.long	.LASF450
	.byte	0x5
	.uleb128 0x51
	.long	.LASF451
	.byte	0x5
	.uleb128 0x52
	.long	.LASF452
	.byte	0x5
	.uleb128 0x53
	.long	.LASF453
	.byte	0x5
	.uleb128 0x54
	.long	.LASF454
	.byte	0x5
	.uleb128 0x55
	.long	.LASF455
	.byte	0x5
	.uleb128 0x56
	.long	.LASF456
	.byte	0x5
	.uleb128 0x57
	.long	.LASF457
	.byte	0x5
	.uleb128 0x59
	.long	.LASF458
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF459
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF460
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF461
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF462
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF463
	.byte	0x5
	.uleb128 0x60
	.long	.LASF464
	.byte	0x5
	.uleb128 0x61
	.long	.LASF465
	.byte	0x5
	.uleb128 0x62
	.long	.LASF466
	.byte	0x5
	.uleb128 0x63
	.long	.LASF467
	.byte	0x5
	.uleb128 0x64
	.long	.LASF468
	.byte	0x5
	.uleb128 0x65
	.long	.LASF469
	.byte	0x5
	.uleb128 0x66
	.long	.LASF470
	.byte	0x5
	.uleb128 0x67
	.long	.LASF471
	.byte	0x5
	.uleb128 0x68
	.long	.LASF472
	.byte	0x5
	.uleb128 0x69
	.long	.LASF473
	.byte	0x5
	.uleb128 0x6a
	.long	.LASF474
	.byte	0x5
	.uleb128 0x6b
	.long	.LASF475
	.byte	0x5
	.uleb128 0x6c
	.long	.LASF476
	.byte	0x5
	.uleb128 0x6d
	.long	.LASF477
	.byte	0x5
	.uleb128 0x6e
	.long	.LASF478
	.byte	0x5
	.uleb128 0x6f
	.long	.LASF479
	.byte	0x5
	.uleb128 0x70
	.long	.LASF480
	.byte	0x5
	.uleb128 0x71
	.long	.LASF481
	.byte	0x5
	.uleb128 0x72
	.long	.LASF482
	.byte	0x5
	.uleb128 0x73
	.long	.LASF483
	.byte	0x5
	.uleb128 0x74
	.long	.LASF484
	.byte	0x5
	.uleb128 0x75
	.long	.LASF485
	.byte	0x5
	.uleb128 0x76
	.long	.LASF486
	.byte	0x5
	.uleb128 0x77
	.long	.LASF487
	.byte	0x5
	.uleb128 0x78
	.long	.LASF488
	.byte	0x5
	.uleb128 0x79
	.long	.LASF489
	.byte	0x5
	.uleb128 0x7a
	.long	.LASF490
	.byte	0x5
	.uleb128 0x7b
	.long	.LASF491
	.byte	0x5
	.uleb128 0x7c
	.long	.LASF492
	.byte	0x5
	.uleb128 0x7d
	.long	.LASF493
	.byte	0x5
	.uleb128 0x7e
	.long	.LASF494
	.byte	0x5
	.uleb128 0x7f
	.long	.LASF495
	.byte	0x5
	.uleb128 0x80
	.long	.LASF496
	.byte	0x5
	.uleb128 0x81
	.long	.LASF497
	.byte	0x5
	.uleb128 0x82
	.long	.LASF498
	.byte	0x5
	.uleb128 0x83
	.long	.LASF499
	.byte	0x5
	.uleb128 0x84
	.long	.LASF500
	.byte	0x5
	.uleb128 0x85
	.long	.LASF501
	.byte	0x5
	.uleb128 0x86
	.long	.LASF502
	.byte	0x5
	.uleb128 0x87
	.long	.LASF503
	.byte	0x5
	.uleb128 0x88
	.long	.LASF504
	.byte	0x5
	.uleb128 0x89
	.long	.LASF505
	.byte	0x5
	.uleb128 0x8a
	.long	.LASF506
	.byte	0x5
	.uleb128 0x8b
	.long	.LASF507
	.byte	0x5
	.uleb128 0x8c
	.long	.LASF508
	.byte	0x5
	.uleb128 0x8d
	.long	.LASF509
	.byte	0x5
	.uleb128 0x8e
	.long	.LASF510
	.byte	0x5
	.uleb128 0x8f
	.long	.LASF511
	.byte	0x5
	.uleb128 0x90
	.long	.LASF512
	.byte	0x5
	.uleb128 0x91
	.long	.LASF513
	.byte	0x5
	.uleb128 0x92
	.long	.LASF514
	.byte	0x5
	.uleb128 0x93
	.long	.LASF515
	.byte	0x5
	.uleb128 0x94
	.long	.LASF516
	.byte	0x5
	.uleb128 0x95
	.long	.LASF517
	.byte	0x5
	.uleb128 0x96
	.long	.LASF518
	.byte	0x5
	.uleb128 0x97
	.long	.LASF519
	.byte	0x5
	.uleb128 0x98
	.long	.LASF520
	.byte	0x5
	.uleb128 0x99
	.long	.LASF521
	.byte	0x5
	.uleb128 0x9a
	.long	.LASF522
	.byte	0x5
	.uleb128 0x9c
	.long	.LASF523
	.byte	0x5
	.uleb128 0x9d
	.long	.LASF524
	.byte	0x5
	.uleb128 0x9e
	.long	.LASF525
	.byte	0x5
	.uleb128 0x9f
	.long	.LASF526
	.byte	0x5
	.uleb128 0xa0
	.long	.LASF527
	.byte	0x5
	.uleb128 0xa1
	.long	.LASF528
	.byte	0x5
	.uleb128 0xa2
	.long	.LASF529
	.byte	0x5
	.uleb128 0xa5
	.long	.LASF530
	.byte	0x5
	.uleb128 0xa6
	.long	.LASF531
	.byte	0x5
	.uleb128 0xa9
	.long	.LASF532
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.page.h.28.82b38a267fcd1fcab2bb3d81713f3559,comdat
.Ldebug_macro9:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x1c
	.long	.LASF533
	.byte	0x5
	.uleb128 0x1d
	.long	.LASF534
	.byte	0x5
	.uleb128 0x1e
	.long	.LASF535
	.byte	0x5
	.uleb128 0x20
	.long	.LASF536
	.byte	0x5
	.uleb128 0x21
	.long	.LASF537
	.byte	0x5
	.uleb128 0x22
	.long	.LASF538
	.byte	0x5
	.uleb128 0x24
	.long	.LASF539
	.byte	0x5
	.uleb128 0x25
	.long	.LASF540
	.byte	0x5
	.uleb128 0x27
	.long	.LASF541
	.byte	0x5
	.uleb128 0x29
	.long	.LASF542
	.byte	0x5
	.uleb128 0x2b
	.long	.LASF543
	.byte	0
	.section	.debug_macro,"G",@progbits,wm4.debug.h.44.63925e77bcf481d7929b9179119fc5a0,comdat
.Ldebug_macro10:
	.value	0x4
	.byte	0
	.byte	0x5
	.uleb128 0x2c
	.long	.LASF544
	.byte	0x5
	.uleb128 0x2d
	.long	.LASF545
	.byte	0x5
	.uleb128 0x2e
	.long	.LASF546
	.byte	0x5
	.uleb128 0x2f
	.long	.LASF547
	.byte	0x5
	.uleb128 0x30
	.long	.LASF548
	.byte	0x5
	.uleb128 0x31
	.long	.LASF549
	.byte	0x5
	.uleb128 0x32
	.long	.LASF550
	.byte	0x5
	.uleb128 0x33
	.long	.LASF551
	.byte	0x5
	.uleb128 0x34
	.long	.LASF552
	.byte	0x5
	.uleb128 0x36
	.long	.LASF553
	.byte	0x5
	.uleb128 0x37
	.long	.LASF554
	.byte	0x5
	.uleb128 0x38
	.long	.LASF555
	.byte	0x5
	.uleb128 0x39
	.long	.LASF556
	.byte	0x5
	.uleb128 0x3a
	.long	.LASF557
	.byte	0x5
	.uleb128 0x3b
	.long	.LASF558
	.byte	0x5
	.uleb128 0x3c
	.long	.LASF559
	.byte	0x5
	.uleb128 0x3e
	.long	.LASF560
	.byte	0x5
	.uleb128 0x43
	.long	.LASF561
	.byte	0x5
	.uleb128 0x44
	.long	.LASF562
	.byte	0x5
	.uleb128 0x45
	.long	.LASF563
	.byte	0x5
	.uleb128 0x46
	.long	.LASF564
	.byte	0x5
	.uleb128 0x47
	.long	.LASF565
	.byte	0x5
	.uleb128 0x48
	.long	.LASF566
	.byte	0x5
	.uleb128 0x49
	.long	.LASF567
	.byte	0x5
	.uleb128 0x4a
	.long	.LASF568
	.byte	0x5
	.uleb128 0x4b
	.long	.LASF569
	.byte	0x5
	.uleb128 0x4c
	.long	.LASF570
	.byte	0x5
	.uleb128 0x4d
	.long	.LASF571
	.byte	0x5
	.uleb128 0x4e
	.long	.LASF572
	.byte	0x5
	.uleb128 0x4f
	.long	.LASF573
	.byte	0x5
	.uleb128 0x50
	.long	.LASF574
	.byte	0x5
	.uleb128 0x51
	.long	.LASF575
	.byte	0x5
	.uleb128 0x52
	.long	.LASF576
	.byte	0x5
	.uleb128 0x53
	.long	.LASF577
	.byte	0x5
	.uleb128 0x54
	.long	.LASF578
	.byte	0x5
	.uleb128 0x55
	.long	.LASF579
	.byte	0x5
	.uleb128 0x56
	.long	.LASF580
	.byte	0x5
	.uleb128 0x57
	.long	.LASF581
	.byte	0x5
	.uleb128 0x58
	.long	.LASF582
	.byte	0x5
	.uleb128 0x59
	.long	.LASF583
	.byte	0x5
	.uleb128 0x5a
	.long	.LASF584
	.byte	0x5
	.uleb128 0x5b
	.long	.LASF585
	.byte	0x5
	.uleb128 0x5c
	.long	.LASF586
	.byte	0x5
	.uleb128 0x5d
	.long	.LASF587
	.byte	0x5
	.uleb128 0x5e
	.long	.LASF588
	.byte	0x5
	.uleb128 0x5f
	.long	.LASF589
	.byte	0x5
	.uleb128 0x60
	.long	.LASF590
	.byte	0x5
	.uleb128 0x61
	.long	.LASF591
	.byte	0x5
	.uleb128 0x63
	.long	.LASF592
	.byte	0x5
	.uleb128 0x64
	.long	.LASF593
	.byte	0x5
	.uleb128 0x65
	.long	.LASF594
	.byte	0x5
	.uleb128 0x66
	.long	.LASF595
	.byte	0x5
	.uleb128 0x67
	.long	.LASF596
	.byte	0x5
	.uleb128 0x68
	.long	.LASF597
	.byte	0x5
	.uleb128 0x72
	.long	.LASF598
	.byte	0x5
	.uleb128 0xac
	.long	.LASF599
	.byte	0x5
	.uleb128 0xb5
	.long	.LASF600
	.byte	0x5
	.uleb128 0xbf
	.long	.LASF601
	.byte	0x5
	.uleb128 0xc8
	.long	.LASF602
	.byte	0x5
	.uleb128 0xd1
	.long	.LASF603
	.byte	0x5
	.uleb128 0xdc
	.long	.LASF604
	.byte	0x5
	.uleb128 0xdf
	.long	.LASF605
	.byte	0x5
	.uleb128 0xe1
	.long	.LASF606
	.byte	0x5
	.uleb128 0xf2
	.long	.LASF607
	.byte	0x5
	.uleb128 0xf3
	.long	.LASF608
	.byte	0x5
	.uleb128 0xf4
	.long	.LASF609
	.byte	0x5
	.uleb128 0xf5
	.long	.LASF610
	.byte	0x5
	.uleb128 0xf6
	.long	.LASF611
	.byte	0x5
	.uleb128 0xf7
	.long	.LASF612
	.byte	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF478:
	.string	"EREMCHG 78"
.LASF436:
	.string	"ENAMETOOLONG 36"
.LASF97:
	.string	"__SIG_ATOMIC_MAX__ 0x7fffffff"
.LASF219:
	.string	"__FLT64_HAS_QUIET_NAN__ 1"
.LASF551:
	.string	"_CYAN_ \"\\x1b[36;40m\""
.LASF639:
	.string	"list_t"
.LASF395:
	.string	"VFS_ROOTFS_DEV \"disk0\""
.LASF185:
	.string	"__LDBL_MAX__ 1.18973149535723176502126385303097021e+4932L"
.LASF342:
	.string	"offsetof(type,member) ((uint32_t)((char*)&((type *)(0))->member - (char*)0))"
.LASF204:
	.string	"__FLT32_HAS_INFINITY__ 1"
.LASF145:
	.string	"__FLT_EVAL_METHOD__ 2"
.LASF210:
	.string	"__FLT64_MAX_EXP__ 1024"
.LASF152:
	.string	"__FLT_MIN_10_EXP__ (-37)"
.LASF505:
	.string	"ENOBUFS 105"
.LASF257:
	.string	"__FLT64X_EPSILON__ 1.08420217248550443400745280086994171e-19F64x"
.LASF442:
	.string	"ENOMSG 42"
.LASF238:
	.string	"__FLT32X_MAX_EXP__ 1024"
.LASF131:
	.string	"__INT_FAST16_WIDTH__ 32"
.LASF301:
	.string	"__GCC_ATOMIC_TEST_AND_SET_TRUEVAL 1"
.LASF609:
	.string	"KASSERT_GREATER(l,r) KASSERT_GENERIC(l, r, greaterthan, \">\")"
.LASF274:
	.string	"__DEC64_EPSILON__ 1E-15DD"
.LASF173:
	.string	"__DBL_DENORM_MIN__ ((double)4.94065645841246544176568792868221372e-324L)"
.LASF631:
	.string	"kernel_end"
.LASF685:
	.string	"p_files"
.LASF604:
	.string	"panic(fmt,args...) dbg_panic(__FILE__, __LINE__, __func__, (fmt), ## args)"
.LASF349:
	.string	"QUOTE(...) QUOTE_BY_NAME(__VA_ARGS__)"
.LASF192:
	.string	"__FLT32_MANT_DIG__ 24"
.LASF679:
	.string	"p_status"
.LASF220:
	.string	"__FLT128_MANT_DIG__ 113"
.LASF343:
	.string	"NOT_YET_IMPLEMENTED(f) (dbg_print(\"Not yet implemented: %s, file %s, line %d\\n\", f, __FILE__, __LINE__))"
.LASF549:
	.string	"_BLUE_ \"\\x1b[34;40m\""
.LASF382:
	.string	"VMMAP_DIR_HILO 2"
.LASF712:
	.string	"lessthaneq"
.LASF588:
	.string	"DBG_VM DBG_MODE(28)"
.LASF688:
	.string	"p_start_brk"
.LASF452:
	.string	"EBADE 52"
.LASF643:
	.string	"tq_list"
.LASF240:
	.string	"__FLT32X_DECIMAL_DIG__ 17"
.LASF165:
	.string	"__DBL_MIN_EXP__ (-1021)"
.LASF87:
	.string	"__LONG_LONG_WIDTH__ 64"
.LASF70:
	.string	"__has_include_next(STR) __has_include_next__(STR)"
.LASF652:
	.string	"c_kstack"
.LASF687:
	.string	"p_brk"
.LASF241:
	.string	"__FLT32X_MAX__ 1.79769313486231570814527423731704357e+308F32x"
.LASF227:
	.string	"__FLT128_MAX__ 1.18973149535723176508575932662800702e+4932F128"
.LASF306:
	.string	"__SIZEOF_WINT_T__ 4"
.LASF608:
	.string	"KASSERTNEQ(l,r) KASSERT_GENERIC(l, r, notequals, \"!=\")"
.LASF531:
	.string	"ENOTRECOVERABLE 131"
.LASF605:
	.string	"KASSERT(x) do { if (!(x)) panic(\"assertion failed: %s\", #x); } while(0)"
.LASF499:
	.string	"EADDRNOTAVAIL 99"
.LASF358:
	.string	"list_remove_head(list) list_remove((list)->l_next)"
.LASF4:
	.string	"__GNUC_MINOR__ 5"
.LASF41:
	.string	"__CHAR32_TYPE__ unsigned int"
.LASF619:
	.string	"unsigned int"
.LASF361:
	.string	"list_head(list,type,member) list_item((list)->l_next, type, member)"
.LASF377:
	.string	"PT_ACCESSED 0x020"
.LASF627:
	.string	"kernel_start"
.LASF618:
	.string	"uint32_t"
.LASF291:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_8 1"
.LASF25:
	.string	"__SIZEOF_SIZE_T__ 4"
.LASF40:
	.string	"__CHAR16_TYPE__ short unsigned int"
.LASF498:
	.string	"EADDRINUSE 98"
.LASF484:
	.string	"EILSEQ 84"
.LASF406:
	.string	"ENXIO 6"
.LASF471:
	.string	"EPROTO 71"
.LASF29:
	.string	"__ORDER_BIG_ENDIAN__ 4321"
.LASF3:
	.string	"__GNUC__ 7"
.LASF279:
	.string	"__DEC128_MIN__ 1E-6143DL"
.LASF603:
	.string	"dbg_active(mode) (dbg_modes & (mode))"
.LASF581:
	.string	"DBG_EXEC DBG_MODE(19)"
.LASF495:
	.string	"EOPNOTSUPP 95"
.LASF163:
	.string	"__DBL_MANT_DIG__ 53"
.LASF58:
	.string	"__UINT_LEAST64_TYPE__ long long unsigned int"
.LASF481:
	.string	"ELIBSCN 81"
.LASF74:
	.string	"__INT_MAX__ 0x7fffffff"
.LASF10:
	.string	"__ATOMIC_RELEASE 3"
.LASF35:
	.string	"__PTRDIFF_TYPE__ int"
.LASF205:
	.string	"__FLT32_HAS_QUIET_NAN__ 1"
.LASF703:
	.string	"dbg_modes"
.LASF44:
	.string	"__INT16_TYPE__ short int"
.LASF330:
	.string	"__DECIMAL_BID_FORMAT__ 1"
.LASF267:
	.string	"__DEC32_EPSILON__ 1E-6DF"
.LASF492:
	.string	"ENOPROTOOPT 92"
.LASF178:
	.string	"__LDBL_DIG__ 18"
.LASF252:
	.string	"__FLT64X_MAX_EXP__ 16384"
.LASF8:
	.string	"__ATOMIC_SEQ_CST 5"
.LASF412:
	.string	"ENOMEM 12"
.LASF693:
	.string	"vmm_proc"
.LASF21:
	.string	"__SIZEOF_SHORT__ 2"
.LASF509:
	.string	"ETOOMANYREFS 109"
.LASF587:
	.string	"DBG_OSYSCALL DBG_MODE(25)"
.LASF108:
	.string	"__INT_LEAST8_MAX__ 0x7f"
.LASF663:
	.string	"kt_kstack"
.LASF51:
	.string	"__INT_LEAST8_TYPE__ signed char"
.LASF206:
	.string	"__FLT64_MANT_DIG__ 53"
.LASF385:
	.string	"KMEM_FRAC(x) (((x)>>2)+((x)>>3))"
.LASF566:
	.string	"DBG_DISK DBG_MODE(4)"
.LASF95:
	.string	"__UINTMAX_C(c) c ## ULL"
.LASF300:
	.string	"__GCC_ATOMIC_LLONG_LOCK_FREE 2"
.LASF77:
	.string	"__WCHAR_MAX__ 0x7fffffffL"
.LASF403:
	.string	"ESRCH 3"
.LASF674:
	.string	"p_pid"
.LASF31:
	.string	"__BYTE_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF268:
	.string	"__DEC32_SUBNORMAL_MIN__ 0.000001E-95DF"
.LASF611:
	.string	"KASSERT_GREQ(l,r) KASSERT_GENERIC(l, r, greaterthaneq, \">=\")"
.LASF195:
	.string	"__FLT32_MIN_10_EXP__ (-37)"
.LASF78:
	.string	"__WCHAR_MIN__ (-__WCHAR_MAX__ - 1)"
.LASF348:
	.string	"QUOTE_BY_VALUE(x) QUOTE_BY_NAME(x)"
.LASF714:
	.string	"lessthan"
.LASF111:
	.string	"__INT_LEAST16_MAX__ 0x7fff"
.LASF72:
	.string	"__SCHAR_MAX__ 0x7f"
.LASF684:
	.string	"p_child_link"
.LASF207:
	.string	"__FLT64_DIG__ 15"
.LASF59:
	.string	"__INT_FAST8_TYPE__ signed char"
.LASF16:
	.string	"__PIE__ 2"
.LASF353:
	.string	"list_empty(list) ((list)->l_next == (list))"
.LASF640:
	.string	"list_link_t"
.LASF82:
	.string	"__SIZE_MAX__ 0xffffffffU"
.LASF305:
	.string	"__SIZEOF_WCHAR_T__ 4"
.LASF474:
	.string	"EBADMSG 74"
.LASF464:
	.string	"ENONET 64"
.LASF246:
	.string	"__FLT32X_HAS_INFINITY__ 1"
.LASF232:
	.string	"__FLT128_HAS_INFINITY__ 1"
.LASF433:
	.string	"EDOM 33"
.LASF407:
	.string	"E2BIG 7"
.LASF55:
	.string	"__UINT_LEAST8_TYPE__ unsigned char"
.LASF319:
	.string	"__tune_i686__ 1"
.LASF425:
	.string	"ENOTTY 25"
.LASF398:
	.string	"PROC_NAME_LEN 256"
.LASF659:
	.string	"KT_EXITED"
.LASF62:
	.string	"__INT_FAST64_TYPE__ long long int"
.LASF641:
	.string	"list"
.LASF233:
	.string	"__FLT128_HAS_QUIET_NAN__ 1"
.LASF613:
	.string	"signed char"
.LASF607:
	.string	"KASSERTEQ(l,r) KASSERT_GENERIC(l, r, equals, \"==\")"
.LASF555:
	.string	"_BYELLOW_ \"\\x1b[1;33;40m\""
.LASF249:
	.string	"__FLT64X_DIG__ 18"
.LASF113:
	.string	"__INT_LEAST16_WIDTH__ 16"
.LASF569:
	.string	"DBG_PAGEALLOC DBG_MODE(7)"
.LASF634:
	.string	"kernel_end_bss"
.LASF451:
	.string	"EL2HLT 51"
.LASF445:
	.string	"EL2NSYNC 45"
.LASF556:
	.string	"_BBLUE_ \"\\x1b[1;34;40m\""
.LASF356:
	.string	"list_insert_tail(list,link) list_insert_before(list, link)"
.LASF455:
	.string	"ENOANO 55"
.LASF68:
	.string	"__UINTPTR_TYPE__ unsigned int"
.LASF534:
	.string	"PAGE_SIZE ((uint32_t)(1UL<<PAGE_SHIFT))"
.LASF203:
	.string	"__FLT32_HAS_DENORM__ 1"
.LASF328:
	.string	"__unix__ 1"
.LASF288:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_1 1"
.LASF539:
	.string	"PN_TO_ADDR(x) ((void *)(((uint32_t)(x)) << PAGE_SHIFT))"
.LASF645:
	.string	"ktqueue_t"
.LASF250:
	.string	"__FLT64X_MIN_EXP__ (-16381)"
.LASF347:
	.string	"QUOTE_BY_NAME(...) #__VA_ARGS__"
.LASF134:
	.string	"__INT_FAST64_MAX__ 0x7fffffffffffffffLL"
.LASF381:
	.string	"VMMAP_DIR_LOHI 1"
.LASF150:
	.string	"__FLT_DIG__ 6"
.LASF130:
	.string	"__INT_FAST16_MAX__ 0x7fffffff"
.LASF292:
	.string	"__GCC_ATOMIC_BOOL_LOCK_FREE 2"
.LASF15:
	.string	"__pie__ 2"
.LASF553:
	.string	"_BRED_ \"\\x1b[1;31;40m\""
.LASF413:
	.string	"EACCES 13"
.LASF265:
	.string	"__DEC32_MIN__ 1E-95DF"
.LASF215:
	.string	"__FLT64_EPSILON__ 2.22044604925031308084726333618164062e-16F64"
.LASF622:
	.string	"long long unsigned int"
.LASF416:
	.string	"EBUSY 16"
.LASF143:
	.string	"__GCC_IEC_559 2"
.LASF222:
	.string	"__FLT128_MIN_EXP__ (-16381)"
.LASF81:
	.string	"__PTRDIFF_MAX__ 0x7fffffff"
.LASF695:
	.string	"PROC_DEAD"
.LASF420:
	.string	"ENOTDIR 20"
.LASF122:
	.string	"__UINT_LEAST16_MAX__ 0xffff"
.LASF198:
	.string	"__FLT32_DECIMAL_DIG__ 9"
.LASF459:
	.string	"EBFONT 59"
.LASF490:
	.string	"EMSGSIZE 90"
.LASF585:
	.string	"DBG_THR DBG_MODE(23)"
.LASF120:
	.string	"__UINT_LEAST8_MAX__ 0xff"
.LASF428:
	.string	"ENOSPC 28"
.LASF103:
	.string	"__INT64_MAX__ 0x7fffffffffffffffLL"
.LASF698:
	.string	"file"
.LASF526:
	.string	"ENOKEY 126"
.LASF100:
	.string	"__INT8_MAX__ 0x7f"
.LASF630:
	.string	"kernel_start_bss"
.LASF392:
	.string	"MAX_VNODES 1024"
.LASF364:
	.string	"list_iterate_reverse(list,var,type,member) do { list_link_t *__link; list_link_t *__prev; for (__link = (list)->l_prev; __link != (list); __link = __prev) { var = list_item(__link, type, member); __prev = __link->l_prev; do"
.LASF224:
	.string	"__FLT128_MAX_EXP__ 16384"
.LASF126:
	.string	"__UINT_LEAST64_MAX__ 0xffffffffffffffffULL"
.LASF148:
	.string	"__FLT_RADIX__ 2"
.LASF24:
	.string	"__SIZEOF_LONG_DOUBLE__ 12"
.LASF552:
	.string	"_WHITE_ \"\\x1b[37;40m\""
.LASF200:
	.string	"__FLT32_MIN__ 1.17549435082228750796873653722224568e-38F32"
.LASF176:
	.string	"__DBL_HAS_QUIET_NAN__ 1"
.LASF375:
	.string	"PT_WRITE_THROUGH 0x008"
.LASF637:
	.string	"l_next"
.LASF345:
	.string	"MAX(a,b) ((a) > (b) ? (a) : (b))"
.LASF188:
	.string	"__LDBL_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951L"
.LASF447:
	.string	"EL3RST 47"
.LASF368:
	.string	"PD_USER 0x004"
.LASF218:
	.string	"__FLT64_HAS_INFINITY__ 1"
.LASF136:
	.string	"__UINT_FAST8_MAX__ 0xff"
.LASF706:
	.string	"km_holder"
.LASF313:
	.string	"__ATOMIC_HLE_RELEASE 131072"
.LASF394:
	.string	"NFILES 32"
.LASF181:
	.string	"__LDBL_MAX_EXP__ 16384"
.LASF584:
	.string	"DBG_KB DBG_MODE(22)"
.LASF338:
	.string	"NULL 0"
.LASF646:
	.string	"pagedir_t"
.LASF273:
	.string	"__DEC64_MAX__ 9.999999999999999E384DD"
.LASF517:
	.string	"EUCLEAN 117"
.LASF501:
	.string	"ENETUNREACH 101"
.LASF298:
	.string	"__GCC_ATOMIC_INT_LOCK_FREE 2"
.LASF92:
	.string	"__INTMAX_MAX__ 0x7fffffffffffffffLL"
.LASF719:
	.string	"kmutex_lock_cancellable"
.LASF335:
	.string	"CS402TESTS 10"
.LASF507:
	.string	"ENOTCONN 107"
.LASF573:
	.string	"DBG_PROC DBG_MODE(11)"
.LASF119:
	.string	"__INT_LEAST64_WIDTH__ 64"
.LASF211:
	.string	"__FLT64_MAX_10_EXP__ 308"
.LASF28:
	.string	"__ORDER_LITTLE_ENDIAN__ 1234"
.LASF307:
	.string	"__SIZEOF_PTRDIFF_T__ 4"
.LASF304:
	.string	"__PRAGMA_REDEFINE_EXTNAME 1"
.LASF612:
	.string	"KASSERT_LESSEQ(l,r) KASSERT_GENERIC(l, r, lessthaneq, \"<=\")"
.LASF450:
	.string	"ENOCSI 50"
.LASF437:
	.string	"ENOLCK 37"
.LASF276:
	.string	"__DEC128_MANT_DIG__ 34"
.LASF186:
	.string	"__LDBL_MIN__ 3.36210314311209350626267781732175260e-4932L"
.LASF461:
	.string	"ENODATA 61"
.LASF45:
	.string	"__INT32_TYPE__ int"
.LASF294:
	.string	"__GCC_ATOMIC_CHAR16_T_LOCK_FREE 2"
.LASF635:
	.string	"kernel_start_init"
.LASF626:
	.string	"setup_end"
.LASF373:
	.string	"PT_WRITE 0x002"
.LASF259:
	.string	"__FLT64X_HAS_DENORM__ 1"
.LASF264:
	.string	"__DEC32_MAX_EXP__ 97"
.LASF487:
	.string	"EUSERS 87"
.LASF624:
	.string	"size_t"
.LASF527:
	.string	"EKEYEXPIRED 127"
.LASF415:
	.string	"ENOTBLK 15"
.LASF547:
	.string	"_GREEN_ \"\\x1b[32;40m\""
.LASF332:
	.string	"__NDISKS__ 1"
.LASF642:
	.string	"ktqueue"
.LASF493:
	.string	"EPROTONOSUPPORT 93"
.LASF439:
	.string	"ENOTEMPTY 39"
.LASF638:
	.string	"l_prev"
.LASF681:
	.string	"p_wait"
.LASF422:
	.string	"EINVAL 22"
.LASF184:
	.string	"__LDBL_DECIMAL_DIG__ 21"
.LASF146:
	.string	"__FLT_EVAL_METHOD_TS_18661_3__ 2"
.LASF225:
	.string	"__FLT128_MAX_10_EXP__ 4932"
.LASF129:
	.string	"__INT_FAST8_WIDTH__ 8"
.LASF209:
	.string	"__FLT64_MIN_10_EXP__ (-307)"
.LASF601:
	.string	"dbgq(mode,...) do { if (dbg_active(mode)) { dbg_print(\"%s\", dbg_color(mode)); dbg_print(__VA_ARGS__); dbg_print(\"%s\", _NORMAL_); } } while(0)"
.LASF463:
	.string	"ENOSR 63"
.LASF170:
	.string	"__DBL_MAX__ ((double)1.79769313486231570814527423731704357e+308L)"
.LASF590:
	.string	"DBG_TESTPASS DBG_MODE(31)"
.LASF518:
	.string	"ENOTNAM 118"
.LASF426:
	.string	"ETXTBSY 26"
.LASF60:
	.string	"__INT_FAST16_TYPE__ int"
.LASF469:
	.string	"ESRMNT 69"
.LASF418:
	.string	"EXDEV 18"
.LASF221:
	.string	"__FLT128_DIG__ 33"
.LASF48:
	.string	"__UINT16_TYPE__ short unsigned int"
.LASF6:
	.string	"__VERSION__ \"7.5.0\""
.LASF502:
	.string	"ENETRESET 102"
.LASF376:
	.string	"PT_CACHE_DISABLED 0x010"
.LASF88:
	.string	"__WCHAR_WIDTH__ 32"
.LASF285:
	.string	"__GNUC_STDC_INLINE__ 1"
.LASF701:
	.string	"curthr"
.LASF76:
	.string	"__LONG_LONG_MAX__ 0x7fffffffffffffffLL"
.LASF46:
	.string	"__INT64_TYPE__ long long int"
.LASF154:
	.string	"__FLT_MAX_10_EXP__ 38"
.LASF513:
	.string	"EHOSTUNREACH 113"
.LASF470:
	.string	"ECOMM 70"
.LASF243:
	.string	"__FLT32X_EPSILON__ 2.22044604925031308084726333618164062e-16F32x"
.LASF401:
	.string	"EPERM 1"
.LASF286:
	.string	"__NO_INLINE__ 1"
.LASF277:
	.string	"__DEC128_MIN_EXP__ (-6142)"
.LASF149:
	.string	"__FLT_MANT_DIG__ 24"
.LASF380:
	.string	"PT_GLOBAL 0x100"
.LASF434:
	.string	"ERANGE 34"
.LASF720:
	.string	"equals"
.LASF212:
	.string	"__FLT64_DECIMAL_DIG__ 17"
.LASF512:
	.string	"EHOSTDOWN 112"
.LASF283:
	.string	"__REGISTER_PREFIX__ "
.LASF194:
	.string	"__FLT32_MIN_EXP__ (-125)"
.LASF430:
	.string	"EROFS 30"
.LASF717:
	.string	"proc/kmutex.c"
.LASF137:
	.string	"__UINT_FAST16_MAX__ 0xffffffffU"
.LASF653:
	.string	"c_kstacksz"
.LASF156:
	.string	"__FLT_MAX__ 3.40282346638528859811704183484516925e+38F"
.LASF166:
	.string	"__DBL_MIN_10_EXP__ (-307)"
.LASF672:
	.string	"char"
.LASF636:
	.string	"kernel_end_init"
.LASF14:
	.string	"__PIC__ 2"
.LASF565:
	.string	"DBG_SCHED DBG_MODE(3)"
.LASF193:
	.string	"__FLT32_DIG__ 6"
.LASF409:
	.string	"EBADF 9"
.LASF432:
	.string	"EPIPE 32"
.LASF217:
	.string	"__FLT64_HAS_DENORM__ 1"
.LASF554:
	.string	"_BGREEN_ \"\\x1b[1;32;40m\""
.LASF321:
	.string	"__code_model_32__ 1"
.LASF661:
	.string	"kthread"
.LASF245:
	.string	"__FLT32X_HAS_DENORM__ 1"
.LASF336:
	.string	"CS402INITCHOICE 0"
.LASF670:
	.string	"kt_qlink"
.LASF117:
	.string	"__INT_LEAST64_MAX__ 0x7fffffffffffffffLL"
.LASF651:
	.string	"c_pdptr"
.LASF559:
	.string	"_BWHITE_ \"\\x1b[1;37;40m\""
.LASF519:
	.string	"ENAVAIL 119"
.LASF255:
	.string	"__FLT64X_MAX__ 1.18973149535723176502126385303097021e+4932F64x"
.LASF228:
	.string	"__FLT128_MIN__ 3.36210314311209350626267781732175260e-4932F128"
.LASF570:
	.string	"DBG_INTR DBG_MODE(8)"
.LASF322:
	.string	"__SEG_FS 1"
.LASF705:
	.string	"km_waitq"
.LASF110:
	.string	"__INT_LEAST8_WIDTH__ 8"
.LASF598:
	.ascii	"DBG_TAB {\"error\", DBG_ERROR, _BWHITE_ }, {\"temp\", DBG_TE"
	.ascii	"MP, _NORMAL_ }, {\"print\", DBG_PRINT, _NORMAL_ }, {\"test\""
	.ascii	", DBG_TEST, _RED_ }, {\"testpass\", DBG_TESTPASS, _GREEN_ },"
	.ascii	" {\"testfail\", DBG_TESTFAIL, _RED_ }, {\"proc\", DBG_PROC, "
	.ascii	"_BLUE_ }, {\"thr\", DBG_THR, _CYAN_ }, {\"sched\", DBG_SCHED"
	.ascii	", _GREEN_ }, {\"init\", DBG_INIT, _NORMAL_ }, {\"term\", DBG"
	.ascii	"_TERM, _BMAGENTA_ }, {\"disk\", DBG_DISK, _YELLOW_ }, {\"mem"
	.ascii	"dev\", DBG_MEMDEV, _BBLUE_ }, {\"vfs\", DBG_VFS, _WHITE_ }, "
	.ascii	"{\"fref\", DBG_FREF, _MAGENTA_ }, {\"vnref\", DBG_VNREF, _CY"
	.ascii	"AN_ }, {\"s5fs\", DBG_S5FS, _BRED_ }, {\"pframe\", DBG_PFRAM"
	.ascii	"E, _BMAGENTA_ }, {\"anon\", DBG_ANON, _WHITE_ }, {\"vmmap\","
	.ascii	" DBG_VMMAP, _BGREEN_ }, {\"fork\", DBG_FORK, _BYELLOW_ }, {\""
	.ascii	"brk\", DBG_BRK , _YELLOW_ }, {\"exec\", DBG_EXEC, _BRED_ }, "
	.ascii	"{\"elf\", DBG_ELF, _BGREEN_ }, {\"pgtbl\", DBG_PGTBL, _BBLUE"
	.ascii	"_ }, {\"osyscall\", DBG_OSYSCALL, _BMAGENTA_ }, {\"vm\", DBG"
	.ascii	"_VM, _RED_ }, {\"syscall\", DBG_SYSCALL, _RED_ }, {\"intr\""
	.string	", DBG_INTR, _BRED_ }, {\"kmalloc\", DBG_KMALLOC, _MAGENTA_ }, {\"pagealloc\", DBG_PAGEALLOC, _WHITE_ }, {\"kb\", DBG_KB, _BLUE_ }, {\"core\", DBG_CORE, _GREEN_ }, {\"mm\", DBG_MM, _RED_ }, {\"user\", DBG_USER, _BYELLOW_}, {\"all\", DBG_ALL, _NORMAL_ }, { NULL, 0, NULL }"
.LASF402:
	.string	"ENOENT 2"
.LASF104:
	.string	"__UINT8_MAX__ 0xff"
.LASF105:
	.string	"__UINT16_MAX__ 0xffff"
.LASF438:
	.string	"ENOSYS 38"
.LASF366:
	.string	"PD_PRESENT 0x001"
.LASF378:
	.string	"PT_DIRTY 0x040"
.LASF351:
	.string	"list_link_is_linked(link) (((link)->l_next != NULL) && ((link)->l_prev != NULL))"
.LASF462:
	.string	"ETIME 62"
.LASF716:
	.string	"GNU C99 7.5.0 -m32 -march=i686 -g3 -gdwarf-3 -std=c99 -ffreestanding -fno-builtin -fno-stack-protector -fsigned-char"
.LASF96:
	.string	"__INTMAX_WIDTH__ 64"
.LASF266:
	.string	"__DEC32_MAX__ 9.999999E96DF"
.LASF214:
	.string	"__FLT64_MIN__ 2.22507385850720138309023271733240406e-308F64"
.LASF525:
	.string	"ECANCELED 125"
.LASF52:
	.string	"__INT_LEAST16_TYPE__ short int"
.LASF196:
	.string	"__FLT32_MAX_EXP__ 128"
.LASF324:
	.string	"__gnu_linux__ 1"
.LASF293:
	.string	"__GCC_ATOMIC_CHAR_LOCK_FREE 2"
.LASF680:
	.string	"p_state"
.LASF109:
	.string	"__INT8_C(c) c"
.LASF141:
	.string	"__INTPTR_WIDTH__ 32"
.LASF182:
	.string	"__LDBL_MAX_10_EXP__ 4932"
.LASF309:
	.string	"__i386__ 1"
.LASF151:
	.string	"__FLT_MIN_EXP__ (-125)"
.LASF715:
	.string	"notequals"
.LASF491:
	.string	"EPROTOTYPE 91"
.LASF628:
	.string	"kernel_start_text"
.LASF504:
	.string	"ECONNRESET 104"
.LASF299:
	.string	"__GCC_ATOMIC_LONG_LOCK_FREE 2"
.LASF235:
	.string	"__FLT32X_DIG__ 15"
.LASF666:
	.string	"kt_proc"
.LASF384:
	.string	"TICK_MSECS 10"
.LASF575:
	.string	"DBG_PFRAME DBG_MODE(13)"
.LASF234:
	.string	"__FLT32X_MANT_DIG__ 53"
.LASF360:
	.string	"list_item(link,type,member) (type*)((char*)(link) - offsetof(type, member))"
.LASF333:
	.string	"__DBG__ all"
.LASF379:
	.string	"PT_SIZE 0x080"
.LASF704:
	.string	"kmutex"
.LASF528:
	.string	"EKEYREVOKED 128"
.LASF620:
	.string	"long long int"
.LASF253:
	.string	"__FLT64X_MAX_10_EXP__ 4932"
.LASF171:
	.string	"__DBL_MIN__ ((double)2.22507385850720138309023271733240406e-308L)"
.LASF339:
	.string	"inline __attribute__ ((always_inline,used))"
.LASF649:
	.string	"c_esp"
.LASF106:
	.string	"__UINT32_MAX__ 0xffffffffU"
.LASF599:
	.string	"DBG_BUFFER_SIZE (PAGE_SIZE)"
.LASF17:
	.string	"__FINITE_MATH_ONLY__ 0"
.LASF625:
	.string	"pid_t"
.LASF372:
	.string	"PT_PRESENT 0x001"
.LASF561:
	.string	"DBG_ALL (~0ULL)"
.LASF213:
	.string	"__FLT64_MAX__ 1.79769313486231570814527423731704357e+308F64"
.LASF251:
	.string	"__FLT64X_MIN_10_EXP__ (-4931)"
.LASF344:
	.string	"MIN(a,b) ((a) < (b) ? (a) : (b))"
.LASF371:
	.string	"PD_ACCESSED 0x020"
.LASF669:
	.string	"kt_state"
.LASF314:
	.string	"__GCC_ASM_FLAG_OUTPUTS__ 1"
.LASF647:
	.string	"context"
.LASF564:
	.string	"DBG_INIT DBG_MODE(2)"
.LASF571:
	.string	"DBG_TERM DBG_MODE(9)"
.LASF329:
	.string	"__ELF__ 1"
.LASF242:
	.string	"__FLT32X_MIN__ 2.22507385850720138309023271733240406e-308F32x"
.LASF692:
	.string	"vmm_list"
.LASF633:
	.string	"kernel_end_data"
.LASF112:
	.string	"__INT16_C(c) c"
.LASF303:
	.string	"__GCC_HAVE_DWARF2_CFI_ASM 1"
.LASF542:
	.string	"PAGE_NSIZES 8"
.LASF107:
	.string	"__UINT64_MAX__ 0xffffffffffffffffULL"
.LASF396:
	.string	"VFS_ROOTFS_TYPE \"ramfs\""
.LASF132:
	.string	"__INT_FAST32_MAX__ 0x7fffffff"
.LASF261:
	.string	"__FLT64X_HAS_QUIET_NAN__ 1"
.LASF161:
	.string	"__FLT_HAS_INFINITY__ 1"
.LASF448:
	.string	"ELNRNG 48"
.LASF405:
	.string	"EIO 5"
.LASF429:
	.string	"ESPIPE 29"
.LASF440:
	.string	"ELOOP 40"
.LASF0:
	.string	"__STDC__ 1"
.LASF19:
	.string	"__SIZEOF_LONG__ 4"
.LASF453:
	.string	"EBADR 53"
.LASF543:
	.string	"PAGE_SAME(addr1,addr2) (PAGE_ALIGN_DOWN(addr1) == PAGE_ALIGN_DOWN(addr2))"
.LASF167:
	.string	"__DBL_MAX_EXP__ 1024"
.LASF572:
	.string	"DBG_FORK DBG_MODE(10)"
.LASF12:
	.string	"__ATOMIC_CONSUME 1"
.LASF658:
	.string	"KT_SLEEP_CANCELLABLE"
.LASF133:
	.string	"__INT_FAST32_WIDTH__ 32"
.LASF506:
	.string	"EISCONN 106"
.LASF37:
	.string	"__WINT_TYPE__ unsigned int"
.LASF592:
	.string	"DBG_MEMDEV DBG_MODE(33)"
.LASF75:
	.string	"__LONG_MAX__ 0x7fffffffL"
.LASF101:
	.string	"__INT16_MAX__ 0x7fff"
.LASF567:
	.string	"DBG_TEMP DBG_MODE(5)"
.LASF83:
	.string	"__SCHAR_WIDTH__ 8"
.LASF125:
	.string	"__UINT32_C(c) c ## U"
.LASF180:
	.string	"__LDBL_MIN_10_EXP__ (-4931)"
.LASF523:
	.string	"ENOMEDIUM 123"
.LASF23:
	.string	"__SIZEOF_DOUBLE__ 8"
.LASF5:
	.string	"__GNUC_PATCHLEVEL__ 0"
.LASF121:
	.string	"__UINT8_C(c) c"
.LASF568:
	.string	"DBG_KMALLOC DBG_MODE(6)"
.LASF683:
	.string	"p_list_link"
.LASF593:
	.string	"DBG_ANON DBG_MODE(34)"
.LASF660:
	.string	"kthread_state_t"
.LASF80:
	.string	"__WINT_MIN__ 0U"
.LASF574:
	.string	"DBG_VNREF DBG_MODE(12)"
.LASF177:
	.string	"__LDBL_MANT_DIG__ 64"
.LASF510:
	.string	"ETIMEDOUT 110"
.LASF367:
	.string	"PD_WRITE 0x002"
.LASF391:
	.string	"MAX_VFS 8"
.LASF187:
	.string	"__LDBL_EPSILON__ 1.08420217248550443400745280086994171e-19L"
.LASF690:
	.string	"kthread_t"
.LASF709:
	.string	"kmutex_lock"
.LASF354:
	.string	"list_insert_before(old,new) do { list_link_t *prev = (new); list_link_t *next = (old); prev->l_next = next; prev->l_prev = next->l_prev; next->l_prev->l_next = prev; next->l_prev = prev; } while(0)"
.LASF700:
	.string	"proc_t"
.LASF431:
	.string	"EMLINK 31"
.LASF190:
	.string	"__LDBL_HAS_INFINITY__ 1"
.LASF66:
	.string	"__UINT_FAST64_TYPE__ long long unsigned int"
.LASF657:
	.string	"KT_SLEEP"
.LASF144:
	.string	"__GCC_IEC_559_COMPLEX 2"
.LASF711:
	.string	"greaterthaneq"
.LASF678:
	.string	"p_pproc"
.LASF662:
	.string	"kt_ctx"
.LASF223:
	.string	"__FLT128_MIN_10_EXP__ (-4931)"
.LASF32:
	.string	"__FLOAT_WORD_ORDER__ __ORDER_LITTLE_ENDIAN__"
.LASF289:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_2 1"
.LASF91:
	.string	"__SIZE_WIDTH__ 32"
.LASF262:
	.string	"__DEC32_MANT_DIG__ 7"
.LASF675:
	.string	"p_comm"
.LASF691:
	.string	"vmmap"
.LASF270:
	.string	"__DEC64_MIN_EXP__ (-382)"
.LASF98:
	.string	"__SIG_ATOMIC_MIN__ (-__SIG_ATOMIC_MAX__ - 1)"
.LASF102:
	.string	"__INT32_MAX__ 0x7fffffff"
.LASF589:
	.string	"DBG_TEST DBG_MODE(30)"
.LASF86:
	.string	"__LONG_WIDTH__ 32"
.LASF9:
	.string	"__ATOMIC_ACQUIRE 2"
.LASF123:
	.string	"__UINT16_C(c) c"
.LASF486:
	.string	"ESTRPIPE 86"
.LASF632:
	.string	"kernel_end_text"
.LASF538:
	.string	"PAGE_OFFSET(x) ((uintptr_t)(x)&~PAGE_MASK)"
.LASF323:
	.string	"__SEG_GS 1"
.LASF520:
	.string	"EISNAM 120"
.LASF483:
	.string	"ELIBEXEC 83"
.LASF315:
	.string	"__i686 1"
.LASF557:
	.string	"_BMAGENTA_ \"\\x1b[1;35;40m\""
.LASF317:
	.string	"__pentiumpro 1"
.LASF39:
	.string	"__UINTMAX_TYPE__ long long unsigned int"
.LASF341:
	.string	"likely(x) __builtin_expect((x), 1)"
.LASF340:
	.string	"unlikely(x) __builtin_expect((x), 0)"
.LASF99:
	.string	"__SIG_ATOMIC_WIDTH__ 32"
.LASF446:
	.string	"EL3HLT 46"
.LASF73:
	.string	"__SHRT_MAX__ 0x7fff"
.LASF665:
	.string	"kt_errno"
.LASF708:
	.string	"kmutex_unlock"
.LASF30:
	.string	"__ORDER_PDP_ENDIAN__ 3412"
.LASF494:
	.string	"ESOCKTNOSUPPORT 94"
.LASF56:
	.string	"__UINT_LEAST16_TYPE__ short unsigned int"
.LASF582:
	.string	"DBG_VFS DBG_MODE(20)"
.LASF155:
	.string	"__FLT_DECIMAL_DIG__ 9"
.LASF485:
	.string	"ERESTART 85"
.LASF577:
	.string	"DBG_SYSCALL DBG_MODE(15)"
.LASF629:
	.string	"kernel_start_data"
.LASF179:
	.string	"__LDBL_MIN_EXP__ (-16381)"
.LASF89:
	.string	"__WINT_WIDTH__ 32"
.LASF281:
	.string	"__DEC128_EPSILON__ 1E-33DL"
.LASF256:
	.string	"__FLT64X_MIN__ 3.36210314311209350626267781732175260e-4932F64x"
.LASF421:
	.string	"EISDIR 21"
.LASF128:
	.string	"__INT_FAST8_MAX__ 0x7f"
.LASF656:
	.string	"KT_RUN"
.LASF201:
	.string	"__FLT32_EPSILON__ 1.19209289550781250000000000000000000e-7F32"
.LASF546:
	.string	"_RED_ \"\\x1b[31;40m\""
.LASF511:
	.string	"ECONNREFUSED 111"
.LASF562:
	.string	"DBG_CORE DBG_MODE(0)"
.LASF615:
	.string	"short int"
.LASF64:
	.string	"__UINT_FAST16_TYPE__ unsigned int"
.LASF540:
	.string	"ADDR_TO_PN(x) (((uint32_t)(x)) >> PAGE_SHIFT)"
.LASF707:
	.string	"kmutex_t"
.LASF271:
	.string	"__DEC64_MAX_EXP__ 385"
.LASF308:
	.string	"__i386 1"
.LASF417:
	.string	"EEXIST 17"
.LASF468:
	.string	"EADV 68"
.LASF237:
	.string	"__FLT32X_MIN_10_EXP__ (-307)"
.LASF427:
	.string	"EFBIG 27"
.LASF65:
	.string	"__UINT_FAST32_TYPE__ unsigned int"
.LASF544:
	.string	"_NORMAL_ \"\\x1b[0m\""
.LASF654:
	.string	"context_t"
.LASF457:
	.string	"EBADSLT 57"
.LASF260:
	.string	"__FLT64X_HAS_INFINITY__ 1"
.LASF667:
	.string	"kt_cancelled"
.LASF278:
	.string	"__DEC128_MAX_EXP__ 6145"
.LASF236:
	.string	"__FLT32X_MIN_EXP__ (-1021)"
.LASF496:
	.string	"EPFNOSUPPORT 96"
.LASF320:
	.string	"__tune_pentiumpro__ 1"
.LASF533:
	.string	"PAGE_SHIFT 12"
.LASF467:
	.string	"ENOLINK 67"
.LASF63:
	.string	"__UINT_FAST8_TYPE__ unsigned char"
.LASF115:
	.string	"__INT32_C(c) c"
.LASF202:
	.string	"__FLT32_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F32"
.LASF191:
	.string	"__LDBL_HAS_QUIET_NAN__ 1"
.LASF43:
	.string	"__INT8_TYPE__ signed char"
.LASF79:
	.string	"__WINT_MAX__ 0xffffffffU"
.LASF337:
	.string	"GDBWAIT 0"
.LASF529:
	.string	"EKEYREJECTED 129"
.LASF325:
	.string	"__linux 1"
.LASF500:
	.string	"ENETDOWN 100"
.LASF355:
	.string	"list_insert_head(list,link) list_insert_before((list)->l_next, link)"
.LASF514:
	.string	"EALREADY 114"
.LASF718:
	.string	"/home/zxc/Desktop/OS/kernel1/weenix-assignment-3.8.0/weenix/kernel"
.LASF596:
	.string	"DBG_USER DBG_MODE(38)"
.LASF621:
	.string	"uint64_t"
.LASF49:
	.string	"__UINT32_TYPE__ unsigned int"
.LASF488:
	.string	"ENOTSOCK 88"
.LASF388:
	.string	"PAGEOUTD_FREE_MIN_SHIFT 4"
.LASF602:
	.string	"dbginfo(mode,func,data) do { if (dbg_active(mode)) { dbg_print(\"%s\", dbg_color(mode)); dbg_printinfo(func, data); dbg_print(\"%s\", _NORMAL_); } } while(0)"
.LASF139:
	.string	"__UINT_FAST64_MAX__ 0xffffffffffffffffULL"
.LASF138:
	.string	"__UINT_FAST32_MAX__ 0xffffffffU"
.LASF118:
	.string	"__INT64_C(c) c ## LL"
.LASF550:
	.string	"_MAGENTA_ \"\\x1b[35;40m\""
.LASF229:
	.string	"__FLT128_EPSILON__ 1.92592994438723585305597794258492732e-34F128"
.LASF275:
	.string	"__DEC64_SUBNORMAL_MIN__ 0.000000000000001E-383DD"
.LASF597:
	.string	"DBG_DEFAULT DBG_ERROR"
.LASF697:
	.string	"pagedir"
.LASF20:
	.string	"__SIZEOF_LONG_LONG__ 8"
.LASF47:
	.string	"__UINT8_TYPE__ unsigned char"
.LASF84:
	.string	"__SHRT_WIDTH__ 16"
.LASF548:
	.string	"_YELLOW_ \"\\x1b[33;40m\""
.LASF465:
	.string	"ENOPKG 65"
.LASF54:
	.string	"__INT_LEAST64_TYPE__ long long int"
.LASF423:
	.string	"ENFILE 23"
.LASF435:
	.string	"EDEADLK 35"
.LASF399:
	.string	"PID_IDLE 0"
.LASF466:
	.string	"EREMOTE 66"
.LASF33:
	.string	"__SIZEOF_POINTER__ 4"
.LASF350:
	.string	"list_link_init(link) do { (link)->l_next = (link)->l_prev = NULL; } while (0);"
.LASF460:
	.string	"ENOSTR 60"
.LASF530:
	.string	"EOWNERDEAD 130"
.LASF578:
	.string	"DBG_FREF DBG_MODE(16)"
.LASF644:
	.string	"tq_size"
.LASF248:
	.string	"__FLT64X_MANT_DIG__ 64"
.LASF579:
	.string	"DBG_PGTBL DBG_MODE(17)"
.LASF90:
	.string	"__PTRDIFF_WIDTH__ 32"
.LASF456:
	.string	"EBADRQC 56"
.LASF159:
	.string	"__FLT_DENORM_MIN__ 1.40129846432481707092372958328991613e-45F"
.LASF516:
	.string	"ESTALE 116"
.LASF85:
	.string	"__INT_WIDTH__ 32"
.LASF623:
	.string	"uintptr_t"
.LASF302:
	.string	"__GCC_ATOMIC_POINTER_LOCK_FREE 2"
.LASF671:
	.string	"kt_plink"
.LASF673:
	.string	"proc"
.LASF282:
	.string	"__DEC128_SUBNORMAL_MIN__ 0.000000000000000000000000000000001E-6143DL"
.LASF558:
	.string	"_BCYAN_ \"\\x1b[1;36;40m\""
.LASF284:
	.string	"__USER_LABEL_PREFIX__ "
.LASF503:
	.string	"ECONNABORTED 103"
.LASF648:
	.string	"c_eip"
.LASF532:
	.string	"ENOTSUP EOPNOTSUPP"
.LASF295:
	.string	"__GCC_ATOMIC_CHAR32_T_LOCK_FREE 2"
.LASF1:
	.string	"__STDC_VERSION__ 199901L"
.LASF36:
	.string	"__WCHAR_TYPE__ long int"
.LASF327:
	.string	"__unix 1"
.LASF535:
	.string	"PAGE_MASK (0xffffffff<<PAGE_SHIFT)"
.LASF536:
	.string	"PAGE_ALIGN_DOWN(x) ((void*)(((uintptr_t)(x))&PAGE_MASK))"
.LASF26:
	.string	"__CHAR_BIT__ 8"
.LASF610:
	.string	"KASSERT_LESS(l,r) KASSERT_GENERIC(l, r, lessthan, \"<\")"
.LASF7:
	.string	"__ATOMIC_RELAXED 0"
.LASF2:
	.string	"__STDC_HOSTED__ 0"
.LASF594:
	.string	"DBG_VMMAP DBG_MODE(35)"
.LASF475:
	.string	"EOVERFLOW 75"
.LASF521:
	.string	"EREMOTEIO 121"
.LASF140:
	.string	"__INTPTR_MAX__ 0x7fffffff"
.LASF346:
	.string	"CONTAINER_OF(obj,type,member) ((type *)((char *)(obj) - offsetof(type, member)))"
.LASF69:
	.string	"__has_include(STR) __has_include__(STR)"
.LASF458:
	.string	"EDEADLOCK EDEADLK"
.LASF449:
	.string	"EUNATCH 49"
.LASF386:
	.string	"PF_HASH_SIZE 17"
.LASF244:
	.string	"__FLT32X_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F32x"
.LASF472:
	.string	"EMULTIHOP 72"
.LASF331:
	.string	"__NTERMS__ 3"
.LASF508:
	.string	"ESHUTDOWN 108"
.LASF316:
	.string	"__i686__ 1"
.LASF290:
	.string	"__GCC_HAVE_SYNC_COMPARE_AND_SWAP_4 1"
.LASF153:
	.string	"__FLT_MAX_EXP__ 128"
.LASF696:
	.string	"proc_state_t"
.LASF11:
	.string	"__ATOMIC_ACQ_REL 4"
.LASF576:
	.string	"DBG_ERROR DBG_MODE(14)"
.LASF563:
	.string	"DBG_MM DBG_MODE(1)"
.LASF614:
	.string	"unsigned char"
.LASF263:
	.string	"__DEC32_MIN_EXP__ (-94)"
.LASF600:
	.string	"dbg(mode,...) do { if (dbg_active(mode)) { dbg_print(\"%s\", dbg_color(mode)); dbg_print(\"%s:%d %s(): \",__FILE__, __LINE__, __func__); dbg_print(__VA_ARGS__); dbg_print(\"%s\", _NORMAL_); } } while(0)"
.LASF359:
	.string	"list_remove_tail(list) list_remove((list)->l_prev)"
.LASF157:
	.string	"__FLT_MIN__ 1.17549435082228750796873653722224568e-38F"
.LASF664:
	.string	"kt_retval"
.LASF479:
	.string	"ELIBACC 79"
.LASF67:
	.string	"__INTPTR_TYPE__ int"
.LASF515:
	.string	"EINPROGRESS 115"
.LASF147:
	.string	"__DEC_EVAL_METHOD__ 2"
.LASF480:
	.string	"ELIBBAD 80"
.LASF410:
	.string	"ECHILD 10"
.LASF443:
	.string	"EIDRM 43"
.LASF116:
	.string	"__INT_LEAST32_WIDTH__ 32"
.LASF580:
	.string	"DBG_BRK DBG_MODE(18)"
.LASF357:
	.string	"list_remove(link) do { list_link_t *ll = (link); list_link_t *prev = ll->l_prev; list_link_t *next = ll->l_next; prev->l_next = next; next->l_prev = prev; ll->l_next = ll->l_prev = NULL; } while(0)"
.LASF397:
	.string	"PROC_MAX_COUNT 65536"
.LASF374:
	.string	"PT_USER 0x004"
.LASF473:
	.string	"EDOTDOT 73"
.LASF326:
	.string	"__linux__ 1"
.LASF650:
	.string	"c_ebp"
.LASF296:
	.string	"__GCC_ATOMIC_WCHAR_T_LOCK_FREE 2"
.LASF710:
	.string	"kmutex_init"
.LASF53:
	.string	"__INT_LEAST32_TYPE__ int"
.LASF34:
	.string	"__SIZE_TYPE__ unsigned int"
.LASF537:
	.string	"PAGE_ALIGN_UP(x) ((void*)(((((uintptr_t)(x))-1)&PAGE_MASK)+PAGE_SIZE))"
.LASF318:
	.string	"__pentiumpro__ 1"
.LASF414:
	.string	"EFAULT 14"
.LASF699:
	.string	"vnode"
.LASF226:
	.string	"__FLT128_DECIMAL_DIG__ 36"
.LASF655:
	.string	"KT_NO_STATE"
.LASF454:
	.string	"EXFULL 54"
.LASF297:
	.string	"__GCC_ATOMIC_SHORT_LOCK_FREE 2"
.LASF254:
	.string	"__FLT64X_DECIMAL_DIG__ 21"
.LASF444:
	.string	"ECHRNG 44"
.LASF57:
	.string	"__UINT_LEAST32_TYPE__ unsigned int"
.LASF387:
	.string	"PAGEOUTD_FREE_TARGET_SHIFT 5"
.LASF158:
	.string	"__FLT_EPSILON__ 1.19209289550781250000000000000000000e-7F"
.LASF208:
	.string	"__FLT64_MIN_EXP__ (-1021)"
.LASF393:
	.string	"NAME_LEN 28"
.LASF175:
	.string	"__DBL_HAS_INFINITY__ 1"
.LASF689:
	.string	"p_vmmap"
.LASF404:
	.string	"EINTR 4"
.LASF334:
	.string	"__KERNEL__ 1"
.LASF61:
	.string	"__INT_FAST32_TYPE__ int"
.LASF694:
	.string	"PROC_RUNNING"
.LASF162:
	.string	"__FLT_HAS_QUIET_NAN__ 1"
.LASF18:
	.string	"__SIZEOF_INT__ 4"
.LASF668:
	.string	"kt_wchan"
.LASF38:
	.string	"__INTMAX_TYPE__ long long int"
.LASF686:
	.string	"p_cwd"
.LASF541:
	.string	"PAGE_ALIGNED(x) (0 == ((uintptr_t)(x)) % PAGE_SIZE)"
.LASF93:
	.string	"__INTMAX_C(c) c ## LL"
.LASF408:
	.string	"ENOEXEC 8"
.LASF489:
	.string	"EDESTADDRREQ 89"
.LASF595:
	.string	"DBG_ELF DBG_MODE(37)"
.LASF310:
	.string	"__SIZEOF_FLOAT80__ 12"
.LASF352:
	.string	"list_init(list) do { (list)->l_next = (list)->l_prev = (list); } while (0);"
.LASF682:
	.string	"p_pagedir"
.LASF50:
	.string	"__UINT64_TYPE__ long long unsigned int"
.LASF522:
	.string	"EDQUOT 122"
.LASF247:
	.string	"__FLT32X_HAS_QUIET_NAN__ 1"
.LASF168:
	.string	"__DBL_MAX_10_EXP__ 308"
.LASF476:
	.string	"ENOTUNIQ 76"
.LASF616:
	.string	"short unsigned int"
.LASF71:
	.string	"__GXX_ABI_VERSION 1011"
.LASF13:
	.string	"__pic__ 2"
.LASF362:
	.string	"list_tail(list,type,member) list_item((list)->l_prev, type, member)"
.LASF22:
	.string	"__SIZEOF_FLOAT__ 4"
.LASF583:
	.string	"DBG_S5FS DBG_MODE(21)"
.LASF411:
	.string	"EAGAIN 11"
.LASF27:
	.string	"__BIGGEST_ALIGNMENT__ 16"
.LASF677:
	.string	"p_children"
.LASF230:
	.string	"__FLT128_DENORM_MIN__ 6.47517511943802511092443895822764655e-4966F128"
.LASF370:
	.string	"PD_CACHE_DISABLED 0x010"
.LASF419:
	.string	"ENODEV 19"
.LASF441:
	.string	"EWOULDBLOCK EAGAIN"
.LASF591:
	.string	"DBG_TESTFAIL DBG_MODE(32)"
.LASF713:
	.string	"greaterthan"
.LASF311:
	.string	"__SIZEOF_FLOAT128__ 16"
.LASF400:
	.string	"PID_INIT 1"
.LASF280:
	.string	"__DEC128_MAX__ 9.999999999999999999999999999999999E6144DL"
.LASF545:
	.string	"_BLACK_ \"\\x1b[30;47m\""
.LASF312:
	.string	"__ATOMIC_HLE_ACQUIRE 65536"
.LASF497:
	.string	"EAFNOSUPPORT 97"
.LASF287:
	.string	"__STRICT_ANSI__ 1"
.LASF124:
	.string	"__UINT_LEAST32_MAX__ 0xffffffffU"
.LASF369:
	.string	"PD_WRITE_THROUGH 0x008"
.LASF482:
	.string	"ELIBMAX 82"
.LASF239:
	.string	"__FLT32X_MAX_10_EXP__ 308"
.LASF142:
	.string	"__UINTPTR_MAX__ 0xffffffffU"
.LASF174:
	.string	"__DBL_HAS_DENORM__ 1"
.LASF363:
	.string	"list_iterate_begin(list,var,type,member) do { list_link_t *__link; list_link_t *__next; for (__link = (list)->l_next; __link != (list); __link = __next) { var = list_item(__link, type, member); __next = __link->l_next; do"
.LASF365:
	.string	"list_iterate_end() while(0); } } while(0)"
.LASF617:
	.string	"int32_t"
.LASF606:
	.ascii	"K"
	.string	"ASSERT_GENERIC(left,right,comparator,comp_str) do { int __left = (int)(left); int __right = (int)(right); if (!comparator(__left, __right)) { panic(\"assertion failed: %s %s %s. Left: %d, Right: %d\\n\", #left, comp_str, #right, __left, __right); } } while(0)"
.LASF524:
	.string	"EMEDIUMTYPE 124"
.LASF197:
	.string	"__FLT32_MAX_10_EXP__ 38"
.LASF477:
	.string	"EBADFD 77"
.LASF586:
	.string	"DBG_PRINT DBG_MODE(24)"
.LASF676:
	.string	"p_threads"
.LASF114:
	.string	"__INT_LEAST32_MAX__ 0x7fffffff"
.LASF383:
	.string	"DEFAULT_STACK_SIZE (56*1024)"
.LASF216:
	.string	"__FLT64_DENORM_MIN__ 4.94065645841246544176568792868221372e-324F64"
.LASF389:
	.string	"MAXPATHLEN 1024"
.LASF560:
	.string	"DBG_MODE(x) (1ULL << (x))"
.LASF127:
	.string	"__UINT64_C(c) c ## ULL"
.LASF272:
	.string	"__DEC64_MIN__ 1E-383DD"
.LASF199:
	.string	"__FLT32_MAX__ 3.40282346638528859811704183484516925e+38F32"
.LASF172:
	.string	"__DBL_EPSILON__ ((double)2.22044604925031308084726333618164062e-16L)"
.LASF94:
	.string	"__UINTMAX_MAX__ 0xffffffffffffffffULL"
.LASF42:
	.string	"__SIG_ATOMIC_TYPE__ int"
.LASF258:
	.string	"__FLT64X_DENORM_MIN__ 3.64519953188247460252840593361941982e-4951F64x"
.LASF702:
	.string	"curproc"
.LASF424:
	.string	"EMFILE 24"
.LASF231:
	.string	"__FLT128_HAS_DENORM__ 1"
.LASF169:
	.string	"__DBL_DECIMAL_DIG__ 17"
.LASF189:
	.string	"__LDBL_HAS_DENORM__ 1"
.LASF390:
	.string	"MAX_FILES 1024"
.LASF164:
	.string	"__DBL_DIG__ 15"
.LASF269:
	.string	"__DEC64_MANT_DIG__ 16"
.LASF160:
	.string	"__FLT_HAS_DENORM__ 1"
.LASF135:
	.string	"__INT_FAST64_WIDTH__ 64"
.LASF183:
	.string	"__DECIMAL_DIG__ 21"
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
