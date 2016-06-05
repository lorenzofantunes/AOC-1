ori $t1, $zero, 0x01
or $t2, $t1, $zero		

sll $t1, $t1, 1
or $t1, $t1, $t2
or $t2, $t1, $t2

sll $t1, $t1, 2
or $t1, $t1, $t2
or $t2, $t1, $t2

sll $t1, $t1, 4
or $t1, $t1, $t2
or $t2, $t1, $t2

sll $t1, $t1, 8
or $t1, $t1, $t2
or $t2, $t1, $t2

sll $t1, $t1, 16
or $t1, $t1, $t2
or $t2, $t1, $t2