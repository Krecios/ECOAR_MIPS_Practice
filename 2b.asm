	.data
hello:
	.asciiz "Wlecome!\n"
len:
	.asciiz "Length: "
nextline:
	.asciiz "\n"
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
	
	li $v0, 4
	la $a0, buff
	syscall
	
	la $t0, buff
	move $t7, $a0

counter:
	lb $t1, 1($t7)
	bltu $t1, ' ', reverse
	addiu $t7, $t7, 1
	b counter
reverse:
	lb $t1, ($t7)
	sb $t1, ($t0)
	beq $a0, $t7, finish
increment:
	addi $t7, $t7, -1
	addi $t0, $t0, 1
	j reverse
finish:
	sb $zero, 1($t0)
	li $v0, 4
	la $a0, buff
	syscall

	li $v0, 10
	syscall