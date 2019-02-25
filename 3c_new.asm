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
	la $t1, buff
	li $t3, 0x30
scan:
	lb $t2, ($t0)
	bleu $t2, ' ', write
	addiu $t3, $t3, 1
	addiu $t0, $t0, 1
	j scan
write:
	lb $t4, ($t1)
	beq $t4, $t2, reset
	sb $t3, ($t1)
	addiu $t1, $t1, 1
	j write
reset:
	li $t3, 0x30
	li $t5, ' '
	sb $t5, ($t1)
	bltu $t2, ' ', finish
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	j scan
finish:
	li $v0, 4
	la $a0, buff
	syscall
	
	li $v0, 10
	syscall
	
