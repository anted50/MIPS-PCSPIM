.data
array:  .word   10, -5, 18, 3, 12, 25, 8
size:   .word   7
min:    .word   0
max:    .word   0

.text
.globl main

main:   
    lw      $t0,    size
    nop     
    nop     
    la      $t1,    array
    nop     
    nop     
    lw      $t2,    0($t1)
    nop     
    nop     
    sw      $t2,    min
    sw      $t2,    max

loop:   
    addi    $t1,    $t1,    4
    lw      $t3,    0($t1)
    nop     
    nop     
    lw      $t2,    min
    nop     
    nop     
    blt     $t3,    $t2,    change_min
    nop     
    j       cont
    nop     

change_min:
    sw      $t3,    min
    j       cont
    nop     

cont:   
    lw      $t2,    max
    nop     
    nop     
    bgt     $t3,    $t2,    change_max
    nop     
    sub     $t0,    $t0,    1
    bnez    $t0,    loop
    nop     
    j       done
    nop     

change_max:
    sw      $t3,    max
    sub     $t0,    $t0,    1
    bnez    $t0,    loop
    nop     

done:   
    lw      $t4,    min
    lw      $t5,    max
