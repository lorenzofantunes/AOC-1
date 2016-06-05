ori $t0, $t0, 0x0 #define x

# Multiplica x por x. 
mult $t0, $t0

# Define 5.
ori $t1, $t1, 0x5 #5

# Armazena o valro de lo em $t0. 
mflo $t0

sll $zero, $zero, 0	 

# Multiplica $t0 por 5. 
mult $t0, $t1

sll $zero, $zero, 0 

# Armazena o resultado em $t3
mflo $t2
sll $zero, $zero, 0

##############################################
		
# Define 9.
and $t1, $t1, $zero 
ori $t1, $t1, 0x9 #9

# multiplica x por 9
mult $t0, $t1

sll $zero, $zero, 0

# armazena o resultado em $t4
mflo $t3

##############################################
#define -34
and $t1, $t1, $zero 
ori $t1, $t1, 0x22 #9

nor $t1, $t1, $zero		

addi $t1, $t1, 0x1

##############################################

add $t0, $t0, $zero 

add $t0, $t1, $t2 
add $t0, $t0, $t3

