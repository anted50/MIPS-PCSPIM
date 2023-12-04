.data
result:     .word   0
string1:    .asciiz "puffins"
string2:    .asciiz "puffins"

.text
.globl main

main:       
    la      $t1,    string1
    nop     
    nop     
    la      $t3,    string2
    nop     
    nop     
    li      $t8,    1                       # $t8 = 1
    nop     
for:        
    lbu     $t6,    0($t1),     #
    nop     
    nop     

    beq     $t6,    $zero,      for2
    nop     
    bne     $t6,    $zero,      nemelt1
    nop     
nemelt1:    
    add     $t1,    $t1,        1           # $t1 = $t1 + 4
    add     $t4,    $t4,        1           # $t4 = $t4 + 1
    j       for
    nop     

for2:       
    lbu     $t7,    0($t3),     #
    nop     
    nop     
    beq     $t7,    $zero,      finish
    nop     
    bne     $t7,    $zero,      nemelt2
    nop     
nemelt2:    
    add     $t3,    $t3,        1           # $t1 = $t1 + 4
    add     $t5,    $t5,        1           # $t4 = $t4 + 1
    j       for2
    nop     
finish:     
    beq     $t4,    $t5,        positive    # if $t4 == $t5 then goto pos
    nop     
    bne     $t4,    $t5,        negative    # if $t4 != $t5 then goto negative
    nop     
positive:   
    sw      $t8,    result,     #
    j       two
    nop     
negative:   
    sw      $zero,  result,     #
    j       two
    nop     
two:        
    nop     

