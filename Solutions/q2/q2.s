.global gcdval
# b = %rdi && a = %rsi such that a>b and a!=0
# checkbit = %rbx
# store NON_ZERO value in %r10 when one of a or b is 0
# temp = %rcx
# Euclids GCD Algorithm is used
# BELOW IS THE EQUIVALENT PSUEDO CODE
# gcd(a,0) = |a|
# if b>a then swap(a,b)
#   while(b>0){ 
#        temp=b;
#        b=b%a;
#        a=temp;
#    }
#    return a;

gcdval:
    # CHECK WHETHER BOTH THE NUMBERS ARE POSITIVE
    cmp $0, %rdi
    jl .invalid
    cmp $0, %rsi
    jl .invalid
    cmp %rsi, %rdi  # compare if(b>a)
    jg .order       # if(b>a)  yes => order the values by swapping(a,b)=(%rsi,%rdi) to (%rdi,%rsi) After this operation (a>b)
    .order:         # swap(a,b)
        movq %rdi, %r8  # temp_for_swap = b
        movq %rsi, %rdi # b = a
        movq %r8, %rsi  # a = temp_for_swap
    movq %rdi, %rcx # temp = b (store b value)
    cmp $0, %rdi    # if(b!=0)
    jne .check
    movq %rsi, %rax # %rax = a
    cmp $0, %rax    # if(a<0)
    jl .make_abs1
    ret             # if above statement is false then ret %rax(when b=0 => return |a|)

.invalid:
    movq $-1, %rax  # return -1
    ret
.make_abs1:     
    neg %rax    # %rax stores |a|
    ret         # return %rax

.check:
    cmp $0, %rsi    # if(a!=0)
    jne .loop # (This is equivalent to while(b!=0))
    movq %rdi, %rax # %rax = b
    cmp $0, %rax    # if(b<0)
    jl .make_abs2   # b  = |b|
    ret
    
.make_abs2:
    neg %rax    # %rax stores |a|
    ret


.loop:
    movq %rsi, %rax # store a value in %rax for idivq
    movq %rdi, %rcx # temp = b
    cqto            # convert quad to octal %rdx:%rax
    idivq %rdi      # divide %rax(a) by %rdi(b) 
    # quotient is stored in %rax(a/b) && remainder is stored in %rdx(a%b)
    movq %rdx, %rdi # b = a%b
    movq %rcx, %rsi # a = temp  (previous value of b before idivq)
    cmp $0, %rdi    # check if(b>0) 
    jg .loop        # if above statement is true then goto => .loop (This is equivalent to while(b>0))
    cmp $0, %rdi    # check if(b<=0)
    jle .done       # if yes goto ==> .done


.done:
    movq %rsi, %rax # store final a(%rsi) value in %rax
    ret             # ret %rax  ( return a;)

