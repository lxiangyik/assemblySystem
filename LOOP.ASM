.model small
.stack 100h
.data
STAR DB ?
BLANK DB ?


  menu db " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",13,10 
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
             db 9,10,13,"3. Square Type Pattern"
             db 9,10,13,"4. Nested Loop Pattern"
             db 9,10,13,"5. Exit"
             db 9,10,13,"Please enter your choice [1-5]: $"

 continueMessage db 9,10,10,13, "Press any key to continue...$"
 numberMessage db 9,10,10,13,"Choose a number from 1 - 5: $"
 printMessage db 9,10,13,"The Pattern is being Printed..."
 db 9,10,10,13,"$"

 errorMessage db 9,10,13,"Invalid input! Please enter number between 1 to 5!"
 db 9,10,13,"Press any key to continue...$"


 msgTQExit db " -------------------------------------------------------------------",13,10
           db "| ####### #     #    #    #     # #    #    #     # ####### #     # |",13,10 
           db "|    #    #     #   # #   ##    # #   #      #   #  #     # #     # |",13,10 
           db "|    #    #     #  #   #  # #   # #  #        # #   #     # #     # |",13,10 
           db "|    #    ####### #     # #  #  # ###          #    #     # #     # |",13,10 
           db "|    #    #     # ####### #   # # #  #         #    #     # #     # |",13,10 
           db "|    #    #     # #     # #    ## #   #        #    #     # #     # |",13,10 
           db "|    #    #     # #     # #     # #    #       #    #######  #####  |",13,10
		   db " -------------------------------------------------------------------$"

                                                                   


 diamondTriangle db 48
 diamondBelow db 55

 c2 dw 0
 c1 dw 0
 c4 dw 7
 c3 dw 3
 c5 dw 0
 c6 dw 1



 .code
 .386

 main proc
 mov ax,@data
 mov ds,ax


 mainMenuInterface:

 mov ah,00
 mov al,02
 int 10h
 
 mov ah,09h
 mov dx,offset menu
 int 21h


 mov ah,01h
 mov dl,al
 int 21h
 cmp al,49
 je Diamond

 cmp al,50
 je Wave

 cmp al,51
 je Square

 cmp al,52
 je NestedTriangles

 cmp al,53
 je Exit

 jmp Error

 Error:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset errorMessage
 int 21h 

 mov ah, 01h
 mov dl,al
 int 21h

 jmp mainMenuInterface

Diamond:

    mov ah,00
    mov al,02
    int 10h

    mov ah,09h
    mov dx,offset printMessage
    int 21h

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
		MOV DL,diamondTriangle
		inc diamondTriangle
		INT 21H
		LOOP L3
		mov diamondTriangle, 48
		
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
		MOV DL,diamondBelow
		INT 21H
		dec diamondBelow
		DEC STAR
		CMP STAR,0
		JNE L5
		mov diamondBelow,55
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


	   mov ah,09h
       mov dx,offset continueMessage
       int 21h

      mov ah,01h
      mov dl,al
      int 21h

	  jmp mainMenuInterface


 back:
 mov ah,09h
 mov dx,offset continueMessage
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp mainMenuInterface


 Wave:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h

 mov c2,0
 mov c4,7
 mov c3,3
 mov c5,0
 mov c6,1
 mov c1,0
 mov dx,offset printMessage
 int 21h

 jmp faraway


 backfromfaraway:

 mov ah,01h
 mov dl,al
 int 21h
 jmp mainMenuInterface

 Square:
mov ah,00
mov al,02
int 10h

 mov ah,09h
 mov dx,offset printMessage
 int 21h

 

    mov cx,10
    mov bx,5

        S1:
        push cx
        mov cx,20

        S2:
        mov ah,2
        mov dl,"*"
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
 mov dx,offset continueMessage
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp mainMenuInterface

 NestedTriangles:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset printMessage
 int 21h

 mov ah,2
 mov cx,6

      mov ah,2  ; print
      mov bl,5  ; bl variable store value 5 
      mov cl,0  ; cl variable store value 0 (keeps going back to 0)
      mov ch,1  ; ch variable store value 1 (keeps adding 1)
	  mov bh,6  ; bh variable (keep on decrementing 1, space)

T1:

      inc cl    ; 0 + 1  = 1 (increment 1)
      mov dl,"*" 
      int 21h
	  cmp cl,ch ; compare cl and ch
      jne T1   ;jump if not equal to (jump back to T1, cl++)

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
      jne T1  ; if diff loop T1

	  mov dl,10 ;newline to third triangle
	  int 21h

	  mov bl,5  ; bl variable store value 5 
      mov cl,0  ; cl variable store value 0 (keeps going back to 0)
      mov ch,1  ; ch variable store value 1 (keeps adding 1)
	  mov bh,6  ; bh variable (keep on decrementing 1, space)
	  mov dl,0

	top2:

      inc cl    ; 0 + 1  = 1 (increment 1)
	  inc diamondTriangle
      mov dl, diamondTriangle
      int 21h
	  cmp cl,ch ; compare cl and ch
      jne top2   ;jump if not equal to (jump back to T1, cl++)
	  mov diamondTriangle,48

  space2:  
      dec bh ; 6 - 1 = 5
	  mov dl,32
	  int 21h

	  cmp bh,0 ;(5,0),4,3,2,1,0
	  jne space2

 right2:
      inc bh ; bh = 0 , 0 + 1 = 1
	  inc diamondTriangle
	  mov dl,diamondTriangle
	  int 21h

	  cmp bh,bl  ; (1,5),2,3,4,5
	  jne right2   ; diff will loop
	  mov diamondTriangle,48


      mov dl,10 ;next line
      int 21h

      mov cl,0 ; update cl = 0
      inc ch   ;1 + 1 = 2

      dec bl   ;5 -1 = 4 ;4lines
      cmp bl,0 ; 4 not equals to 0 
      jne top2  ; if diff loop T1





 mov ah,09h
 mov dx,offset continueMessage
 int 21h

 mov ah,01h
 mov dl,al
 int 21h

 jmp mainMenuInterface

 Exit:
 mov ah,00
 mov al,02
 int 10h

 mov ah,09h
 mov dx,offset msgTQExit
 int 21h


 mov ah,4ch
 int 21h

 faraway:

 pre_design:

 inc c1 ;check whether is first line
 cmp c1,2
 jl res

 mov cx,c2

 rea:
 cmp c2,0
 je jumprea

 mov dl,32
 mov ah,2
 int 21h
 loop rea

 jumprea:

 inc c2
cmp c1,5 ;check middle line
 je res
mov dl,42
mov ah,2
 int 21h

 res:

 mov cx,c3

 pattern_head:

 mov bx,cx
 mov cx,c4

 cmp c1,5 ;check middle line
 je b

 a:
 mov dl,32
 mov ah,2
 int 21h

 loop a


 b:
 mov dl,42
 mov ah,2
 int 21h

 mov cx,c5

 c:
 cmp c5,0
 je d

 mov dl,32
 mov ah,2
 int 21h

 loop c

 d:
 cmp c1,5 ;check middle line
 je jump_d 


 mov dl,42
 mov ah,2
 int 21h
 jump_d:

 mov cx,bx

loop pattern_head


cmp c1,5 ;check middle line
 jne recraft_next_line

 mov dl,42
 mov ah,2
 int 21h

 recraft_next_line:

 mov dl,10
 mov ah,2
 int 21h

 mov dl,13
 int 21h

 
 cmp c6,5
 je end_pattern_head
 inc c5
 inc c5

 ;dec c4
 dec c4
 dec c4

 inc c6 ;pre diamond shape

 cmp c6,6
 jne pre_design

 end_pattern_head:
 dec c2
 dec c2


 inc c4
 inc c4

 
 dec c5
 dec c5


 pre_design1:
 dec c1 ;check whether is end line
 cmp c1,2
 jl resOpt



 mov cx,c2

 rea1:
 cmp c2,0
 je jumprea_opt

 mov dl,32
 mov ah,2
 int 21h

 loop rea1


 jumprea_opt:

 dec c2

 mov dl,42
 mov ah,2
 int 21h
 resOpt:

 mov cx,c3


 pattern_tail:

 mov bx,cx
 mov cx,c4

 e:
 mov dl,32
 mov ah,2
 int 21h

 loop e

 f:
 mov dl,42
 mov ah,2
 int 21h

 mov cx,c5

 g:
 cmp c5,0
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

 dec c5
 dec c5

 inc c4
 inc c4

 dec c6 ;pre diamond shape


 cmp c6,1
 jne pre_design1


 mov ah,09h
 mov dx,offset continueMessage
 int 21h


 jmp backfromfaraway



 main endp
 end main