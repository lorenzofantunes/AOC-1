#############################################
#############################################
#Macros
.macro push
    addi $sp, $sp, -4
    sw $a0, ($sp)
.end_macro

.macro pop
    lw $v0, ($sp)
    addi $sp, $sp, 4
.end_macro

.macro end
    jr $ra
    nop
.end_macro

#############################################
#############################################
#Body
.data


.text
    li $a0, 12
    jal fatorial
    nop

    move $t0, $v0

    j fim

#############################################
#############################################
#Funcoes


    fatorial:
        beq $a0, 0x1, endFatorial #verifica se acabou
        nop
        #move $t0, $a0 #coloca o numero em t0
        push #coloca o numero na pilha
        addi $t0, $a0, -1 #decrementa o fatorial e salva em $t1

        move $a0, $ra
        push #coloca o registrador na pilha

        move $a0, $t0
        jal fatorial #chama a funcao recursiva
        nop

        move $t0, $v0 #copia o retorna da funcao pra t1

        pop #pega o endereço para voltar a recursao
        move $ra, $v0
        pop #pega o valor de multiplicar e coloca em $v0

        mult $v0, $t0 #multiplica
        nop

        mflo $v0 #coloca o valor da multiplicacao em $v0
        nop

        #$v0 tem o resultado
    end

    endFatorial:
        ori $v0, $zero, 0x1 #copia 1 pra $v0
    end

    fim:
        nop
