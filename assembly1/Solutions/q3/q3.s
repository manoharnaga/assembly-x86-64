.global is_prime

#  %rdi == x == N
#  %r9  == i
#  %rcx == (x%i)

is_prime:
    cmp $1, %rdi     # check if(x<=1)
    jle .false       # if(x<=1) then x is NOT PRIME so return 0
    movq $2, %r9     # loop starts from (i=2 to i<x)   
    cmp $1, %rdi     # if(x>1)   
    jg .loop         # for loop (i = 2 ; i < x ; i++)
    ret   

.loop:
    cmp %rdi, %r9    # if(i>=n) then jump
    jge .true        # if(x is not divisble by i=2 to i=x-1) then x is PRIME so return %rax(1)
    movq %rdi, %rax  # store x(%rdi) in %rax for idivq
    cqto             # convert quad to octal %rdx:%rax
    idivq %r9        # %rax = (x/i)(%rax/%r9) and %rdx = (x%i)(%rax(%)%r9)
    movq %rdx, %rcx  # %rcx = (x%i)
    cmp $0, %rcx     # if(x%i==0) then x has some factor between i=2 to x-1
    je .false        # x is NOT PRIME
    leaq 1(%r9), %r9 # i++ 
    jmp .loop        # jump to .loop for i<x
    
.false:
    movq $0, %rax    # store 0 in %rax
    ret              # if(x<=1) then x is NOT PRIME so return %rax(0)

.true:
    movq $1, %rax    # store 1 in %rax
    ret              # if(x is not divisble by i=2 to i=x-1) then x is PRIME so return %rax(1)





