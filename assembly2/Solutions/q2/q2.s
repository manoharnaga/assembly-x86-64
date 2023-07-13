.global binseq

# %r12 ==> n (stored inside the stack)
# %r13 ==> change(stack)
# %r15 ==> sum (stack)
# %rdi ==> n (argument)
# %rsi ==> change
# %r8 ==>  binseq(n-1,change-1)
# %r9 ==>  binseq(n-1,change+1)
# %r10 ==> ans_sum
# %r11


binseq:
    cmp $0, %rdi                 
    je  .base_1
    cmp $1, %rdi
    je  .base_2
    movq %rsi, %r11
    .base_3:
        cmp $0, %rsi
        jl  .negate
        cmp %rsi, %rdi
        jl  .base_1
    
    movq %r11, %rsi

    decq %rdi
    movq %rdi, %r12
    pushq %r12
    movq %rsi, %r13
    pushq %r13
    movq $0, %r15
    pushq %r15          # push sum onto stack

    call binseq         # binseq(n-1,change)
    popq %r15
    imulq $2, %rax
    addq %rax, %r15
    popq %rsi
    popq %rdi

    movq %rdi, %r12
    pushq %r12
    movq %rsi, %r13
    pushq %r13
    pushq %r15
    
    decq %rsi
    call binseq
    popq %r15
    addq %rax, %r15
    popq %rsi
    popq %rdi
    
    pushq %r15

    incq %rsi
    call binseq
    popq %r15
    addq %rax, %r15
    movq %r15, %rax
    movq $13 , %r11
    cqto
    idivq %r11
    movq %rdx,%rax
    ret

    
.negate:
    neg %rsi
    cmp %rsi, %rdi
    jl  .base_1
    jmp .base_3

.base_1:
    movq $0, %rax
    ret

.base_2:
    cmp $0, %rsi
    je .base_2_1
    jmp .base_2_2

.base_2_1:
    movq $2, %rax
    ret

.base_2_2:
    cmp $1, %rsi
    je  .base_2_21
    cmp $-1, %rsi
    je  .base_2_21
    jmp .base_1

.base_2_21:
    movq $1, %rax
    ret


