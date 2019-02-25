	.data
buff:
	.space 80
Tbuff:
	.space 80
	.text
	
	li $v0, 8
	la $a0, buff
	la $a1, 80
	syscall
	
	li $v0, 4
	la $a0, buff
	syscall
	
	la $t0, buff
	la $t1, Tbuff
scan:
	lb $t2, ($t0)
	bltu $t2, ' ', finish
	bleu $t2, 'Z', possible
	j write
possible:
	bgeu $t2, 'A', skip
	j write
write:
	sb $t2, ($t1)
	addiu $t0, $t0, 1
	addiu $t1, $t1, 1
	j scan
skip:
	addiu $t0, $t0, 1
	j scan
finish:
	li $v0, 4
	la $a0, Tbuff
	syscall
	
	 li $v0, 10
	 syscall 