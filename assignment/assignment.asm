# 9. Гараас утга оруулсан string1 ба string 2 тэмдэгт мөрүүдийн аль уртыг нь олно. Аль урт тэмдэгт
# мөрийнх нь эхний тэмдэгтүүдийг (үгийг) авч нөгөө богино тэмдэгт мөрийн төгсгөлд нэмж өгсөн хоёр
# тэмдэгт мөрийн уртыг тэнцүүлж дэлгэцэнд хэвлэнэ.

.data   
equal:      .asciiz "two strings entered are the same length"
buffer1:    .space  64
buffer2:    .space  64

.text   
            .globl  main
main:       
    li      $t3,        10                      # $t3 = 10
    #read the first string and find length
    la      $a0,        buffer1                 # $a0 == buffer санах ойн хаяг
    jal     pread                               # jump to pread and save position to $ra
    nop     
    move    $t2,        $a0
    jal     length                              # jump to length and save position to $ra
    nop     
    move    $t1,        $t2                     # $t1 = $t2 / save the previous string address
    move    $t5,        $t4                     # $t5 = $t4 / save the length of the first word
    move    $t4,        $0                      # clears register for next word
    #read the second string and find length
    la      $a0,        buffer2                 # $a0 == buffer санах ойн хаяг
    jal     pread                               # jump to pread and save position to $ra
    nop     
    move    $t2,        $a0
    jal     length                              # jump to length and save position to $ra
    nop     
    move    $t6,        $t4                     # $t6 = $t4 / save the length of the first word
    #check if its equal in length
    beq     $t5,        $t6,        done_equal  # if $t5 == $t6 then goto done_equal
    nop     
    #check which one is longer
    blt     $t5,        $t6,        target11     # if $t5 < $t6 then goto target1
    nop
    blt     $t6,        $t5,        target22     # if $t6 < $t5 then goto target2
    nop     

target11:
    la      $t2,        buffer2,    #
    addi    $t1,        $t1,        -2          # $t1 = $t1 + -2
    j		target1				# jump to target1
    
target22:
    la      $t1,        buffer1,    #     
    addi    $t2,        $t2,        -2          # $t1 = $t1 + -2
    j		target2				# jump to target2
    
target1:    
    nop     
    beq     $t5,        $t6,        done1       # if $t7 == $t6 then goto done
    nop     
    lb      $t8,        0($t2),     #
    nop     
    nop     
    addi    $t2,        $t2,        1           # $t2 = $t2 + 1 / increment load address
    addi    $t5,        $t5,        1           # $t5 = $t5 + 1 / increment length
    addi    $t1,        $t1,        1           # $t1 = $t1 + 1 / increment save address
    sb      $t8,        0($t1),                 # save
    nop     
    j       target1                             # jump to target1

target2:    
    nop     
    beq     $t5,        $t6,        done2        # if $t5 == $t6 then goto done
    nop     
    lb      $t8,        0($t1),     #
    nop     
    nop     
    addi    $t1,        $t1,        1           # $t2 = $t2 + 1 / increment load address
    addi    $t6,        $t6,        1           # $t7 = $t7 + 1 / increment length
    addi    $t2,        $t2,        1           # $t1 = $t1 + 1 / increment save address
    sb      $t8,        0($t2),     #
    nop     
    j       target2                             # jump to target2

done_equal: 
    nop     
    la      $a0,        equal                   # print string
    li      $v0,        4                       # service 4
    syscall 
    j       done                                # jump to done
    li      $v0,        10                       # service 4
    syscall 

done1:
    nop     
    addi    $t1,        $t1,        1           # $t1 = $t1 + 1 / increment save address
    addi    $t2,        $t2,        1           # $t1 = $t1 + 1 / increment save address
    sb      $t3,        0($t1),     #
    la      $a0,        buffer1                 # print string
    li      $v0,        4                       # service 4
    syscall 
    la      $a0,        buffer2                 # print string
    li      $v0,        4                       # service 4
    syscall 
    li      $v0,        10                       # service 4
    syscall 

done2:
    nop     
    addi    $t1,        $t1,        1           # $t1 = $t1 + 1 / increment save address
    addi    $t2,        $t2,        1           # $t1 = $t1 + 1 / increment save address
    sb      $t3,        0($t2),     #
    la      $a0,        buffer1                 # print string
    li      $v0,        4                       # service 4
    syscall 
    la      $a0,        buffer2                 # print string
    li      $v0,        4                       # service 4
    syscall 
    li      $v0,        10                       # service 4
    syscall 

.text   
.globl  pread
pread:      
    li      $a1,        16                      # $a1 == buffer санах ойн урт
    li      $v0,        8                       # read string into $v0
    syscall                                     # service 8
    jr      $ra                                 # return
    nop     #

.text   
.globl  length
length:     
    lb      $t6,        0($t2)                  #load the byte from address given
    nop     
    nop     
    beq     $t6,        $t3,        callback    # $t3 = enter = 10  / if it's equal to enter which is 10
    add     $t2,        $t2,        1           # $t2 = $t2 + 1 / address increment
    add     $t4,        $t4,        1           # $t4 = $t4 + 1 / length increment
    nop     
    j       length
    nop     
callback:   
    jr      $ra                                 # jump to
    nop     


