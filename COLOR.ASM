.model small
.stack 100h
.code

Main proc

    mov ah, 09h     ; char display function
    mov al,"$"      ; char # is displayed
    mov bh, 0       ; start value of char, start should be always 0
    mov bl,224      ; color combination. up to 255
    mov cx,50      ; cx- counter reg to repeat the char display
    int 10h         ; call BIOS

    mov ah,4ch
    int 21h

MAIN endp
End main