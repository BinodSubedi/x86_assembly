section .data
  number db 0,10

section .text
  global _start

  _start:
    mov rax, 9
    call _printRaxNum
    
    mov rax,60
    mov rdi, 0
    syscall

  _printRaxNum:
    add rax, 48
    mov [number], al

    mov rax, 1
    mov rdi, 1
    mov rsi, number
    mov rdx, 2
    syscall
    ret  
 
