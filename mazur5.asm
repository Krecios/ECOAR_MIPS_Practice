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
	syscall
	
	move $t0, $a0

counter:
	lb $t1, 0($t0)
	lb $t2, 1($t0)
	addiu $t0, $t0, 1
	bgeu $t1, '0', check1
	bleu $t2, ' ', finish
	b counter
check1:
	bleu $t2, ' ', prefin
	bleu $t1, '9', check2
	b counter
check2:
	bgtu $t2, '9', score
	bltu $t2, '0' score
	b counter
score:
	addiu $t3, $t3, 1
	addiu $t0, $t0, 1
	b counter
prefin:
	addiu $t3, $t3, 1
	b finish
finish:
	li $v0, 1
	la $a0, ($t3)
	syscall
	
	li $v0, 10
	syscall
