# Compute Fibonacci sequence taking 1st two fibonacci numbers as 0 and 1
# Start .data segment (data!)
	.data

msg1:	.asciiz	"Type the Nth Fibonaccio number (N):  "
msg2:	.asciiz	"F(N) = "
lf:     .asciiz	"\n"
 
	.text

	.globl	main
	
	main:
	# Print msg1
	li	$v0,4		# print_string syscall code = 4
	la	$a0, msg1	
	syscall

	# Get N from user and save
	li	$v0,5		# read_int syscall code = 5
	syscall	
	move	$t0,$v0		# syscall results returned in $v0

	# Initialize registers
	li	$t1, 0		# F(0) = 0
	li	$t2, 1		# F(1) = 1
	li      $t3, 0           #F(N) = 0
	li      $t4, 1           #counter = 0
	
	#CASE N = 0
	beq $t0, $t1, exit2
		
	#CASE N = 1
	beq $t0, $t2, exit
	
	#CASE N >=2
	loop:
	addi    $t4,$t4,1       # $t4  = $t4 + 1	
	add	$t3, $t1, $t2	# $t3 = $t1 + $t2
	move	$t1,$t2	        # $t1 = $t2
	move    $t2,$t3         # $t2 = $t3
	beq	$t0, $t4, exit	# if counter = N then continue to exit
	j	loop            # if not jump again into loop
	
	
	# Exit routine - print msg2
	exit:	
	li	$v0, 4		# print_string syscall code = 4
	la	$a0, msg2
	syscall

	# Print sum
	li	$v0,1		# print_string syscall code = 4
	move	$a0, $t2
	syscall

	# Print newline
	li	$v0,4		# print_string syscall code = 4
	la	$a0, lf
	syscall
	li	$v0,10		# exit
	syscall
	
	exit2:
	li	$v0, 4		# print_string syscall code = 4
	la	$a0, msg2
	syscall

	# Print sum
	li	$v0,1		# print_string syscall code = 4
	move	$a0, $t0
	syscall

	# Print newline
	li	$v0,4		# print_string syscall code = 4
	la	$a0, lf
	syscall
	li	$v0,10		# exit
	syscall
	
	
