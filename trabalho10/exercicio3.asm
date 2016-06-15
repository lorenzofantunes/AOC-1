.data
    frase: .ascii "ONE RING to rule them aLL"
.text
    #$t0 ponteiro da frase
    #$t1 const 20
    #$t2 const 65
    #$t3 const 97
    #t4 letra
    la $t0, frase
    #define constantes
    li $t1, 20
    li $t2, 65
    li $t3, 97

    loop:
        lbu $t4, ($t0) #carrega a letra

        beq $t4, $zero, fim #ve se acabou
        nop

        beq $t4, $t1, incrementa #ve se é espaco
        nop

        incrementa:
        addi $t0, $t0, 1 #incrementa a letra
        j loop
    nop

    j fim
    nop

################################################
    minimiza:

    jr $ra
    nop

    capi:

    jr $ra
    nop

################################################
    fim:
        nop
