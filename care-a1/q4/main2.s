	.file	"main2.cpp"
	.section	.text.unlikely._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
	.align 2
.LCOLDB0:
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
.LHOTB0:
	.align 2
	.p2align 4,,15
	.weak	_ZNKSt5ctypeIcE8do_widenEc
	.type	_ZNKSt5ctypeIcE8do_widenEc, @function
_ZNKSt5ctypeIcE8do_widenEc:
.LFB824:
	.cfi_startproc
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE824:
	.size	_ZNKSt5ctypeIcE8do_widenEc, .-_ZNKSt5ctypeIcE8do_widenEc
	.section	.text.unlikely._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
.LCOLDE0:
	.section	.text._ZNKSt5ctypeIcE8do_widenEc,"axG",@progbits,_ZNKSt5ctypeIcE8do_widenEc,comdat
.LHOTE0:
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4,,15
	.globl	_Z3addii
	.type	_Z3addii, @function
_Z3addii:
.LFB1048:
	.cfi_startproc
	testl	%edi, %edi
	movl	%esi, %eax
	je	.L3
	testl	%esi, %esi
	movl	%edi, %eax
	je	.L3
	.p2align 4,,10
	.p2align 3
.L4:
	movl	%edi, %eax
	xorl	%esi, %edi
	andl	%esi, %eax
	addl	%eax, %eax
	movl	%eax, %esi
	jne	.L4
	movl	%edi, %eax
.L3:
	rep ret
	.cfi_endproc
.LFE1048:
	.size	_Z3addii, .-_Z3addii
	.section	.text.unlikely
.LCOLDE1:
	.text
.LHOTE1:
	.section	.text.unlikely
.LCOLDB2:
	.text
.LHOTB2:
	.p2align 4,,15
	.globl	_Z8multiplyii
	.type	_Z8multiplyii, @function
_Z8multiplyii:
.LFB1049:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	cmpl	%esi, %edi
	jge	.L12
	movl	%esi, %r13d
	movl	%edi, %r14d
.L12:
	cmpl	$1, %r14d
	movl	%r13d, %ebx
	jle	.L13
	movl	$1, %r12d
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L33:
	testl	%r13d, %r13d
	jne	.L31
.L14:
	movl	%ebx, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movq	%rax, %r15
	movq	(%rax), %rax
	movq	-24(%rax), %rax
	movq	240(%r15,%rax), %rbp
	testq	%rbp, %rbp
	je	.L32
	cmpb	$0, 56(%rbp)
	je	.L17
	movsbl	67(%rbp), %esi
.L18:
	movq	%r15, %rdi
	addl	$1, %r12d
	call	_ZNSo3putEc
	movq	%rax, %rdi
	call	_ZNSo5flushEv
	cmpl	%r12d, %r14d
	je	.L13
.L19:
	testl	%ebx, %ebx
	jne	.L33
	movl	%r13d, %ebx
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L17:
	movq	%rbp, %rdi
	call	_ZNKSt5ctypeIcE13_M_widen_initEv
	movq	0(%rbp), %rax
	movl	$10, %esi
	movq	48(%rax), %rax
	cmpq	$_ZNKSt5ctypeIcE8do_widenEc, %rax
	je	.L18
	movq	%rbp, %rdi
	call	*%rax
	movsbl	%al, %esi
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L31:
	movl	%r13d, %eax
	.p2align 4,,10
	.p2align 3
.L15:
	movl	%ebx, %edx
	xorl	%eax, %ebx
	andl	%eax, %edx
	movl	%edx, %eax
	addl	%eax, %eax
	jne	.L15
	jmp	.L14
	.p2align 4,,10
	.p2align 3
.L13:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L32:
	.cfi_restore_state
	call	_ZSt16__throw_bad_castv
	.cfi_endproc
.LFE1049:
	.size	_Z8multiplyii, .-_Z8multiplyii
	.section	.text.unlikely
.LCOLDE2:
	.text
.LHOTE2:
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"x + y = "
.LC4:
	.string	" and x * y = "
	.section	.text.unlikely
.LCOLDB5:
	.section	.text.startup,"ax",@progbits
.LHOTB5:
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB1050:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$20, %esi
	movl	$10, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	_Z8multiplyii
	movl	$8, %edx
	movl	$.LC3, %esi
	movl	$_ZSt4cout, %edi
	movl	%eax, %ebp
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	$30, %esi
	movl	$_ZSt4cout, %edi
	call	_ZNSolsEi
	movl	$13, %edx
	movq	%rax, %rbx
	movl	$.LC4, %esi
	movq	%rax, %rdi
	call	_ZSt16__ostream_insertIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_PKS3_l
	movl	%ebp, %esi
	movq	%rbx, %rdi
	call	_ZNSolsEi
	movq	%rax, %rdi
	call	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1050:
	.size	main, .-main
	.section	.text.unlikely
.LCOLDE5:
	.section	.text.startup
.LHOTE5:
	.section	.text.unlikely
.LCOLDB6:
	.section	.text.startup
.LHOTB6:
	.p2align 4,,15
	.type	_GLOBAL__sub_I__Z3addii, @function
_GLOBAL__sub_I__Z3addii:
.LFB1060:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$_ZStL8__ioinit, %edi
	call	_ZNSt8ios_base4InitC1Ev
	movl	$__dso_handle, %edx
	movl	$_ZStL8__ioinit, %esi
	movl	$_ZNSt8ios_base4InitD1Ev, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__cxa_atexit
	.cfi_endproc
.LFE1060:
	.size	_GLOBAL__sub_I__Z3addii, .-_GLOBAL__sub_I__Z3addii
	.section	.text.unlikely
.LCOLDE6:
	.section	.text.startup
.LHOTE6:
	.section	.init_array,"aw"
	.align 8
	.quad	_GLOBAL__sub_I__Z3addii
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.2) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
