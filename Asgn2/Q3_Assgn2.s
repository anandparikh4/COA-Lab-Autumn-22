# Program to populate, print and take transpose of mxn matrix and then print the transposed matrix 
# Assignment-2
# Autumn Semester 2022-2023
# Question 3
# Group 81
# Soni Aditya Bharatbhai 20CS10060
# Anand Manojkumar Parikh 20CS10007

	.data			# data segment containing some strings

prompt_rows:
	.asciiz "Enter the number of rows (m) : "

prompt_cols:
	.asciiz "Enter the number of columns (n) : "

prompt_first_term:
	.asciiz "Enter the first term of the GP : "

prompt_common_ratio:
	.asciiz "Enter the common ratio of the GP : "

print_A:
	.asciiz "Matrix A :\n"

print_B:
	.asciiz "Matrix B :\n"

invalid:
	.asciiz "Invalid input!"

newline:
	.asciiz "\n" 

space:
	.asciiz " " 

	.text			# text segment

	.globl main

main:
	li $v0,4		
	la $a0, prompt_rows
	syscall
	li $v0,5
	syscall			# scan number of rows
	move $s0,$v0		# s0 <-- m

	ble $s0,0,error		# if rows <= 0 invalid input

	li $v0,4
	la $a0, newline
	syscall
	
	li $v0,4
	la $a0, prompt_cols
	syscall
	li $v0,5
	syscall			# scan number of columns
	move $s1,$v0		# s1 <-- n	

	ble $s1,0,error		# if columns <= 0 invalid input

	li $v0,4
	la $a0, newline
	syscall

	li $v0,4
	la $a0, prompt_first_term
	syscall
	li $v0,5
	syscall			# scan first term of GP
	move $s4,$v0		# s4 <-- first term (a)

	li $v0,4
	la $a0, newline
	syscall

	li $v0,4
	la $a0, prompt_common_ratio
	syscall
	li $v0,5
	syscall			# scan common ratio of GP
	move $s5,$v0		# s5 <-- common ratio (r)

	li $v0,4
	la $a0, newline
	syscall

	jal initStack		# initialise the stack
	
	mul $a0,$s0,$s1 	# a0 <-- m*n

	jal mallocInStack	# malloc space for m*n integers for array A
	move $s2,$v0		# s2 <-- start address of A

	mul $a0,$s1,$s0 	# a0 <-- n*m

	jal mallocInStack	# malloc space for n*m integers for array B
	move $s3,$v0		# s3 <-- start address of B

	mul $a0,$s0,$s1		# a0 <-- m*n
	move $a1,$s4		# a1 <-- a
	move $a2,$s5		# a2 <-- r
	move $a3,$s2		# a3 <-- start address of A
	jal populateMatrix	# populate the matrix A

	li $v0,4
	la $a0,print_A
	syscall			

	move $a0,$s0		# a0 <-- m
	move $a1,$s1		# a1 <-- n
	move $a2,$s2		# a2 <-- start address of A
	jal printMatrix		# print matrix A

	move $a0, $s0		# a0 <-- m
	move $a1, $s1		# a1 <-- n
	move $a2, $s2		# a2 <-- start address of A
	move $a3, $s3		# a3 <-- start address of B	
	jal transposeMatrix	# transpose A and store in B

	li $v0,4
	la $a0,print_B
	syscall

	move $a0,$s1		# a0 <-- n
	move $a1,$s0		# a1 <-- m
	move $a2,$s3		# a2 <-- start address of B
	jal printMatrix		# print matrix B


exit:
	li $v0,10		# terminate the program
	syscall

error:
	li $v0,4
	la $a0, invalid		# output message : invalid input in case number of rows or columns in non-positive
	syscall
	b exit


initStack:			# initialise the stack
	sub $sp,$sp,4		# allocate 4 bytes
	sw $fp,0($sp)		# store the old frame pointer
	move $fp,$sp		# fp <-- sp (assign new frame pointer)
	jr $ra			# return


pushToStack:			# push elements to the stack
	sub $sp,$sp,4		# allocate 4 bytes
	sw $a0,0($sp)		# store the value in the argument received
	move $v0,$sp 		# v0 (return value) <-- stack pointer
	jr $ra			# return


mallocInStack:			# allocate a chunk of memory
	mul $a0,$a0,4		# multiply the argument by 4, since each integer is of 4 bytes
	sub $sp,$sp,$a0		# allocate that much memory
	move $v0,$sp		# v0 (return value) <-- sp (start address of allocated space)
	jr $ra			# return


populateMatrix:			# since the array is allocated linearly and filled in row major
	move $t0,$a0		# t0 <-- m*n (store content of a0 in t0, since a0 will be used in syscalls)
	li $t1,0		# i <-- 0
	move $t3,$a1		# t3 <-- a (first term)
	
	populate:
		beq $t1,$t0,end_populate	# if i == m*n, break. So i : [0 , m*n-1]
		
		move $t2,$a3			# t2 <-- start address of array (arr)
		mul $t1,$t1,4			# t1 <-- 4*i
		add $t2,$t2,$t1			# t2 <-- start address + 4i (address of arr[i])

		li $t4,4			
		div $t1,$t4			# t1 <-- i
		mflo $t1

		sw $t3,0($t2)			# arr[i] <-- current element of the progression

		mul $t3,$t3,$a2			# new term <-- current * common ratio

		add $t1,$t1,1			# i++
		b populate			# re-iterate
	
	end_populate:				# loop ends
		la $a0,newline			
		li $v0,4
		syscall
		jr $ra		# return
		

printMatrix:
	li $t0,0		# i <-- 0
	
	for_i:
		beq $t0,$a0,end_for_i		# if i == m, break

		li $t1,0			# j <-- 0

		for_j:
			beq $t1,$a1,end_for_j	# if j == n break

			mul $t2,$a1,$t0		# t2 <-- n*i
			add $t2,$t2,$t1		# t2 <-- n*i + j
			mul $t2,$t2,4		# t2 <-- 4 (n*i + j)
			add $t2,$t2,$a2		# t2 <-- arr + 4 * (n*i + j) (address of arr[i][j])
			
			move $t3,$a0		# temp variable <-- a0 (since a0 used in syscalls)

			lw $a0,0($t2)		# a0 <-- arr[i][j]
			li $v0,1
			syscall			# print arr[i][j]

			la $a0,space
			li $v0,4		
			syscall

			move $a0,$t3		# a0 <-- temp (recover the value)

			add $t1,$t1,1		# j++
			b for_j			# re-iterate
		
		end_for_j:
			move $t3,$a0		# temp <-- a0

			la $a0,newline
			li $v0,4
			syscall			# print a new line after each row

			move $a0,$t3		# a0 <-- temp

			add $t0,$t0,1		# i++
			b for_i			# re-iterate

	end_for_i:
		la $a0,newline
		li $v0,4
		syscall
		jr $ra				# return


transposeMatrix:
	li $t0,0				# i <-- 0
	
	for_i_2:
		beq $t0,$a1,end_for_i_2		# if i == n, break
		
		li $t1,0			# j <-- 0
		
		for_j_2:
			beq $t1,$a0,end_for_j_2	# if j == m, break
			
			mul $t2,$a0,$t0		# t2 <-- m*i
			add $t2,$t2,$t1		# t2 <-- m*i + j
			mul $t2,$t2,4		# t2 <-- 4 * (m*i + j)
			add $t2,$t2,$a3		# t2 <-- B + (m*i + j)	(address of B[i][j])

			mul $t3,$a1,$t1		# t3 <-- n*j
			add $t3,$t3,$t0		# t3 <-- n*j + i
			mul $t3,$t3,4		# t3 <-- 4 * (n*j + i)
			add $t3,$t3,$a2		# t3 <-- A + (n*j + i)	(address of A[i][j])

			lw $t4,0($t3)		# t4 <-- A[i][j]
			sw $t4,0($t2)		# B[i][j] <-- t4, basically assign B[i][j] = A[i][j]

			add $t1,$t1,1		# j++	
			b for_j_2		# re-iterate
		
		end_for_j_2:
			add $t0,$t0,1		# i++
			b for_i_2		# re-iterate
	
	end_for_i_2:
		jr $ra		# return