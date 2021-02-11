##	_Lab3main - a program that calls linked list utility functions,

##		 depending on user selection.  _Lab3main outputs a 

##		message, then lists the menu options and get the user

##		selection, then calls the chosen routine, and repeats

##

##	a0 - used for input arguments to syscalls and for passing the 

##		pointer to the linked list to the utility functions

##	a1 - used for 2nd input argument to the utility functions that need it

##	a2 - used for 3rd input argument to the utility functions that need it

##	v0 - used for input and output values for syscalls

##	s0 - used to safely hold the pointer to the linked list

##	s1 - used to hold the user input choice of which menu option			


##   


##      linked list consists of 0 or more elements, in 


##		dynamic memory segment (i.e. heap)


##	elements of the linked list contain 2 parts:


##		at address z: pointerToNext element (unsigned integer), 4 bytes


##		at address z+4: value of the element (signed integer), 4 bytes


##

##

###################################################################

#
#					 	

#
#		text segment			

#
#						

#
####################################################################



	

	.text		
 	

	.globl _Lab3main
 


_Lab3main:		# execution starts here


	li $s0, 0	# initialize pointer storage register to 0 (=Null pointer)



	la $a0,msg110	# put msg110 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg110 string






##

##	Output the menu to the terminal,

##	   and get the user's choice

##

##



MenuZ:	
la $a0,msg111	# put msg111 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg111 string




	
la $a0,msg112	# put msg112 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg112 string




	
la $a0,msg113	# put msg113 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg113 string




	
la $a0,msg114	# put msg114 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg114 string




	
la $a0,msg115	# put msg115 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg115 string




	
la $a0,msg116	# put msg116 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg116 string




	
la $a0,msg117	# put msg117 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg117 string



	
la $a0,msg118	# put msg118 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg118 string





EnterChoice:

	
la $a0,msg119	# put msg119 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg119 string




	li $v0,5	# system call to read  
	

	syscall		# in the integer


	move $s1, $v0	# move choice into $s1





##

##

##	T1 through T11no use an if-else tree to test the user choice (in $s1)

##	   and act on it by calling the correct routine

##

##



T1:	bne $s1,1, T2	# if s1 = 1, do these things. Else go to T2 test

	jal create_list

	move $s0, $v0	# put pointer to linked list in s0 for safe storage

	j MenuZ		# task is done, go to top of menu and repeat



T2:	bne $s1,2, T3	# if s1 = 2, do these things. Else go to T3 test

	move $a0, $s0	# put pointer to linked list in a0 before the call

	jal display_list 

	j MenuZ		# task is done, go to top of menu and repeat



T3:	bne $s1,3, T4	# if s1 = 3, do these things. Else go to T4 test

	
la $a0,msg120	# put msg120 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg120 string




	li $v0,5	# system call to read  
	

	syscall		#   in the integer


	move $a1, $v0	# put integer value into a1 before the call

	move $a0, $s0	# put pointer to linked list in a0 before the call

	jal Insert_end

	j ReportZ 



T4:	bne $s1,4, T5	# if s1 = 4, do these things. Else go to T5 test

	
la $a0,msg120	# put msg120 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg120 string




	li $v0,5	# system call to read  
	

	syscall		#   in the value

	move $a1, $v0	# put integer value into a1 before the call




	la $a0,msg124	# put msg124 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg124 string




	li $v0,5	# system call to read  
	

	syscall		#   in the position number

	move $a2, $v0	# put position number into a2 before the call



	move $a0, $s0	# put pointer to linked list in a0 before the call

	jal Insert_n

	move $s0, $v1	# put the (possibly revised) pointer into s0

	j ReportZ



T5:	bne $s1,5, T6	# if s1 = 5, do these things. Else go to T6 test

	
la $a0,msg125	# put msg125 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg125 string




	li $v0,5	# system call to read  
	

	syscall		#   in the position number

	move $a1, $v0	# put position number into a1 before the call

	move $a0, $s0	# put pointer to linked list in a0 before the call

	jal Delete_n

	move $s0, $v1	# put the (possibly revised) pointer into s0

	j ReportZ



T6:	bne $s1,6, T7	# if s1 = 6, do these things. Else go to T7 test

	
	la $a0,msg126	# put msg126 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg126 string




	li $v0,5	# system call to read  
	

	syscall		#   in the value x

	move $a1, $v0	# put x value into a1 before the call

	move $a0, $s0	# put pointer to linked list in a0 before the call

	jal Delete_x

	move $s0, $v1	# put the (possibly revised) pointer into s0
	
	li $v0, 0

	j ReportZ


T7:	bne $s1,7, T8	# if s1 = 1, do these things. Else go to T7 test
	
	la $a0, msg133	#print prompt
	li $v0, 4
	syscall
	
	li $v0, 5	# take n from user
	syscall
	
	move $a1, $v0	# position n
	move $a0, $s0	# base address of linked list
	
	jal AddNodes
	
	move $s0, $v1	# possibly renewed base address of linked list
	
	j ReportZ


T8:	bne $s1,8, T9	# if s1 = 1, do these things. Else go to T8 test

	la $a0, msg133	#print prompt
	li $v0, 4
	syscall
	
	li $v0, 5	# take n from user
	syscall
	
	move $a1, $v0	# position n
	move $a0, $s0	# base address of linked list
	
	jal SwapNodes
	move $s0, $v1	# rewised base address
	
	j ReportZ
	

T9:	bne $s1,9, T10	# if s1 = 1, do these things. Else go to T9 test
	
	jal create_list
	move $a1, $v0	# base address of second list
	
	la $a0, msg134		# start printing result prompt
	li $v0, 4
	syscall
	
	move $a0, $s0	# base address of linked list
	
	jal CountCommonValues
	
	move $a0, $v0		# print result
	li $v0, 1
	syscall
	
	la $a0, endl	# endl
	li $v0, 4
	syscall

	j MenuZ	# task is done, go to top of menu and repeat

T10:	bne $s1,10, T11	# if s1 = 1, do these things. Else go to T10 test

	la $a0, msg135	# print prompt for bottom limit
	li $v0, 4
	syscall
	
	li $v0, 5	# take low limit from user
	syscall
	move $t0, $v0
	
	la $a0, msg136	# print prompt for top limit
	li $v0, 4
	syscall
	
	li $v0, 5	# take top limit from user
	syscall
	move $t1, $v0
	
	la $a0, msg137		# start printing result prompt
	li $v0, 4
	syscall
	
	move $a2, $t1	# top limit
	move $a1, $t0	# bottom limit
	move $a0, $s0	# base address of linked list
	
	jal FindSumInRange 
	
	move $a0, $v0		# print sum
	li $v0, 1
	syscall
	
	la $a0, endl	# endl
	li $v0, 4
	syscall

	j MenuZ	# task is done, go to top of menu and repeat
	 
	 
T11:	bne $s1,11, T11no	# if s1 = 1, do these things. Else go to T11no


	la $a0,msg127	# put msg127 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the thank you string




	li $v0,10
	# the exit syscall is 10

	syscall		# goodbye...



T11no:	
la $a0,msg128	# put msg128 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg128 string

	j EnterChoice	# go to the place to enter the choice





##

##

##	ReportZ determines if the return value in $v0 is

##	   0 for success, -1 for failure, or other (invalid)

##

##



ReportZ: beq $v0,0,Succeed

	 beq $v0,-1,Fail



Invalid: la $a0,msg130  # put msg130 address into a0
	

	 li $v0,4	# system call to print
	

	 syscall	#   out the invalid message

	 j MenuZ	# task is done, go to top of menu and repeat

	

Succeed: la $a0,msg131  # put msg131 address into a0
	

	 li $v0,4	# system call to print
	

	 syscall	#   out the success message

	 j MenuZ	# task is done, go to top of menu and repeat



Fail:	 la $a0,msg132  # put msg132 address into a0
	

	 li $v0,4	# system call to print
	

	 syscall	#   out the failure message

	 j MenuZ	# task is done, go to top of menu and repeat

	
	






###################################################################

##

#### create_list - a linked list utility routine, 

##			which creates the contents, element 

##			by element, of a linked list

##

##	a0 - used for input arguments to syscalls

##	s0 - holds final value of pointer to linked list (to be put in v0 at exit)

##	t0 - temp value, holds # of current element being created; is loop control variable

##	t1 - temp value, holds n+1, where n is the user input for length of list

##	s1 - value of pointer to current element

##	s2 - value of pointer to previous element

##	v0 - used as input value for syscalls (1, 4, 5 and 9),

##		but also for the return value, to hold the address of the 

##		first element in the newly-created linked list

##	sp - stack pointer, used for saving s-register values on stack

##

##################################################################   




create_list:		# entry point for this utility routine

	

	addi $sp,$sp,-12 # make room on stack for 3 new items
	

	sw $s0, 8 ($sp) # push $s0 value onto stack
	

	sw $s1, 4 ($sp) # push $s1 value onto stack
	

	sw $s2, 0 ($sp) # push $s2 value onto stack
	

	



	la $a0, msg91	# put msg91 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg91 string

	



	la $a0, msg92	# put msg92 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg92 string

	



	li $v0,5	# system call to read  
	

	syscall		#   in the integer
	



	addi $t1,$v0,1	# put limit value of n+1 into t1 for loop testing

	



	bne $v0, $zero, devam90 #if n = 0, finish up and leave

	



	la $a0, msg93	# put msg93 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg93 string

	



	move $s0, $zero # the pointer to the 0-element list will be Null
	

	j Finish90	# 
	






devam90:		# continue here if n>0
	

	li $t0, 1	# t=1

	

	li $a0, 16	# get 16 bytes of heap from OS
	

	li $v0, 9	# syscall for sbrk (dynamic memory allocation)
	

	syscall
	



	move $s0, $v0	# the final value of list pointer is put in $s0
	

	move $s1, $v0	# the pointer to the current element in the list is put in $s1
	

	j Prompt90	# 
		




Top90:	move $s2, $s1	# pointer to previous element is updated with pointer to current element

	

	

	sll $t2,$t0,4	# $t2 is 16 x the number of the current element ($t0)
	

	move $a0, $t2	# get $t2 bytes of heap from OS
	

	li $v0, 9	# syscall for sbrk (dynamic memory allocation)
	

	syscall
	



	move $s1, $v0	# the pointer to the new current element in the list is put in $s1
	

	sw $s1, 0($s2)	# the previous element's pointerToNext is loaded with the new element's address

	



Prompt90: la $a0,msg94	# put msg94 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg94 string

	



	move $a0, $t0	# put x (the current element #) in $a0
	

	li $v0,1	# system call to print
	

	syscall		#   out the integer in $a0

	

	

	la $a0, msg95	# put msg95 address into a0
	

	li $v0,4	# system call to print
	

	syscall		#   out the msg95 string

	



	li $v0, 5	# system call to read in  
	

	syscall		#   the integer from user
	

	sw $v0, 4($s1) 	# store the value from user into

 
			#   current element's value part


	



	addi $t0,$t0,1	# x = x+1  increment element count
	

	bne $t0,$t1, Top90 # If x != n+1, go back to top of loop and iterate again


   
	

	sw $0,0($s1)	# Put Null value into pointerToNext part of last element in list

	





Finish90: move $v0,$s0	# put pointer to linked list in $v0 before return

	

	lw $s0, 8 ($sp) # restore $s0 value from stack
	

	lw $s1, 4 ($sp) # restore $s1 value from stack
	

	lw $s2, 0 ($sp) # restore $s2 value from stack
		

	addi $sp,$sp,12 # restore $sp to original value (i.e. pop 3 items)
	

	jr $ra		# return to point of call






##################################################################

#### display_list - a linked list utility routine, 

##			which shows the contents, element 

##			by element, of a linked list

##

##	a0 - input argument: points to the linked list, i.e. contains

##		the address of the first element in the list

##	s0 - current pointer, to element being displayed

##	s1 - value of pointerToNext part of current element

##	v0 - used only as input value to syscalls (1, 4, and 34)

##	sp - stack pointer is used, for protecting s0 and s1

##

################################################################# 

  



display_list:		# entry point for this utility routine

	

	addi $sp, $sp,-8 # make room on stack for 2 new items
	

	sw $s0, 4 ($sp) # push $s0 value onto stack
	

	sw $s1, 0 ($sp) # push $s1 value onto stack



	

	move $s0, $a0	# put the pointer to the current element in $s0
	



	la $a0, msg81	# put msg81 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		#   out the msg81 string

	



	bne $s0, $zero, devam80	# if pointer is NULL, there is no list

	



	la $a0, msg82	# put msg82 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		#   out the msg82 string
	

	j Return80	# done, so go home





devam80:		# top of loop	
	

	la $a0, msg83	# put msg83 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		#   out the msg83 string

	

	

	lw $s1, ($s0)	# read the value of pointerToNext
	

	move $a0, $s1	# put the pointerToNext value into a0
	

	li $v0, 34	# system call to print out the integer 
	

	syscall		#   in hex format

	



	la $a0, msg84	# put msg84 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		#   out the msg84 string

	



	lw $a0, 4($s0)	# read the value part, put into a0
	

	li $v0, 1	# system call to print  
	

	syscall		#   out the integer

	



	la $a0, msg85	# put msg85 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		#   out the msg85 string (new line)





Top80:	beq $s1, $zero, Return80 # if pointerToNext is NULL, there are no more elements

	

	

	la $a0, msg86	# put msg86 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		#   out the msg86 string

	



	move $s0, $s1	# update the current pointer, to point to the new element

	

	lw $s1, ($s0)	# read the value of pointerToNext in current element
	

	move $a0, $s1	# put the pointerToNext value into a0
	

	li $v0, 34	# system call to print out the integer 
	

	syscall		#   in hex format

	



	la $a0, msg84	# put msg84 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		#   out the msg84 string

	



	lw $a0, 4($s0)	# read the value part, put into a0
	

	li $v0, 1	# system call to print  
	

	syscall		#   out the integer

	



	la $a0, msg85	# put msg85 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		#   out the msg85 string (new line)

	



	j Top80		# go back to top of loop, to test and

 
			#   possibly iterate again





Return80:	
	

	la $a0, msg89	# put msg89 address into a0
	

	li $v0, 4	# system call to print
	

	syscall		# out the msg89 string

	



	lw $s0, 4 ($sp) # restore $s0 value from stack
	

	lw $s1, 0 ($sp) # restore $s1 value from stack
	

	addi $sp, $sp, 8 # restore $sp to original value (i.e. pop 2 items)
	

	jr $ra		# return to point of call







#################################################

##

##

##	dummy routines for the 4 utilities which

##	  students should write for Lab3

##

##

###############################################
#

### Fill Those functions
Insert_end:

	addi $sp, $sp, -12 	# store registers to stack
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
	move $s0, $a0		# current element
	move $s1, $a1		# value
	
insert_end_loop:
	move $t0, $s0		# previous = current
	lw $s0, 0($s0)		# current = next
	bne $s0, $0, insert_end_loop		# while current is not null return loop
	
	li $a0, 16		# allocate 16 bytes of memory
	li $v0, 9
	syscall
	
	sw $0, 0($v0)		# make next null
	sw $s1, 4($v0)		# store value
	sw $v0, 0($t0)		# add element in list
	
	li $v0, 0		# it is successful
	
	lw $ra, 0($sp)		# load registers from stack
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra




Insert_n:
	addi $sp, $sp, -16	# store registers
	sw $s2, 12($sp)
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
	move $s0, $a0		# base address
	move $s1, $a1		# value
	move $s2, $a2		# position to insert
	
	li $t2, 1		# indicator for loop
	move $t0, $s0		# current
	
	li $v0, -1		# its failure
	beq $s0, $0, n_inserted		# if linked list is empty its failure
	ble $s2, 1, n_inserted		# if position is less than 2 its failure
insert_n_loop:
	addi $t2, $t2, 1	# move the indicator
	move $t1, $t0		# previous node
	lw $t0, 0($t0)		# move current
	
	beq $t0, $0, insert_tail		# if current is null insert value to tail
	beq $t2, $s2, insert_position		# if indicator reaches position n insert this position
	blt $t2, $s2, insert_n_loop		# if indicator is less than position do loop
n_inserted:	
	move $v1, $s0		# move base adderss to v1

	lw $ra, 0($sp)		# loads registers
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	jr $ra
	
insert_tail:
	move $a0, $s0		# base address
	move $a1, $s1		# value
	jal Insert_end		# insert value to end
	j n_inserted
	
insert_position:
	move $t3, $t0		# temp
	
	li $a0, 16		# allocate 16 bytes of memory
	li $v0, 9
	syscall
	
	sw $s1, 4($v0)		# value of new node
	sw $t3, 0($v0)		# pointer'toNext of new node
	sw $v0, 0($t1)		# previous's pointerToNext = new node
	
	li $v0, 0		# it is successful
	j n_inserted



Delete_n:
	addi $sp, $sp, -12	# store s registers
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)

	move $s0, $a0		# base address of linked list
	move $s1, $a1
	li $t0, 1		# indicator for linked list
	
	li $v0, -1		# return failure
	beq $s0, $0, end_delete_n_loop		# if linked list is empty return -1
	
	beq $s1, $t0, delete_head	# if n is 1 delete head
	move $t1, $s0		# next
	move $t2, $s0
delete_n_loop:
	move $t3, $t2		# previous
	move $t2, $t1		# current
	lw $t1, 0($t1)
	beq $t1, $0, delete_tail	# if next is null delete tail
	addi $t0, $t0, 1
	
	beq $t0, $s1, delete_node	# if indicator is n delete current
	blt $t0, $s1, delete_n_loop	# while indicator is less than n return loop
end_delete_n_loop:
	move $v1, $s0		# new renewed base address

	lw $ra, 0($sp)		# loads registers
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	
delete_head:
	move $t1, $s0
	lw $s0, 0($t1)		# make pointerToNext the new head
	li $v0, 0		# return success
	j end_delete_n_loop

delete_node:
	beq $t1, $0, delete_tail
	lw $t3, 0($t1)
	sw $t3, 0($t2)		# previous's pointerToNext = current's pointerToNext
	li $v0, 0		# return success
	j end_delete_n_loop

delete_tail:
	beq $t0, 1, delete_head
	sw $0, 0($t3)		# make previous's pointerToNext = 0
	li $v0, 0		# return success
	j end_delete_n_loop

	

# As there is no memory deallocation in MIPS, memory allocated for
# deleted nodes will not be used again unless all memory is full 
Delete_x:
	addi $sp, $sp, -28	# stores registers
	sw $s5, 24($sp)
	sw $s4, 20($sp)
	sw $s3, 16($sp)
	sw $s2, 12($sp)
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
	move $s0, $a0
	move $s1, $a1
	addi $s5, $0, 0		# number of counted nodes

	beq $s0, $0, end_delete_x_loop
	
head_x_deleted:
	addi $s5, $s5, 1	# increase number of counted nodes
	
	lw $s4, 4($s0)		# value
	beq $s4, $s1, delete_x_head
	move $s2, $s0		# previous = head
delete_x_loop:
	lw $s3, 0($s2)		# current = previous's pointerToNext
	beq $s3, $0, end_delete_x_loop
	addi $s5, $s5, 1	# increase number of counted nodes
	
	lw $s4, 4($s3)		# current's value
	beq $s4, $s1, delete_x_node
	move $s2, $s3		# previous = current
	j delete_x_loop
end_delete_x_loop:
	
	move $v0, $s5
	move $v1, $s0
	
	lw $ra, 0($sp)		# loads registers
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	lw $s4, 20($sp)
	lw $s5, 24($sp)
	addi $sp, $sp, 28
	jr $ra

delete_x_head:
	move $s4, $s0
	lw $s0, 0($s0)		# make pointerToNext the new head
	sw $0, 4($s4)		# delete head's item
	sw $0, 0($s4)		# delete head's next
	j head_x_deleted

delete_x_node:
	lw $s4, 0($s3)
	sw $s4, 0($s2)		# previous's pointer'toNext = current's pointerToNext
	sw $0, 0($s3)		# delete current's pointer'toNext
	sw $0, 4($s3)		# delete current's value
	j delete_x_loop
	
	
	
	
AddNodes:
	addi $sp, $sp, -12	# store registers
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
	move $s0, $a0		# base address
	move $s1, $a1		# first position to add
	add, $s1, $s1, 1	# second position to add
	
	li $t2, 1		# indicator for second position
	move $t0, $s0		# current
	
	li $v0, -1		# its failure
	beq $s0, $0, nodes_added	# if linked list is empty its failure
add_nodes_loop:
	addi $t2, $t2, 1	# move the indicator
	lw $t1, 4($t0)		# value before current
	lw $t0, 0($t0)		# move current
	
	beq $t0, $0, nodes_added		# if current is null return failure
	blt $t2, $s1, add_nodes_loop		# if indicator is less than second position do loop
	lw $t3, 4($t0)		# get value of current
	add $t3, $t1, $t3	# add node values
	sw $t3, 4($t0)		# store new value to current
	
	addi $s1, $s1, -1	# get position of first node
	move $a1, $s1		# position of first node
	move $a0, $s0		# base address
	jal Delete_n
nodes_added:

	lw $ra, 0($sp)		# loads registers
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	
	
	
SwapNodes:
	addi $sp, $sp, -12	# store registers
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
	move $s0, $a0		# base address
	move $s1, $a1		# first position to swap
	add, $s1, $s1, 1	# second position to swap
	
	li $t4, 1		# indicator for second position
	move $t0, $s0		# next
	move $t1, $s0		# current
	
	li $v0, -1		# its failure
	beq $s0, $0, nodes_swaped	# if linked list is empty its failure
swap_nodes_loop:
	addi $t4, $t4, 1	# move the indicator
	move $t2, $t1		# move previous
	move $t1, $t0		# move current
	lw $t0, 0($t0)		# move next
	
	beq $t0, $0, nodes_swaped		# if next is null return failure
	blt $t4, $s1, swap_nodes_loop		# if indicator is less than second position do loop
	
	li $v0, 0
	lw $t3, 0($t0)		# temp = current
	sw $t3, 0($t1)		# current points to temp
	sw $t1, 0($t0)		# next points to current
	beq $t4, 2, swap_head	# if indicator is 2 swap head and second
	sw $t0, 0($t2)		# previous points to old next
	j nodes_swaped
swap_head:
	move $s0, $t0		# s0 points to next
nodes_swaped:
	move $v1, $s0		# revised base address

	lw $ra, 0($sp)		# loads registers
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	addi $sp, $sp, 12
	jr $ra
	


CountCommonValues:
	addi $sp, $sp, -16	# store registers
	sw $s2, 12($sp)
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
	move $s0, $a0	# base address of first list
	move $s1, $a1	# base address of second list	
	li $s2, 0	# indicator to traverse first list
	
	move $t1, $s0	# current for first array
	li $t0, 0
common_value_outer_loop:
	addi $t0, $t0, 1	# move indicator 1
	beq $t1, $0, counted_common_values	# if current is null exit loop

	lw $t2, 4($t1)		# key value
	
	move $t4, $s1	# current for second list
	li $t3, 0	# indicator to traverse second list
common_value_inner_loop:
	addi $t3, $t3, 1	# move indicator 2
	beq $t4, $0, traversed_second_list	# if current is null exit loop
	lw $t5, 4($t4)		# second value
	lw $t4, 0($t4)		# move second current

	bne $t5, $t2, common_value_inner_loop	# if key value is not equal to second value do loop
	addi $s2, $s2, 1
traversed_second_list:
	lw $t1, 0($t1)		# move first current
	j common_value_outer_loop
counted_common_values:
	move $v0, $s2		# count of common values

	lw $ra, 0($sp)		# loads registers
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	addi $sp, $sp, 16
	jr $ra
	
	

FindSumInRange:
	addi $sp, $sp, -20	# store registers
	sw $s3, 16($sp)
	sw $s2, 12($sp)
	sw $s1, 8($sp)
	sw $s0, 4($sp)
	sw $ra, 0($sp)
	
	move $s0, $a0		# base address
	move $s1, $a1		# bottom limit
	move $s2, $a2		# top limit
	
	li $v0, 0	# sum
	beq $s0, $0, return_sum		# if list is empty don't call recursive function
	
	lw $t0, 0($s0)		# pointerToNext
	lw $s3, 4($s0)		# value of head
	
	move $a0, $t0
	jal FindSumInRange		# recursive call
	
	blt $s3, $s1, return_sum
	bgt $s3, $s2, return_sum
	add $v0, $v0, $s3	# sum = sum + value of head
return_sum:
	
	lw $ra, 0($sp)		# loads registers
	lw $s0, 4($sp)
	lw $s1, 8($sp)
	lw $s2, 12($sp)
	lw $s3, 16($sp)
	addi $sp, $sp, 20
	jr $ra
	
	
	
	
	nop



################################################

#
#

#
#     	 	data segment			

#
#						

#
#

################################################



	 .data


msg81:	 .asciiz "This is the current contents of the linked list: \n"


msg82:   .asciiz "No linked list is found, pointer is NULL. \n"


msg83:   .asciiz "The first node contains:  pointerToNext = "


msg84:   .asciiz ", and value = "


msg85:   .asciiz "\n"


msg86:   .asciiz "The next node contains:  pointerToNext = "


msg89:   .asciiz "The linked list has been completely displayed. \n"


msg91:	 .asciiz "This routine will help you create your linked list. \n"


msg92:   .asciiz "How many elements do you want in your linked list? Give a non-negative integer value: 0, 1, 2, etc.\n"


msg93:   .asciiz "Your list is empty, it has no elements. Also, it cannot not be displayed. \n"


msg94:   .asciiz "Input the integer value for list element #"


msg95:   .asciiz ": \n"




msg110:  .asciiz "Welcome to the Lab3 program about linked lists.\n"


msg111:  .asciiz "Here are the options you can choose: \n"

msg112:  .asciiz "1 - create a new linked list \n"

msg113:  .asciiz "2 - display the current linked list \n"

msg114:  .asciiz "3 - insert element at end of linked list \n"

msg115:  .asciiz "4 - insert element into linked list at position n  \n"

msg116:  .asciiz "5 - delete element at position n from linked list \n"

msg117:  .asciiz "6 - delete element from linked list with value x \n"

msg118:  .ascii	 "7 - Add nodes at position n and (n+1)\n"
msg118a: .ascii	 "8 - Swap nodes at position n and (n+1)\n"
msg118b: .ascii	 "9 - Count common values with a second array\n"
msg118c: .ascii	 "10 - Find sum in given range\n"
msg118d: .asciiz "11 - exit this program \n"

msg119:  .asciiz "Enter the integer for the action you choose:  "

msg120:  .asciiz "Enter the integer value of the element that you want to insert:  "

msg124:  .asciiz "Enter the position number in the linked list where you want to insert the element:  "	

msg125:  .asciiz "Enter the position number in the linked list of the element you want to delete:  "

msg126:  .asciiz "Enter the integer value of the element that you want to delete:  "



msg127:  .asciiz "Thanks for using the Lab3 program about linked lists.\n"


msg128:  .asciiz "You must enter an integer from 1 to 11. \n"

msg130:  .asciiz "The return value was invalid, so it isn't known if the requested action succeeded or failed. \n"	

msg131:  .asciiz "The requested action succeeded. \n"

msg132:  .asciiz "The requested action failed. \n"

msg133:	 .asciiz "Enter the position number n: "
msg134:	 .asciiz "Common values are "
msg135:  .asciiz "Enter lower limit: "
msg136:	 .asciiz "Enter top limit: "
msg137:	 .asciiz "Sum between the range is "
endl:	 .asciiz "\n"