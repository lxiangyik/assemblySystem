.model small
.stack 100h

.data
msg1    db      10, 13, 10, 13, "Please select an item:",0Dh,0Ah,0Dh,0Ah,09h
        db      "1- Create File",0Dh,0Ah,09h
        db      "2- About",0Dh,0Ah,09h      
        db      "3- Exit",0Dh,0Ah,09h
        db      "Enter item number: " 
        db      '$'   
        
About   db      10, 13, 10, 13, "I am some text about the program!$"

handle  dw  ?
file1   db  "test.txt", 0
text    db  "test text",0
text_size equ $ - text
  
.code
main proc 
    mov   ax,@data
    mov   ds,ax

ShowMenu:       
    lea     dx, msg1  
    mov     ah, 09h 
    int     21h     
        
getnum:        
    mov     ah, 1 
    int     21h        
    
    cmp     al, '1' 
    jl      ShowMenu   
    cmp     al, '3'
    jg      ShowMenu 
        
    cmp     al, "1"
    je      CreateFile
    cmp     al, "2"
    je      ShowAbout
    cmp     al, "3"
    jmp     Quit
;    cmp     al, "4"
;    jmp     CodeForMenu4
;    etc...
        
Quit: 
   mov   ah,4ch
   int   21h   

Showabout:       
    lea     dx, About  
    mov     ah, 09h 
    int     21h    
    jmp     ShowMenu
    
CreateFile:
    ; open file
    mov     ah, 3ch
    mov     dx, offset file1
    mov     cl, 1
    int     21h
    mov     handle, ax
    
    ; write to file
    mov     ah, 40h
    mov     bx, handle
    mov     dx, offset text
    mov     cx, text_size
    int     21h
    
    ; close handle, data isn't written until handle closed.
    mov     ah, 3eh
    mov     bx, handle
    int     21H         
    
    jmp     ShowMenu                
main endp
end main
