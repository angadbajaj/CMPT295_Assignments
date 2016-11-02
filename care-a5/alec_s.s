.globl sum_float

	# var map:
	#   %xmm0:  total
	#   %rdi:   F[n] (base pointer)
	#   %rsi:   n
	#   %rbp:   endptr
	#	%rdx:	i
	#	%rsp: 	queue enqueue (tail)
	#	%rcx:	queue dequeue (head)
	#	%xmm1:  x
	#	%xmm2:	y
	#	%r8:	OG rsp

sum_float:
	push	%rbp
	mov		%rsp, %r8	# r8 = rsp
	xorps	%xmm0, %xmm0            # total <- 0.0
	leaq	(%rdi, %rsi, 4), %rbp   # endptr <- F + n
	xor		%rdx, %rdx
	mov		$1, %rdx	# i = 1
	mov		%rsp, %rcx	# rcx = head of queue

loop:
	cmpq	%rdx, %rsi		# for i = 1, i < N, i++
	jl 		endloop		# if i = N+1, done (N < i)
	incq	%rdx			# i++
	cmpq	%rdi, %rbp		# if F is empty
	jle		F_empty_x
	movss	(%rdi), %xmm1		# x = F[head]
	cmpq	%rcx, %rsp		# rsp > rcx then queue empty
	jg		queue_x_empty
	ucomiss (%rcx), %xmm1		# if F[head] <= Q[head]
	jle		queue_x_empty	# then:
	movss	(%rcx), %xmm1		# x = Q[head]
	leaq	-4(%rcx), %rcx		# set head to next element in queue
	jmp	queue_x_not_empty	# skip F++
F_empty_x:
	movss	(%rcx), %xmm1		# x = Q[head]
	leaq	-4(%rcx), %rcx		# set head to next element in queue
	jmp		F_empty_y	# skip F++
queue_x_empty:
	leaq	4(%rdi), %rdi           # F++
queue_x_not_empty:
	movss	(%rdi), %xmm2		# y = F[head]
	cmpq	%rcx, %rsp		# rsp > rcx then queue empty
	jg		queue_y_empty
	ucomiss (%rcx), %xmm2		# F[head] <= Q[head]
	jle		queue_y_empty
F_empty_y:
	movss	(%rcx), %xmm2		# y = Q[head]
	leaq	-4(%rcx), %rcx
	jmp		queue_y_not_empty
queue_y_empty:
	leaq	4(%rdi), %rdi           # F++
queue_y_not_empty:
	addss	%xmm1, %xmm2           	# y = x+y
	leaq    -4(%rsp), %rsp		# rsp = rsp - 4 (make room)
	movss	%xmm2, (%rsp)		# move y to rsp
	jmp	loop                    # jump 2 start

endloop:
	movss	(%rsp), %xmm0
endgood:
	mov		%r8, %rsp
	pop		%rbp
	ret
