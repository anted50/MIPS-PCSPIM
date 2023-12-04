.data   
prompt: .asciiz "Enter an string: "
buffer: .space  16

.text   
        .globl  main
main:   
    li      $t3,    10                  # $t3   =10
    jal     pread                       # read first string
    nop     #
    move    $t2,    $a0
    jal     for                         # jump to for
    nop     
    jal     pread                       # read second string
    nop     #
    move    $t2,    $a0
    
    jal     for                         # jump to for
    nop     #
    move    $t2,    $a0
    
    jal     pread                       # read third string
    nop     #
    jal     for                         # jump to for
    nop     #
    move    $t2,    $a0
    
    jal     pread                       # read fourth string
    nop     #
    jal     for                         # jump to for
    nop     
    move    $a0,    $t4                 # $a0 = $t4
    nop     
    li      $v0,    1                   # print the sum
    syscall 
    li      $v0,    10                  # exit
    syscall 

.text   
        .globl  for
for:    
    lb      $t6,    0($t2), #
    nop     
    nop     
    beq     $t6,    $t3,    callback    # $t3 = enter = 10
    add     $t2,    $t2,    1           # $t2 = $t2 + 1
    add     $t4,    $t4,    1           # $t4 = $t4 + 1
    nop     
    j       for
    nop     

callback:
    jr      $ra                         # jump to
    nop     


.text   
.globl  pread
pread:  
    la      $a0,    prompt              # print string
    li      $v0,    4                   # service 4
    syscall 
    li      $v0,    8                   # read string into $v0
    la      $a0,    buffer              # $a0 == buffer санах ойн хаяг
    li      $a1,    16                  # $a1 == buffer санах ойн урт
    syscall                             # service 5

    jr      $ra                         # return
    nop     #