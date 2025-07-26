# Program to find k-th largest element in an array of 10 integers
# Assignment-2
# Autumn Semester 2022-2023
# Question 2
# Group 81
# Soni Aditya Bharatbhai 20CS10060
# Anand Manojkumar Parikh 20CS10007

# helper strings
.data
    input_int:
        .asciiz "Enter the integer: "
    input_k:
        .asciiz "Enter the value of k: "
    output_msg1:
        .asciiz "The "
    output_msg2:
        .asciiz "-th largest number in the array is: "
    error_msg:
        .asciiz "Invalid value of k.\n"
    newline:
        .asciiz "\n"
    sorted_msg:
        .asciiz "The sorted array is:\n"
    space_:
        .asciiz " "
    .align 2
    array:
        .space 40

.text    
.globl main

main:
    la $s0, array       # s0 = &array[0]
    li $s1, 10          # s1 = 10 = size of the array

    # for loop to take input for the 10 integers
    # s0 stores the address of the array element for which we are taking input
    # s1 stores number of array elements
    
    li $t0, 0           # t0 stores counter variable i
    
    for:
        beq $t0, $s1, endfor  # if i=n when break the for loop
        li $v0, 4               
        la $a0, input_int       # print the message for input
        syscall

        li $v0, 5
        syscall         

        sw $v0, 0($s0)          # array[i] = input value
        addu $s0, $s0, 4        # s0 now stores &array[i+1]

        addi $t0, $t0, 1       # i++
        b for
    endfor:
        la $s0, array           # s0 now stores &array[0]

        li $v0, 4               
        la $a0, input_k         # print message to take input for k
        syscall

        li $v0, 5
        syscall
        move $s2, $v0               # s2 stores k

        bgt $s2, $s1, invalid_k     # sanity check on the value of k  
        ble $s2, 0, invalid_k       # if k<=0 or k>n then we print error message

        move $a0, $s0               # a0 stores &array[0] 
        move $a1, $s1                  # a1 stores n
                                    # the function parameters have been initialized using a0 and a1
        jal sort_array              # call the sort_array function
        
        move $a0, $s0               # a0 stores &array[0]
        move $a1, $s2               # a1 stores k
        jal find_k_largest          # call the find_k_largest function

        move $t0, $v0               # t0 stores the k-th largest number of the array

        # print the output messages
        li $v0, 4
        la $a0, output_msg1
        syscall

        li $v0, 1
        move $a0, $s2
        syscall

        li $v0, 4
        la $a0, output_msg2
        syscall

        li $v0, 1
        move $a0, $t0       # print the k-th largest number of the array
        syscall

        li $v0, 4
        la $a0, newline
        syscall

        b exit              # terminate the program

find_k_largest:     # finds the k-th largest number of array and returns the value in v0
                    # function parameters are- a0: &array[0], a1:k

    move $t0, $a0       # t0 stores &array[0]
    move $t1, $a1       # t1 stores k
    sub $t1, $s1, $t1   # t1 stores n-k 
    mul $t1, $t1, 4     # t1 stores 4*(n-k)
    addu $t0, $t0, $t1  # t0 stores &array[n-k], array[n-k] is the k-th largest number of the array
    lw $v0, 0($t0)      # v0 stores the return value: array[n-k]
    jr $ra              # return to main

sort_array:                     # function to sort the array in increasing order
                                # function parameters: a0 stores &array[0], a1 stores n (array size)
    sub $sp, $sp, 4
    sw $ra, 0($sp)              # create space of 4 bytes in stack and store the return address in the stack

    li $t0, 0                   # t0 stores i, counter variable of the outer for loop, i=0

    for_i: 
        bge $t0, $a1, end_for_i     # if i>=n we break the loop
        li $t1, 0                   # t1 stores j, counter variable of the inner for loop, j=0
        sub $t2, $a1, $t0           # t2 stores n-i 
        addi $t2, $t2, -1           # t2 now stores n-i-1
        move $t3, $a0               # t3 stores &array[0], in the inner for loop t3 will store &array[j]
        for_j:
            bge $t1, $t2, nxt_i_loop    # if j>=n-i-1 we break
            lw $t4, 0($t3)              # t4 stores array[j]
            move $t5, $a0               # t5 stores &array[0]
            move $t6, $a1               # t6 stores n
            
            move $a0, $t3               # a0 now stores &array[j]
            addu $t3, $t3, 4            # t3 now stores &array[j+1]
            move $a1, $t3               # a1 now stores &array[j+1] 
            lw $t7, ($t3)               # t7 stores array[j+1]
            ble $t4, $t7, nxt_j_loop    # if array[j] <= array[j+1] continue with next iteration of for_j loop
            jal SWAP                    # swap array[j] and array[j+1]
            nxt_j_loop: 
                move $a0, $t5           # a0 now stores &array[0]
                move $a1, $t6           # a1 now stores n
                addi $t1, $t1, 1        # j++
                b for_j
        nxt_i_loop:
            addi $t0, $t0, 1            # i++
            b for_i
    
    end_for_i:
        
        li $v0,4
        move $t2, $a0                   # t2 stores &array[0]
        la $a0, sorted_msg
        syscall                         # print console message before printing the sorted array
        move $a0, $t3                   # a0 now stores &array[0]
        li $t0,0                        # i = 0
        move $t1, $a0                   # t1 stores &array[0], in for loop t1 always stores &array[i]
        move $t2, $a0                   # t2 stores &array[0]
        # below loop prints the sorted array 
        print_loop:
            beq $t0, $a1, ret_main      # if i=n, break the loop
            li $v0, 1               
            lw $a0, 0($t1)              # a0 stores array[i]           
            syscall                     # print array[i]
            li $v0, 4
            la $a0, space_              # print space
            syscall
            addu $t1, $t1, 4            # t1 now stores &array[i+1]
            addi $t0,$t0,1              # i++
            b print_loop        

    ret_main:
        li $v0, 4
        la $a0, newline                 # print newline
        syscall
        move $a0, $t2                   # a0 now again stores &array[0]
        lw $ra, 0($sp)                  # ra now stores the return address
        jr $ra                          # return to main

SWAP:                   # swaps array[j] and array[j+1], function parameters are &array[j] (stored in a0) and &array[j+1] (stored in a1)
    lw $t8, 0($a0)      # t8 now stores array[j]
    lw $t9, 0($a1)      # t9 now stores array[j+1]
    sw $t9, 0($a0)      # array[j] and array[j+1] are assigned swapped values
    sw $t8, 0($a1)
    jr $ra              # return to sort_array function

invalid_k:              # if value of k is not valid we print appropriate error message
    li $v0, 4   
    la $a0, error_msg
    syscall
    b exit

exit:
    li $v0, 10      # terminate program
    syscall