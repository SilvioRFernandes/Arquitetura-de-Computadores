.text
	li $s0, 0xFFFFFFFF #igual a 1111 1111 1111 1111  1111 1111 1111 1111 bin 
	li $s1, 0x00000001 #igual a 0000 0000 0000 0000 0000 0000 0000 0001 bin
	slt	$t0, $s0, $s1	# comparação com sinal
	sltu $t1, $s0, $s1	# comparação sem sinal

