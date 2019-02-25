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
remove:
	lbu $t1, ($t0)
	bgeu, $t1, '0', check
	bltu, $t1, ' ', finish
	sb $t1, ($t7)
	addiu $t0, $t0, 1
	addiu $t7, $t7, 1
	b remove
check:
	bleu, $t1, '9', increment
	sb $t1, ($t7)
	addiu $t0, $t0, 1
	addiu $t7, $t7, 1
	b remove
increment:
	addiu $t0, $t0, 1
	b remove
finish:
	li $v0, 4
	la $a0, Tbuff
	syscall