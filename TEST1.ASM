.model small
 .stack 100h
 .data
 .code
 MAIN PROC
 ;****** display a prompt

       mov ah, 00h ;set congiration to video mode
       mov al,13h  ;choose video mode
       int 10h     ;execute the configuration

       mov ah,0Bh ;see the configuration
       mov bh,00h ;to the background colour
       mov bl,00h ;choose black as background colour
       int 10h    ;execute the configuration

       mov ah,0Ch ;set the configuration to writing a pixel
       mov al,0Fh ;choose white as colour
       mov bh,00h ;set the page number
       mov cx,0Ah ;set the column{x}
       mov dx,0Ah ;set the line{y}
       int 10h    ;execute the configuration


 ;****** end program
         mov ah,4ch ; DOS exit function
         int 21h    ; exit to DOS
 MAIN endp
      end    MAIN