	.file	"lsearch_2.c"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB0:
	.text
.LHOTB0:
	.p2align 4,,15
	.globl	lsearch_2
	.type	lsearch_2, @function
lsearch_2:
.LFB23:
	.cfi_startproc
	movslq	%esi, %rcx
	salq	$2, %rcx
	testl	%esi, %esi
	leaq	(%rdi,%rcx), %r9
	js	.L7
	leaq	-4(%rdi,%rcx), %rcx
	xorl	%eax, %eax
	movl	(%rcx), %r8d
	movl	%edx, (%rcx)
	cmpl	(%rdi), %edx
	je	.L4
	addq	$4, %rdi
	.p2align 4,,10
	.p2align 3
.L5:
	addq	$4, %rdi
	addl	$1, %eax
	cmpl	-4(%rdi), %edx
	jne	.L5
.L4:
	cmpl	%edx, %r8d
	movl	%r8d, (%rcx)
	je	.L11
	cmpq	%r9, %rdi
	je	.L7
	rep ret
	.p2align 4,,10
	.p2align 3
.L11:
	leal	-1(%rsi), %eax
	ret
.L7:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	lsearch_2, .-lsearch_2
	.section	.text.unlikely
.LCOLDE0:
	.text
.LHOTE0:
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
