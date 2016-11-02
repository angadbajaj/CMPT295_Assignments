	.globl sqrt
# THIS IMPLEMENTS Shifting nth root algorithm

sqrt:
	mov $0, %rax   # place your code for Q3 here
	mov $15, %rcx # counter variable
	mov $0x8000, %rdx # 15th bit set to 1
	jmp mainloop # jump to the mainloop

setback:
	xor %rdx, %rax # both rdx and rax kth bits are 1,
	 						   # rdx has all other bits 0
								 # thus result is 0 at kth bit
	dec %rcx # decrement counter variable
	shr $1, %rdx # shift our mask right
	jmp mainloop # jump back to mainloop (safety)

mainloop:

	or %rdx, %rax # set 15th bit of rax to 1

	movq %rax, %rsi # move rax to rsi, a temp variable

	imulq %rax, %rsi # rax*rsi => rsi
	cmpq %rsi, %rdi # compare rsi to rdi
	jl setback # if rsi < rdi, set kth bit back to zero
	dec %rcx # decrement counter
	shr $1, %rdx # shift mask such that the (counter(th) )
							 # bit in rdx is set to 1
	cmpq $0, %rcx # compare 0 to counter
	jge mainloop # if 0 >= counter, continue
	jmp result # else return

result:
	ret # eax in 64 bit is rax, thus
			# the correct var is in the correct place
