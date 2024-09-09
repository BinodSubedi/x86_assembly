STD_WR equ 1
STD_WR_FD equ 1


%macro exit 0
  mov rax, 60
  mov rdi, 0
  syscall

%endmacro
 

; I used 3 just for demonstration purpose, 3 is arg count, number of param basically

%macro printText 3
  mov rax, %1
  mov rdi, %2
  pop rsi
  mov rdx, %3
  syscall 
%endmacro

section .data
  text db "Hello there!", 10, 0

section .text
  global _start

  _start:
    
    mov rax, text
    call _print
    exit
    
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
    printText STD_WR, STD_WR_FD, rbx
    ret

