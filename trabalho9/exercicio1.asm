.data
    string: .space 10
.text
    #t0 endereco string
    #t1 tamanho string
    la $a0, string #endereço da string
    ori $a1, 10 #tamanho

    li $v0, 8 #le string
    syscall

    #copia valores para os registradores
    move $t0, $a0
    move $t1, $a1

    #palavra de no maximo 30 caracteres
    percorre:
        lbu $a1, ($t0) #carrega a letra em a1

        beq $a1, $zero, imprime #termina o loop
        nop

        jal push #coloca na pilha
        nop

        addi $t0, $t0, 1 #incrementa ponteiro de string em 1 byte


        j percorre
        nop

        imprime:
        move $a0, $sp
        li $v0, 4
        syscall
    fim:
        #termina programa
        li $v0, 10
        syscall

############################################################

    push:
        addi $sp, $sp, -1 #aumenta a pilha invertida
        sb $a1, ($sp) #armazena valor na memoria
        jr $ra
        nop

    pop:
        lw $v0, ($sp)
        addi $sp, $sp, 1 #decrementa a pilha invertida
        jr $ra
        nop
