.data
	.word 3
.text
	#t0 base
	#t1 n
	#t2 cont 2
	#t3 contador i
	#t4 resultado da expressao de soma e parcial com a divisao
	#t5 resultado do produtorio
	#t6 n+1

	lui $t0, 0x1001 #carrega a base
	lw $t1, 0x0($t0)  # pega o valor de n 
	ori $t2, $t2, 0x2 #define constante 2
	ori $t5, $t5, 0x1 #inicializa o produtorio com 1
	addi $t6, $t1, 0x1 #coloca n+1 em t6
	
	.FOR:
		beq $t6, $t3, .FIM #verifica se o for terminou(n+1 == i)
		nop			
		and $t4, $zero, $t4 #zera o t4
		div $t3, $t2 #divide i por 2
		nop
		mflo $t4 #armazena o resultado da divisao em t4
		add $t4, $t1, $t4 #soma o o resultado da divisao com n
		
		mult $t5, $t4 #multiplica o resultado da expressao pelo valor acumulado no produtorio
		addi $t3, $t3, 0x1 #incrementa contador i
		mflo $t5 #armazena o valor em t5		
	j .FOR	
	nop
	
	sw $t5, 0x4($t0)
	
	.FIM: