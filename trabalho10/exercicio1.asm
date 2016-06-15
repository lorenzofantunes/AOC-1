.data
    vetor1: .space 20
    vetor2: .space 20

.text
    la $t0, vetor1 #carrega posicao do primeiro vetor

    li $t2, 5 #contador que decrementa

    for1: #for de leitura
        beq $t2, $zero, fimFor1
        nop

        li $v0, 5 #le
        syscall
        nop

        sw $v0, ($t0) #salva o valor lido na memoria

        addi $t0, $t0, 4 #incrementa o endereço em uma word(4 bytes)
        addi $t2, $t2, -1 #decrementa

        j for1
        nop
    fimFor1:

    li $t2, 5 #redefine o contador

    for2: #for de leitura
        beq $t2, $zero, fimFor2
        nop

        li $v0, 5 #le
        syscall
        nop

        sw $v0, ($t0) #salva o valor lido na memoria

        addi $t0, $t0, 4 #incrementa o endereço em uma word(4 bytes)
        addi $t2, $t2, -1 #decrementa

        j for2
        nop
    fimFor2:

    la $t0, vetor1 #carrega o inicio do vetor

    li $t2, 10 #redefine o contador

    for3: #for de leitura
        beq $t2, $zero, fimFor3
        nop

        lw $a0, ($t0) #salva o valor lido na memoria

        li $v0, 1 #imprime o integer
        syscall
        nop

        addi $t0, $t0, 4 #incrementa o endereço em uma word(4 bytes)
        addi $t2, $t2, -1 #decrementa

        j for3
        nop
    fimFor3:
