	.data
hello:
	.asciiz "Welcome!\n"
buff:
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
	
	li $v0, 4
	la $a0, buff
	syscall

	la $t0, buff
	move $t1, $t0
	
compliment:
	lbu $t2, ($t0)
	bltu $t2, ' ', finish
	beq $t2, '0', case0
	beq $t2, '1', case1
	beq $t2, '2', case2
	beq $t2, '3', case3
	beq $t2, '4', case4
	beq $t2, '5', case5
	beq $t2, '6', case6
	beq $t2, '7', case7
	beq $t2, '8', case8
	beq $t2, '9', case9
	addiu $t0, $t0, 1
	b compliment
	
case0:
	li $t2, '9'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case1:
	li $t2, '8'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case2:
	li $t2, '7'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case3:
	li $t2, '6'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case4:
	li $t2, '5'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case5:
	li $t2, '4'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case6:
	li $t2, '3'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case7:
	li $t2, '2'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case8:
	li $t2, '1'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
case9:
	li $t2, '0'
	sb $t2, ($t0)
	addiu $t0, $t0, 1
	b compliment
						
finish:
	li $v0, 4
	la $a0, buff
	syscall

	li $v0, 10
	syscall