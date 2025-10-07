# syscalls codes & co
.equ __SUCCESS,     0
.equ __STDOUT,      1
.equ __WRITE,       64
.equ __EXIT,        93

#------------------------------------------------------------------------------#
# Supporting macros
#------------------------------------------------------------------------------#

.section .rodata
  newline: .string "\n"

# Print value at a0 and a '\n'
.macro println_a0
        jal     __num_print

        # Print newline
        li      a0, 1          # File descriptor (stdout)
        la      a1, newline    # Address of newline string
        li      a2, 1          # Length = 1 character
        li      a7, 64         # syscall number for write
        ecall                  # System call
.endm

#------------------------------------------------------------------------------#
# Here is the generic content of the main with some supporting functions
#------------------------------------------------------------------------------#
.section .text
.align 2

#------------------------------------------------------------------------------#
# __num_print - print the content of a0 as decimal
#------------------------------------------------------------------------------#
__num_print:
        addi    sp, sp, -32    # 10 bytes + 1 to represent the number as ascii
        sw      ra, 0(sp)
        sw      s1, 4(sp)
        sw      s2, 8(sp)
        sw      s3, 12(sp)
        sw      s4, 16(sp)

        li      s1, 0          # sign_bit
        li      s2, 10         # for division

        addi    s3, sp, 31     # str[0] pointer
        sb      zero, 0(s3)    # terminator

        bge     a0, zero, 1f   # if num >= 0 go to L1 else get absolute
        xori    a0, a0, -1     # (num ^ -1)
        addi    a0, a0, 1      # num + 1
        addi    s1, zero, 1    # negative

    1:  remu    s4, a0, s2     # num % 10
        addi    s4, s4, 48     # convert to ascii
        addi    s3, s3, -1     # decrement start pointer
        sb      s4, 0(s3)      # store value

        divu    a0, a0, s2     # num /= 10
        blt     zero, a0, 1b   # if num > 0 loop

        beq     s1, zero, 1f   # if sign_bit = 0 go to print; else add '-' char
        addi    s4, zero, '-'  # ascii '-'
        addi    s3, s3, -1     # decrement start pointer
        sb      s4, 0(s3)      # store '-'

    1:  add     a0, s3, zero
        jal     __printstr

        lw      ra, 0(sp)
        lw      s1, 4(sp)
        lw      s2, 8(sp)
        lw      s3, 12(sp)
        lw      s4, 16(sp)
        addi    sp, sp, 32
        ret

#------------------------------------------------------------------------------#
# __printstr - print str on terminal
# a0 -> str
#------------------------------------------------------------------------------#
__printstr:
        addi    sp, sp, -8
        sw      ra, 0(sp)
        sw      s1, 4(sp)

        add     s1, a0, zero
        jal     __strlen
        add     a2, a0, zero   # length of string

        li      a0, __STDOUT
        mv      a1, s1         # string to print
        li      a7, __WRITE    # syscall number for write
        ecall

        lw      ra, 0(sp)
        lw      s1, 4(sp)
        addi    sp, sp, 8
        ret

#------------------------------------------------------------------------------#
# __strlen
# a0 -> str
# return strlen(str) on a0
#------------------------------------------------------------------------------#
__strlen:
        move    t0, a0
    1:  lbu     t1, 0(t0)
        beqz    t1, 1f
        addi    t0, t0, 1
        j 1b
    1:  sub     a0, t0, a0
        ret

