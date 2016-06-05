.data
	n: .word 5
	
.text
	#t0 base
	#t1 i
	#t2 n 
	#t3 acumulador
	#t4 
	
	lui $t0, 0x1001 #base
	ori $t1, $t1, 0x1 #define valor inicial de i
	lw $t2, 0x0($t0) #carrega valor de n
	addi $t2, $t2, 0x1 #adiciona 1 em n
	ori $t3, $t3, 0x1 #define valor inicial do acumulador
	
	.FOR:
		beq $t1, $t2, .FIM #verifica se o for terminou(n+1 == i)
		nop			
		
		mult $t3, $t1 #multiplica o resultado da expressao pelo valor acumulado no produtorio
		addi $t1, $t1, 0x1 #incrementa contador i
		mflo $t3 #armazena o valor em t5		
	j .FOR	
	nop
	
	.FIM:
		
	sw $t3, 0x4($t0)
	


	