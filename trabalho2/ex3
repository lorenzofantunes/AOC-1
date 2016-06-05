ori $t0, $zero, 0x7000
sll $t0, $t0, 16

#resulta em e0000000 ou 3758096384
addu $t0, $t0, $t0

#A representação fica errada, pois ele mostra o resultado sem estar 
#em complemento de dois.
#Se utilizarmos add a soma irá dar overflow, pois, será ímpossível 
#representar um numero tão grande com tão poucos bits. 