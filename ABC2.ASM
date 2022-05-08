.model small
.stack 100h
.data                               ;data section
         msg db "Welcome To APU$"      ;msg is variable name, db - define byte
 .code

 MAIN proc
 ;****** display a prompt

     mov ax,@data        ;@data -address of data, pointer concept
     mov ds,ax           ;ds - ds segment (hold/handle data addresses)
     
     mov ah,09h          ;09h/09/0h/9 - strin display function (Service)
     mov dx,offset msg   ; dx - data register (to handle data), offset - (keyword)
     int 21h             ; call dos to display
     
 ;****** end program
         mov ah,4ch ; DOS exit function
         int 21h    ; exit to DOS
 Main endp          ; end procedure
 End main           ; end program 

