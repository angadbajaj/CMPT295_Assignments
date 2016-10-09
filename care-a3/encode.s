	.globl encode
encode:
	xorl 	%eax, %eax 		# set eax to 0
	xor	%rcx, %rcx		# set rcx to 0
	mov	%rcx, (%rsi)		# move 0 to our return value
getend:
	inc 	%rcx			# rcx incremented into its final position
	inc	%rdi			# increment our pointer to input
	cmp 	$0, (%rdi)		# if we did not hit the null terminator
	jne 	getend			# then keep looping!
	dec	%rdi			# we incremented once to many
	mov	%rcx, %r8		# r8 will always hold the length of array
start:
	mov 	(%rdi), %rdx		# move our current value @rdi into rdx
	cmp	$-1, %rcx		# if strlength is at 0 (0 position)
	je	end			# jump to positive end
	and	$15, %rdx		# and rdx with 15 to get rid of first 4 bits
	cmp	$13, %rdx		# if we see a '-' sign
	je	negative		# go ahead and multiply by (-1)
	mov	%rcx, %r9		# move decrementor to r9 for use below
	sub	%r8, %r9		# r9 = r9 - r8
	imul 	$-1, %r9		# above will be negative, so make it positive
pow:
	cmp 	$0, %r9			# compare 0 to r9, which is my pow loop counter
	je 	endpow			# if zero,	 break
	imul 	$10, %rdx		# multiply rdx by 10 ( will total 10^i times)
	jno	continuepow		# check for overflow
	or	$1, %eax		# if there was overflow, set flag
continuepow:
	dec 	%r9			# decrement loop counter
	jmp 	pow			# loop back
endpow:
	add 	%rdx, (%rsi)		# add our str2int value to our output long *
	jno	continueendpow		# check for overflow
	or	$1, %eax		# set overflow flag if there was overflow
continueendpow:
	dec 	%rdi			# decrement our counter for the string
	dec	%rcx			# decrement our counter for position in string
	jmp 	start			# go back to beginning
negative:
	mov	(%rsi), %rdx		#if num supposed to be negative, mul by -1
	imul 	$-1, %rdx	
	mov	%rdx, (%rsi)
end:
	ret						# simply return otherwise

Algorithm:
Go to the end of the string. Get the char at that value, convert to int by first
getting the chars int value by anding with a mask of 15 (0000 1111). Next, multiply
by 10^i where the char is at the ith position from 0-N left to right. Lastly, we add
this value to our output memory which was initalized to 0. If there is overflow, eax
becomes set to 1.



