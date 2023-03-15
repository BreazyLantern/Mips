		.data
filename:	.asciiz "pillarscipher.bmp"
bitmap:		.space 54

		.text
		
		#contains the address of the file's name
		la $s0 filename 	
		#contains the address of the alocated space
		la $s1 bitmap		
		
		#Opening the file

		move 	$a0 $s0		#moves the address of the file's name to $a0
		li 	$a1 0		#opens the file for reading
		li 	$a2 0		
		li 	$v0 13		#syscall for opening a file
		syscall
		
		move 	$s2 $v0		#contains the file descriptor of the bitmap
		
		#Reading the first 54 bits of the bitmap
		
		move	$a0 $s2		#moves the file descriptor of the bitmap to $a0
		move	$a1 $s1		#moves the address of the alocated space to $a1
		li 	$a2 54		#specifies how many bytes to read (send into the bitmap buffer)
		li 	$v0 14		#syscall for reading a file
		syscall
		
		#Close the file
		
		li	$v0 16		#syscall for closing a file
		syscall
		
		
		#Allocating Heap Space
		
		li	$a0 216958	#specifies how many bytes to allocate in the heap
		li	$v0 9		#syscall for allocating space in the heap
		syscall
		
		move $s3 $v0		#moves the address of the allocated space to $s3#contains the address of the alocated space
		
		#Opening the bitmap file

		move 	$a0 $s0		#moves the address of the file's name to $a0
		li 	$a1 0		#opens the file for reading
		li 	$a2 0		
		li 	$v0 13		#syscall for opening a file
		syscall
		
		move 	$s2 $v0		#contains the file descriptor of the bitmap
		
		#Reading the the whole 216958 bytes of the bitmap
		
		move	$a0 $s2		#moves the file descriptor of the bitmap to $a0
		move	$a1 $s3		#moves the address of the alocated space to $a1
		li 	$a2 216958	#specifies how many bytes to read (send into the bitmap buffer)
		li 	$v0 14		#syscall for reading a file
		syscall
		
		
		#Close the file
		
		li	$v0 16		#syscall for closing a file
		syscall

					
		#Loops until an asterisk
																																																																		
loop:		lb	$t1 0($s3)	#loads the first byte in the buffer
		add	$s3 $s3 1	#goes to the next address
		bne	$t1 42 loop	#Loops until an asterisk is loaded

		#Close the program
		
		li 	$v0 10		#syscall for closing the program
		syscall
		
		#After the program runs, the address at $s3 will be around the same place as the city (Paris)
