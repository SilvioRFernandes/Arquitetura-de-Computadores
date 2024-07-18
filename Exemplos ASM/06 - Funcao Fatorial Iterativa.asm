.data
	i: .word  3	# valor 5 armazenado em i
	msg_result: .asciiz "O valor do fatorial � "
 
.text
main:	
	# carregando variaveis
	la  $t0, i        	# endereco de "teste" em $t0
      	lw  $a0, 0($t0)		# carrega o valor de "i" em $a0
      	jal fact
      	
      	#salvando o resulado em $s0
      	add   $s0, $v0, $zero      # resultado final
      	
      	#imprime o resultado
      	la   $a0, msg_result # endereco de "msg_result" em $a0
      	li   $v0, 4          # especiica o servico de impressao de string
      	syscall              # faz a chamada de system para imprimir a string
  
      	add   $a0, $s0, $zero      # resultado final
      	li   $v0, 1           # especifica o servido de impressao de inteiros
      	syscall               # imprime o valor de resultado
      	
      	# Terminando o programa
      	li   $v0, 10          # system call for exit
      	syscall               # we are out of here.
      	
      	
####################
# Funcao Fatorial
###################
fact:
		addi  $sp, $sp, -8   #ajusta pilha para 2 itens
		sw $ra, 4($sp)   # salva o endere�o de retorno
    	sw $a0, 0($sp) # salva o argumento n
	    	#Condi��o
		slti    $t0, $a0, 1          # teste para n < 1
		beq $t0, $zero, L1     # se n>=1 vai para L1
		#Sen�o for maior que 1, devolve o valor 1.
		addi $v0, $zero, 1 # retorna 1
		addi $sp, $sp, 8     # retira 2 itens da pilha
		jr       $ra                 #retorna para depois de jal
		#Se for maior que 1
	L1: addi $a0, $a0, -1  #arg1 = n � 1;
	  	jal     fact               #chama fact(n-1);
	  	#Restaurando registradores.
		#A pr�xima instru��o � onde fact retorna.
		lw $a0, 0($sp)     #retorna de jal: restaura n
		lw $ra, 4($sp)      #restaura endere�o de retorno
		addi $sp, $sp, 8  #ajusta stack pointer
		
		#Devolvendo o novo $v0
		mul $v0, $a0, $v0  # retorna n * fact( n - 1)
		jr $ra   # retorna para o procedimento que o chamou

      	
      	
