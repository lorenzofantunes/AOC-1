.data 
	.half 10
	.half 30
.text
	#base
	lui $t0, 0x1001
	
	lh $t1, 0x0($t0)
	lh $t2, 0x2($t0)
	
	beq $t1, $t2, .DIFERENTES
	nop
	
	.IGUAIS:
	mult $t1, $t2			
	j .FIM
	nop
	
	.DIFERENTES:
	div $t1, $t2	
	nop
	
	.FIM:
	mflo $t3
	sw $t3, 0x4($t0)
	 