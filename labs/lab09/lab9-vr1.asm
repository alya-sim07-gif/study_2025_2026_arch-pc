%include "in_out.asm"

SECTION .data
    msg_func   db "Функция: f(x) = 2x + 15", 0
    msg_result db "Результат: ", 0    

SECTION .text
GLOBAL _start
_start:
    mov eax, msg_func
    call sprintLF
    
    ; Получаем аргументы командной строки
    pop ecx        
    pop edx         
    sub ecx, 1      
    mov esi, 0      
    
    ; Проверяем, есть ли аргументы
    cmp ecx, 0
    je _end         

next:
    pop eax         
    call atoi       
    
    call _calculate_fx 
    
    add esi, eax    
    dec ecx         
    jnz next        

_end:
    mov eax, msg_result
    call sprint
    mov eax, esi
    call iprintLF
    call quit

_calculate_fx:
    mov ebx, 2
    mul ebx        
    add eax, 15     
    ret