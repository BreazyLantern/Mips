
.data
data: .space 5
char: .space 2
prompt: .asciiz "Please enter a numbers:  \n"
null: .asciiz ""
space: .ascii " "
newline: .asciiz "\n"
.text

main:
la $a0, prompt      
li $v0, 4      
syscall  
j readInt       

gets:          
                        
la $s1, data    
loop:          
jal getc      
lb $t0, char       
sb $t0, 0($s1)    
lb $t1, newline  
beq $t0, $t1, done 
addi $s1, $s1, 1 
j loop    

getc:           
li $v0, 8   
la $a0, char       
li $a1, 2  
syscall     
jr $ra     

readInt:     
               
               
j gets         
done:        
addi $s1, $s1, -1
la $s0, data    
addi $s0, $s0, -1 
add $s2, $zero, $zero  
li $t0, 10    
li $t3, 1
lb $t1, 0($s1)    
blt $t1, 48, NotValid
bgt $t1, 57, NotValid 
addi $t1, $t1, -48 
add $s2, $s2, $t1  
addi $s1, $s1, -1 
lp:      
mul $t3, $t3, $t0 
beq $s1, $s0, Exit
lb $t1, ($s1)      
blt $t1, 48, NotValid
bgt $t1, 57, NotValid
addi $t1, $t1, -48 
mul $t1, $t1, $t3
add $s2, $s2, $t1  
addi $s1, $s1, -1  
j lp           

NotValid:         
add $s2, $zero, $zero
j Exit

Exit:
li $v0, 1
add $a0, $s2, $zero
syscall 
li $v0, 10     
syscall
