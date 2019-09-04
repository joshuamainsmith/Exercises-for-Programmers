.data
    question: .asciiz "What is the input string? "
    response_1: .asciiz "Has "
    response_2: .asciiz " characters"
    
    buffer: .space 20
.text

main:    
	li $v0, 4 # system call code for printing string 
	la $a0, question # load address of string to be printed into a0
	syscall
    
	li $v0, 8 # system call for string input
	la $a0, buffer #load byte space into address
	li $a1, 20 # allot the byte space for string
	move $t0,$a0 #save string to t0
	syscall
	
	li $v0, 4 # system call code for printing string
	syscall
	
	li $v0, 4 # system call code for printing string 
	la $a0, response_1 # load address of string to be printed into a0
	syscall

loop:
	lb   $a0,0($t0)
	beqz $a0,done
	addi $t0,$t0,1
	addi $t1,$t1,1
	j     loop
done:

	li   $v0,1 # print integer
	sub $t1, $t1, 1
	add  $a0, $0,$t1
	syscall
	
	li $v0, 4 # system call code for printing string 
	la $a0, response_2 # load address of string to be printed into a0
	syscall

	li   $v0,10
	syscall