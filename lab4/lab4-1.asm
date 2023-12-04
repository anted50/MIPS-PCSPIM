# 17xy - 12x - 6y + 12
# x=0xb, y=0x5b
# (0x3fdf) hariu        0x10000005
.data
x: .byte 0xb    # 0x10000000
y: .byte 0x5b   # 0x10000001

.text
.globl main
main:
        lui $10,0x1001 # $10 = 0x10000000 base $ sanah oin hayag
        lb $1,0($10)   # x=$1=0xb
        sll $0,$0,0    # nop
        sll $0,$0,0    # nop
        lb $2,1($10)   # y=$2=0x5b
        sll $0,$0,0    # nop
        sll $0,$0,0    # nop
        
        ori $8,$0,17   # neg 17
        ori $9,$0,12   # neg 12
        ori $11,$0,6   # neg 6
        multu $1,$2     # x * y
        mflo $12        # x * y -> $11
        multu $12,$8    # 17 * $12
        mflo $13        # 17 * $12 -> $13
        multu $1,$9     # x * 12 
        mflo $14        # x * 12 -> $14
        multu $2,$11    # y * 6
        mflo $15        # y * 6 -> $15
        subu $16,$13,$14 
        subu $17,$16,$15
        addu $18,$17,$9
        sh $18,4($10)


