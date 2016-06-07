.data
    km: .ascii "Informe o numero de kms: \0"
    litros: .ascii "Informe o numero total de litros: \0"
    kmlitro: .ascii "O numero de km/litro é \0"
    quebraDeLinha: .ascii "\n"
.text

loop:
    jal calcula
    nop
    beq $v0, $zero, fim
    nop
    j loop
    nop

fim:
    #termina o programa
    li $v0, 10
    syscall

calcula:
    #pede kms
    la $a0, km
    li $v0, 4
    syscall

    #pega kms
    li $v0, 5
    syscall
    move $t0, $v0
    beq $v0, $zero, acabou # se kms for 0 então acaba o programa

    #pede litros
    la $a0, litros
    li $v0, 4
    syscall

    #pega litros
    li $v0, 5
    syscall
    move $t1, $v0

    div $t0, $t1
    nop

    mflo $t2 #aramazena no registrador o resultado

    #informa km/litro
    la $a0, kmlitro
    li $v0, 4
    syscall

    #informa resultado
    move $a0, $t2 #copia em a0 o resultado
    li $v0, 1
    syscall
    la $a0, quebraDeLinha
    li $v0, 4
    syscall

    move $v0, $t0 #copia de volta pra $v0 o numero de kms

    acabou:
    jr $ra
    nop
