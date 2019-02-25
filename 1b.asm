	.data
hello: 	.asciiz "Welcome!\n"
empty:	.space 80
	.text
 
main: 	li $v0, 4
	la $a0, hello
	syscall
	
	li $v0, 8
	la $a0, empty
	la $a1, 80
	syscall
	
	li $v0, 4
	la $a0, empty
	syscall
	
	la $t0, empty
	move $t1, $t0
	
change:
	lbu $t2, ($t0)
	bltu $t2, ' ', finish
	bltu $t2, 'A', nostar
	bgtu $t2, 'Z', nostar
	li $t2, '*'
	sb $t2, ($t0)
nostar:	
	addiu $t0, $t0, 1
	b change
	
finish:
	li $v0, 4
	la $a0, empty
	syscall
	
	li $v0, 10
	syscall
	
	
	 
