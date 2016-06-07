
#inicia os valores dos argumentos
ori $a1, 0x5
ori $a2, 0x5
ori $a3, 0x5

jal media #chama a função de fazer a media
nop

move $a0, $v0 #copia o retorno para $a0

li $v0, 1 #imprime o valor na tela
syscall

li $v0, 10 #termina o programa
syscall

media:
    ori $t0, $zero, 0x3 #define a constante 3
    add $v0, $a1, $a2 #adiciona os 2 primeiros
    add $v0, $v0, $a3 #adiciona o terceiro
    div $v0, $t0 #divide eles por 3
    nop

    mflo $v0 #armazena o resultado em v0
    nop

    jr $ra
    nop
