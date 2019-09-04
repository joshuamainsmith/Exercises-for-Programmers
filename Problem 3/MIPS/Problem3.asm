.data
name: .asciiz "\nWho said it? "
quote: .asciiz "\nWhat is the quote? "
response: .asciiz " says "
quoteMark: .asciiz "\"" 

quoteBuffer: .space 100
nameBuffer: .space 20
.text

main:
	li $v0, 4 # system call code for printing string 
	la $a0, quote # load address of string to be printed into a0
	syscall
	
	#Quote
	li $v0, 8 # system call for string input
	la $a0, quoteBuffer #load byte space into address
	li $a1, 100 # allot the byte space for string
	move $t0,$a0 #save string to t0
	syscall
	
	# Stripping newline character
	xor $a2, $a2, $a2 # Clearing a2
qLoop:
	lbu $a3, quoteBuffer($a2)  
	addiu $a2, $a2, 1
	bnez $a3, qLoop       # Search the NULL char code
	beq $a1, $a2, qSkip   # Check whether the buffer was fully loaded
	subiu $a2, $a2, 2    # Otherwise 'remove' the last character
	sb $0, quoteBuffer($a2)     # and put a NULL instead
qSkip:	
	
	li $v0, 4 # system call code for printing string 
	la $a0, name # load address of string to be printed into a0
	syscall
	
	#Name
	li $v0, 8 # system call for string input
	la $a0, nameBuffer #load byte space into address
	li $a1, 20 # allot the byte space for string
	move $t1,$a0 #save string to t1
	syscall
	
	# Stripping newline character
	xor $a2, $a2, $a2 # Clearing a2
nLoop:
	lbu $a3, nameBuffer($a2)  
	addiu $a2, $a2, 1
	bnez $a3, nLoop       # Search the NULL char code
	beq $a1, $a2, nSkip   # Check whether the buffer was fully loaded
	subiu $a2, $a2, 2    # Otherwise 'remove' the last character
	sb $0, nameBuffer($a2)     # and put a NULL instead
nSkip:	
	
	# Name
	li   $v0,4 # print string
	add  $a0, $0,$t1
	syscall
	
	# "Says" response
	li $v0, 4 # system call code for printing string 
	la $a0, response # load address of string to be printed into a0
	syscall
	
	# "Says" response
	li $v0, 4 # system call code for printing string 
	la $a0, quoteMark # load address of string to be printed into a0
	syscall
	
	# Quote
	li   $v0,4 # print string
	add  $a0, $0,$t0
	syscall
	
	# "Says" response
	li $v0, 4 # system call code for printing string 
	la $a0, quoteMark # load address of string to be printed into a0
	syscall
	
	li $v0, 10 # End Program
	syscall
	