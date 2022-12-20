.global sos

# %rdi == N
# %r9  == i
# %rcx == M
# %r8 == temp
sos:
    cmp $0, %rdi  # check if N<=0
    jle  .invalid
    movq $1, %r9 # i = 1
    movq $0, %rcx # M = 0
    jmp .loop
    
.invalid:
    movq $-1, %rax  # invalid case return -1
    ret             # invalid case return -1

.loop:
    cmp %rdi, %r9               # if(i>N) goto done
    jg  .done                   # done returns M
    movq %r9, %r8               # temp = i
    imulq %r8, %r8              # temp = temp*temp(i*i)
    leaq (%rcx,%r8), %rcx       # M = M + (temp*temp)(i*i)
    leaq 1(%r9), %r9            # i++
    jmp .loop

.done:
    movq %rcx, %rax             # %rax = M(answer)
    ret                         # return %rax
 



