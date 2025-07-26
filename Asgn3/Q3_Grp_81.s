# Program to recursively sort an array
	.data
start:
	.asciiz "Enter 10 integers"
prompt:
	.asciiz "Enter an integer : "
newline:
	.asciiz "\n"
space:
    .asciiz " "
result:
    .asciiz "Sorted array: "
done:
    .asciiz "Done\n\n\n" ;
input_key:
    .asciiz "Enter the key to search in the array: "
success:
    .asciiz "Key found at index: "
failure:
    .asciiz "Key not found"

.align 2
array:
	.space 40                   # static array of 10 integers (hence, 40 bytes)


	.text                       # text (code) section begins

	.globl main

main:                           # procudure main
    li $v0,4
    la $a0,start
    syscall
    la $a0,newline
    syscall

    li $t0,0    # i <-- 0

    la $s0,array    # s0 <-- A

    scan:                       # loop to scan in all the 10 integers
        bge $t0,10,endscan
        li $v0,4
        la $a0,prompt
        syscall
        li $v0,5
        syscall

        mul $t1,$t0,4
        add $t1,$t1,$s0

        sw $v0,0($t1)
        
        li $v0,4
        la $a0,newline
        syscall

        addi $t0,$t0,1
        b scan

    endscan:                    
        move $a0,$s0    # a0 (start address of array to sort) <-- A
        li $a1,0        # a1 (left index) <-- 0
        li $a2,9        # a2 (right index) <-- 9

        jal sort        # call sort to sort the array A in non-decreasing order

        li $v0,4
        la $a0,result
        syscall

        li $t0,0        # i <-- 0 (iterator for printing the sorted array)

    print:              # print the sorted array                
        bge $t0,10,end_print     

        mul $t1,$t0,4
        add $t1,$t1,$s0

        lw $a0,0($t1)
        li $v0,1
        syscall

        li $v0,4
        la $a0,space
        syscall

        addi $t0,$t0,1
        b print

    end_print:          # sorting and printing done, searching starts
        li $v0,4
        la $a0,newline
        syscall
        
        li $v0,4
        la $a0,input_key    # prompt to enter the input key
        syscall

        li $v0,5
        syscall         # scan in the key to search in the (now) sorted array
        move $s1,$v0    # s1 <-- key

        li $v0,4
        la $a0,newline
        syscall

        move $a0,$s0    # a0 <-- A = start address of A
        li $a1,0        # a1 <-- start = 0
        li $a2,9        # a2 <-- end = 9
        move $a3,$s1    # a1 <-- key
        jal search      # search(A,0,9,key)
        
        beq $v0,-1,not_found

    found:
        move $t0,$v0    # t0 <-- index

        li $v0, 4
        la $a0,success
        syscall
        li $v0,1
        move $a0,$t0
        syscall
    
        b exit

    not_found:
        li $v0, 4
        la $a0,failure
        syscall

        b exit

    exit:
        li $v0,4
        la $a0,newline
        syscall
        li $v0,10
        syscall


sort:
    subu $sp,$sp,8      # <-- allocate 8 bytes
    sw $fp,4($sp)       # store fp in first 4
    sw $ra,0($sp)       # store ra in next 4
    addiu $fp,$sp,4     # fp <-- sp + 4
    
#    bge $a1,$a2,finish_sort     # if left >= right, return

    # store locally used variables in temporary registers
    move $t0,$a0        # t0 <-- A
    move $t1,$a1        # t1 <-- left
    move $t2,$a2        # t2 <-- right
    move $t3,$a1        # t3 <-- p = left
    move $t4,$a1        # t4 <-- l = left
    move $t5,$a2        # t5 <-- r = right

    # sorting algorithm begins

    while:
        bge $t4,$t5,end_while   # if l>=r, break

        while_l_smaller:        # first inner while loop 
            mul $t6,$t4,4
            add $t6,$t6,$t0     # t6 <-- A + 4*l
            lw $t8,0($t6)       # t8 <-- A[l]

            mul $t7,$t3,4
            add $t7,$t7,$t0     # t7 <-- A + 4*p
            lw $t9,0($t7)       # t9 <-- A[p]

            bgt $t8,$t9,end_while_l_smaller     # if a[l] > a[p], break

            bge $t4,$t2,end_while_l_smaller     # if l >= right, break

            addi $t4,$t4,1      # l++

            b while_l_smaller   # re-iterate the first inner while loop

        end_while_l_smaller:

        while_r_greater:        # second inner while loop
            mul $t6,$t5,4
            add $t6,$t6,$t0     # t6 <-- A + 4*r
            lw $t8,0($t6)       # t8 <-- A[r]

            mul $t7,$t3,4       
            add $t7,$t7,$t0     # t7 <-- A + 4*p
            lw $t9,0($t7)       # t9 <-- A[p]

            blt $t8,$t9,end_while_r_greater     # if a[r] < a[p], break

            ble $t5,$t1,end_while_r_greater     # if r <= left, break

            addi $t5,$t5,-1     # r--

            b while_r_greater   # re-iterate the second inner while loop

        end_while_r_greater:

        bge $t4,$t5,recurse     # if l >= r, goto label recurse (which recursively calls sort again)
        
        mul $a0,$t4,4
        add $a0,$a0,$t0     # a0 <-- A + 4*l
        mul $a1,$t5,4
        add $a1,$a1,$t0     # a1 <-- A + 4*r
        jal swap

        b while
###
        recurse:                # recurse label
            mul $a0,$t3,4
            add $a0,$a0,$t0     # a0 <-- A + 4*p
            mul $a1,$t5,4
            add $a1,$a1,$t0     # a1 <-- A + 4*r
            jal swap            # swap a[p], a[r]

                    #li $v0,1
                    #move $a0,$t5
                    #syscall
                    #li $v0,4
                    #la $a0,newline
                    #syscall

            subu $sp,$sp,16     # allocate 16 bytes of space to store the local variables in memory, which might be needed after recursion returns back, since the registers will be over-written
            sw $t0,12($sp)      # store A
            sw $t1,8($sp)       # store left
            sw $t2,4($sp)       # store right
            sw $t5,0($sp)       # store r

            move $a0,$t0        # a0 <-- A
            move $a1,$t1        # a1 <-- left
            addi $a2,$t5,-1     # a2 <-- r-1

            jal sort            # call sort(A,left,r-1) to sort the subarray to the left of pivot

            lw $a0,12($sp)      # a0 <-- A
            lw $a1,0($sp)       # a1 <-- r
            addi $a1,$a1,1      # a1 <-- r+1
            lw $a2,4($sp)       # s2 <-- right

            jal sort            # call sort(A,r+1,right) to sort the subarray to the right of pivot     

            addu $sp,$sp,16     # roll sp back 16 bytes, to de-allocate the allocated space

            b finish_sort       # goto label finish_sort (which returns to $ra)

###

    end_while:

    finish_sort:                # label finish_sort
        lw $ra,0($sp)           # restore return address 
        lw $fp,4($sp)           # restore frame pointer
        addu $sp,$sp,8          # roll back sp to de-allocate that space
        jr $ra                  # return to caller

    
swap:                   # procedure swap to swap elements at addresses in $a0 and $a1
    lw $t8,0($a1)       # t8 <-- value at address in a1
    lw $t9,0($a0)       # t9 <-- value at address in a0
    sw $t8,0($a0)       # value at address in a0 <-- t8
    sw $t9,0($a1)       # value at address in a1 <-- t9
    jr $ra

search:
    subu $sp,$sp,8      # allocate space on stack and save fp and ra
    sw $fp,4($sp)
    sw $ra,0($sp)
    addiu $fp,$sp,4

    move $t0,$a0    # t0 <-- A
    move $t1,$a1    # t1 <-- start
    move $t2,$a2    # t2 <-- end
    move $t3,$a3    # t3 <-- key

    while_valid:
        bgt $t1,$t2,end_while_valid

        sub $t4,$t2,$t1     # t4 <-- end - start
        div $t4,$t4,3       
        mflo $t4            # t4 <-- (end - start)/3

        move $t5,$t4        # t5 <-- (end - start)/3

        add $t4,$t4,$t1     # t4 <-- start + (end - start)/3 = mid1
        sub $t5,$t2,$t5     # t5 <-- end - (end - start)/3 = mid2

        mul $t6,$t4,4       
        add $t6,$t6,$t0     # t6 <-- A + 4*mid1

        mul $t7,$t5,4
        add $t7,$t7,$t0     # t5 <-- A + 4*mid2

        lw $t8,0($t6)       # t8 <-- A[mid1]
        lw $t9,0($t7)       # t9 <-- A[mid2]

        beq $t3,$t8,return_mid1 # key equals A[mid1] so return mid1

        beq $t3,$t9,return_mid2 # key equals A[mid2] so return mid2

        blt $t3,$t8,go_left     # key < A[mid1] so search to left of mid1

        bgt $t3,$t9,go_right    # key > A[mid2] so search to right of mid2

        b go_mid                # branch to label go_mid, search from mid1 to mid2

        return_mid1:
            move $v0,$t4        # return value is mid1
            b finish_search     

        return_mid2:
            move $v0,$t5        # return value is mid2
            b finish_search

        go_left:                # recursively search to left of mid1
            move $a0,$t0        # a0 stores &A[0]
            move $a1,$t1        # a1 stores start
            move $a2,$t4        # a2 stores mid1
            addi $a2,$a2,-1     # a2 now stores mid1-1
            move $a3,$t3        # a3 stores key
            jal search          # recursively search
            b finish_search
        
        go_right:              # recursively search to the right of mid2
            move $a0,$t0       # a0 stores &A[0] 
            move $a1,$t5       # a1 stores mid2
            addi $a1,$a1,1     # a1 now stores mid2+1 
            move $a2,$t2       # a2 stores end 
            move $a3,$t3       # a3 stores key 
            jal search         # recursively search for key 
            b finish_search
        
        go_mid:                 # recursively search for the key in mid1 to mid2 in array A
            move $a0,$t0        # a0 stores &A[0]
            move $a1,$t4        # a1 stores mid1
            addi $a1,$a1,1      # a1 now stores mid1+1
            move $a2,$t5        # a2 stores mid2
            addi $a2,$a2,-1     # a2 now stores mid2-1
            move $a3,$t3        # a3 stores key
            jal search          # recursively search for key
            b finish_search

    end_while_valid:
        li $v0,-1
        b finish_search     # key not found so return value = -1

    finish_search:
        lw $ra,0($sp)       # ra now stores the return address
        lw $fp,4($sp)       # restore frame pointer
        addu $sp,$sp,8      # deallocate space from the stack
        jr $ra              # return