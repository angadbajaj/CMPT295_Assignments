	.file	"main.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	compare
	.type	compare, @function
compare:
.LFB39:
	.cfi_startproc
	movss	(%rdi), %xmm0
	subss	(%rsi), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	ja	.L3
	ucomiss	%xmm1, %xmm0
	movl	$1, %eax
	jbe	.L6
	rep ret
	.p2align 4,,10
	.p2align 3
.L6:
	cvttss2si	%xmm0, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE39:
	.size	compare, .-compare
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	u2f
	.type	u2f, @function
u2f:
.LFB38:
	.cfi_startproc
	movl	%edi, -4(%rsp)
	movss	-4(%rsp), %xmm0
	ret
	.cfi_endproc
.LFE38:
	.size	u2f, .-u2f
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"Test Case 1:\n"
.LC6:
	.string	"The total before sorting: "
.LC7:
	.string	" The total after sorting: "
.LC8:
	.string	"\nTest Case 2:\n"
.LC10:
	.string	"MAJOR ERROR "
.LC11:
	.string	""
	.section	.text.unlikely
.LCOLDB12:
	.section	.text.startup,"ax",@progbits
.LHOTB12:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB40:
	.cfi_startproc
	subq	$328, %rsp
	.cfi_def_cfa_offset 336
	movl	$.LC4, %edi
	movq	%fs:40, %rax
	movq	%rax, 312(%rsp)
	xorl	%eax, %eax
	call	puts
	movss	.LC3(%rip), %xmm0
	leaq	20(%rsp), %rax
	movss	%xmm0, 16(%rsp)
	leaq	112(%rsp), %rdx
	movss	.LC5(%rip), %xmm1
	.p2align 4,,10
	.p2align 3
.L9:
	movl	$0x64000005, (%rax)
	addq	$4, %rax
	addss	%xmm1, %xmm0
	cmpq	%rdx, %rax
	jne	.L9
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	movss	%xmm0, 12(%rsp)
	call	__printf_chk
	movss	12(%rsp), %xmm0
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC7, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	leaq	16(%rsp), %rdi
	movl	$compare, %ecx
	movl	$4, %edx
	movl	$24, %esi
	call	qsort
	leaq	16(%rsp), %rdi
	movl	$24, %esi
	call	sum_float
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC8, %edi
	call	puts
	leaq	112(%rsp), %rdi
	xorl	%esi, %esi
	movl	$2, %ecx
	pxor	%xmm0, %xmm0
	movl	$-1840700269, %r8d
	movsd	.LC9(%rip), %xmm2
	movl	$1431655766, %r9d
	jmp	.L10
	.p2align 4,,10
	.p2align 3
.L12:
	movl	%esi, %eax
	movl	%esi, %ecx
	imull	%r9d
	movl	%esi, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	leal	(%rdx,%rdx,2), %eax
	subl	%eax, %ecx
	cmpl	$1, %ecx
	sbbl	%ecx, %ecx
	addq	$4, %rdi
	notl	%ecx
	addl	$2, %ecx
.L10:
	movl	%esi, %eax
	pxor	%xmm1, %xmm1
	imull	%r8d
	movl	%esi, %eax
	sarl	$31, %eax
	addl	%esi, %edx
	sarl	$2, %edx
	subl	%eax, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	cmpl	%eax, %esi
	sete	%al
	addl	$1, %esi
	movzbl	%al, %eax
	addl	%eax, %ecx
	cmpl	$50, %esi
	cvtsi2sd	%ecx, %xmm1
	mulsd	%xmm2, %xmm1
	cvtsd2ss	%xmm1, %xmm1
	movss	%xmm1, (%rdi)
	addss	%xmm1, %xmm0
	jne	.L12
	movl	$10, %edi
	movss	%xmm0, 12(%rsp)
	call	putchar
	movl	$.LC6, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movss	12(%rsp), %xmm0
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC7, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	leaq	112(%rsp), %rdi
	movl	$4, %edx
	movl	$compare, %ecx
	movl	$50, %esi
	call	qsort
	movss	112(%rsp), %xmm1
	leaq	116(%rsp), %rax
	leaq	312(%rsp), %rdx
	jmp	.L16
	.p2align 4,,10
	.p2align 3
.L22:
	addq	$4, %rax
	movaps	%xmm0, %xmm1
	cmpq	%rax, %rdx
	je	.L15
.L16:
	movss	(%rax), %xmm0
	ucomiss	%xmm0, %xmm1
	jbe	.L22
	movl	$.LC10, %edi
	call	puts
.L15:
	leaq	112(%rsp), %rdi
	movl	$50, %esi
	call	sum_float
	call	f_printbits
	movq	stdout(%rip), %rsi
	movl	$10, %edi
	call	_IO_putc
	movl	$.LC11, %edi
	call	puts
	movq	312(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L24
	addq	$328, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L24:
	.cfi_restore_state
	call	__stack_chk_fail
	.cfi_endproc
.LFE40:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE12:
	.section	.text.startup
.LHOTE12:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC3:
	.long	1885339663
	.align 4
.LC5:
	.long	1677721605
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC9:
	.long	2576980378
	.long	1069128089
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
