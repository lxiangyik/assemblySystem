.model small
.stack 200h
.data                               ;data section
         msg db ''      ;msg is variable name, db - define byte
         msg1 db ''
         msg2 db ''

 .code
 main proc
 ;****** display a prompt

     mov ax,@data        ;data address to pointer concept
     mov ds,ax           ;ds - ds segment (hold/handle data addresses)
     int 21h

     mov ah,0ah         
     lea dx, msg
     int 21h             ; call dos to display
   
      mov dl, 10
      mov ah, 2
      int 21h
     
     mov ah,0ah
     lea dx, msg1
     int 21h

      mov dl, 10
      mov ah, 2
      int 21h

      mov ah,0ah
     lea dx, msg2
     int 21h

     
 ;****** end program
         mov ah, 4ch ; DOS exit function
         int 21h    ; exit to DOS
 Main endp          ; end procedure
 End main           ; end program 

