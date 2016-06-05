.data
    tamanho: .word 5
    vetor: .word 1, 2, 2, 4, 5

.text
    #t0 tamanho
    #t1 ponteiro do vetor
    #t2 contador
    #t3 constante 1
    #t4 valor 1
    #t5 valor 2

    ori $t3, $t3, 0x1 #contante 1

    la $t0, tamanho
    nop

    lw $t0, 0x0($t0) #carrega o tamanho
    sub $t0, $t0, 0x1

    la $t1, vetor
    nop

    loop:
        beq $t2, $t0, verte
        nop

        lw $t4, 0x0($t1)
        nop
        lw $t5, 0x4($t1)
        nop

        slt $16, $t5, $t4

        beq $16, $t3, inverte #achou uma desordem inverte o valor
        nop

        addi $t2, $t2, 0x1
        addi $t1, $t1, 0x4
        j loop
        nop

    inverte:
        sub $16, $16, 0x1
        j fim
        nop

    verte:
        addi $16, $16, 0x1
    fim:
        nop
