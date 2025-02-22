format elf64 executable
entry start

    result db 21 dup 10
    result_end:

start:
    mov ecx, 10
    mov rax, 2
    mov rbx, 1
.fibo_loop:
    add rbx, rax
    add rax, rbx
    dec ecx
    jnz .fibo_loop

    mov ecx, (result_end - result - 2)
    mov rbx, 10
.num_str_loop:
    mov rdx, 0
    div rbx
    add rdx, '0'
    mov [result + ecx], dl
    dec rcx
    or eax, eax
    jnz .num_str_loop

    mov rdx, rcx
    neg rdx

    mov rax, 1 ; write
    mov rdi, 1 ; stdout
    lea rsi, [(result + 1) + rcx] ; string
    lea rdx, [(result_end - result - 1) + rdx] ; length
    syscall

    mov rax, 60 ; exit
    mov rdi, 0 ; success
    syscall
