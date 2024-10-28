
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

section .bss
   userNumber resb SYS_OPEN

section .text
global _start
_start:

   mov eax, SYS_WRITE 
   mov ebx, SYS_EXIT
   mov ecx, userQuestion
   mov edx, lenUserQuestion
   int KERNEL_CALL
   
   mov eax, SYS_READ
   mov ebx, SYS_FORK
   mov ecx, userNumber
   mov edx, SYS_OPEN
   int KERNEL_CALL
   
   mov eax, SYS_WRITE
   mov ebx, SYS_EXIT
   mov ecx, showNumber
   mov edx, lenShowNumber
   int KERNEL_CALL
   
   mov eax, SYS_WRITE
   mov ebx, SYS_EXIT
   mov ecx, userNumber
   mov edx, SYS_OPEN
   int KERNEL_CALL
   
   mov eax, SYS_EXIT
   mov ebx, 0
   int KERNEL_CALL
   
   
   
   
   
