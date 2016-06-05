.data
	.word 1
	.word 2
	.word 3
	.word 4
	.word 5
	.word 6
	.word 7
	.word 8
	
.text
	#t0 base
	#t1 i
	#t2 nElementos
	#t3 resto da divisao
	#t4 ponteiro da posicao atual do vetor
	#t5 cont 2
	#t6 conteudo posicao do vetor
	#t7 armazena o resultado em t7 ou no else: armazena i -1 e o valor do vetor em i -1
	#t8 i * 4
	#t9 const 4
	
	lui $t0, 0x1001 #base
	
	addi $t2, $t2, 0x8 #define nElementos
		
	ori $t5, $zero, 0x2	
	ori $t9, $zero, 0x4
	
	.FOR:
		beq $t1, $t2, .FIM #verifica se o for terminou
		nop
		and $t4, $zero, $t4 #zera $t4
		add $t4, $t4, $t0 #copia valor base para t4
		mult $t1, $t9 #multiplica i por 4
		nop
		mflo $t8
		add $t4, $t4, $t8 #adiciona a posicao do vetor
		.IF:
			#cabecalho do if
			div $t1, $t5 #faz o mod
			nop
			mfhi $t3
			bne $t3, $zero, .ELSE #verifica se o mod eh igual a zero
			nop
			
			#corpo do if
			mult $t1, $t5 #multiplica o valor do vetor por 2
			nop
			mflo $t7 #armazena o resultado em t7
			sw $t7, 0x0($t4) #armazena na memoria
			j .INCREMENTA
		.ELSE:
			lw $t6, 0x0($t4) #pega o conteudo da posicao t6
			lw $t7, -0x4($t4) #pega a posicao anterior no vetor						
			add $t7, $t7, $t6 #soma os valores
			sw $t7, 0x0($t4) #armazena na memoria		
				
		.INCREMENTA:
		addi $t1, $t1, 0x1 #incrementa contador i
	j .FOR	
	nop
	
	.FIM:
	