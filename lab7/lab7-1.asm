.data
x: .word 7
a: .word -3
bb: .word 3
c: .word 9
d: .word -24
result: .word 0

.text
.globl main

main:
                                    # ax3 + bx2 + cx + d
    #       la,     $t1,    x,      #,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x#,la,$t1,x# la      $t1,    x,      #
    lw      $t1,    x,      #
    nop     
    nop     
    lw      $t2,    a,      #
    nop     
    nop     
    lw      $t3,    bb,     #
    nop     
    nop     
    lw      $t4,    c,      #
    nop     
    nop     
    lw      $t5,    d,      #
    nop     
    nop     

    mult    $t1,    $t1             # $t1 * $t1 = Hi and Lo registers
    mflo    $t7                     # copy Lo to $7

    mult    $t7,    $t1             # $t7 * $t1 = Hi and Lo registers
    mflo    $t8

    mult    $t2,    $t8             # $t2 * $t8 = Hi and Lo registers
    mflo    $s0                     # copy Lo to $t2

    mult    $t3,    $t7             # $t3 * $t7 = Hi and Lo registers
    mflo    $s1                     # copy Lo to $t2

    mult    $t4,    $t1             # $t4 * $t1 = Hi and Lo registers
    mflo    $s2                     # copy Lo to $s2

    add     $s3,    $s1,    $s2     # $s3 = $s1 + $s2
    add     $s4,    $s0,    $t5     # $s4 = $s2 + $t5
    add     $t6,    $s4,    $s3     # $t5 = $s4 + $t3

    sw      $t6,    result













