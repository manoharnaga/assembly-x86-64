.global nge

# %r9 ==> n ==> n-- until n<0
# %rdi ==> arr ==> base address
# %rsi ==> ans ==> base address
# %r8 ==> pointer_to_check is_empty_stack()(temporary)

nge:
    movq %rdx, %r9          # 3rd parameter ==> n
    dec %r9                 # n--
    cmp $0, %r9             # if(n>=0)
    jge .valid              # if(n>=0) ==> valid
    movq $-1, %rax          # if(n<0) return -1
    ret
    
.valid:
    movq %rsp, %r8          # pointer_to_check is_empty_stack()
    jmp .loop               # start loop from the back (for(i=n-1;i>=0;i--))

.loop:
    cmp $0, %r9             # if(n<0) 
    jl  .make_empty_stack   # ==> make stack empty() and return
    jmp .while_s_notempty   # if(n>=0) jump to ==>  while(!stack.empty()) loop


.while_s_notempty:
    cmp %r8, %rsp            # comparing the initially stored stack pointer before any pushes, with current stack pointer 
    je .if_stack_empty       # if (%rsp==%r8(initial %rsp)) then stack is empty()
    movq (%rsp), %rcx        # temp = stack.top()
    cmp (%rdi,%r9,8), %rcx   # if(stack.top()>arr[i])
    jg  .check_if_block      # if yes then go to if block
    popq %r12                # pop the top of stack
    jmp .while_s_notempty    # pop the stack until stack not empty() or stack.top()>arr[i]

.check_if_block:
    cmp %r8, %rsp               # if(current_stack_pointer==initial_stack_pointer)
    je .if_stack_empty          # then stack is empty()
    .else:                      # else store the stack.top()  as ans for arr[i]
        movq (%rsp), %r10       # temp2=stack.top()
        movq %r10, (%rsi,%r9,8) # ans[i]=temp2;
    jmp .push_the_val

.if_stack_empty:
    movq $-1, (%rsi,%r9,8)      # ans[i]=-1;
    # jmp .push_the_val

.push_the_val:
    pushq (%rdi,%r9,8)          # stack.push(arr[i])
    dec %r9                     # n--
    jmp .loop                   # start loop again


.make_empty_stack:
    cmp %r8, %rsp               # check if stack is empty()
    je .end                     # if yes go to end
    popq %r12                   # else pop top of the stack into %r12
    jmp .make_empty_stack       # while(!stack.empty()) stack.pop()

.end:
    movq $1, %rax               # return 1 for successful operation
    ret



    
