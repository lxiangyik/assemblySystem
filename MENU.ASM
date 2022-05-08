.model small
.stack 100h
.data      

        menu db '* * *Main Menu* * *',13,10
             db '*1). Student Info *',13,10
             db '*2). Mark Info    *',13,10
             db '*3). Marks Info   *',13,10
             db '*4). Quit Program *',13,10
             db '* * * * * * * * * *',13,10,10
             db 'Enter choice: $'

 .code
 main proc
 ;****** display a prompt

     mov AX, @DATA        ;data address to pointer concept
     mov ds, ax           ;ds - ds segment (hold/handle data addresses)

 
     mov ah,09h         
     mov dx, offset menu
     int 21h             ; call dos to display
     
     
     mov ah, 1
     int 21h

     
 ;****** end program
         mov ah, 4ch ; DOS exit function
         int 21h    ; exit to DOS
 Main endp          ; end procedure
 End main           ; end program 

