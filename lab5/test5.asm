.data
L1: .word 9
L2: .word 1
L3: .word 3
L4: .word 6

.text
.globl _main
_main:
 lui $10,0x1001
 lw $1, 0($10)
 sll $0,$0,0    # nop
 sll $0,$0,0    # nop
 lw $2, 4($10)
 sll $0,$0,0    # nop
 sll $0,$0,0    # nop
 lw $3, 8($10)
 sll $0,$0,0    # nop
 sll $0,$0,0    # nop
 lw $4, 16($10)
 sll $0,$0,0    # nop
 sll $0,$0,0    # nop 
L1_2: slt $12, $8, $9 
 beq $12, $0, Swap8_9 
L3_4: slt $12, $10, $11 
 beq $12, $0, Swap10_11 
L2_3: slt $12, $9, $10 
 beq $12, $0, Swap9_10 
 j Exit 

Swap9_10: 
 add $13, $0, $9 
 add $9, $0, $10
 add $10, $0, $13
 j L1_2 
Swap10_11: 
 add $13, $0, $10 
 add $10, $0, $11
 add $11, $0, $13
 j L2_3

Swap8_9: 
 add $13, $0, $8 
 add $8, $0, $9
 add $9, $0, $13
 j L3_4 
Exit: 
 sw $8, L1($0)
 sw $9, L2($0)
 sw $10, L3($0)
 sw $11, L4($0)