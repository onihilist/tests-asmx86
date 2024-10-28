KERNEL_CALL equ 80h
SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4

segment .data  
userQuestion db 'Votre nombre : ', 0
lenUserQuestion equ $ - userQuestion
testMessage db 'https://discord.gg/420sec'
lenTestMessage equ $ - testMessage

section .bss
   userNumber resb 10 

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
   mov edx, 10        
   int KERNEL_CALL

   mov eax, 0          
   mov ecx, userNumber
   xor ebx, ebx        

convert_loop:
   cmp byte [ecx + ebx], 10  
   je end_convert
   sub byte [ecx + ebx], '0' 
   imul eax, eax, 10           
   add eax, [ecx + ebx]       
   inc ebx                  
   jmp convert_loop

end_convert:

   cmp eax, 420
   jne not_equal_420

not_equal_420:

   mov eax, SYS_EXIT
   xor ebx, ebx        
   int KERNEL_CALL

equal_420:

   mov eax, SYS_WRITE
   mov ebx, 1            
   mov ecx, testMessage
   mov edx, lenTestMessage
   int KERNEL_CALL

   mov eax, SYS_EXIT
   xor ebx, ebx            
   int KERNEL_CALL
