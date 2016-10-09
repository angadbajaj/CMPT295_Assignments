.globl times
times:
	mov %edi, %eax # move a into eax
	mov %esi, %ecx # move b into ecx
	mov %eax, %edx # move a (from eax) into edx
	jmp mult # jump to multiply

# eax = a
# edi is now scratch (temp)
# esi = b
add: # addition (bitwise)
	mov  %eax, %edi # edi = eax
	and  %esi, %edi # edi = edi & esi
	xor  %esi, %eax # eax = eax ^ esi
	shl  $1, %edi 	 # edi = edi << 1
	mov  %edi, %esi # esi = edi
	cmp  $0, %esi # (b == 0)?
	jne add					 # jump to add if b not equal to 0
	jmp mult

mult:
	mov %edx, %esi # move edx to esi
	cmp $0, %ecx # compare ecx with 0
	dec %ecx #  decrement ecx
	jne add # if ecx isnt 0, jump back to add
	ret %rax
