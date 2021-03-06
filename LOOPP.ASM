.model small
.stack 100h
.data
STAR DB ?
BLANK DB ?


  msg_Menu db " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",13,10 
		     db "|      ::::::::: ::::::::::: ::::::::   ::::::::   ::::::::  |",13,10       
 		     db "|     :+:    :+:    :+:    :+:    :+: :+:    :+: :+:    :+:  |",13,10   
  		     db "|    +:+    +:+    +:+    +:+        +:+        +:+    +:+   |",13,10 
  		     db "|   +#+    +:+    +#+    +#++:++#++ +#+        +#+    +:+    |",13,10  
  		     db "|  +#+    +#+    +#+           +#+ +#+        +#+    +#+     |",13,10 
  		     db "| #+#    #+#    #+#    #+#    #+# #+#    #+# #+#    #+#      |",13,10 
  		     db "|######### ########### ########   ########   ########        |",13,10 
			 db " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",13,10 
			 db 9,10,13,"==== Main Menu ===="
             db 9,10,13,"Please choose one of the patterns:"
             db 9,10,13,"1. Number Pattern"
             db 9,10,13,"2. Design Pattern"
             db 9,10,13,"3. Box Type Pattern"
             db 9,10,13,"4. Nested Loop Pattern"
             db 9,10,13,"5. Exit"
             db 9,10,13,"Please enter your choice: $"

 msgCont db 9,10,10,13, "Press any key to continue...$"
 msgnum db 9,10,10,13,"Choose a number from 1 - 5: $"
 msgPrint db 9,10,13,"The Pattern is being Printed..."
 db 9,10,10,13,"$"

 msgError db 9,10,13,"Error, wrong input"
 db 9,10,13,"Press any key to continue...$"

 msgExit db 9,10,13,"Exiting....$"


 counter2 dw 0
 counter4 dw 7
 counter3 dw 3
 counter5 dw 0

 counter6 dw 1
 counter1 dw 0


 .code
 .386

 Welcome proc
 mov ax,@data
 mov ds,ax


 Start:

 mov ah,00
 mov al,02
 int 10h
 
  Banner:
 mov ah,09h
 mov dx,offset msg_Menu
 int 21h


 mov ah,01h
 mov dl,al
 int 21h
 cmp al,49
 je Diamond

 cmp al,50
 je Des

 cmp al,51
 je Box

 cmp al,52
 je Nes

 cmp al,53
 je Ended

 jmp Error

 Error:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgError
 int 21h 

 mov ah, 01h
 mov dl,al
 int 21h

 jmp Start

Diamond:
        MOV AH,00
		MOV AL,02
		INT 10H

        MOV CX,5
		MOV BX,1
		
	   L1:
		PUSH CX
		
	   L2:
		MOV AH,2
		MOV DL,32
		INT 21H
		LOOP L2
		
		
		MOV CX,BX
	   L3:
		MOV AH,2
		MOV DL,'*'
		INT 21H
		LOOP L3
		
		MOV AH,2
		MOV DL,10
		INT 21H
		MOV DL,13
		INT 21H
		
		INC BX
		INC BX
		
		POP CX
		LOOP L1
		
		MOV CX,4
		MOV BH,7
		MOV BL,2
		
		MOV STAR,BH
		MOV BLANK,BL
		
	   L4:
		CMP BLANK,0
		JE L5
		MOV AH,2
		MOV DL,32
		INT 21H
		DEC BLANK
		JMP L4
		
	   L5:
		MOV AH,2
		MOV DL,'*'
		INT 21H
		DEC STAR
		CMP STAR,0
		JNE L5
	  L6:  
		MOV AH,2
		MOV DL,10
		INT 21H
		MOV DL,13
		INT 21H
		
		DEC BH
		DEC BH
		MOV STAR,BH
		
		INC BL
		MOV BLANK,BL
		
		LOOP L4
		jmp back





 back:
 mov ah,09h
 mov dx,offset msgCont
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp start


 Des:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgPrint
 int 21h

 jmp faraway


 backfromfaraway:

 mov ah,01h
 mov dl,al
 int 21h
 jmp Start

 Box:
mov ah,00
mov al,02
int 10h

 mov ah,09h
 mov dx,offset msgPrint
 int 21h

 
 mov ah,2
 mov cx,6

 square:

    mov cx,10
    mov bx,5

        S1:
        push cx
        mov cx,20

        S2:
        mov ah,2
        mov dl,'@'
        int 21h

        Loop S2

        mov ah,2
        mov dl,10
        int 21h
        mov dl,13
        int 21h

        pop cx
        Loop S1
    mov dl,10

 mov ah,09h
 mov dx,offset msgCont
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp start

 Nes:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgPrint
 int 21h

 mov ah,2
 mov cx,6

      mov ah,2  ; print
      mov bl,5  ; bl variable store value 5 
      mov cl,0  ; cl variable store value 0 (keeps going back to 0)
      mov ch,1  ; ch variable store value 1 (keeps adding 1)
	  mov bh,6  ; bh variable (keep on decrementing 1, space)

top:

      inc cl    ; 0 + 1  = 1 (increment 1)
      mov dl,"*" 
      int 21h
	  cmp cl,ch ; compare cl and ch
      jne top   ;jump if not equal to (jump back to top, cl++)

  space:  
      dec bh ; 6 - 1 = 5
	  mov dl,32
	  int 21h

	  cmp bh,0 ;(5,0),4,3,2,1,0
	  jne space

 right:
      inc bh ; bh = 0 , 0 + 1 = 1
	  mov dl,"&"
	  int 21h

	  cmp bh,bl  ; (1,5),2,3,4,5
	  jne right   ; diff will loop


      mov dl,10 ;next line
      int 21h

      mov cl,0 ; update cl = 0
      inc ch   ;1 + 1 = 2

      dec bl   ;5 -1 = 4 ;4lines
      cmp bl,0 ; 4 not equals to 0 
      jne top  ; if diff loop top

	  mov dl,10 ;newline to third triangle
	  int 21h

	  mov bl,5  ; bl variable store value 5 
      mov cl,0  ; cl variable store value 0 (keeps going back to 0)
      mov ch,1  ; ch variable store value 1 (keeps adding 1)
	  mov bh,6  ; bh variable (keep on decrementing 1, space)

	top2:

      inc cl    ; 0 + 1  = 1 (increment 1)
      mov dl,"~"
      int 21h
	  cmp cl,ch ; compare cl and ch
      jne top2   ;jump if not equal to (jump back to top, cl++)

  space2:  
      dec bh ; 6 - 1 = 5
	  mov dl,32
	  int 21h

	  cmp bh,0 ;(5,0),4,3,2,1,0
	  jne space2

 right2:
      inc bh ; bh = 0 , 0 + 1 = 1
	  mov dl,"@"
	  int 21h

	  cmp bh,bl  ; (1,5),2,3,4,5
	  jne right2   ; diff will loop


      mov dl,10 ;next line
      int 21h

      mov cl,0 ; update cl = 0
      inc ch   ;1 + 1 = 2

      dec bl   ;5 -1 = 4 ;4lines
      cmp bl,0 ; 4 not equals to 0 
      jne top2  ; if diff loop top





 mov ah,09h
 mov dx,offset msgCont
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp start

 Ended:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgExit
 int 21h

 mov ah,4ch
 int 21h

 faraway:

 pre_design:

 inc counter1 ;check whether is first line
 cmp counter1,2
 jl restart

 mov cx,counter2

 rea:
 cmp counter2,0
 je jumprea

 mov dl,32
 mov ah,2
 int 21h
 loop rea

 jumprea:

 inc counter2
cmp counter1,5 ;check middle line
 je restart
mov dl,254
mov ah,2
 int 21h

 restart:

 mov cx,counter3

 pattern_head:

 mov bx,cx
 mov cx,counter4

 cmp counter1,5 ;check middle line
 je b

 a:
 mov dl,32
 mov ah,2
 int 21h

 loop a


 b:
 mov dl,254
 mov ah,2
 int 21h

 mov cx,counter5

 c:
 cmp counter5,0
 je d

 mov dl,32
 mov ah,2
 int 21h

 loop c

 d:
 cmp counter1,5 ;check middle line
 je jump_d 


 mov dl,254
 mov ah,2
 int 21h
 jump_d:

 mov cx,bx

loop pattern_head


cmp counter1,5 ;check middle line
 jne recraft_next_line

 mov dl,254
 mov ah,2
 int 21h

 recraft_next_line:

 mov dl,10
 mov ah,2
 int 21h

 mov dl,13
 int 21h

 
 cmp counter6,5
 je end_pattern_head
 inc counter5
 inc counter5

 ;dec counter4
 dec counter4
 dec counter4

 inc counter6 ;pre diamond shape

 cmp counter6,6
 jne pre_design

 end_pattern_head:
 dec counter2
 dec counter2


 inc counter4
 inc counter4

 
 dec counter5
 dec counter5


 pre_design1:
 dec counter1 ;check whether is end line
 cmp counter1,2
 jl restart_opt



 mov cx,counter2

 rea1:
 cmp counter2,0
 je jumprea_opt

 mov dl,32
 mov ah,2
 int 21h

 loop rea1


 jumprea_opt:

 dec counter2

 mov dl,42
 mov ah,2
 int 21h
 restart_opt:

 mov cx,counter3


 pattern_tail:

 mov bx,cx
 mov cx,counter4

 e:
 mov dl,32
 mov ah,2
 int 21h

 loop e

 f:
 mov dl,42
 mov ah,2
 int 21h

 mov cx,counter5

 g:
 cmp counter5,0
 je h

 mov dl,32
 mov ah,2
 int 21h

 loop g

 h:
 mov dl,42
 mov ah,2
 int 21h

 mov cx,bx

 loop pattern_tail

 recraft_next_line_tail:

 mov dl,10
 mov ah,2
 int 21h

 mov dl,13
 int 21h

 dec counter5
 dec counter5

 inc counter4
 inc counter4

 dec counter6 ;pre diamond shape


 cmp counter6,1
 jne pre_design1


 mov ah,09h
 mov dx,offset msgCont
 int 21h


 jmp backfromfaraway



 Welcome endP
 end Welcome