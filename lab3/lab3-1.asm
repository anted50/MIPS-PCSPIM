.text
.globl main

main:
    ori $8,$0,0x186A        # $8 = 6250
    sll $8,$8,8 
    ori $9,$0,3             # $9 = 3
    mult $8,$9              # 3 * 6250
    ori $10,$0,7            # $10 = 7
    mflo $11                # lo = $11
    addu $12,$10,$11        # $10 + $11 =>$12

    ori $13,$0,2            # $13 = 2
    mult $8,$13             # $8 * $13 = lo
    mflo $14                # lo = $14
    ori $15,$0,8            # $15 = 8
    addu $16,$14,$15        # $14 + $15 = $16

    div $12,$16             # $12 / $16

    mfhi $16                # vld    
    mflo $17                # bvhel too



    
