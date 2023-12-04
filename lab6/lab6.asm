.data
x:  .byte    6                      # 0x10000000
x1: .byte    6                      # 0x10000000
x2: .byte    3                      # 0x10000000
x3: .byte    2                      # 0x10000000
x4: .byte    6                      # 0x10000000

.text
.globl main

main:
    ori     $7,     $0,     5       # $7 = $0 | 4 while toologc
    lui     $1,     0x1000          # $10 = 0x10000000 base $ sanah oin hayag
    ori     $11,    $0,     0       # $11 = $0 | 1 which byte to check
main2:
    add     $12,    $11,    $1      # $12 = $11 + $1
    lb      $4,     0($12)
    sll     $0,     $0,     0       # $0 = $0 << 0
    sll     $0,     $0,     0       # $0 = $0 << 0
    ori     $3,     $0,     0       # $3 = $3 | 0


    ori     $5,     $4,     0       # $5 = $4 | 0 should contain the original number or could be smth else
    add     $5,     $5,     -1      # $5 = $5 + -1
    beq     $11,    $7,     finish  # if $11 == $7 then goto finish


check:
    sll     $0,     $0,     0       # $0 = $0 << 0
    beq     $5,     $0,     next    # if $5 == $0 then goto next
    div     $4,     $5              # $4 / $5
    mflo    $8                      # $8 = floor($4 / $5)
    mfhi    $9                      # $9 = $4 % $5
    sll     $0,     $0,     0       # $0 = $0 << 0


    beq     $9,     $0,     adder   # if $9 == $0 then goto adder
    sll     $0,     $0,     0       # $0 = $0 << 0 MUST DO THIS

    add     $5,     $5,     -1      # $5 = $5 + -1  number that divides from og number
    j       check                   # jump to main

adder:
    sll     $0,     $0,     0       # $0 = $0 << 0
    add     $3,     $3,     $5      # $3 = $3 + $8  sum of perfect number divider
    add     $5,     $5,     -1      # $5 = $5 + -1  number that divides from og number
    j       check                   # jump to main

next:
    sll     $0,     $0,     0       # $0 = $0 << 0
    beq     $3,     $4,     saver   # if $3 == $4 then goto saver
    add     $11,    $11,    1       # $12 = $12 + 1

    j       main2                   # jump to main2

saver:
    sll     $0,     $0,     0       # $0 = $0 << 0
    add     $16,    $16,    1       # $16 = $16 + 1
    j       main2                   # jump to main2

finish:
    sll     $0,     $0,     0       # $0 = $0 << 0
    sb      $16,    5($1),  #

















