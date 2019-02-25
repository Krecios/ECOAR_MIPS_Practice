	.data
hello:
	.asciiz "Wlecome!\n"
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
	lb $t1, ($t0)
	addiu $t0, $t0, 1 
	lb $t2, ($t0)
	addiu $t0, $t0, 2 
search:
	lb $t3, ($t0)
	bltu $t3, ' ', finish
	bgeu $t4, 1, star
	beq $t3, $t1, start
	beq $t3, $t2, end
	sb $t3, ($t7)
	addiu $t0, $t0, 1
	addiu $t7, $t7, 1
	j search
start:
	addiu $t4, $4, 1
	j star
end:
	li $t4, 0
	j star
star:
	sb $t7, '*'
	addiu $t0, $t0, 1
	addiu $t7, $t7, 1
	j search
finish:
	li $v0, 4
	la $a0, Tbuff
	syscall
	
	li $v0, 10
	syscall	

	
