#define altura
ori $t0, $t0, 0x78 

#define base
ori $t1, $t1, 0xA0 

#define 2
ori $t2, $t2, 0x2

#multiplica base * altura
mult $t0, $t1
sll $zero, $zero, 0

#armazena o resutlado da multiplicação em t0
mflo $t0

#divide por 2
div $t0, $t2

sll $zero, $zero, 0

#armazena em $t7
mflo $t7