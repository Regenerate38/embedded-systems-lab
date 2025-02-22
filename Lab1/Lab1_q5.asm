; SUBROUTINE TO FIND GREATEST AND SMALLEST NUMBERS FROM AN ARRAY

ORG 00H

MOV 50H, #0xA5
MOV 51H, #0xFD
MOV 52H, #0x67
MOV 53H, #0x42
MOV 54H, #0xDF
MOV 55H, #0x9A
MOV 56H, #0x84
MOV 57H, #0x1B
MOV 58H, #0xC7
MOV 59H, #0x31

MOV R0, #0X50
MOV R1, #0X09

MOV R2, 0X50 ;STORING THE GREATEST
MOV R3, 0X50 ;STORING THE SMALLEST

LOOP:
CLR C
INC R0
MOV A, R2 
SUBB A, @R0 ; if there is carry, then the number from array is now the largest number
MOV A, @R0
JC GREATEST
MOV R2, A
GREATEST:
MOV A, R3
CLR C
SUBB A, @R0
MOV A, @R0
JNC NEXT
MOV R3, A
NEXT: DJNZ R1, LOOP


DISP:
MOV P1, R2
LCALL DELAY
MOV P1, R3
LCALL DELAY
SJMP DISP


ORG 300H
DELAY:
MOV R5, 0x30
HERE1: MOV R6, 0XFF
HERE2: MOV R7, 0XFF
HERE3: DJNZ R7, HERE3
DJNZ R6, HERE2
DJNZ R5, HERE1
RET

END