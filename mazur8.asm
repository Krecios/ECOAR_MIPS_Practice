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
	la $a1, Tbuff
	syscall
	
	la $t0, buff
	la $t7, Tbuff
	addiu $t6, $t6, 1
scan:
	lb $t1, ($t0)
	bltu $t1, ' ', finish
	bgeu $t1, '0', possiblenumber
	b flag
flag:
	beq $t2, $t6, increment
	b write
increment:
	addiu $t0, $t0, 1
	b scan
write:
	sb $t1, ($t7)
	addiu $t7, $t7, 1
	beq $t2, $t6 offflag
	b increment
offflag:
	addiu $t2, $t2, -1
	b increment
possiblenumber:
	bleu $t1, '9', number
	b flag
number:
	beq $t2, $t6, increment
	addiu $t2, $t2, 1
	b flag
finish:
	li $v0, 4
	la $a0, Tbuff
	syscall
	
	li $v0, 10
	syscall