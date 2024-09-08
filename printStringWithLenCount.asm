section .data
  text db "Hello there!", 10, 0

section .text
  global _start

  _start:
    
    mov rax, text
    call _print
    

    mov rax, 60
    mov rdi, 0
    syscall

; push rax is just stupid, just doing for nothing here
  _print:
    push rax
    mov rbx, 0

  _printInLoop:
    mov cl, [rax]
    cmp cl, 0
    je _printCountEnd
    inc rax
    inc rbx
    jmp _printInLoop

  _printCountEnd:
    mov rax, 1
    mov rdi, 1
    pop rsi
    mov rdx, rbx
    syscall    

    ret

