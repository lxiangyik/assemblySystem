.model small
.stack 500h
.data
NL  DB  0DH, 0AH, '$'
STAR DB ?
BLANK DB ?



     tq_msg db "__/\\\\\\\\\\\\\\\__/\\\________/\\\_____/\\\\\\\\\_____/\\\\\_____/\\\__/\\\________/\\\____________/\\\________/\\\_______/\\\\\_______/\\\________/\\\_  ",13,10
	        db " _\///////\\\/////__\/\\\_______\/\\\___/\\\\\\\\\\\\\__\/\\\\\\___\/\\\_\/\\\_____/\\\//____________\///\\\____/\\\/______/\\\///\\\____\/\\\_______\/\\\_   ",13,10
			db "  _______\/\\\_______\/\\\_______\/\\\__/\\\/////////\\\_\/\\\/\\\__\/\\\_\/\\\__/\\\//_________________\///\\\/\\\/______/\\\/__\///\\\__\/\\\_______\/\\\_  ",13,10
			db "   _______\/\\\_______\/\\\\\\\\\\\\\\\_\/\\\_______\/\\\_\/\\\//\\\_\/\\\_\/\\\\\\//\\\___________________\///\\\/_______/\\\______\//\\\_\/\\\_______\/\\\_  ",13,10
			db "    _______\/\\\_______\/\\\/////////\\\_\/\\\\\\\\\\\\\\\_\/\\\\//\\\\/\\\_\/\\\//_\//\\\____________________\/\\\_______\/\\\_______\/\\\_\/\\\_______\/\\\_  ",13,10
			db "     _______\/\\\_______\/\\\_______\/\\\_\/\\\/////////\\\_\/\\\_\//\\\/\\\_\/\\\____\//\\\___________________\/\\\_______\//\\\______/\\\__\/\\\_______\/\\\_ ",13,10
			db "      _______\/\\\_______\/\\\_______\/\\\_\/\\\_______\/\\\_\/\\\__\//\\\\\\_\/\\\_____\//\\\__________________\/\\\________\///\\\__/\\\____\//\\\______/\\\__  ",13,10
			db "       _______\/\\\_______\/\\\_______\/\\\_\/\\\_______\/\\\_\/\\\___\//\\\\\_\/\\\______\//\\\_________________\/\\\__________\///\\\\\/______\///\\\\\\\\\/___ ",13,10
			db "        _______\///________\///________\///__\///________\///__\///_____\/////__\///________\///__________________\///_____________\/////__________\/////////_____$",13,10

      banner db " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ",13,10 
		     db "|      ::::::::: ::::::::::: ::::::::   ::::::::   ::::::::  |",13,10       
 		     db "|     :+:    :+:    :+:    :+:    :+: :+:    :+: :+:    :+:  |",13,10   
  		     db "|    +:+    +:+    +:+    +:+        +:+        +:+    +:+   |",13,10 
  		     db "|   +#+    +:+    +#+    +#++:++#++ +#+        +#+    +:+    |",13,10  
  		     db "|  +#+    +#+    +#+           +#+ +#+        +#+    +#+     |",13,10 
  		     db "| #+#    #+#    #+#    #+#    #+# #+#    #+# #+#    #+#      |",13,10 
  		     db "|######### ########### ########   ########   ########        |",13,10 
			 db " - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - $",13,10 

		menu db "====Main Menu ===",13,10
             db "1) Number Pattern",13,10
             db "2) Design Pattern",13,10
             db "3) Box Type Patterm",13,10
             db "4) Nested Loop Pattern",13,10
			 db "5) Exit",13,10
             db "Enter your choice (1-4):",13,10
			 db 9,10,10,13,"$"
msg1 db 'this is option1$',13,10,10
msg2 db 'this is option2$',13,10,10
msg3 db 'this is option3$',13,10,10


msgError    db 9,10,13,"Error, wrong input"
            db 9,10,13,"Press any key to continue...$"

end_msg     db,9,10,13,"The system ends here.........$"


.code

main proc
        mov ax,@data
        mov ds,ax

		mov ah, 00
		mov al,02
		int 10h

ShowMenu:
        mov ah,09h
        mov dx,offset banner
        int 21h

		mov ah,09h
        mov dx,offset menu
        int 21h

		mov ah, 01h
		mov dl,al
		int 21h
	
		cmp     al, 49
		je      Diamond
		cmp     al, 50
		je      Triangle
		cmp     al, 51
		jmp     Square
		cmp     al, 52
		je      Triangle
		cmp     al, 53
        je      Quit
		jmp     Error

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
     jmp ShowMenu

Quit: 
		mov ah,00
        mov al,02
        int 10h

        mov ah,09h
        mov dx,offset end_msg
        int 21h

        mov ah,4ch
        int 21h
		
Triangle:
           MOV AX, @DATA
    MOV DS, AX

    MOV CX, 5
    MOV BX, 1

    FOR_1:
        PUSH    CX
        MOV DL, 20H    ; 20H IS ASCII CODE FOR SPACE
        MOV AH, 2

        FOR_2:
            INT 21H    ; PRINTING SPACES
        LOOP    FOR_2

        MOV CX, BX
        MOV DL, '*'
        MOV AH, 2

        FOR_3:
            INT     21H    ; PRINTING STARS
        LOOP    FOR_3

        LEA DX, NL
        MOV AH, 9
        INT     21H    ; MOVE CURSOR TO THE START OF NEXT LINE
        INC BX
        POP CX

    LOOP    FOR_1
	jmp showMenu

Diamond:
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
		jmp ShowMenu 

Square:
		MOV CX,5
		MOV BX,1

		Lsqr1:
		PUSH CX
		MOV CX,10
		   
		Lsqr2:
		MOV AH,2
		MOV DL,02
		INT 21H
		   
		LOOP Lsqr2
		 
		MOV AH,2
		MOV DL,10
		INT 21H
		MOV DL,13
		INT 21H

		POP CX     

		LOOP Lsqr1
		jmp ShowMenu 
    main endp
	end main