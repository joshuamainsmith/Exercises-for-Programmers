.data ## Data declaration section

qName: .asciiz "\nWhat is your name? "
Greeting_1: .asciiz "\nHello, "
Greeting_2: .asciiz "Nice to meet you!\n"

buffer: .space 20

.text

main:
	li $v0, 4 # system call code for printing string 
	la $a0, qName # load address of string to be printed into a0
	syscall
	
	li $v0, 8 # system call for string input
	la $a0, buffer #load byte space into address
	li $a1, 20 # allot the byte space for string
	move $t0,$a0 #save string to t0
	syscall
	
	la $a0,Greeting_1 #load and print Greeting_1 string
	li $v0,4
	syscall
	
	la $a0, buffer #reload byte space to primary address
        move $a0,$t0 # primary address = t0 address (load pointer)
        li $v0,4 # print string, new line added at end
        syscall
        
        la $a0,Greeting_2 #load and print Greeting_1 string
	li $v0,4
	syscall
	
	li $v0, 10
	syscall
