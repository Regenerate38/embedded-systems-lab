NAME aq4
PUBLIC store4, store5
CSEG AT 0100H

store4:
	MOV R4, A
	RET
	
store5:
	MOV R5, 0x3e
	RET
	
END
