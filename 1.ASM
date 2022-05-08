org 100h
mov ax, 3
mov ah, 0
mov al, 3
int 10h

mov cl,10
print:
mov ah,02
mov bh,0
mov dh,cl
mov,dl,0
int 10h

mov ah,09
mov bh,0
mov bl,00fh
mov a1,'l'
mov cx,1
int 10h
loop print

ret
