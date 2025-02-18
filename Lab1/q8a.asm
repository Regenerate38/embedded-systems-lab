NAME q8a
PUBLIC store3, get3
CSEG AT 0100H

store3:
	MOV R3, A
	RET
	
get3:
	MOV A, R3
	RET
END
