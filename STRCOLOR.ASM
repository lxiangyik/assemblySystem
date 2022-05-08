.model small
.stack 200h
.data                               ;data section
         msg db "Welcome$"
 .code
 main proc
 ;****** display a prompt

     mov ax,@data        ;data address to pointer concept
     mov es,ax           ;ds - ds segment (hold/handle data addresses)
 
     mov ah, 13h
     mov al,0
     mov bh,0
     mov bl,45
     mov cx,7
     mov dh,5
     mov dl,5
     mov bp, offset msg
     int 10h

     
 ;****** end program
         mov ah, 4ch ; DOS exit function
         int 21h    ; exit to DOS
 Main endp          ; end procedure
 End main           ; end program 


