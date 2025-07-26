# Program to find the determinant of nxn matrix
# Question 1
# Assignment 4
# Group 81
# Soni Aditya Bharatbhai (20CS10060)
# Anand Manojkumar Parikh (20CS10007)    

# helper strings
.data

    input1:
        .asciiz "Enter four positive integers (n, a, r and m) :\n"  
    error_msg1:
        .asciiz "n is not positive! Please re-enter.\n"
    error_msg2:
        .asciiz "a is not positive! Please re-enter.\n"
    error_msg3:
        .asciiz "r is not positive! Please re-enter.\n"
    error_msg4:
        .asciiz "m is not positive! Please re-enter.\n"
    output_matrix:
        .asciiz "The matrix A is:\n"
    output_det:
        .asciiz "Final determinant of the matrix A is "
    space:
        .asciiz " "
    newline:
        .asciiz "\n"

.text
.globl main

main:  
    li $v0, 4
    la $a0, input1  # print the input message
    syscall

    input_n:        # take input for n
        li $v0, 5
        syscall
        ble $v0, $zero, error_n  # if n<=0 we display error message and ask for input again
        move $s0, $v0

    input_a:        # take input for a
        li $v0, 5
        syscall
        ble $v0, $zero, error_a  # if a<=0 we display error message and ask for input again
        move $s1, $v0

    input_r:        # take input for r
        li $v0, 5
        syscall
        ble $v0, $zero, error_r  # if r <= 0, we display error message and ask for input again
        move $s2, $v0

    input_m:        # take input for m
        li $v0, 5
        syscall
        ble $v0, $zero, error_m  # if m<=0, we display error message and ask for input again
        move $s3, $v0

    move $a0, $s0           # a0(function parameter of malloc_matrix) stores n
    jal malloc_matrix       # call malloc_matrix function to allocate space for matrix A on the stack
    move $s4, $v0           # s4 stores the address &A[0][0]

    # s0 stores n, s1 stores a, s2 stores r, s3 stores m, s4 stores &A[0][0]
    
    move $a0, $s4   # a0 stores &A[0][0] (1st function argument)
    move $a1, $s0   # a1 stores n (2nd function argument) 
    move $a2, $s1   # a2 stores a (3rd function argument)
    move $a3, $s2   # a3 stores r (4th function argument)
    subu $sp, $sp, 4    # we also need m as a function parameter so we store it in the stack
    sw $s3, 0($sp)      # m stored in the stack
    jal populate_matrix # call populate matrix function to fill the entries of matrix A
    addiu $sp, $sp, 4   # pop m from the stack

    move $a0, $s4       # a0 stores &A[0][0] (1st function argument)
    move $a1, $s0       # a1 stores n (2nd function argument)
    jal print_matrix    # call the print_matrix function to print the elements of matrix A    


    move $a0, $s4      # a0 stores &A[0][0] (1st function argument)      
    move $a1, $s0      # a1 stores n (2nd function argument) 
    jal determinant    # call the recursive determinant function

    move $t0, $v0      # t0 stores the return value (determinant of A)

    mul $t1, $s0, $s0  # t1 stores n*n
    sll $t1, $t1, 2    # t1 now stores 4*n*n 
    addu $sp, $sp, $t1 # deallocate matrix A from the stack 

    li $v0, 4            
    la $a0, output_det  # print the output message
    syscall

    li $v0, 1
    move $a0, $t0       # print the determinant value
    syscall

    li $v0, 4
    la $a0, newline     # prints newline
    syscall

    li $v0,10           # terminate program
    syscall 

# allocates space on stack for a n*n matrix
# n is the only input parameter of this function
# returns the start address of the matrix
malloc_matrix:
    mul $t0, $a0, $a0   # t0 stores n*n
    sll $t0, $t0, 2     # t0 stores 4*n*n (number of bytes needed)
    subu $sp, $sp, $t0  # allocate space on stack
    move $v0, $sp       # start address of matrix is return value
    jr $ra              # return


# a0 stores A, a1 stores n, a2 stores a, a3 stores r
# m is stored at stack top i.e 0($sp)
# this function fills the entries of a matrix in row major fashion
populate_matrix:
    move $t0, $a2    # t0 will store (ar^i)%m in the below loop
    lw $t1, 0($sp)   # t1 stores m

    li $t2, 0           # t2 stores i (counter variable for below loop)
    mul $t3, $a1, $a1   #stores n*n
    move $t4, $a0       # t4 stores address of matrix element where we have to store value
    
    # this loop fills the elements of matrix A in row major order
    fill_loop:
        beq $t2, $t3, finish_populate   # if i=n*n break loop 
        div $t0, $t1                    # divide ar^i by m
        mfhi $t0                        # t0 now stores (ar^i)modulo m
        sw $t0, 0($t4)                  # store this value in matrix
        mul $t0, $t0, $a3               # t0 now stores ar^(i+1), value for next iteration
        addi $t2, $t2, 1                # i++
        addiu $t4, $t4, 4               # t4 now points to the next address in matrix where we have to store this value
        b fill_loop                     # branch to fill_loop
    finish_populate:                    # return
        jr $ra        

# a0 stores A, a1 stores n
# print_matrix function prints the entries of the matrix A
print_matrix:
    li $t0, 0           # t0 stores counter variable i(number of elements printed so far)
    li $t1, 0           # t1 stores the current column index (0-indexing is used)
    mul $t2, $a1, $a1   # t2 stores n*n    
    move $t3, $a0       # t3 stores the address of the matrix element which will be printed

    print_loop:
        bge $t0, $t2, finish_print  # if i = n*n, all elements of matrix have been printed so break loop
        
        li $v0, 1
        lw $a0, 0($t3)  # print the current matrix element
        syscall

        li $v0, 4
        la $a0, space   # prints space
        syscall

        addi $t0, 1     # i++
        addi $t1, 1     # column++
        addiu $t3, $t3, 4   # t3 now points to the next matrix element

        bne $t1, $a1, print_loop    # if column = n we need to print a newline else we loop

        li $v0, 4
        la $a0, newline     # since column = n, we have printed the entire current row, so we print newline
        syscall
        
        li $t1, 0       # column = 0 for the next row
        b print_loop    # loop again
    finish_print:
        jr $ra          # return

error_n:
    li $v0, 4
    la $a0, error_msg1  # prints error message for invalid n
    syscall
    b input_n           # take input again

error_a:
    li $v0, 4
    la $a0, error_msg2  # prints error message for invalid a
    syscall
    b input_a           # take input again

error_r:
    li $v0, 4
    la $a0, error_msg3  # print error message for invalid r
    syscall
    b input_r           # take input again

error_m:
    li $v0, 4
    la $a0, error_msg4  # print error message for invalid m
    syscall     
    b input_m           # take input again

# a0 stores &A[0][0], a1 stores n ( number of rows in square matrix A)
# recursive function that computes determinant of matrix A
# return value is the determinant of A

determinant:  
    bgt $a1, 1, recurse     # if n>1 we compute recursively
    lw $v0, 0($a0)          # n==1, base case, determinant = A[0][0]    
    jr $ra                  # return

    recurse:                
       subu $sp, $sp, 16    # create space for storing values
       sw $fp, 12($sp)      # save old frame pointer in stack
       sw $ra, 8($sp)       # save return address in stack
       sw $a0, 4($sp)       # save &A[0][0] in stack
       sw $a1, 0($sp)       # save n in the stack
       addiu $fp, $sp, 12   # set new frame pointer        
       
       addi $a0, $a1, -1    # a0 = n-1, first function parameter of malloc_matrix
       jal malloc_matrix    # create space in stack for (n-1)*(n-1) matrix say M
       # matrix M is used to store minors of A
       # wecompute determinant with respect to the first row of A

       lw $t0, -8($fp)     # t0 stores &A[0][0]
       move $t1, $v0        # t1 stores &M[0][0]
       li $t2, 0            # t2 stores column number j
       li $t3, 1            # t3 stores current sign to multiply to the minor (i.e (-1)^(i+j) )
       li $t4, 0            # t4 stores current sum of the determinants of the minors we have computed so far
       lw $t5, -12($fp)     # t5 stores n
       determinant_loop:
            beq $t2, $t5, return_determinant  # if j=n, we break loop

            # since we have to call the fill_minor function to compute the minor matrix
            # corresponding to the current column we first save the register values in stack

            subu $sp, $sp, 12   # create space in stack
            sw $t2, 8($sp)      # save j 
            sw $t3, 4($sp)      # save sign
            sw $t4, 0($sp)      # save current sum

            move $a0, $t0       # a0 stores &A[0][0]
            move $a1, $t1       # a1 stores &M[0][0]
            move $a2, $t2       # a2 stores column number j
            move $a3, $t5       # a3 stores n
            # M should be the matrix we obtain by removing 0th row and j-th column from A
            jal fill_minor      # call fill_minor function
            
            addi $a0, $sp, 12   # a0 stores &M[0][0]
            lw $a1, -12($fp)    # a1 stores n
            addi $a1, $a1, -1   # a1 now stores n-1
            jal determinant     # recursively compute determinant of minor M

            move $t6, $v0       # t6 stores determinant of minor M
            # restore the temporary registers
            lw $t0, -8($fp)    # t0 stores &A[0][0]
            addi $t1, $sp, 12   # t1 stores &M[0][0]
            lw $t2, 8($sp)      # t2 stores j
            lw $t3, 4($sp)      # t3 stores sign
            lw $t4, 0($sp)      # t4 stores current sum
            lw $t5, -12($fp)    # t5 stores n
            addiu  $sp, $sp, 12 # pop the saved registers before(t2,t3,t4) from the stack

            mul $t6, $t6, $t3   # t6 now stores value of co-factor
            sll $t7, $t2, 2     # t7 stores 4*j
            addu $t7, $t7, $t0  # t7 now stores &A[0][j]
            lw $t7, 0($t7)      # t7 now stores A[0][j]

            mul $t6, $t6, $t7   # multiply cofactor with A[0][j]
            add $t4, $t4, $t6   # add this value to the current sum

            mul $t3, $t3, -1    # sign = sign*-1, for next column
            addi $t2, $t2, 1    # column number += 1 i.e j++
            b determinant_loop  # loop again

        return_determinant:
            move $v0, $t4       # t4 stores determinant value, store return value in v0
            addiu $t8, $fp, 4   # t8 stores address of current stack base
            lw $ra, -4($fp)     # ra now stores the return address
            lw $fp, 0($fp)      # restore old frame pointer
            move $sp, $t8       # deallocate the memory on the stack
            jr $ra              # return

# a0 stores &A[0][0]
# a1 stores &M[0][0]
# a2 stores column number j
# a3 stores n (total columns in A)
# fill_minor function stores in matrix M the matrix obtained on removing 0th row and j-th column of A
fill_minor:
    move $t0, $a0       # t0 stores &A[0][0]
    move $t1, $a1       # t1 stores &M[0][0]
    move $t2, $a2       # t2 stores j
    mul $t3, $a3, $a3   # t3 stores n*n
    li $t4, 0           # t4 stores number of elements of A we have seen so far
    # t4 stores i(counter variable)
    # in the below loop t0 stores the address of that element in A which will be considered to be stored in M
    # t1 stores the address of that element in M to which we have to write the value from A
    minor_loop:
        blt $t4, $a3, continue_loop # if i<n, we are in the 0-th row so continue
        beq $t4, $t3, return_minor  # if i = n*n break the loop

        div $t4, $a3                # divide i by n
        mfhi $t5                    # t5 stores i%n i.e the current column index
        beq $t5, $t2, continue_loop # if current column is j, we continue

        lw $t6, 0($t0)      # t6 stores value of current element in A
        sw $t6, 0($t1)      # store this value in M

        addiu $t1, $t1, 4   # t1 now stores the address of that element in M which needs to be filled

        continue_loop:
            addiu $t0, $t0, 4   # t0 stores the address of next element in A which will be copied to M if the row and column are valid
            addi $t4, $t4, 1    # i++
            b minor_loop        # loop again
    
    return_minor:
        jr $ra          # return
