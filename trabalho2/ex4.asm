ori $t1, $zero, 0x2
sll $t1, $t1, 2

ori $t2, $zero, 0x3
nor $t2, $t2, $zero
addi $t2, $t2, 0x1
sll $t2, $t2, 1

ori $t0, $zero, 0x3
add $t3, $t3, $t0
add $t3, $t3, $t0
add $t3, $t3, $t0

and $t0, $t0, $zero

add $t0, $t0, $t1
add $t0, $t0, $t2
add $t0, $t0, $t3
