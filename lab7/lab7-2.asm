.data
array1: .word -30, -23, 56, -43,  72, -18, 71
array2: .word  45,  23, 21, -23, -82,   0, 69
result: .word 0, 0, 0, 0, 0, 0, 0

.text
.globl main

main:
    la      $t1,    array1, #
    nop     
    nop     
    la      $t2,    array2, #
    nop     
    nop     
    la      $t3,    result, #
    nop     
    nop     

    li      $t4,    0                           # $t4 = 0
    li      $s1,    7                           # $t5 = 8

    j       for

for:
    beq     $t4,    $s1,    finish              # if $t4 == $s1 then goto finish
    lw      $t5,    0($t1), #
    nop     
    nop     
    lw      $t6,    0($t2), #
    nop     
    nop     

    add     $s2,    $t5,    $t6                 # $s2 = $t5 + $t6

    sw      $s2,    0($t3), #

    j       nemelt

nemelt:
    beq     $t4,    $s1,    finish              # if $t4 == $s1 then goto finish
    add     $t1,    $t1,    4                   # $t1 = $t1 + 4
    add     $t2,    $t2,    4                   # $t2 = $t2 + 4
    add     $t3,    $t3,    4                   # $t3 = $t3 + 4
    add     $t4,    $t4,    1                   # $t4 = $t4 + 1
    j       for

finish:
    nop     




