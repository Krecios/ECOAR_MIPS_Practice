	.data
hello:
	.asciiz "Wlecome!\n"
len:
	.asciiz "Length: "
nextline:
	.asciiz "\n"
buff:
	.space 80
Tbuff:
	.space 80
	.text
mian:
	li $v0, 4
	la $a0, hello
	syscall
	
	li $v0, 8
	la $a0, buff
	la $a1, 80
	syscall
	
	li $v0, 4
	la $a0, buff
	la $a1, Tbuff
	syscall
	
	la $t0, buff
	la $t7, Tbuff


odd:
	lb $t1, 0($t0)
	sb $t1, ($t7)
	bltu $t1, ' ', prepere
	addiu $t7, $t7, 1
	addiu $t0, $t0, 2
	j odd
prepere:
	move $t0, $a0
	addiu $t0, $t0, 1
even:
	lb $t1, ($t0)
	sb $t1, ($t7)
	bltu $t1, ' ', finish
	addiu $t7, $t7, 1
	addiu $t0, $t0, 2
	j even
finish:
	li $v0, 4
	la $a0, Tbuff
	syscall
	
	li $v0, 10
	syscall
	
