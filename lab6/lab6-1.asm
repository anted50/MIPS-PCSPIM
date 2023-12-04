.data
str: .asciiz "MIPS IS RISC and PIPELINED PrOCesSOR"

.text
.globl main
main:
    ori     $8,     $0,     0                       # $8 = $0 | 0
    lui     $3,     0x1000
loop:
    lbu     $10,    0($3)                           # get the char
    sll     $0,     $0,     0                       # branch delay
    beq     $10,    $0,     finish                  # exit loop if char == null
    sll     $0,     $0,     0                       # branch delay
    ori     $7,     $0,     65                      # $7 = $0 | 65
    ori     $6,     $0,     90                      # $6 = $0 | 90

    slt     $11,    $7,     $10                     # $11 = ($7 < $10) ? 1 : 0
    slt     $12,    $10,    $6                      # $12 = ($10 < $6) ? 1 : 0

    bne     $11,    $0,     next0                   # if $11 != $0 then goto next0

    sll     $0,     $0,     0                       # $0 = $0 << 0

    addiu   $3,     $3,     1                       # point at the next char
    j       loop
    sll     $0,     $0,     0,          #,branch,delay,slot# finishdone:
    sll     $0,     $0,     0                       # target for branch
next0:
    bne     $12,    $0,     converter               # if $12 != $0 then goto converter
    sll     $0,     $0,     0                       # $0 = $0 << 0

    addiu   $3,     $3,     1                       # point at the next char
    j       loop
    sll     $0,     $0,     0,          #,branch,delay,slot# finishdone:
    sll     $0,     $0,     0,          #,target,for,branch# jump to loop

converter:
    beq     $11,    $0,     loop                    # if $11 == $0 then goto loop
    sll     $0,     $0,     0                       # $0 = $0 << 0
    addiu   $10,    $10,    32                      # $10 = $10 + 32

    sb      $10,    0($3),  #

    addiu   $3,     $3,     1                       # point at the next char
    j       loop
    sll     $0,     $0,     0,          #,branch,delay,slot# finishdone:
    sll     $0,     $0,     0                       # target for branch
finish:
    sll     $0,     $0,     0                       # $0 = $0 << 0


