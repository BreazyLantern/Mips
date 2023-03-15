#Assuming the following conditions: $t0 contain 0x000F, $t1 contain 0x34E0. What would $t1 contain when the following instruction is executed?

lb $t0, 0x000F
lb $t1, 0x34F0

Sllv $t1, $t1, $t0