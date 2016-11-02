

.string1:
	.string "Please enter your name: "
.string2:
	.string "Thank you %s!\n"
.string3:
	.string "Please enter your year of birth: "
.string4:
	.string "Sorry, that year is invalid. Please enter a year >= 1899 and <= 2012\n"

	.globl get_age
get_age:
	push %rbx
	push %rbp              # callee saved registers

	                       # local variables:
	leaq -8(%rsp), %rsp    #   - endptr
	leaq -24(%rsp), %rsp   #   - name_str[24]
	leaq -24(%rsp), %rsp   #   - year_of_birth[24]

	mov %rsp, %rbp

	movq $.string1, %rdi
	xorl %eax, %eax
	call printf            # printf("Please enter your name: ");


	leaq 24(%rbp), %rdi
	call gets              # gets(name_str);

	xorl %eax, %eax		   # need to zero
	jmp enter_year		   # go to enter_year, which asks user for year of birth

bad_year:
	movq $.string4, %rdi
	xorl %eax, %eax
	call printf

enter_year:
	movq $.string3, %rdi
	xorl %eax, %eax
	call printf			   # printf("Please enter your year of birth: ")

	leaq 48(%rbp), %rdi
	call gets              # gets(year_of_birth);



	leaq 48(%rbp), %rdi		# need base pointer in rdi
	xor %rsi, %rsi			# need 0 (NULL) as end pointer
	xor %rdx, %rdx			# need 0 as our format value
	xor %rax, %rax			# 0 our return just in case :)
	call strtol				# convert year_of_birth to integer

	cmp $1899, %rax 		# check if user age in range [1899, 2015]
	jl bad_year				# if <1899, go to bad_year
	cmp $2012, %rax
	jg bad_year				# if >2015, go to bad year

	push %rax				# need to hold on to our age value

	movq $.string2, %rdi
	leaq 24(%rbp), %rsi		# base pointer of our name string (\0 term)
	xorl %eax, %eax			# needs to be 0
	call printf 			# printf("Thank You %s !")

	pop %rax				# get back our age value
	mov %rax, %rsi			# move rax (age) into rsi
	mov $2015, %rax			# move 2015 into rax
	sub %rsi, %rax			# rax = rax - rsi (giving age)

	leaq 56(%rsp), %rsp 	# set stack pointer to initial position and get back
	pop %rbp				# rbp & rax were pushed, need back
	pop %rbx

	ret
