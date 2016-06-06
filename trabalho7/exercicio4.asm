.data
    tamanho: .word 5
    vetor: .word 1, 2, 3, 4, 5

.text
    #t0 tamanho
    #t1 ponteiro do vetor
    #t2 contador
    #t3 ponteiro decremental
    #t4 constante 4 e temp depois
    #t5 valor 1
    #t6 valor 2
    #t7 constante 1
    #t8 menor ou maior

    ori $t7, $t7, 0x1
    ori $t4, $t4, 0x4

    la $t0, tamanho
    nop

    lw $t0, 0x0($t0) #carrega o tamanho
    sub $t3, $t0, 0x1

    la $t1, vetor
    nop

    mult $t3, $t4
    nop

    mflo $t3
    add $t3, $t3, $t1

    loop:
        beq $t3, $t1, fim
        nop

        slt $t8, $t3, $t1
        
        beq $t8, $t7, fim
        nop

        lw $t5, 0x0($t1)
        nop
        lw $t6, 0x0($t3)
        nop

        sw $t5, 0x0($t3)
        nop
	    sw $t6, 0x0($t1)
        nop

        addi $t1, $t1, 0x4
        sub $t3, $t3, 0x4

        j loop
        nop
    fim:
        nop
