.text
.globl main

main:
    ori $8,$0,0x186A        # x = 1,600,000
    sll $8,$8,8
    ori $9,$0,0x1388        # y = 80,000
    sll $9,$9,4
    ori $10,$0,0x61A8       # x = 400,000
    sll $10,$10,4

    div $8,$10
    mflo $12                # move from LO/HI = mflo/hi
    div $9,$10
    mfhi $13
    multu $12,$13
    mflo $14

