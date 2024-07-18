############################################
#Funcao principal que chama a funcao copy
############################################
.data
	msg_1: .asciiz "String 1: "
	msg_2: .asciiz "String 2: "
	str_1: .asciiz "Ola_Mundo...\n "
	str_2: .ascii 
	 
.text
main:	
	# carregando variaveis
	la  $s0, str_1        	# endereco de "str_1" em $t0      	
    la  $s1, str_2        	# endereco de "str_2" em $t1
      	
      	      	
	######################
	#imprime valor da string 1
      	la   $a0, msg_1 
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
  	la   $a0, str_1
      	li   $v0, 4           # especifica o servido de impressao a string
      	syscall               # imprime 
      	
      	
      	#imprime valor da string 2
      	la   $a0, msg_2 
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
      	la   $a0, str_2
      	li   $v0, 4           # especifica o servido de impressao a string
      	syscall               # imprime 
      	############################
      	
      	# parametros da funcao
      	add  $a1, $s0, $zero	# copiando endereco str_1
      	add  $a0, $s1, $zero	# copiando endereco srt_2
      	
      	#chama a funcao
      	jal strcpy
      	
     	
     	######################
	#imprime valor da string 1
      	la   $a0, msg_1 
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
  	la   $a0, str_1
      	li   $v0, 4           # especifica o servido de impressao a string
      	syscall               # imprime 
      	
      	
      	#imprime valor da string 2
      	la   $a0, msg_2 
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
      	la   $a0, str_2
      	li   $v0, 4           # especifica o servido de impressao a string
      	syscall               # imprime 
      	############################
     	
     	
     	
      	# Terminando o programa
      	li   $v0, 10          # system call for exit
      	syscall               # we are out of here.
      	
 


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
