.data 
	s1: .word 2
	s2: .word 5
	v0: .word 0
	v1: .word 0
	v2: .word 7
	v3: .word 1
	v4: .word 33
.text
	#t0 base
	#t1 n elementos dentro do intervalo
	#t2 maior que s0
	#t3 menor que s1
	#t4 contador i
	#t5 valor da posicao no vetor
	#s0 v1
	#s1 v2
	#s3 inicio do vetor
	#s4 tamanho do vetor
	
	lui $t0, 0x1001 #base
	lw $s0, 0x0($t0) #v1
	lw $s1, 0x4($t0) #v2
	addi $s3, $t0, 0x8 #armazena o inicio do vetor
	ori $s4, $zero, 0x5 #define o numero de elementos do vetor
	
	addi $s4, $s4, 0x1 #adiciona um no numero de elementos
	addi $s1, $s1, 0x1 #adiciona um no numero de elementos
	
	.FOR:
		beq $t4, $s4, .FIM #verifica se o for terminou(n+1 == i)
		nop			
		
		lw $t5, 0x0($s3) #carrega o elemento atual do vetor
		slt $t2, $t5, $s0 #verifica se t5 é menor que s0
		slt $t3, $t5, $s1 #verifica se t5 é menor que s1
		
		#xor $t2, $t2, $t3 #xor pra ver se o numero está dentro do limite
		
		bne $zero, $t2, .INCREMENTA #eh menor que s0
		beq $zero, $t3, .INCREMENTA #eh maior que s1
		addi $t1, $t1, 0x1 #incrementa o contador i
		
		.INCREMENTA:
		
		addi $s3, $s3, 0x4 #incrementa a posicao da memoria
		addi $t4, $t4, 0x1 #incrementa o contador i
	j .FOR	
	nop	
	
	.FIM:
	
	