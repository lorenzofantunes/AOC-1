.data
	.word 20
	.word 40
	.word 60
	.word 80
	.word 90
	
.text
	lui $t0, 0x1001 #base
	
	lw $t4, 0x0($t0)
	lw $t5, 0x4($t0)
	lw $t6, 0x8($t0)
	lw $t7, 0xC($t0)
	lw $t8, 0x10($t0)
	ori $t9, $zero, 0x1
	# ori $t3, $zero, 0x1 #define estado bom
	
	.COND1:		
	slt $t1, $t4, $t8 #verifica se valor é maior que 20
	slt $t2, $t8, $t5  #verifica se valor é menor que 40
	
	bne $t1, $t2, .COND2 #verifica se os digitos sao diferentes, logo é falsa a condicao
	nop
	beq $t9, $t1, .VERDADE #verifica se os valores sao iguais a 1
	nop
	
	.COND2:
	slt $t1, $t6, $t8 #verifica se valor é maior que 60
	slt $t2, $t8, $t7  #verifica se valor é menor que 40
	
	bne $t1, $t2, .FIM #verifica se os digitos sao diferentes, logo é falsa a condicao
	nop
	beq $t9, $t1, .VERDADE #verifica se os valores sao iguais a 1
	nop	
	j .FIM
	nop
	
	.VERDADE:
	ori $t3, $zero, 0x1
	
	.FIM: