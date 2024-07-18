############################################
#Funcao principal que chama a funcao copy
############################################
.include "08.2 - copy.asm"

.globl main

.data
	msg_1: .asciiz "String 1: "
	msg_2: .asciiz "String 2: "
	str_1: .asciiz "Ola_Mundo...\n "
	str_2: .asciiz "\n"
	 
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
      	