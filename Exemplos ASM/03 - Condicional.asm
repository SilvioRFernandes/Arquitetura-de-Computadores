# Calcula f = (g+h)-(i+j)
      .data
g: .word  5	# valor 5 armazenado em g
h: .word  2	# valor 2 armanazenado em h
i: .word  3	# valor 1 armanazenado em i
j: .word  3	# valor 3 armanazenado em j
f: .word  0	# valor 0 armanazenado em f

      .text
      # carrengando os valores da memoria
      la  $t0, g        # carrega o endereco de g em $t0
      lw  $s1, 0($t0)	# carrega o valor de g em $s1
      la  $t0, h        # carrega o endereco de h em $t0
      lw  $s2, 0($t0)	# carrega o valor de h em $s2
      la  $t0, i        # carrega o endereco de i em $t0
      lw  $s3, 0($t0)	# carrega o valor de i em $s3
      la  $t0, j        # carrega o endereco de j em $t0
      lw  $s4, 0($t0)	# carrega o valor de j em $s4
      
      #testando se i != j
      bne $s3, $s4, else
      add $s0, $s1, $s2	#soma g e h
      j exit
 else:sub $s0, $s1, $s2	#soma g e h
 exit:      
      #Armazena o resultado na memoria
      la  $t0, f        # carrega o endereco de f em $t0
      sw $s0, 0($t0)	# armazena o valor
      
      add $a0, $s0, $zero #copiando o valor de $s0 para $a0
      li $v0, 1		#imprimir inteiro
      syscall 		
      
      # Terminando o programa
      li   $v0, 10          # system call for exit
      syscall               # we are out of here.
      
