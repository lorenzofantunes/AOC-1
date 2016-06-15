.data
    pi: .float 3.14
    dois: .float 2.0
    linha: .ascii "\n\0"
    tipo: .ascii "Qual área? (1 - circunferencia, 2 - triangulo, 3 - retangulo) \0"
    areaSaida: .ascii "A área é: \0"
    raio: .ascii "Informe o raio: \0"
    base: .ascii "Informe a base: \0"
    altura: .ascii "Informe a altura: \0"
.text
    #mostra a frase
    la $a0, tipo
    li $v0, 4
    syscall
    nop

    #le o tipo de operacao
    li $v0, 5
    syscall
    nop

    #verifica qual func chamar
    addi $v0, $v0, -1
    beq $v0, $zero, circRef
    nop

    addi $v0, $v0, -1
    beq $v0, $zero, triangRef
    nop

    addi $v0, $v0, -1
    beq $v0, $zero, retRef
    nop

    j fim
    nop

    circRef:
    jal circ
    nop
    j fim
    nop

    triangRef:
    jal tri
    nop
    j fim
    nop

    retRef:
    jal ret
    nop
    j fim
    nop

#Funções#######################################################
    circ: #pi * R * 2
        #f0 raio
        #f1 pi
        #f2 2.0

        #imprime a frase e carrega o valor do raio
        la $a0, raio
        li $v0, 4
        syscall
        nop
        li $v0, 6
        syscall
        nop

        #carrega pi
        la $t0, pi #carrega o endereco de pi
        l.s $f1, ($t0) #carerga o valor de pi

        #carrega 2.0
        la $t0, dois #carrega o endereco de 2.0
        l.s $f2, ($t0) #carerga o valor 2.0

        mul.s $f12, $f0, $f1 #r * pi
        mul.s $f12, $f12, $f2 #r * pi * 2

        #imprime o valor da area
        la $a0, areaSaida
        li $v0, 4
        syscall
        nop
        li $v0, 2 #imprime float
        syscall
        nop

        jr $ra
    nop

    tri: #(base * altura)/2
        #f0 altura
        #f1 base
        #f2 2.0

        #imprime a frase e carrega a base
        la $a0, base
        li $v0, 4
        syscall
        nop
        li $v0, 6
        syscall
        nop
        mov.s $f1, $f0 #copia a base pra $f2


        #imprime a frase e carrega a altura
        la $a0, altura
        li $v0, 4
        syscall
        nop
        li $v0, 6
        syscall
        nop

        #carrega 2.0
        la $t0, dois #carrega o endereco de 2.0
        l.s $f2, ($t0) #carerga o valor 2.0

        mul.s $f12, $f0, $f1 #base * altura
        div.s $f12, $f12, $f2 #(base * altura)/2

        #imprime o valor da area
        la $a0, areaSaida
        li $v0, 4
        syscall
        nop
        li $v0, 2 #imprime float
        syscall
        nop

        jr $ra
    nop

    ret: #base * altura
        #f0 altura
        #f1 base
        #f2 2.0

        #imprime a frase e carrega a base
        la $a0, base
        li $v0, 4
        syscall
        nop
        li $v0, 6
        syscall
        nop
        mov.s $f1, $f0 #copia a base pra $f2


        #imprime a frase e carrega a altura
        la $a0, altura
        li $v0, 4
        syscall
        nop
        li $v0, 6
        syscall
        nop

        mul.s $f12, $f0, $f1 #base * altura

        #imprime o valor da area
        la $a0, areaSaida
        li $v0, 4
        syscall
        nop
        li $v0, 2 #imprime float
        syscall
        nop
        jr $ra
    nop

    fim:
        nop
