.data
    letra: .space 2 #1 byte
    sete: .float 7
    vinteTres: .float 23
.text
    li $a1, 2 #tamanho de ler
    la $a0, letra

    loop:
        li $v0, 8
        syscall
        nop

        lb $v0, ($a0)
        nop

        beq $v0, 77, metro #M
        nop

        beq $v0, 80, pe #P
        nop

        beq $v0, 81, fim #Q
        nop

    j loop
    nop

    j fim
    nop
####################################################
    metro:
        li $v0, 6 #le float e coloca em f12
        syscall
        nop

        la $t0, sete
        la $t1, vinteTres
        l.s $f13, ($t0)
        l.s $f14, ($t1)

        div.s $f13, $f13, $f14
        nop
        mul.s $f12, $f0, $f13
        nop

        li $v0, 2
        syscall
        nop

        j loop
    nop
    pe:
        li $v0, 6 #le float e coloca em f12
        syscall
        nop

        la $t0, sete
        la $t1, vinteTres
        l.s $f13, ($t0)
        l.s $f14, ($t1)

        div.s $f13, $f14, $f13
        nop
        mul.s $f12, $f0, $f13
        nop

        li $v0, 2
        syscall
        nop

        j loop
    nop


    fim:
        nop
