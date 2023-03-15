		.data
prompt:		.asciiz "Enter a coordinate: \n"

promptSize:	.asciiz "Enter the number of coordinates: \n"

promptKey:	.asciiz "Enter key between 1 to 9: \n"

spacing:	.asciiz "\n\n"

plaintext:	.space 10
		.text
		
		
		
		li	$v0, 4
		la	$a0, 0
		syscall
		
		la	$t1, plaintext
		li	$v0, 4
		la	$a0, promptSize
		syscall
	
		li	$v0, 5 #get input
		syscall
		
		
		#store the input
		move	$t0, $v0
		move	$t3, $t0
		
		
				
userInput:	li	$v0, 4
		la	$a0, prompt
		syscall
		li	$v0, 5
		syscall
		
		sb	$v0, 0($t1)
		addi	$t1,$t1, 1
		sub	$t0,$t0, 1 #counter decrements
		bgt	$t0, 0, userInput #loop while t0 is greater than 0
		
		li 	$t0, 0
		
		li	$v0, 4
		la	$a0, promptKey
		syscall
		
		li	$v0, 5
		syscall
		
		
		
		move	$t0, $v0 #store the key from input
		li	$t1, 0
		la	$t1, plaintext 

		
		
Printout:
		li	$v0, 4		
		lb	$t4, 0($t1)
		add	$t4,$t4, $t0
		sb	$t4,0($t1)
		add	$t1,$t1,1
		
		
		li	$v0, 1
		move	$a0, $t4
		syscall
		
		li 	$v0, 4
		la	$a0, spacing
		syscall
		sub	$t3,$t3,1
		bgt	$t3,0, Printout
		syscall
	
	
Exit:		li 	$v0, 10
		syscall	
