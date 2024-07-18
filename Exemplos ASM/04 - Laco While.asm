# Realiza o laco:
#while (save[i] == k)
#	i += 1;
.data
	save: .word  0:10	# array de 10 posicoes
	i: .word  0		# controlador do laco
	k: .word  0		# constante que sera comparada com os elementos do array
	valor_k: .asciiz "; O valor de K � "
	valor_save: .asciiz "; O valor de save[i] � "
.text
      # carrengando os valores da memoria
      la  $t0, i        # endereco de i em $t0
      lw  $s3, 0($t0)	# carrega o valor de i em $s3
      la  $t0, k        # endereco de k em $t0
      lw  $s5, 0($t0)	# carrega o valor de k em $s5
      la  $s6, save	# endereco de sabe em $s6
      
      # valor de save[i]
      li $t1, 1
      sw $t1, 8($s6)    #armazena o valor 1 no save[2]
      
      # inicio do laco
Loop: 	sll $t1, $s3, 2		# $t1 = 4 * i
	add $t1, $t1, $s6   	# $t1 = endere�o de save[i]
	lw $t0, 0($t1)    	# $t0 = save[i]        
	
	#############################
	#imprime valor de K
      	la   $a0, valor_k 	# string "o valor de k � "
      	li   $v0, 4          	# especiica o servico de impressao de string
      	syscall              	# faz a chamada de system para imprimir a string
      	add   $a0, $s5, $zero  	# valor de K
      	li   $v0, 1           	# especifica o servido de impressao de inteiros
      	syscall               	# imprime o valor de resultado
      	
      	#imprime valor de save
      	la   $a0, valor_save 	# string "o valor de save[i] � "
      	li   $v0, 4          	# especiica o servico de impressao de string
      	syscall              	# faz a chamada de system para imprimir a string
      	add   $a0, $t0, $zero  	# valor de save
      	li   $v0, 1           	# especifica o servido de impressao de inteiros
      	syscall               	# imprime o valor de resultado
      	#############################
	
	bne $t0, $s5, Exit	#v� para exit se save[i] != k     
	addi $s3, $s3, 1		# i = i + 1
	j        Loop
Exit:

	# Terminando o programa
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
