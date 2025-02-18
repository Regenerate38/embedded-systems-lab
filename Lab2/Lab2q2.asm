; CODE FOR DOUBLE DECIMAL DIGIT COUNTER

ORG 00H
; DATA VALUE TO DISPLAY TO PORT FOR SEVEN SEGMENT DISPLAY FOR 0 TO 9 RESPECTIVELY
NUMS: DB 0X3F, 0X06, 0X5B, 0X4F, 0X66, 0X6D, 0X7D, 0X07, 0X7F, 0X4F ; Numbers 0-9

MOV DPTR, #NUMS
MOV P2, #0XFE 
RESET: MOV R0, #0X00
MOV R1, #0X00    ; Set R1 to store tens place (00 initially)

COUNT_UP: 
    ; Get tens digit (R1)
    MOV A, R1
    MOVC A, @A+DPTR 
    MOV P1, A
    LCALL DELAY
    
    ; Get ones digit (R0)
    MOV A, R0
    MOVC A, @A+DPTR
    MOV P0, A
    LCALL DELAY

    INC R0           ; Increment ones place
    CJNE R0, #0X0A, COUNT_UP ; If R0 != 10, continue counting

    ; Reset ones place and increment tens place
    MOV R0, #0
    INC R1           ; Increment tens place

    ; Check if we've reached 20 and reverse the counting
    CJNE R1, #2, COUNT_UP  ; If R1 != 2 (meaning it's less than 20), continue counting

    ; Start counting back down from 20 to 00
    DEC R1           ; Decrement tens place
    MOV R0, #0X00    ; Reset ones place

    COUNT_DOWN:
        MOV A, R1
        MOVC A, @A+DPTR
        MOV P1, A
        LCALL DELAY

        MOV A, R0
        MOVC A, @A+DPTR
        MOV P0, A
        LCALL DELAY

        DEC R0          ; Decrement ones place
        CJNE R0, #0XFF, COUNT_DOWN ; If R0 != 0, continue counting back down

        ; Reset values for the next cycle
        MOV R0, #0
        MOV R1, #2     ; Reset tens place back to 2 to start counting from 20

        SJMP RESET     ; Start over from 00
        

ORG 300H

DELAY:
    MOV R1, 0x50
HERE1: MOV R6, 0XFF
HERE2: MOV R7, 0XFF
HERE3: DJNZ R7, HERE3
DJNZ R6, HERE2
DJNZ R1, HERE1
RET

END
