#t1 1010101010101010 coloca o valor aaaaaaaa em t1
ori $t1, $zero, 0xAAAA
sll $t1, $t1, 16
ori $t1, $t1, 0xAAAA

#t2 100100100100 coloca o valor de t1 em t2 e shifta para direita
srl $t2, $t1, 1

#faz as operacoes

#t3 1111111111111111 realiza o or entre t1 e t2
or $t3, $t1, $t2

#t4 0000000000000000 realiza o and entre t1 e t2, zera todos valores pois os valroes são intercalados entre 0 e 1
and $t4, $t1, $t2

#t5 1111111111111111 faz o xor entre t1 e t2
xor $t5, $t1, $t2

