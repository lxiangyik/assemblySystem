.model small
.stack 100h
.data 



.code
main proc

;*       *****
;**      ****
;***     ***
;****    **
;*****   *

      mov ah,2  ;print
      mov bl,5  ; bl variable store value 5 (keep decreasing one)
      mov cl,0  ; cl variable store value 0 (keeps going back to 0)
      mov ch,1  ; ch variable store value 1 (keeps adding 1)
      mov bh,6

   
 
top:
      inc cl    ; 0 + 1  = 1 (increment 1)
      mov dl, "*" ; 
      int 21h     ; bios display

      cmp cl,ch ; compare cl and ch (1,1)
      jne top   ;jump if not equal to (jump back to top, cl++)
      mov cl, 0

 space:

    inc cl
    mov dl, 32
    int 21h
    cmp bl, cl ;(0 + 1 = 1),2,3,4,5,6 
    jne space
    mov cl, 0

right:
    inc cl
    mov dl,"&"
    int 21h

    cmp cl, bh ;(0 + 1 = 1),2,3,4,5
    jne right

   
      mov dl,10 ;next line
      int 21h

      mov cl,0   ; update cl = 0
      inc ch     ;1 + 1 = 2  , current line 
      dec bl     ;5 -1 = 4    , line left (5 -1 = 4),3,2,1,0
      dec bh
      cmp bl,0   ; 4 not equals to 0 
      jne top    ; if diff loop top

      mov ah,4ch ;quit
      int 21h
main endp
end main
