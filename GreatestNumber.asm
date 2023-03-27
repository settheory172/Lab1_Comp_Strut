 #Start .data segment (data!)
.data    
    msg1:    .asciiz      "Enter the first number to compare: "
    msg2:    .asciiz      "Enter the second number to compare: "
    msg3:    .asciiz      "Enter the third number to compare: "
    newline:   .asciiz	"\n"
    
# Start .text segment (program code)
.text
	
.globl	main
main:
	# Print string msg1
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg1	# load the address of msg
	syscall
	
	# Get first number from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t0,$v0		# syscall results returned in $v0
	
	# Print string msg2
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg2	# load the address of msg2
	syscall

	# Get second number from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t1,$v0		# syscall results returned in $v0
	
	# Print string msg3
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg3	# load the address of msg2
	syscall

	# Get third number from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t2,$v0		# syscall results returned in $v0
	
	# given that a == $to, b == $t1, c == $t1 are intergers
	bge $t0, $t1, a_ge_c   # if a >= b then check if a>=c, if not then jump to b >= a
	j b_ge_a	       # jump to b >= a
	
	
	a_ge_c:                 #Beggining of a >= c
	bge $t0, $t2, print_a   # If a >= c then print a, if not then jump to  b >= a
	j b_ge_a                # jump to b >= a
	
	
	b_ge_a:                 #Beggining of b >= a
	bge $t1, $t0, b_ge_c    # If b >=a then check if b >= c
	
	
	b_ge_c:                  #Beggining of b >= a
	bge $t1, $t2, print_b   # If b >=c then print b, if not then print c
	j print_c
	
	# If a is the greatest, print a
	print_a:
	li $v0, 1       # Load system call code for printing integer
	move $a0, $t0    # Move the value of $s0 (a) to $a0 (argument register)
	la $a1, msg1    # Load the address of the message string for printing
	syscall         # Print the message and the value of a
	j exit          # Jump to the end of the program

	# If b is the greatest, print b
	print_b:
	li $v0, 1       # Load system call code for printing integer
	move $a0, $t1    # Move the value of $s1 (b) to $a0 (argument register)
	la $a1, msg2    # Load the address of the message string for printing
	syscall         # Print the message and the value of b
	j exit          # Jump to the end of the program

	# If c is the greatest, print c
	print_c:
	li $v0, 1       # Load system call code for printing integer
	move $a0, $t2    # Move the value of $s2 (c) to $a0 (argument register)
	la $a1, msg3    # Load the address of the message string for printing
	syscall         # Print the message and the value of c
	j exit          # Jump to the end of the program

	# Exit the program
	exit:
	li $v0, 10      # Load system call code for exiting the program
	syscall         # Exit the program
