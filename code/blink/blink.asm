		INCL "definitions.asm"

        ORG  0C000H
        JMP  SET_PC
SET_PC:
		MVI  A, 04H
        OUT  PORT_74237
START:  LXI  H,STACK
		SPHL
		JMP LOOP
		
LOOP:
		MVI A, 84H
		OUT PORT_74237
		MVI C, 255
		CALL DELAY
		MVI A, 44H
		OUT PORT_74237
		MVI C, 255
		CALL DELAY
		JMP LOOP
		
DELAY:
		MVI B, 255
PETLA_DEL_WEWN:
        NOP
        NOP
        DCR B
        JNZ PETLA_DEL_WEWN                          
        DCR C
        RZ
        JMP DELAY    
        
        ORG  7FFFH
STACK:  DS   0                          ;STACK STARTS HERE
;

CR      EQU  0DH
LF      EQU  0AH

		END
