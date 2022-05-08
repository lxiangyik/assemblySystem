.model small
.stack 100h     
.code
 main proc
 ;****** display a prompt

     mov ah,2
     mob bl,5
     mov cl,5
     mov ch,1
top:
     inc cl
     mov dl,42
     int 21h

     cmp cl,ch
     jne top

     mov dl,10
     int 21h

     mov cl,0
     inc ch
     dec bl
     cmp bl,0
     jne top


     
 ;****** end program
         mov ah, 4ch ; DOS exit function
         int 21h    ; exit to DOS
 Main endp          ; end procedure
 End main           ; end program 

