.data
    buffer: .space 2

.text
    #le uma stringe armazena ela na memoria
    li $v0, 8
    la $a0, buffer
    li $a1, 2
    syscall


    lw $t0, 0x0($a0) #tenta ler a string como um inteiro e armazena em t0
    sub $t0, $t0, 0x30 #subtrai 30 hexa pra chegar no valor correto na tabela ascii

    #imprime o inteiro na tela
    move $a0, $t0
    li $v0, 1
    syscall
