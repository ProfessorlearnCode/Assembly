.MODEL SMALL

.STACK 100H

.DATA
    HANGMAN DB "H   A   N   G   M   A   N"
    MESSAGE1 DB "USE UP/DOWN ARROW TO SELECT"
    MESSAGE2 DB "PRESS ESC TO GO BACK TO MAIN MENU"
    MESSAGE3 DB "USED LETTERS:"
    MESSAGE4 DB "GAME OVER !!"
    MESSAGE5 DB "PRESS ANY KEY TO CONTINUE"
    MESSAGE6 DB "ENTER YOUR NAME : "
    MESSAGE7 DB "SUCCESS!!"
    START DB "Start"
    HIGH_SCORE DB "High Score"
    EXIT DB "Exit"
    TEMPB DB ?
    TEMP DW ? 
    ANSWER DB 12 DUP(?) 
    ANS_ADDRESS DW ?
    RAND_CLUE DW ?      
    RAND_QUES DW 0 
    NUM_ANS DW ?
    MAIN_OPTION_VAR DB 1  
    BLANK DB 12 DUP ("_ ")
    
    CLUE DB "THIS IS AN ANIMAL","THIS IS A FRUIT  ","THIS IS A FLOWER ","THIS IS A COUNTRY","THIS IS A BIRD   "
    
    QUESTIONS DB "ELEPHANT    ","DINOSAUR    ","HIPPOPOTAMUS","RHINOCEROS  ","DONKEY      "
              DB "APPLE       ","BANANA      ","JACKFRUIT   ","MANGO       ","BLUEBERRY   "
              DB "SUNFLOWER   ","DAFFODIL    ","DAISY       ","JASMINE     ","LOTUS       "
              DB "BANGLADESH  ","GERMANY     ","AUSTRALIA   ","CANADA      ","RUSSIA      "
              DB "CUCKOO      ","PARROT      ","OSTRICH     ","CRANE       ","EAGLE       "
    
    _SIZE DB 8,8,12,10,6
         DB 5,6,9,5,9
         DB 9,8,5,7,5
         DB 10,7,9,6,6
         DB 6,6,7,5,5
        
    INDEX DB 5 DUP(0)    
    SCOREM DB "SCORE: "
    SCORE_IN_DEC DB 5 DUP(?)
    DIGIT_NO DW ?
    SCORE DB ?    
    INPUT_CHECK DB ?
    ANSWER_STATUS DB ?
    CHECK_AND_FILL_VAR DB ?
    SPACES DB 15 DUP(' ')
    HSFILE DB "HSDATA.txt",0
    HSMEMORY DB 30 DUP(' ')
    HSHANDLE DW ?   
    NUM_MATHA DB 9
    
    MATHA1 DB "____     "
    MATHA2 DB "    |    "
    MATHA3 DB " _ _|_   "
    MATHA4 DB "/      \ "
    MATHA5 DB "| -  - | "
    MATHA6 DB " \  . /  "
    MATHA7 DB "  \  /   "
    MATHA8 DB "   /|\   "
    MATHA9 DB "  / | \  "
    MATHAB DB " /  |  \ "
    MATHAC DB "    |    "
    MATHAD DB "    /\   "
    MATHAE DB "   /  \  "
    MATHAF DB "  /    \ "
    MATHAG DB " /      \"
      
.CODE
MAIN PROC

    INITIATE:
        MOV AH,0                        ;set video mode
        MOV AL,3
        INT 10H
        
        MOV AX,@DATA                    ;initialoze data
        MOV DS,AX
        MOV ES,AX
        MOV TEMP,25
        MOV SI,0
        
        MOV AH,6                        ;color title box
        MOV CX,0400H
        MOV DX,0650H
        MOV BH,43H
        MOV AL,0
        INT 10H
        
        MOV AH,2                        ;move cursor
        MOV DX,051DH
        MOV BH,0
        INT 10H
    
        MOV BH,0
        
    TITLE_PRINT:                    ;print title
        MOV AH,9
        MOV AL,HANGMAN[SI]
        MOV CX,1
        MOV BL,11000000B
        INT 10H
        
        INC SI
        CMP SI,TEMP
        JE TITLE_PRINT_END
        INC DL
        MOV AH,2
        INT 10H
        
        JMP TITLE_PRINT
    
    TITLE_PRINT_END:
    
        CALL MAIN_OPTION_SELECT_PRINT       ;print options and message
        
        MOV DX,171CH
        MOV BH,0
        LEA SI,MESSAGE1
        MOV CX,27
        
        CALL PRINT_MESSAGE
    
    OPTION_SELECT_LOOP:                 ;option selection by keyboard input
        MOV AH,0
        INT 16H
        
        CMP AH,72
        JE OPTION_SELECT_UP
        CMP AH,80
        
        JE OPTION_SELECT_DOWN
        CMP AL,0DH
        
        JE OPTION_SELECTION_ACTION
        
        JMP OPTION_SELECT_LOOP
    
    OPTION_SELECT_UP:
        CMP MAIN_OPTION_VAR,1
        JE OPTION_SELECT_LOOP
        DEC MAIN_OPTION_VAR
        
        CALL MAIN_OPTION_SELECT_PRINT
        JMP OPTION_SELECT_LOOP
        
    OPTION_SELECT_DOWN:
        CMP MAIN_OPTION_VAR,3
        JE OPTION_SELECT_LOOP
        INC MAIN_OPTION_VAR
        
        CALL MAIN_OPTION_SELECT_PRINT
        JMP OPTION_SELECT_LOOP
        
    OPTION_SELECTION_ACTION:
        CMP MAIN_OPTION_VAR,1
        JE START_GAME_PREP
        CMP MAIN_OPTION_VAR,2
        JE TRANSITION1
        CMP MAIN_OPTION_VAR,3
        JE TRANSITION2
    
    TRANSITION1:
        JMP HIGH_SCORE_PAGE
        TRANSITION2:
        JMP EXIT_GAME

    START_GAME_PREP:
        MOV SCORE,6
    
    START_GAME:
        MOV AH,5
        MOV AL,1
        INT 10H 
        
        MOV DX,340H
        MOV BH,1
        MOV CX,7
        LEA SI,SCOREM
        CALL PRINT_MESSAGE
        
        MOV AL,SCORE
        SUB AL,6
        LEA SI,SCORE_IN_DEC
        CALL DECIMAL_OUTPUT
        MOV CX,DIGIT_NO
        MOV DX,348H
        CALL PRINT_MESSAGE
    
    

    GENERATE_CLUE:
        MOV AH,00H
        INT 1AH
        
        
        MOV AX,DX
        XOR DX,DX
        MOV CX,5
        DIV CX
        
        MOV BH,1   
        MOV CX,17 
        MOV AX,DX 
        MOV RAND_CLUE,AX
        MUL CX
        LEA SI,CLUE         ;print clue 
        ADD SI,AX
        MOV DX,0305H
        
        CALL PRINT_MESSAGE
    
    GENERATE_ANS:
      
        MOV CX,5
        
        LEA SI,QUESTIONS
         
        MOV AX,RAND_CLUE
        MUL CX   
               
        MOV CL,12 
        MOV BX,RAND_CLUE
        ADD AL,INDEX[BX] 
        MUL CL 
        ADD SI,AX 
        MOV ANS_ADDRESS,SI 
        
        MOV CX,5
        MOV AX,RAND_CLUE
        MUL CX
        MOV CL,INDEX[BX]
        ADD AL,CL   
        
        
        
        LEA DI,_SIZE
        ADD DI,AX
        XOR CX,CX
        MOV CL,[DI] 
        MOV NUM_ANS,CX 
       
        LEA DI,ANSWER
        MOV CX,NUM_ANS
        REP MOVSB
        
     
        MOV CX,2
        MOV AX,NUM_ANS
        MUL CX 
        
        MOV CL,INDEX[BX]  
        INC CL
        CMP CL,5
        JE HERE
        MOV INDEX[BX],CL
        
        MOV CX,AX
        JMP PRINT_BLANK
        
    HERE:    
        MOV CL,0
        MOV INDEX[BX],CL
        MOV CX,AX
        
    PRINT_BLANK:
        LEA SI,BLANK
        MOV DX,0805H
        MOV BH,1
        CALL PRINT_MESSAGE
        
        MOV DX,0905H
        MOV TEMPB,'-'
        LEA SI,ANSWER
        MOV CX,NUM_ANS
        
    PRINT_VOWEL:
        CMP BYTE PTR[SI],'A'
        JE PRINT_NOW
        CMP BYTE PTR[SI],'E'
        JE PRINT_NOW
        CMP BYTE PTR[SI],'I'
        JE PRINT_NOW
        CMP BYTE PTR[SI],'O'
        JE PRINT_NOW
        CMP BYTE PTR[SI],'U'
        JE PRINT_NOW
        INC SI
        ADD DX,2
        DEC CX
        JNZ PRINT_VOWEL
        JMP VOWEL_PRINT_END
        
    PRINT_NOW:
        PUSH CX
        PUSH SI
        MOV CX,1
        MOV BH,1
        LEA SI,TEMPB
        CALL PRINT_MESSAGE
        POP SI
        POP CX
        INC SI
        ADD DX,2
        DEC CX
        JNZ PRINT_VOWEL
        
    VOWEL_PRINT_END:
        
        MOV DX,1305H                        ;prints message
        MOV BH,1
        LEA SI,MESSAGE3
        MOV CX,13
        CALL PRINT_MESSAGE
        
        MOV TEMP,6
        MOV TEMPB,' '
        MOV AX,NUM_ANS
        MOV CHECK_AND_FILL_VAR,AL
        
    CHECK_LOOP:
        MOV BX,2
        MOV AH,3FH
        MOV CX,1
        LEA DX,INPUT_CHECK
        INT 21H
        
        MOV AH,40H
        MOV CX,1
        LEA DX,TEMPB
        INT 21H
        
        CMP INPUT_CHECK,'Z'
        JLE CAPITAL_SO_PROCEED
        SUB INPUT_CHECK,'a'
        ADD INPUT_CHECK,'A'
        
    CAPITAL_SO_PROCEED:
        CALL CHECK_AND_FILL
        CMP ANSWER_STATUS,0
        JE WRONG_ANS
        MOV AL,ANSWER_STATUS
        SUB CHECK_AND_FILL_VAR,AL
        JZ NEXT_LEVEL
        JMP CHECK_LOOP
        
    WRONG_ANS:
        MOV AH,03H
        MOV BH,1
        INT 10H
        
           
        MOV BX,TEMP
        CALL MATHA_MUNDU  
        
        MOV DX,DX
        MOV BH,1
        MOV AH,2
        INT 10H
        
        DEC TEMP
        JNZ CHECK_LOOP
        JMP GAME_OVER
        
    NEXT_LEVEL:
        MOV AH,6                        ;color title box
        MOV CX,0A0DH
        MOV DX,1129H
        MOV BH,43H
        MOV AL,0
        INT 10H
        
        MOV DX,0C16H
        MOV BH,1
        LEA SI,MESSAGE7
        MOV CX,9
        CALL PRINT_MESSAGE
        MOV DX,0F0FH
        MOV BH,1
        LEA SI,MESSAGE5
        MOV CX,25
        CALL PRINT_MESSAGE
        
        MOV AH,0
        INT 16H
        
        MOV AX,TEMP
        ADD SCORE,AL
        MOV AH,0                        ;clear screen
        MOV AL,3
        INT 10H
        
        JMP START_GAME
        
        MOV AH,0
        INT 16H
        
     HIGH_SCORE_PAGE:
        MOV AH,5
        MOV AL,2
        INT 10H
        CALL HIGH_SCORE_PRINT
        MOV AH,5
        MOV AL,1
        INT 10H
        JMP INITIATE
        
     GAME_OVER:
        MOV AH,6                        ;color title box
        MOV CX,0A0DH
        MOV DX,1129H
        MOV BH,43H
        MOV AL,0
        INT 10H
        
        MOV DX,0C16H
        MOV BH,1
        LEA SI,MESSAGE4
        MOV CX,12
        CALL PRINT_MESSAGE
        MOV DX,0F0FH
        MOV BH,1
        LEA SI,MESSAGE5
        MOV CX,25
        CALL PRINT_MESSAGE
        
        MOV AH,0
        INT 16H
        
        CALL CHECK_IF_HIGH_SCORE
        CMP AX,1
        JE HIGH_SCORE_PAGE
        JMP INITIATE
        
        
     EXIT_GAME:
        MOV AH,4CH
        INT 21H
        
        MAIN ENDP  
        
     MATHA_MUNDU PROC NEAR
        
        PUSH BX
        PUSH SI
        PUSH CX
        PUSH DX
        
        CMP BX,6
        JE MATHAAA
        CMP BX,5
        JE PET
        CMP BX,4
        JE LEFTY1
        CMP BX,3
        JE RIGHTY1
        CMP BX,2
        JE LEFTPA1
        JL RIGHTPA1
     
     MATHAAA:
        LEA SI,MATHA3
        MOV BH,1
        MOV DX,0332H
        MOV CX,9
        CALL PRINT_MESSAGE
        LEA SI,MATHA4
        ADD DH,1
        CALL PRINT_MESSAGE 
        LEA SI,MATHA5
        ADD DH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHA6
        ADD DH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHA7
        ADD DH,1
        CALL PRINT_MESSAGE
        JMP RETURNX 
    
     LEFTY1:
        JMP LEFTY
        
     PET:
        LEA SI,MATHA8 
        ADD SI,4
        MOV DX,0836H
        MOV CX,1
        MOV BH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHA9
        ADD SI,4
        ADD DH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHAB   
        ADD SI,4
        ADD DH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHAC
        ADD SI,4
        ADD DH,1
        CALL PRINT_MESSAGE
        JMP RETURNX
        
     RIGHTY1:
        JMP RIGHTY 
     
     LEFTPA1:
        JMP LEFTPA
    
     RIGHTPA1:
        JMP RIGHTPA2
        
     LEFTY:
        MOV DX,0832H
        LEA SI,MATHA8
        MOV CX,4
        MOV BH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHA9
        MOV CX,3
        ADD DH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHAB   
        ADD SI,1
        ADD DH,1     
        MOV CX,2
        CALL PRINT_MESSAGE
        JMP RETURNX 
        
     RIGHTY:
        MOV DX,0837H
        LEA SI,MATHA8
        ADD SI,5
        MOV CX,4
        MOV BH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHA9
        ADD SI,5
        ADD DH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHAB   
        ADD SI,5
        ADD DH,1
        CALL PRINT_MESSAGE
        JMP RETURN  
    
     RIGHTPA2:
        JMP RIGHTPA
        
     RETURNX:
        JMP RETURN
        
     LEFTPA:
        MOV DX,0C32H
        LEA SI,MATHAD
        MOV CX,5
        MOV BH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHAE
        ADD DH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHAF   
        ADD DH,1     
        CALL PRINT_MESSAGE
        LEA SI,MATHAG   
        ADD DH,1     
        CALL PRINT_MESSAGE
        JMP RETURN
        
     RIGHTPA:
        MOV DX,0C37H
        LEA SI,MATHAD
        ADD SI,5
        MOV CX,4
        MOV BH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHAE 
        ADD SI,5
        ADD DH,1
        CALL PRINT_MESSAGE
        LEA SI,MATHAF
        ADD SI,5   
        ADD DH,1     
        CALL PRINT_MESSAGE
        LEA SI,MATHAG   
        ADD SI,5
        ADD DH,1     
        CALL PRINT_MESSAGE 
        LEA SI,MATHA1
        MOV CX,5
        MOV DX,0132H
        CALL PRINT_MESSAGE
        LEA SI,MATHA2
        ADD DH,1
        CALL PRINT_MESSAGE
         
        
     RETURN:
        POP DX
        POP CX
        POP SI
        POP BX
        RET 
        MATHA_MUNDU ENDP
    
     PRINT_MESSAGE PROC NEAR
    
     ;INPUT: DH=ROW NO.
     ;       DL=COLUMN N0.
     ;       BH=PAGE N0.
     ;       SI=MESSAGE ADDRESS
     ;       CX=MESSAGE _SIZE
    
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        
        MOV AH,2
        INT 10H
    
        MESSAGE_PRINT:
        MOV AH,0EH
        MOV AL,[SI]
        MOV BL,0
        INT 10H
        INC SI
        LOOP MESSAGE_PRINT
        
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET
        PRINT_MESSAGE ENDP
        
     MAIN_OPTION_SELECT_PRINT PROC NEAR              
    
     ;prints options (with selection box)
                                                    
     ;I/O: none
    
        PUSH AX 
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        
        CMP MAIN_OPTION_VAR,2
        JE OPTION_2_COLOR_BOX
        CMP MAIN_OPTION_VAR,3
        JE OPTION_3_COLOR_BOX
        
        MOV AH,6
        MOV AL,3
        MOV BH,24H
        MOV CX,0B23H
        MOV DX,0D2EH
        INT 10H
        MOV BH,10
        MOV CX,0E23H
        MOV DX,102EH
        INT 10H
        MOV CX,1123H
        MOV DX,132EH
        INT 10H
        JMP OPTION_NAME_PRINT
        
     OPTION_2_COLOR_BOX:
        MOV AH,6
        MOV AL,3
        MOV BH,24H
        MOV CX,0E23H
        MOV DX,102EH
        
        INT 10H
        MOV BH,10
        MOV CX,0B23H
        MOV DX,0D2EH
        INT 10H
        MOV CX,1123H
        MOV DX,132EH
        
        INT 10H
        JMP OPTION_NAME_PRINT
        
     OPTION_3_COLOR_BOX:
        MOV AH,6
        MOV AL,3
        MOV BH,24H
        MOV CX,1123H
        MOV DX,132EH
        INT 10H
        
        MOV BH,10
        MOV CX,0B23H
        MOV DX,0D2EH
        INT 10H
        
        MOV CX,0E23H
        MOV DX,102EH
        INT 10H
        
     OPTION_NAME_PRINT:
        MOV DX,0C26H
        MOV BH,0
        LEA SI,START
        MOV CX,5
        CALL PRINT_MESSAGE
        
        MOV DX,0F24H
        MOV BH,0
        LEA SI,HIGH_SCORE
        MOV CX,10
        CALL PRINT_MESSAGE
        
        MOV DX,1227H
        MOV BH,0
        LEA SI,EXIT
        MOV CX,4
        CALL PRINT_MESSAGE
        
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        
        RET
        MAIN_OPTION_SELECT_PRINT ENDP
    
     HIGH_SCORE_PRINT PROC NEAR
    
     ;input: none
     ;outout: none
    
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
    
        MOV DX,0623H
        MOV BH,2
        LEA SI,HIGH_SCORE
        MOV CX,10
        CALL PRINT_MESSAGE
    
        MOV AH,3DH
        LEA DX,HSFILE
        MOV AL,0
        INT 21H
        MOV HSHANDLE,AX
        
        MOV BX,HSHANDLE
        MOV AH,3FH
        MOV CX,7
        LEA DX,HSMEMORY
        INT 21H
        MOV DX,0B1EH
        MOV BH,2
        LEA SI,HSMEMORY
        MOV CX,6
        CALL PRINT_MESSAGE   
        MOV AL,HSMEMORY[6]
        LEA SI,SCORE_IN_DEC
        CALL DECIMAL_OUTPUT
        MOV CX,DIGIT_NO
        MOV BH,2
        MOV DX,0B2EH
        CALL PRINT_MESSAGE
        
        MOV DX,171AH
        MOV BH,2
        LEA SI,MESSAGE2
        MOV CX,33
        CALL PRINT_MESSAGE
        
        HIGH_SCORE_WAIT4ESC:
        MOV AH,0
        INT 16H
        CMP AL,27
        JNE HIGH_SCORE_WAIT4ESC
        
        MOV AH,3EH
        MOV BX,HSHANDLE
        INT 21H
            
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        
        RET
        HIGH_SCORE_PRINT ENDP    
    
     CHECK_AND_FILL PROC NEAR
    
     ;input: ANS_ADDRESS=answer address
     ;       NUM_ANS = number of chars in answer
     ;       INPUT_CHECK = taken input character
    
     ;output:ANSWER_STATUS = # of matched char
        
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        
        MOV AH,3
        MOV BH,1
        INT 10H
        PUSH DX
        
        MOV SI,ANS_ADDRESS
        MOV CX,NUM_ANS
        MOV DX,0805H
        MOV AH,2
        INT 10H
        MOV ANSWER_STATUS,0
        
        CHECK_FILL_LOOP:
        MOV BL,[SI]
        CMP BL,INPUT_CHECK
        JE FILL_NOW
        INC SI
        ADD DX,2
        DEC CX
        JNZ CHECK_FILL_LOOP
        JMP CHECK_AND_FILL_EXIT
        
        FILL_NOW:
        INC ANSWER_STATUS
        PUSH CX
        MOV AH,2
        MOV BH,1
        INT 10H
        MOV AH,9
        MOV AL,[SI]
        MOV BL,01011011B
        MOV CX,1
        MOV BH,1
        INT 10H
        MOV BYTE PTR[SI],' '
        POP CX
        INC SI
        ADD DX,2
        DEC CX
        JNZ CHECK_FILL_LOOP
        
        CHECK_AND_FILL_EXIT:
        MOV AH,2
        POP DX
        INT 10H
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET
        
        CHECK_AND_FILL ENDP
        
     ;SAVE A NUMBER STORED IN AL INTO BUFFER OF SI
    
     DECIMAL_OUTPUT PROC NEAR
        
        PUSH AX
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
        
        MOV AH,0
        MOV BH,10
        MOV CX,0
        
     PUSH_DEC:
            
        DIV BH
        CMP AL,0
        JZ PRINT_DEC
        MOV DL,AH
        MOV DH,0
        PUSH DX
        INC CX
        MOV AH,0
        JMP PUSH_DEC
        
     PRINT_DEC:
        MOV DIGIT_NO,CX
        INC DIGIT_NO
    
        MOV DL,AH
        ADD DL,"0"  
        MOV [SI],DL
        INC SI
        CMP CX,0
        JZ RETURN1
        
     POP_DEC:
        POP DX
        ADD DL,"0"
        MOV [SI],DL
        INC SI
        LOOP POP_DEC
        
     RETURN1:
        POP SI
        POP DX
        POP CX
        POP BX
        POP AX
        RET
        
     DECIMAL_OUTPUT ENDP
    
     CHECK_IF_HIGH_SCORE PROC NEAR
    
     ;checks score and determines whether it is a new high score or not
     ;input: Score
     ;output: AX(1 for new high score, 0 for not)
    
        PUSH BX
        PUSH CX
        PUSH DX
        PUSH SI
    
        MOV AH,3DH
        LEA DX,HSFILE
        MOV AL,2
        INT 21H
        
        MOV HSHANDLE,AX
        MOV BX,AX
        MOV AH,3FH
        MOV CX,7
        LEA DX,HSMEMORY
        INT 21H
        
        MOV AL,SCORE
        CMP HSMEMORY[6],AL
        JG END1
        
        MOV AH,6                    ;color title box
        MOV CX,0A0DH
        MOV DX,1140H
        MOV BH,43H
        MOV AL,0
        INT 10H
        
        MOV DX,0D1CH
        MOV BH,1
        LEA SI,MESSAGE6
        MOV CX,18
        CALL PRINT_MESSAGE
        
        MOV TEMP,6
        LEA DI,HSMEMORY
        
     INPUT_NAME:
        LEA DX,TEMPB
        MOV AH,3FH
        MOV BX,2
        MOV CX,1
        INT 21H
        
        MOV AL,TEMPB
        CMP AL,0DH
        JE INPUT_NAME_END
        
        STOSB
        
        DEC TEMP
        JNZ INPUT_NAME
        JMP END2
        
     INPUT_NAME_END:
        MOV AL,' '
        STOSB
        DEC TEMP
        JNZ INPUT_NAME_END
        
     END2:
        MOV AH,SCORE
        SUB AH,6
        MOV [DI],AH
        
        MOV AH,42H
        MOV AL,0
        MOV BX,HSHANDLE
        MOV DX,0
        MOV CX,0
        INT 21H
        
        MOV AH,40H
        MOV CX,7
        LEA DX,HSMEMORY
        INT 21H
        
        MOV AH,3EH
        MOV BX,HSHANDLE
        INT 21H
        
        POP SI
        POP DX
        POP CX
        POP BX
        MOV AX,1
        RET
        
     END1:
        MOV AH,3EH
        MOV BX,HSHANDLE
        INT 21H
        
        POP SI
        POP DX
        POP CX
        POP BX
        MOV AX,0
        RET
        
        CHECK_IF_HIGH_SCORE ENDP    
    
     END MAIN    