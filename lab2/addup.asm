

.text
.globl main
main:
    ori $8,$0,0xbf   #x1=0xbf
    ori $9,$0,0x3a   #x2=0x3a
    ori $10,$0,0x74  #x3=0x74
    and $11,$8,$9
    and $12,$9,$10
    or $13,$11,$12