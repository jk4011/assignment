        .data
N:      .word  10
str:    .asciiz "Answer: %d !!\n"
fs_addr:   .space  4
y:      .word  0
f:      .word  0, 1

        .text
        ;; Replace the following code with real one
                    LD		$t1, f(r0)	    ;;#$t1  = base[offset]
                    LD		$t5, N(r0)		;;#1st = 2nd[3rd]
                    DADDI	$t6, r0, 1		;;#1st = 2nd[3rd]
                    DADDI	$t2, $t1, 1		
                    DADDI	$t4, r0, 16		;;# $t4 = r0 + 8
                
                Loop:
                    DADD	$t3, $t2, $t1	
                    SD		$t3, f($t4) 
                    DADD	$t1, $t2, r0		
                    DADD	$t2, $t3, r0		
                    DADDI	$t4, $t4, 8		
                    DADDI	$t6, $t6, 1		
                    bne		$t5, $t6, Loop		;;#jump to 3rd if 1st != 2nd
        
        ;; Print the answer (don't delete this)
        DADDI   R1, R0, str
        SW      R1, fs_addr(R0)
        DADDI   R14, R0, fs_addr
        SYSCALL 5
