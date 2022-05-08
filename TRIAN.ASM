.MODEL SMALL 
.STACK 100H 
.DATA 
 
 
.CODE 
    MAIN: 
        MOV AX, @DATA 
        MOV DS, AX 
         
        MOV CL, 7 ; cl variable stoe 7
    LOOP1: 
        MOV DL, CL  ; print 7
    LOOP2: 
        MOV AH, 02H  
        INT 21H 
         
        DEC DL 
        CMP DL, 0
        JNE LOOP2 
         
        MOV DL, 0AH 
        MOV AH, 02H 
        INT 21H 
         
         
        MOV DL, 0DH 
        MOV AH, 02H 
        INT 21H 
         
         
        DEC CL 
        CMP CL, 0
        JNE LOOP1 
         
          
         
        MOV AH, 04CH 
        INT 21H 
    END MAIN 