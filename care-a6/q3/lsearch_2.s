	.globl	lsearch_2
	#	var_map:
	# 	%edi: array_pointer (int *)
	# 	%esi: n (array length, int)
	# 	%edx: edx (target)
	#		%rax/%eax: return value
	#		%ecx:	position at which target found
	#		%r8d: original last value in array

	#	Algorithm:
	#	int lsearch_2(int *A, int n, int target) {
	#		int * start = A;
	#    	int * end = A + n;
	#    	if (n < 0) return -1;
	#    	int temp_2 = A[n-1]; // last val in array
	#   	A[n-1] = target;
	# 		int return_value = 0;
	#		if (target - *start != 0) {
	#			start++; //A[1]
	#			do {
	#				start++;
	#				return_value++;
	#			} while (*(start - 1) != target);
	#		}
	#		A[n-1] = temp_2; //what was there before
	#	    if (target == temp_2) return n-1;
	#		else if (start != end) return return_value;
	#		return -1;
	#	} //this C code will compile and run :)

	# The algorithm used is the same as ours but checks the first value
	#		in the array against target first and uses pointer arithmetic to checks
	#		the other values from start to end one by one
	#		at the end, it returns the position if found, or -1


lsearch_2:
	testl	%esi, %esi
	jle	not_found
	movslq	%esi, %rax
	leaq	-4(%rdi,%rax,4), %rax
	movl	(%rax), %r8d
	movl	%edx, (%rax)
	cmpl	(%rdi), %edx
	je		set_position_to_zero
	addq	$4, %rdi
	xorl	%ecx, %ecx
main_loop:
	addq	$4, %rdi
	addl	$1, %ecx
	cmpl	-4(%rdi), %edx
	jne	main_loop
final_checks:
	movl	%r8d, (%rax)
	leal	-1(%rsi), %eax
	cmpl	%ecx, %eax
	jg	move_position_into_return
	cmpl	%edx, %r8d
	jne	not_found
	rep ret
move_position_into_return:
	movl	%ecx, %eax
	ret
not_found:
	movl	$-1, %eax
	ret
set_position_to_zero:
	xorl	%ecx, %ecx
	jmp	.L4
