.data
    frase: .ascii "l  f antunes"

.text
    #t0 base
    #t1 caracter
    #t2 flag

    la $t0, frase
    lbu $t1, 0x0($t0) #carrega caracter
    beq $t1, $zero, fim
    nop

    beq $t1, 0x20, espaco
    nop

    sub $t1, $t1, 0x20 #capitaliza
    sb $t1, 0x0($t0)
    
    addi $t0, $t0, 0x1 #incrementa contador

    acharEspaco:
        lbu $t1, 0x0($t0) #carrega caracter
        nop

        beq $t1, $zero, fim
        nop

        beq $t1, 0x20, espaco
        nop

        addi $t0, $t0, 0x1 #incrementa contador
        j acharEspaco
        nop

    espaco:
        addi $t0, $t0, 0x1 #incrementa contador

        lbu $t1, 0x0($t0)
        nop

        beq $t1, 0x20, acharEspaco
        nop

        sub $t1, $t1, 0x20 #capitaliza
        sb $t1, 0x0($t0)

        addi $t0, $t0, 0x1 #incrementa contador
        j acharEspaco
        nop

    fim:
        nop
