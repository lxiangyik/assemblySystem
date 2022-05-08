.model small
.stack 100h
.code
main proc

trianglee db 6


      mov ah,2  ;print everything under it
      mov bl,5  ; bl variable store value 5 
      mov cl,0  ; cl variable store value 0 (keeps going back to 0)
      mov ch,1  ; ch variable store value 1 (keeps adding 1)


	  mov bh,6  ; bh variable (keep on decrementing 1, space)


;*      $$$$$
;**     $$$$
;***    $$$
;****   $$
;*****  $

top:
      inc cl    ; 0 + 1  = 1 (increment 1)
      mov dl,"*"  
      int 21h
	  cmp cl,ch ; compare cl and c, 1 and 0
      jne top   ;jump if not equal to (jump back to top, cl++)

  space:  
	  mov dl,32
	  int 21h

	  cmp bh,0
	  dec bh  ; 6 -1 = 5
	  jne space

 right:
      dec trianglee 
      mov dl,"&"
	  int 21h

	  cmp trianglee,0  ;compare 5 with 0
	  jne right   ; diff will loop


      mov dl,10 ;next line
      int 21h

      mov cl,0 ; update cl = 0
      inc ch   ;1 + 1 = 2
      dec bl   ;5 -1 = 4
      cmp bl,0 ; 4 not equals to 0 
      jne top  ; if diff loop top

      mov ah,4ch ;quit
      int 21h
main endp
end main

