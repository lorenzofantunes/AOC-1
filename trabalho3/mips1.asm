# 0x100		0x0FFF		0xFF00		0x8000		0xFFFFF888
# 9 bits	12 bits		16 bits		16 bits		32 bits
# 0x1000	0x0FFF		0xFFFF		0x1000		0x3333
# 13 bits	12 bits		16 bits		13 bits		14 bits
# 0x0010000	0xffe001 	0xfeff0100 	0x08000000	0xffffffff fe819b18
# 17 bits	20 bits		32 bits		28 bits		64 bits	
	
ori $t0, $t0, 0x100	
ori $t1, $t2, 0x1000    
mult $t0, $t1
and $t0, $t0, $zero 
and $t1, $t1, $zero 

ori $t0, $t0, 0x0FFF
ori $t1, $t2, 0x0FFF
mult $t0, $t1
and $t0, $t0, $zero 
and $t1, $t1, $zero 

ori $t0, $t0, 0xFF00
ori $t1, $t2, 0xFFFF
mult $t0, $t1
and $t0, $t0, $zero 
and $t1, $t1, $zero 

ori $t0, $t0, 0x8000
ori $t1, $t2, 0x1000
mult $t0, $t1
and $t0, $t0, $zero 
and $t1, $t1, $zero 

ori $t0, $t0, 0xFFFF
sll $t0, $t0, 16
ori $t0, $t0, 0xF888
ori $t1, $t2, 0x3333
mult $t0, $t1
and $t0, $t0, $zero 
and $t1, $t1, $zero 