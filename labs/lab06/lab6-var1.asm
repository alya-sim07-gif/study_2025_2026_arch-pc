%include 'in_out.asm'
SECTION .data
msg: DB 'Введите значение переменной x: ',0
rem: DB 'Результат: ',0
SECTION .bss
x: RESB 80
SECTION .text
GLOBAL _start
_start:
mov eax, msg
call sprint
mov ecx, x
mov edx, 80
call sread
mov eax, x
call atoi
mov ebx, 2
mul ebx        
add eax, 10    
mov ebx, 3
div ebx        
mov edi, eax
mov eax, rem
call sprint
mov eax, edi
call iprintLF
call quit