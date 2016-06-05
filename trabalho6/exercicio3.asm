.data
	a: .word 4
	b: .word 3
	c: .word 4
.text
	# t0 base
	# t1 a
	# t2 b
	# t3 c
	# t4 atual/resultado
	# t5 primeira comparacao
	# t6 segunda comparacao
	# t7 resultado
	lui $t0, 0x1001 #base
	lw $t1, 0x0($t0) #a	
	lw $t2, 0x4($t0) #b
	lw $t3, 0x8($t0) #c
	ori $t8, $zero, 0x1 #define const 1
	
	or $t4, $zero, $t1 #atual	
	slt $t5, $t4, $t2 #verifica se é menor que t2
	slt $t6, $t4, $t3 #verifica se é menor que t3	
	xor $t7, $t5, $t6 #verifica se é a mediana
	beq $t8, $t7, .FIM #se for a mediana vai para o fim
	nop 
	
	or $t4, $zero, $t2 #atual	
	slt $t5, $t4, $t1 #verifica se é menor que t2
	slt $t6, $t4, $t3 #verifica se é menor que t3	
	xor $t7, $t5, $t6 #verifica se é a mediana
	beq $t8, $t7, .FIM #se for a mediana vai para o fim
	nop 
	
	or $t4, $zero, $t3 #atual	
	
	.FIM: