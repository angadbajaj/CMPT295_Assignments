	.file	"rank.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	compute_ranks
	.type	compute_ranks, @function
compute_ranks:
.LFB0:
	.cfi_startproc
	testl	%esi, %esi
	movl	$0, (%r9)
	movl	$0x00000000, (%rcx)
	movl	$0x00000000, (%r8)
	jle	.L1
	leal	-1(%rsi), %r10d
	movq	%rdx, %rax
	leaq	4(,%r10,4), %r11
	leaq	(%rdx,%r11), %r10
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$1, (%rax)
	addq	$4, %rax
	cmpq	%rax, %r10
	jne	.L3
	addq	%rdi, %r11
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L8:
	movss	(%rdi,%r10,4), %xmm1
	movq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L7:
	movss	(%rax), %xmm0
	ucomiss	%xmm1, %xmm0
	jbe	.L5
	addl	$1, (%rdx,%r10,4)
.L5:
	addq	$4, %rax
	cmpq	%rax, %r11
	jne	.L7
	addq	$1, %r10
	cmpl	%r10d, %esi
	jg	.L8
	movss	(%rcx), %xmm0
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L9:
	addss	(%rdi,%rax,4), %xmm0
	movss	%xmm0, (%rcx)
	movss	(%rdi,%rax,4), %xmm1
	ucomiss	.LC1(%rip), %xmm1
	jb	.L10
	addss	(%r8), %xmm1
	movss	%xmm1, (%r8)
	addl	$1, (%r9)
	movss	(%rcx), %xmm0
.L10:
	addq	$1, %rax
	cmpl	%eax, %esi
	jg	.L9
	pxor	%xmm1, %xmm1
	movl	(%r9), %eax
	cvtsi2ss	%esi, %xmm1
	testl	%eax, %eax
	divss	%xmm1, %xmm0
	movss	%xmm0, (%rcx)
	je	.L1
	pxor	%xmm0, %xmm0
	movss	(%r8), %xmm1
	cvtsi2ss	%eax, %xmm0
	divss	%xmm0, %xmm1
	movss	%xmm1, (%r8)
	ret
.L1:
	rep ret
	.cfi_endproc
.LFE0:
	.size	compute_ranks, .-compute_ranks
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	1112014848
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
