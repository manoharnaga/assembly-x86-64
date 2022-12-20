.global quot
.global rem

# %rdi == m
# %rsi == n
# %r10 == cnt(quotient)=0(initialise)
# %r11 == qpar == parity of quotient 
# qpar = 1 ==> +ve
# qpar = 0 ==> -ve
# %rcx == temp

quot:
    cmp $0, %rsi        # if(n>0) 
    je .invalid         # else return -1
    movq $0, %r10       # cnt = 0
    movq %rdi, %rcx     # temp = m
    cmp $0, %rdi        # if(m<=0) 
    jle .mb1            # m is -ve
    cmp $0, %rsi        # if(n<0)
    jl  .nb2            # n is -ve
    movq $1, %r11       # initialise (qpar = 1)
    cmp %rsi, %rdi      # if(m>=n)
    jge  .qloop         # goto loop qloop <==> while(m<=n)
    jl   .finalq        # if(m<n) calculate q and r and ret

.mb1:
    neg %rdi            # m=-m  if(m<=0)
    cmp $0, %rsi        # if(n<0)
    jl  .nb1            # n is -ve
    movq $0, %r11       # n +ve and m -ve ==> q -ve ==> qpar = 0
    cmp %rsi, %rdi      # if(m>=n)
    jge  .qloop         # goto loop qloop <==> while(m<=n)
    jl   .finalq        # if(m<n) calculate q and r and ret

.nb1:
    movq $1, %r11
    neg %rsi
    cmp %rsi, %rdi      # if(m>=n)
    jge  .qloop         # goto loop qloop <==> while(m<=n)
    jl   .finalq        # if(m<n) calculate q and r and ret      

.nb2:
    movq $0, %r11
    neg %rsi
    cmp %rsi, %rdi      # if(m>=n)
    jge  .qloop         # goto loop qloop <==> while(m<=n)
    jl   .finalq        # if(m<n) calculate q and r and ret

.qloop:
    subq %rsi, %rdi
    inc %r10
    cmp %rsi, %rdi      # if(m>=n)
    jge  .qloop         # goto loop qloop <==> while(m<=n)
    jl   .finalq        # if(m<n) calculate q and r and ret


.finalq:
    cmp $1, %r11        # if(qpar!=1)
    jne .negateit       # goto .negateit 
    movq %r10, %rax     # %rax = cnt = quotient
    ret                 # return %rax

.negateit:
    neg %r10            # if(qpar!=1) ==> cnt=-cnt(quotient)
    movq %r10, %rax     # %rax = cnt = quotient
    ret                 # return %rax

# THE BELOW BLOCK IS EXECUTED AFTER ALL THE ABOVE BLOCKS
rem:
    imulq %rsi, %r10    # cnt = cnt*n <==> q=n*q
    subq %r10, %rcx     # temp = temp - cnt <==> m = m-n*q(remainder)
    movq %rcx, %rax     # %rax = remainder
    ret                 # return %rax


.invalid:           # if(n<=0) return -1
    movq $-1, %rax  # %rax = -1
    ret             # return %rax





