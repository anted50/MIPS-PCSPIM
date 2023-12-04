.data
x: .byte 7      # 0x10000000
x1: .byte -7    # 0x10000001
x2: .byte 7     # 0x10000000
x3: .byte 0     # 0x10000001
x4: .byte -7    # 0x10000000
x5: .byte 0     # 0x10000001
x6: .byte 17    # 0x10000000
x7: .byte -9    # 0x10000001
x8: .byte 12    # 0x10000000
x9: .byte 0     # 0x10000001

    .text
    .globl main
main:
    ori		$7, $0, 9			# $7 = $0 | 9 while tooluur anhnii utga
while:
    beq		$7, $0, finish	    # if $t0 == $t1 then goto target
    sll		$0, $0, 0			# $0 = $0 << 0 
    ori		$3, $0, 9			# $3 = $1 | 9 erembe 
    lui     $1, 0x1000          # $10 = 0x10000000 base $ sanah oin hayag
erembe:
    beq		$3, $0, next	    # if $3 ==0t1 nextgoto target
    sll		$0, $0, 0			# $0 = $0 << 0
    lb		$4, 0($1)		    #    
    sll		$0, $0, 0			# $0 = $0 << 0 
    sll		$0, $0, 0			# $0 = $0 << 0
    lb		$5, 1($1)		    #    
    sll		$0, $0, 0			# $0 = $0 << 0 
    sll		$0, $0, 0			# $0 = $0 << 0
    slt		$6, $4, $5		    # $6 = ($4 < $5) ? 1 : 0
    beq		$6, $0, solihgvi	# if $6 == $0 goto solihgvi
    sll		$0, $0, 0			# $0 = $0 << 0
    sb		$4, 1($1)		    #
    sb		$5, 0($1)		    # 
solihgvi:
    addi	$1, $1, 1			# $1 = $1 + 1
    addi    $3, $3, -1           # $3 = $3 + 1
    j		erembe				# jump to erembe
    sll		$0, $0, 0			# $0 = $0 << 0  
next:
    addi	$7, $7, -1			# $7 = $7 -1 
    j		while				# jump to while
    sll		$0, $0, 0			# $0 = $0 << 0
finish:
    sll		$0, $0, 0			# $0 = $0 << 0
    
         