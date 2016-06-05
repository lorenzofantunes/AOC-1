#loop ate 333 somando em uma variavel

.data
	.word 333 #valor a para comparar

.text
	lui $t0, 0x1001 #carrega posicao da base
	
	lw  $t1, 0x0($t0) #carrega valor a ser comparado
	
	.LOOP300:	
	beq $t3, $t1, .FIM #verifica se é igual a 333
		nop	
		addi $t3, $t3, 0x1 #incremena contador
		add $t2, $t2, $t3
	j .LOOP300
	nop
	
	.FIM:
	