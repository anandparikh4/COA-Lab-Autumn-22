# Program to find the prouct of two 16-bit signed integers using booth's multiplication algorithm
# Assignment-2
# Autumn Semester 2022-2023
# Question 1
# Group 81
# Soni Aditya Bharatbhai 20CS10060
# Anand Manojkumar Parikh 20CS10007

# Data segment

# helper strings for console messages
.data
    input1:
        .asciiz "Enter first number:"
    input2:
        .asciiz "Enter second number:"
    invalid_input:
        .asciiz "The entered number is not a 16-bit signed integer.\n"
    output_msg:
        .asciiz "Product of the two numbers are: "
    newline:
        .asciiz "\n"

# Code segment

.text

.globl main

main:
    li $v0, 4
    la $a0, input1      # print message to take input for 1st integer
    syscall
    
    li $v0, 5
    syscall
    move $s0, $v0           # $s0 stores the first integer, let $s0 = n1

    li $t0, 1               # $t0 stores 2^15, $t1 stores -2^15 
    sll $t0, $t0, 15
    sub $t1, $zero, $t0

    bge $s0, $t0, invalid_number    # if n1 is not a 16-bit signed integer then print error message
    blt $s0, $t1, invalid_number        

    li $v0, 4   
    la $a0, input2      # print message to take input of 2nd integer
    syscall

    li $v0, 5            
    syscall
    move $s1, $v0       # $s1 stores the 2nd integer, let $s1 = n2

    bge $s1, $t0, invalid_number    # if n2 is not a 16 bit signed integer print error message
    blt $s1, $t1, invalid_number    

    move $a0, $s0           # initialize registers a0 and a1 with n1 and n2 respectively
    move $a1, $s1           # so the 2 function arguments of multiply_booth function have been initialized
    jal multiply_booth      # call multiply_booth function
    move $t0, $v0           # move the return value (product of n1 and n2) in register to t0

    li $v0, 4
    la $a0, output_msg      # print the string "Product of 2 integers are: "
    syscall

    li $v0, 1               # print the integer corresponding to the product of the 2 numbers
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline         # print a newline
    syscall

    li $v0, 10              # terminate
    syscall    

# to = M, t1 = Q, t2 = A, t3 = Q-1, t4 = count, t5 =  Q0
# we use temporary registers t0,t1,t2,t3,t4,t5 for the multiply_booth function
# without loss of generality we take n1 as M and n2 as Q
multiply_booth:
    move $t0, $a0           # t0 stores M
    move $t1, $a1           # t1 stores Q 
    
    li $t3, 0               # Q-1 is initialized to 0 as per algorithm
    li $t4, 32              # count initialized to 32
    li $t2, 0               # t2 stores A
    
    li $t6, 1               # t6 stores the constant -2^31
    sll $t6, $t6, 31

    addi $t7, $t6, 1        # t7 stores the constant (2^31) - 1
    sub $t7, $zero, $t7

    # the logic of this program is that since we have checked M and Q to be 16-bit signed integers
    # we can assume that we are given two 32 bit signed integers and we have to multiply them
    # so we run the algorithm loop for 32 times and each time we do right shift on A and Q, we change MSB of Q depending on the LSB of A
    # now after the loop has completed the final result should theoretically be the 64-bit integer we obtain by appending 32 bits of Q to the right of the 32 bits of A
    # however we know for sure that the final result will be a 32 bit integer so the final answer will be the 32 bits of Q
    # the below for loop runs the above process

    for:
        beq $t4, $zero, endfor      # if count = 0 we break the loop
        andi $t5, $t1, 1            # t5 stores Q0            
        beq $t5, $zero, case0       # if Q0=0 we branch to label case0
        b case1                     # unconditional branch to label case1

        case0:
            beq $t3, $zero, common_operation    # if Q-1 = 0 we do not change A
            add $t2, $t2, $t0                   # A = A+M performed
            b common_operation                  
        
        case1:
            bne $t3, $zero, common_operation    # if Q-1 = 1 we do not change A
            sub $t2, $t2, $t0                   # A = A-M performed
            b common_operation

        common_operation:
            andi $t8, $t2, 1                    # t8 stores LSB of A
            sra $t2, $t2 , 1                    # arithmetic right shift on A
            move $t3, $t5                       # Q-1 now stores Q0 (value updated for next iteration)
            sra $t1, $t1, 1                     # arithmetic right shift on Q
            addi $t4, $t4, -1                   # reduce count by 1
            beq $t8, $zero, make_zero           # if we have to make MSB of Q as 0 go to label make_zero    
            b make_one                          # else go to label make_one
            make_zero:
                and $t1, $t1, $t7               # Q = Q & INT_32_MAX, so we make MSB of Q as 0
                b for 
            make_one:
                or $t1, $t1, $t6                # Q = Q | INT_32_MIN, so we make MSB of Q as 1
                b for 
            
    endfor:
        move $v0, $t1                           # move the final result from t1 to v0
        jr $ra                                  # return to main

invalid_number:
    li $v0, 4
    la $a0, invalid_input                       # since the entered integer is not a 16 bit signed integer we print error message
    syscall

    li $v0, 10                                  # terminate program
    syscall
