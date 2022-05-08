.model small
 .stack 100h
 .data
 .code
 MAIN PROC
 ;****** display a prompt

       mov dl, 'j'
       mov ah, 2
       int 21h

       mov dl, 10
       int 21h

       mov dl, 'e'
       mov ah, 2
       int 21h

       mov dl,32
       int 21h

       mov dl, 'f'
       mov ah, 2
       int 21h

       mov dl, 'f'
       mov ah, 2
       int 21h
 ;****** end program
         mov ah,4ch ; DOS exit function
         int 21h    ; exit to DOS
 MAIN endp
      end    MAIN
