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

 
 mov ah,2
 mov cx,6

      mov ah,2  ; print
      mov bl,3  ; bl variable store value 5 
      mov cl,0  ; cl variable store value 0 (keeps going back to 0)
      mov ch,0  ; ch variable store value 1 (keeps adding 1)
	  mov bh,7  ; bh variable (keep on decrementing 1, space)

	 L11:
	  mov dl,"*"
	  int 21h

	L12:
	  mov cl,0
      inc cl    ; 0 + 1 = 1,2,3,4,5,6,7 
	  mov dl,32
	  int 21h

	  cmp cl, bh ; (1,7),2,3,4,5,6,7
	  jne L12

	  inc ch    ; 0 + 1 = 1,2,3
	  cmp ch,bl ;(1,3),2,3
	  jne L11

	  mov dl, "*"
	  int 21h




 mov ah,09h
 mov dx,offset msgCont
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp start




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

 Welcome endP
 end Welcome