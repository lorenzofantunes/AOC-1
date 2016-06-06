.data
    tamanho: .word 5
    vetor1: .word 1, 2, 3, 4, 5
    vetor2: .word 1, 2, 3, 4, 5
    soma: .word 0, 0, 0, 0, 0
.text
    la $t0, vetor1
    nop
    la $t1, vetor2
    nop
    la $t2, soma
    nop
    la $t6, tamanho
    nop

    lw $t6, 0x0($t6)
    nop

    loop:
        beq $t6, $t7, fim
        nop
        
        lw $t3, 0x0($t0)
        nop
        lw $t4, 0x0($t1)
        nop

        add $t5, $t3, $t4 #faz a soma
        sw $t5, 0x0($t2) #armazena na memoria

        addi $t0, $t0, 0x4
        addi $t1, $t1, 0x4
        addi $t2, $t2, 0x4

        addi $t7, $t7, 0x1 #incrementa contador
        j loop
        nop

    fim:
        nop
