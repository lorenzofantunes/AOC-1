.data
    frase: .ascii "The dark lord shall rise again."

.text
    #t0 base
    #t1 caracter
    #t2 segunda base

    la $t0, frase

    acharEspaco:
        lbu $t1, 0x0($t0)
        nop

        beq $t1, $zero, fim #verifica se a frase acabou
        nop

        beq $t1, 0x20 espaco #verifica se é espaço
        nop

        addi $t0, $t0, 0x1 #incrementa contador

        j acharEspaco
        nop

    espaco:
        move $t2, $t0 #novo ponteiro

        loop:
            lbu $t3, 0x1($t2) #pega valor do proximo caracter
            nop

            sb $t3, 0x0($t2) # armazena na posicao anterior

            beq $t3, $zero, fimEspaco #verifica se a frase acabou
            nop

            addi $t2, $t2, 0x1 #incrementa contador para começar certo
            j loop
            nop

        fimEspaco:
        addi $t0, $t0, 0x1 #incrementa contador para começar certo
        j acharEspaco
        nop

    fim:
        nop
