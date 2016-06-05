ori $t1, $zero, 0x0001

sll $t1, $t1, 4

ori $t1, $t1, 0x2
sll $t1, $t1, 4
ori $t1, $t1, 0x3
sll $t1, $t1, 4
ori $t1, $t1, 0x4
sll $t1, $t1, 4
ori $t1, $t1, 0x5
sll $t1, $t1, 4
ori $t1, $t1, 0x6
sll $t1, $t1, 4
ori $t1, $t1, 0x7
sll $t1, $t1, 4
ori $t1, $t1, 0x8

or $t3, $t1, $t3

#primeiro numero
sll $t3, $t3, 28
or $t2, $t2, $t3
or $t3, $t1, $t3

#segundo
sll $t3, $t3, 24
srl $t3, $t3, 28
sll $t3, $t3, 24
or $t2, $t2, $t3
or $t3, $t1, $t3

#terceiro
sll $t3, $t3, 20
srl $t3, $t3, 28
sll $t3, $t3, 20
or $t2, $t2, $t3
or $t3, $t1, $t3

#quarto
sll $t3, $t3, 16
srl $t3, $t3, 28
sll $t3, $t3, 16
or $t2, $t2, $t3
and $t3, $zero, $t3 #resolve o problema do elemento central
or $t3, $t1, $t3

#quinto
sll $t3, $t3, 12
srl $t3, $t3, 28
sll $t3, $t3, 12
or $t2, $t2, $t3
or $t3, $t1, $t3

#sexto
sll $t3, $t3, 8
srl $t3, $t3, 28
sll $t3, $t3, 8
or $t2, $t2, $t3
or $t3, $t1, $t3

#setimo
sll $t3, $t3, 4
srl $t3, $t3, 28
sll $t3, $t3, 4
or $t2, $t2, $t3
or $t3, $t1, $t3

#oitavo
sll $t3, $t3, 0
srl $t3, $t3, 28
sll $t3, $t3, 0
or $t2, $t2, $t3
or $t3, $t1, $t3