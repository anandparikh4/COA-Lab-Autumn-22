compi $s1,0
compi $s2,0
addi $s1,3
addi $s2,4
sw $s1,0($sp)
sw $s2,1($sp)
lw $s2,0($sp)
lw $s1,1($sp)