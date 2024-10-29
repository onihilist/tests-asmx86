
KERNEL_CALL equ 80h
SYS_EXIT equ 1
SYS_FORK equ 2
SYS_READ equ 3
SYS_WRITE equ 4
SYS_OPEN equ 5
SYS_CLOSE equ 6

segment .data  
userQuestion db 'Votre nombre : '
lenUserQuestion	equ	$ - userQuestion
showNumber db 'Vous avez choisi : '
lenShowNumber equ $ - showNumber
linkIfEqual db 'https://discord.gg/420sec'
lenLinkIfEqual equ $ - linkIfEqual

section .bss
    userNumber resb 6

section .text
global _start

_start:
    mov eax, SYS_WRITE 
    mov ebx, 1          
    mov ecx, userQuestion
    mov edx, lenUserQuestion
    int KERNEL_CALL

    mov eax, SYS_READ
    mov ebx, 0          
    mov ecx, userNumber
    mov edx, 5          
    int KERNEL_CALL

    mov byte [userNumber + eax - 1], 0
    mov eax, 0          
    mov ecx, userNumber 

convert_loop:
    movzx ebx, byte [ecx] 
    test ebx, ebx         
    jz done_converting     
    sub ebx, '0'          
    imul eax, eax, 10     
    add eax, ebx          
    inc ecx               
    jmp convert_loop      

done_converting:
    cmp eax, 420
    jne not_equ_420

is_equ_420:
    mov eax, SYS_WRITE
    mov ebx, 1          
    mov ecx, linkIfEqual
    mov edx, lenLinkIfEqual
    int KERNEL_CALL

    mov eax, SYS_EXIT
    xor ebx, ebx        
    int KERNEL_CALL

not_equ_420:
    mov eax, SYS_WRITE
    mov ebx, 1          
    mov ecx, showNumber
    mov edx, lenShowNumber
    int KERNEL_CALL

    mov eax, SYS_WRITE
    mov ebx, 1          
    mov ecx, userNumber
    mov edx, 5          
    int KERNEL_CALL

    mov eax, SYS_EXIT
    xor ebx, ebx        
    int KERNEL_CALL
