####################################################
#macros
.macro push
    addi $sp, $sp, -4
    sw $a0, ($sp)
.end_macro
.macro pop
    lw $v0, ($sp)
    addi $sp, $sp, 4
.end_macro

.text
    li $a0, 150
    li $a1, 230
    li $a2, 991

    jal soma3n
    nop

    move $t0, $v0 #retorno de soma3n "R"

    j fim
    nop
####################################################
#funcoes

    soma3n:
        addi $sp, $sp, -4
        sw $ra, ($sp)

        jal soma
        nop

        move $a1, $v0 #copia o retorno e coloca em a1
        move $a0, $a2

        jal soma
        nop

        lw $ra, ($sp)
        addi $sp, $sp, 4

        #desempilha
        jr $ra
    nop

    soma:
        add $v0, $a0, $a1
        jr $ra
    nop

    fim:
        nop
