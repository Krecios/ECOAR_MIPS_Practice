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
	
	la $t0, buff
	la $t7, Tbuff
	addiu $t5, $t5, 0x20 
countword:
	lb $t1, ($t0)
	bleu $t1, ' ', prepwrite
	addiu $t2, $t2, 1
	addiu $t0, $t0, 1
	j countword
prepwrite:
	move $t3, $t2
	b writefirst
writefirst:
	beq $t2, 1, case1
	beq $t2, 2, case2
	beq $t2, 3, case3
	beq $t2, 4, case4
	beq $t2, 5, case5
	beq $t2, 6, case6
	beq $t2, 7, case7
	beq $t2, 8, case8
	beq $t2, 9, case9
	b finish
case1:
	sb $t7, ($t2)
	b writesecond
case2:
	li $t7, '2'
	b writesecond
case3:
	li $t7, '3'
	b writesecond
case4:
	li $t7, '4'
	b writesecond
case5:
	li $t7, '5'
	b writesecond
case6:
	li $t7, '6'
	b writesecond
case7:
	li $t7, '7'
	b writesecond
case8:
	li $t7, '8'
	b writesecond
case9:
	li $t7, '9'
	b writesecond
writesecond:
	li $v0, 11
	la $a0, ($t7)
	syscall
	addiu $t7, $t7, 1
	addiu $t3, $t3, -1
	beq $t3, $t4, prepcount
	j writefirst
prepcount:
	bltu $t1, ' ', finish
	li $v0, 11
	la $a0, ($t5)
	syscall
	li $t2, 0
	addiu $t7, $t7, 1
	li $t7, 0x20
	addiu $t0, $t0, 1
	b countword
finish:
	li $v0, 4
	la $a0, Tbuff
	syscall
	
	li $v0, 10
	syscall
