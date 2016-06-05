.data 
	num: .word 4
.text
	#t0 base
	#t1 comparador (1000...)	
	#t2 contador i = 32
	#t3 num
	#t4 const 1
	#t5 const -1
	
	lui $t0, 0x1001 #base
	lui $t1, 0x8000 #define comparador
	ori $t2, $t2, 0x20 #define i = 32 
	lw $t3, 0x0($t0) #carrega o valor do num da para o registrador
	ori $t4, $t4, 0x1 #define a constante 1
	nor $t5, $t4, $zero #comp de 2
	addi $t5, $t5, 0x1 #comp de 2
	
	.LOOP:
		beq $t2, $zero, .FIM #verifica se o for terminou(i == 0)
		nop
		
		and $t6, $t1, $t3
		srl $t6, $t6, 31
		beq $t6, $t4, .FIM #verifica se achou o bit mais significativo
		nop
		.DECREMENTA:
		add $t2, $t2, $t5 #decrementa o contador i
		sll $t3, $t3 , 1
		j .LOOP
		nop
	.FIM:
