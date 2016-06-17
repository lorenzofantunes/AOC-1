.data
    frase: .ascii "ONE RING to rule them aLL\n\0"
.text
    #$t0 ponteiro da frase
    #$t1 const 64
    #$t2 const 91
    #$t3 const 96
    #$t4 const 123
    #$t5 letra
    #$t6 flag 1
    #$t7 flag 2

    la $t0, frase

    #define constantes
    li $t1, 64
    li $t2, 91
    li $t3, 96
    li $t4, 123

    #imprime a frase
    la $a0, frase
    li $v0, 4
    syscall
    nop

    loop:
        lbu $t5, ($t0) #carrega a letra

        beq $t5, 0, fimLoop #ve se acabou
        nop
        beq $t5, 32, incrementa #ve se é espaco
        nop

        #minimiza
        slt $t6, $t1, $t5 # se a letra for maior que 64 seta 1
        slt $t7, $t5, $t2 # se a letra for menor que 91 seta 1
        and $t6, $t6, $t7 #and entre elas

        beq $t6, 0x1, minimiza
        nop

        #capitaliza
        slt $t6, $t3, $t5 # se a letra for maior que 96 seta 1
        slt $t7, $t5, $t4 # se a letra for menor que 123 seta 1
        and $t6, $t6, $t7 #and entre elas

        beq $t6, 0x1, capitalize
        nop


        incrementa:
        addi $t0, $t0, 1 #incrementa a letra
        j loop
    nop
    fimLoop:

    #imprime a frase
    la $a0, frase
    li $v0, 4
    syscall
    nop

    j fim
    nop

################################################
    minimiza:
        addi $t5, $t5, 32
        sb $t5, ($t0)
        nop
        j incrementa
    nop

    capitalize:
        addi $t5, $t5, -32
        sb $t5, ($t0)
        nop
        j incrementa
    nop

################################################
    fim:
        nop
