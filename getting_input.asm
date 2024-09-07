section .data
  text1 db "What is your name? "
  text2 db "hello "


section .bss
  name resb 16

section .text
  global _start

  _start:
    call _printQsn
    call _getName
    call _printHello
    call _printName


    mov rax, 60
    mov rdi, 0
    syscall


  _printQsn:
    mov rax, 1
    mov rdi, 1
    mov rsi, text1
    mov rdx, 19
    syscall
    ret

  _getName:
    mov rax, 0
    mov rdi, 0
    mov rsi, name
    mov rdx, 16
    syscall
    ret


  _printHello:
    mov rax, 1
    mov rdi, 1
    mov rsi, text2
    mov rdx, 6
    syscall
    ret

  _printName:
    mov rax, 1
    mov rdi, 1
    mov rsi, name
    mov rdx, 16
    syscall
    ret


