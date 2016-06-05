ori $t0, $t0, 0x2 #define x
nor $t0, $t0, $zero
addi $t0, $t0, 0x1 

#define 7
ori $t1, $t1, 0x7 #define x

#multiplica x por 7
mult $t0, $t1

sll $zero, $zero, 0

#armazena o resultado da multiplicação em $t2
mflo $t2

#adiciona $t2 com 4
addi $t2, $t2, 0x4

#zera $t1
and $t1, $zero, $zero
ori $t1, $t1, 0x3 #define x

#multiplica x por 3
mult $t0, $t1

sll $zero, $zero, 0

#armazena o resultado da multiplicação em $t3
mflo $t3

#adiciona $t3 com 6
addi $t3, $t3, 0x6


##############################################
#divisao dos valores
div $t2, $t3
sll $zero, $zero, 0

#armazena o quociente em $t0
mflo $t0

#armazena o resto em $t1
mfhi $t1

# se x = -2 o resultado vai ser uma divisão por zero, logo, é impossível e gera rusultados bizarros
