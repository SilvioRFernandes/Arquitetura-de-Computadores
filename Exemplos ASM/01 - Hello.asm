.data 
	msg: .asciiz "Ola Mundo!\n"

.text
	li $v0, 4
	la $a0, msg
	syscall