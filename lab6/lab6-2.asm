.data
str:    .asciiz "pen is example"
.text
.globl main
main:   
    ori     $8,     $0,     0                       # $8 = $0 | 0
    ori     $4,     $0,     1                       # $4 = $0 | 1 true or false
    ori     $5,     $0,     0x20                    # $5 = $0 | 20  cuz space is 20
    lui     $3,     0x1000
loop:   
    sll     $0,     $0,     0                       # $0 = $0 << 0
    lbu     $10,    0($3)                           # get the char
    sll     $0,     $0,     0                       # branch delay
    sll     $0,     $0,     0                       # branch delay
    beq     $10,    $0,     finish                  # exit loop if char == null
    sll     $0,     $0,     0                       # branch delay
    ori     $7,     $0,     65                      # $7 = $0 | 65  uppercase A
    ori     $6,     $0,     90                      # $6 = $0 | 90  uppercase Z

    bne     $4,     $0,     step2                   # if $4 != $0 then goto step2
    sll     $0,     $0,     0                       # $0 = $0 << 0

    beq     $10,    $5,     spaceTrue               # if $10 == $5 then goto spaceTrue
    sll     $0,     $0,     0                       # $0 = $0 << 0
    addiu   $3,     $3,     1                           # point at the next char
    j       loop
    sll     $0,     $0,     0                           # $0 = $0 << 0

step2:  
    beq     $4,     $0,     loop                    # if $4 == $0 then goto loop
    sll     $0,     $0,     0                       # $0 = $0 << 0


    slt     $8,     $10,    $6                      # $8 = ($10 < $6) ? 1 : 0
    slt     $9,     $7,     $10                     # $9 = ($7 < $10) ? 1 : 0
    bne     $8,     $9,     step3                   # if $8 != $9 then goto step3
    sll     $0,     $0,     0                       # $0 = $0 << 0

    addiu   $3,     $3,     1                       # point at the next char
    beq     $10,    $5,     spaceTrue               # if $10 == $5 then goto spaceTrue
    sll     $0,     $0,     0                       # $0 = $0 << 0
    j       loop
    sll     $0,     $0,     0                       # $0 = $0 << 0

step3:  
    add     $10,    $10,    -32                     # $10 = $10 + (-32)
    sb      $10,    0($3),  #
    ori     $4,     $0,     0                       # $4 = $0 | 0 cuz letter is uppercase not close to space
    addiu   $3,     $3,     1                       # point at the next char
    j       loop
    sll     $0,     $0,     0                       # $0 = $0 << 0

spaceTrue:
    sll     $0,     $0,     0                       # $0 = $0 << 0
    ori     $4,     $0,     1                       # $4 = $0 | 1
    addiu   $3,     $3,     1                       # point at the next char
    sll     $0,     $0,     0                       # $0 = $0 << 0
    j       loop
    sll     $0,     $0,     0                       # $0 = $0 << 0

finish: 
    sll     $0,     $0,     0                       # $0 = $0 << 0


