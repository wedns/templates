# include "support.S"
.section .data

.section .text
.globl _start

# *************************************************************************
# Main program
# *************************************************************************
_start:
    # Prologue
    addi    sp, sp, -4     # Allocate stack space
    sw      ra, 0(sp)      # Save return address

    # NOTE: Your code goes here

    # Macro that prints the value of a0 and a '\n' to stdout (see `support.S`)
    println_a0

    # Epilogue
    lw      ra, 0(sp)      # Restore return address
    addi    sp, sp, 4      # Deallocate stack space

    # Exit
    li      a0, 0          # Exit code 0
    li      a7, 93         # syscall number for exit
    ecall                  # System call .endm
