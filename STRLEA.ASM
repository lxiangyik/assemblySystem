.model small
.stack 200h
.data                               ;data section
         sms db 'LEE$'      ;msg is variable name, db - define byte
         sms1 db 'XIANG$'
         sms2 db 'YIK$'

 .code
 main proc
 ;****** display a prompt

     mov ax,@data        ;data address to pointer concept
     mov ds,ax           ;ds - ds segment (hold/handle data addresses)


     
     mov ah,09h         
     lea dx, sms
     int 21h             ; call dos to display
     
     mov dl, 10
      mov ah, 2
      int 21h

     mov ah,09h
     lea dx, sms1
     int 21h

     mov dl, 10
     mov ah, 2
     int 21h


      mov ah,09h
     lea dx, sms2
     int 21h

     
 ;****** end program
         mov ah, 4ch ; DOS exit function
         int 21h    ; exit to DOS
 Main endp          ; end procedure
 End main           ; end program 

