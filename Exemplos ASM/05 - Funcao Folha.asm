############################################
#Funcao principal que chama a funcao folha
############################################
.data
	i: .word  1	# valor 5 armazenado em i
	jota: .word  1	# valor 2 armanazenado em j
	f: .word  0	# valor 1 armanazenado em f
	g: .word  4	# valor 3 armanazenado em g
	h: .word  4	# valor 0 armanazenado em h
	teste: .word 50
	msg_result: .asciiz "O valor de F = "
	msg_teste: .asciiz "\nO valor da variavel teste = "
	 
.text
main:	
	# carregando variaveis
	la  $t0, teste        	# endereco de "teste" em $t0
      	lw  $s0, 0($t0)		# carrega o valor de "teste" em $s0
      	la  $t0, g        	# endereco de "g" em $t0
      	lw  $a0, 0($t0)		# carrega o valor de "g" em $a0
	la  $t0, h        	# endereco de "h" em $t0
      	lw  $a1, 0($t0)		# carrega o valor de "h" em $a1
      	la  $t0, i        	# endereco de "i" em $t0
      	lw  $a2, 0($t0)		# carrega o valor de "i" em $a2
      	la  $t0, jota        	# endereco de "j" em $t0
      	lw  $a3, 0($t0)		# carrega o valor de "j" em $a3
      	
      	#chama a funcao
      	jal exemplo_folha
      	
      	#copia resultado para $s1
      	add $s1, $zero, $v0
      	
      	#imprime o resultado
      	la   $a0, msg_result # endereco de "msg_result" em $a0
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
      	add   $a0, $s1, $zero      # resultado final
      	li   $v0, 1           # especifica o servido de impressao de inteiros
      	syscall               # imprime o valor de resultado
      	
      	
      	#imprime variavel teste para certificar que o valor foi restaurado
      	la   $a0, msg_teste # endereco de "msg_teste" em $a0
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
      	add   $a0, $s0, $zero      # valor do teste
      	li   $v0, 1           # especifica o servido de impressao de inteiros
      	syscall               # imprime o valor de resultado
      	
      	# Terminando o programa
      	li   $v0, 10          # system call for exit
      	syscall               # we are out of here.
      	
 
 ############################################
# Funcao folha # Calcula f = (g+h)-(i+j)
############################################    	
 exemplo_folha:
	# Liberando registradores
	addi $sp, $sp, -12   # ajusta a pilha criando espa�o para tr�s itens
	sw $t1, 8($sp)   #salva registradores $t1, $t0 e $s0
	sw $t0, 4($sp)   # para ser usado depois
	sw $s0, 0($sp)
	add $t0, $a0, $a1    # $t0 = g+h
	add $t1, $a2, $a3    # $t1 = i + j
	sub $s0, $t0, $t1        # $s0 = (g+h) � (i + j), ou seja, f

	#Copiando o valor de f para ser retornado
	add $v0, $s0, $zero  

	#Restaurando os tr�s valores antigos dos registradores
	lw $s0, 0($sp)
	lw $t0, 4($sp)
	lw $t1, 8($sp)
	addi $sp, $sp, 12

	# E finalmente, o procedimento termina
	jr $ra     # Desvia de volta � rotina que chamou
		
