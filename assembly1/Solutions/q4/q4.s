.global lpf
# lpf ==> LARGEST PRIME FACTOR

#  %rdi == N == x
#  %r9  == i
#  %rcx == (x%i) && (i%j)--in inner loop
#  %r8 == j
#  %rsi == answer ==> LARGEST PRIME FACTOR


lpf:
    movq %rdi, %rsi  # lpf = answer = N = x
    movq $1, %r9     # loop starts from (i=2 to i<x)   
    cmp $1, %rdi     # if(x>1)   
    jg .loop         # for loop (i = 2 ; i < x ; i++)
    movq $-1, %rax   # store -1 in %rax &&  if(x<=1) then it cannot have prime factor
    ret              # return -1

.loop:
    leaq 1(%r9), %r9 # i++ 
    cmp %rdi, %r9    # if(i>=n) then jump
    jg .i_isprime    # return the largest prime factor i
    je .x_isprime    # if(x is not divisble by i=2 to i=x-1) then check if x is PRIME
    movq %rdi, %rax  # store x(%rdi) in %rax for idivq
    cqto             # convert quad to octal %rdx:%rax
    idivq %r9        # %rax = (x/i)(%rax/%r9) and %rdx = (x%i)(%rax(%)%r9)
    movq %rdx, %rcx  # %rcx = (x%i)
    cmp $0, %rcx     # if(x%i==0) then x has some factor between i=2 to x-1
    je .is_prime     # check if it is a prime
    jmp .loop        # jump to .loop for i<x
 
 
.i_isprime:
    movq %rsi, %rax  # store answer(%rsi) in %rax
    ret              # return the largest prime factor i

.x_isprime:
    jmp .is_prime    # here %r9 == %rdi == x
    


# if (x%i==0) then check if 'i' is prime
.is_prime:           # check if the factor is_prime
    movq $2, %r8     # loop starts from (j=2 to j<i)   
    cmp $1, %r9      # if(i>1)   
    jg .prime_l   # for loop (j = 2 ; j < i ; j++)
    movq $0, %rax    # j>=i then return 0 


.prime_l:
    cmp %r9, %r8     # if(j>=i) then jump
    jge .is_primefac # if(i is not divisble by j=2 to j=i-1) then i is PRIME so make it largest primefactor
    movq %r9, %rax   # store i(%r9) in %rax for idivq
    cqto             # convert quad to octal %rdx:%rax
    idivq %r8        # %rax = (i/j)(%r9/%r8) and %rdx = (i%j)(%rax(%)%r8)
    movq %rdx, %rcx  # %rcx = (i%j)
    cmp $0, %rcx     # if(i%j==0) then i has some factor between j=2 to i-1
    je .is_notprimefac # i is NOT PRIME return 0
    leaq 1(%r8), %r8 # j++ 
    jmp .prime_l  # jump to .prime_loop for j<i
    

.is_primefac:
    movq %r9, %rsi  # if(i is PRIME FACTOR) ==> store the new lpf in %rsi
    jmp .loop       # continue for(i=2;i<=x;i++)

.is_notprimefac:
    jmp .loop       # i is NOT A PRIME FACTOR ==> continue for(i=2;i<=x;i++)


