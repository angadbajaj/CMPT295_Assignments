	.file	"main.c"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	" and there was overflow"
.LC1:
	.string	""
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	".-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-.-."
	.align 8
.LC3:
	.string	"The encoding of %s\n            was %ld%s.\n"
	.section	.rodata.str1.1
.LC4:
	.string	"BONUS - Decode: %s.\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB23:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$.LC0, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$tests, %ebp
	movl	$decodes, %ebx
	xorl	%r12d, %r12d
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L4:
	addl	$1, %r12d
	cmpl	$12, %r12d
	je	.L10
.L5:
	movl	$.LC2, %edi
	addq	$40, %rbp
	addq	$40, %rbx
	call	puts
.L2:
	movl	$result, %esi
	movq	%rbp, %rdi
	call	encode
	movq	result(%rip), %rcx
	testl	%eax, %eax
	movl	$.LC1, %r8d
	cmovne	%r13, %r8
	movl	%eax, OF(%rip)
	movq	%rbp, %rdx
	movl	$.LC3, %esi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk
	movq	result(%rip), %rdi
	movq	%rbx, %rsi
	movb	$0, (%rbx)
	call	decode
	cmpb	$0, (%rbx)
	je	.L4
	xorl	%eax, %eax
	movq	%rbx, %rdx
	movl	$.LC4, %esi
	movl	$1, %edi
	addl	$1, %r12d
	call	__printf_chk
	cmpl	$12, %r12d
	jne	.L5
.L10:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.comm	OF,4,4
	.comm	result,8,8
	.comm	decodes,480,32
	.globl	tests
	.data
	.align 32
	.type	tests, @object
	.size	tests, 480
tests:
	.string	"5"
	.zero	38
	.string	"1234567890"
	.zero	29
	.string	"999999999999999999"
	.zero	21
	.string	"9223372036854775807"
	.zero	20
	.string	"9223372036854775808"
	.zero	20
	.string	"9999999999999999999"
	.zero	20
	.string	"11111111111111111111"
	.zero	19
	.string	"18446744073709551615"
	.zero	19
	.string	"18446744073709551616"
	.zero	19
	.string	"-9876543210"
	.zero	28
	.string	"-9223372036854775808"
	.zero	19
	.string	"-9223372036854775809"
	.zero	19
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
