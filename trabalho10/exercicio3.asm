.data
    #frase: .ascii "ONE RING to rule them aLL\0"
    frase: .ascii " OnE\0"
.text
    #$t0 ponteiro da frase
    #$t1 const 20
    #$t2 const 64
    #$t3 const 91
    #$t4 const 96
    #$t5 const 123
    #$t6 letra
    #$t7 flag 1
    #$t8 flag 2
    la $t0, frase

    #define constantes
    li $t1, 32
    li $t2, 64
    li $t3, 91
    li $t4, 96
    li $t5, 123

    loop:
        lbu $t6, ($t0) #carrega a letra

        beq $t6, $zero, fimLoop #ve se acabou
        nop
        beq $t6, $t1, incrementa #ve se é espaco
        nop

        slt $t7, $t2, $t6 # se a letra for maior que 64 seta 1
        slt $t8, $t6, $t3 # se a letra for menor que 91 seta 1
        #xor 
        #and $t7, $t7, $t8 #and entre elas
        #xor $t7, $t7  #invert valor


        beq $t7 $zero, minimiza
        nop

        #beq ???, $zero, capitalize
        #nop


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
    #
    jr $ra
    nop

    capitalize:

    jr $ra
    nop

################################################
    fim:
        nop
