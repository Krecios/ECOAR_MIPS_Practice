	.data

hello:
	.asciiz "Welcome! \n"
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
	
swap:
	lbu $t1, ($t0)
	lbu $t2, 1($t0)
	bleu $t1, ' ', finish
	bleu $t2, ' ', finish
	sb $t2, ($t0)
	sb $t1, 1($t0)
	addiu $t0, $t0, 2
	b swap
	
finish:
	li $v0, 4
	la $a0, buff
	syscall

	li $v0, 10
	syscall
	
