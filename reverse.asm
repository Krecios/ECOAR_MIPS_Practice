	.data
hello:
	.asciiz "Welcome!\n"
buff:
	.space 80
Tbuff:
	.space 80
	.text
main:
	li $v0, 4
	la $a0, hello
	syscall
	
	li $v0, 8
	la $a0, buff
	la $a1, 80
	syscall
	
	la $t0, Tbuff
	la $t7, buff
	addiu $t5, $t5, 0

skiptolast:
	lb $t1, ($t7)
	bltu $t1, ' ', reduce
	addiu $t6, $t6, 1
	addiu $t7, $t7, 1
	j skiptolast
reduce:
	addiu $t7, $t7, -1
	b copy
copy:
	lb $t2, ($t7)
	sb $t2, ($t0)	
	beq $t6, $t5, finish
	addiu $t6, $t6, -1
	addiu $t7, $t7, -1
	addiu $t0, $t0, 1
	b copy
finish:
	li $v0, 4
	la $a0, Tbuff
	syscall

	li $v0, 10
	syscall
