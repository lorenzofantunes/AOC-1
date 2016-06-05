# aloca 326 em t0
ori $t0, $zero, 0x146

# aloca -211 em t1
ori $t1, $zero, 0xD3
nor $t1, $t1, $zero
addi $t1, $t1, 0x1

#adiciona t0 e t1 e armazena em t0
add $t0, $t0, $t1

# zera t1
and $t1, $t1, $zero

# aloca 311 em t1
ori $t1, $zero, 0x137

# adiciona t0 com t1
add $t0, $t0, $t1

# zera t1
and $t1, $t1, $zero

#aloca -684 em t1
ori $t1, $zero, 0x2AC
nor $t1, $t1, $zero
addi $t1, $t1, 0x1

# adiciona t0 com t1
add $t0, $t0, $t1

# zera t1
and $t1, $t1, $zero
