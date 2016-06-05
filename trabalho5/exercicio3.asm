.data 
	.word 2
	
.text
	lui $t0, 0x1001 #carrega a base
	
	lw $t1, 0x0($t0) #carrega o termo desejado	
	ori $t2, $zero, 0x1 #carrega o valor do termo t -1
	ori $t3, $zero, 0x1 #carrega o valor do termo t
	ori $t4, $zero, 0x1 #termo atual
	
	beq $t1, $t4, .UMDOIS #verifica se o termo requisitado eh 1
	nop
	addi $t4, $t4, 0x1 #incrementa o termo atual
	
	beq $t1, $t4, .UMDOIS #verifica se o termo requisitado eh 2
	nop
		
	.FIBONATANDO:
	beq $t1, $t4, .FIM
		addi $t4, $t4, 0x1 #incrementa o termo atual
		or $t5, $zero, $t3 # copia o valor de t3 para t5, t5 é um temporario
		add $t3, $t3, $t2 # calcula o valor de fibonacci para o termo $t4
		and $t2, $zero, $t5 #zera $t2
		or $t2, $t2, $t5 # copia o valor novo de #t2
	j .FIBONATANDO
	nop
	
	.UMDOIS:
	
	.FIM: