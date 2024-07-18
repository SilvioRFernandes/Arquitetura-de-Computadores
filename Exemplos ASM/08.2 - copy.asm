############################################
#Funcao copy
############################################
.data
	 
.text

strcpy:

	addi 	$sp, $sp, -4		#ajusta pilha para mais 1 item
	sw	$s0, 0($sp)		#salva $s0
	add	$s0, $zero, $zero	# i = 0+0
L1:	add	$t1, $s0, $a1		#endere�o de y[i] em $t1
	lb	$t2, 0($t1)		# $t2 = y[i]
	add	$t3, $s0, $a0		#endere�o de x[i] em $t3
	sb	$t2, 0($t3)		# x[i] = y[i]
	beq	$t2, $zero, L2		#se y[i] == 0, vai para L2
	addi	$s0, $s0, 1		# i = i+1
	j	L1			# vai para L1
L2: 	lw	$s0, 0($sp)		# y[i] == 0; fim da string; restura $s0
	addi	$sp, $sp, 4		#retira 1 word da pilha	
	jr	$ra			#retorna
