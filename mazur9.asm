	.data
hello:
	.asciiz "Wlecome!\n"
buff:
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
	
	la $t0, buff
	addiu $t7, $t7, 3
scan:
	lb $t1, ($t0)
	bltu $t1, '0', finish
	bgeu $t1, 'a', possiblelowercase
	addiu $t0, $t0, 1
	b scan
possiblelowercase:
	bleu $t1, 'z', is3
	addiu $t0, $t0, 1
	b scan
is3:
	addiu $t2, $t2, 1
	beq $t2, $t7, hit
	addiu $t0, $t0, 1
	b scan
hit:
	addiu $t2, $t2, -3
	subiu $t1, $t1, 0x20
	sb $t1, ($t0)
	addiu $t0, $t0, 1
	b scan
finish:
	li $v0, 4
	la $a0, buff
	syscall
	
	li $v0, 10
	syscall
