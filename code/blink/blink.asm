		INCL "../common/definitions.asm"
		
FULLSYS EQU 1

        ORG  0C000H
        JMP  SET_PC
SET_PC:
		MVI  A, 04H
        OUT  PORT_74237
START:  LXI  H,STACK
		SPHL
		JMP INIT
		
		INCL "../common/utils.asm"

INIT:
	IF FULLSYS
        ;Initialize 8253
  		MVI  A, 36H                     ;TIMER0 - baudrate generator for 8251
  		OUT  CONTR_W_8253               ;Timer 0, write LSB then MSB, mode 3, binary 
 	 	MVI  A, 13H                     ;LSB
  		OUT  COUNT_REG_0_8253
  		MVI  A, 00H                     ;MSB
  		OUT  COUNT_REG_0_8253
        MVI  A, 70H                     ;TIMER1 - systick
        OUT CONTR_W_8253                ;Timer 1, write LSB then MSB, mode 0, binary
 	 	MVI  A, 60H                     ;LSB, interrupt every 20ms
  		OUT  COUNT_REG_1_8253
  		MVI  A, 0EAH                    ;MSB, interrupt every 20ms
  		OUT  COUNT_REG_1_8253        
        ;Initialize 8251
        MVI	 A, 4EH
        OUT	 UART_8251_CTRL
        MVI	 A, 27H
        OUT	 UART_8251_CTRL
        ;Initialize 8259
        MVI  A, 0FFH					;ICW1 - LSB of IR0_VECT = 0xE0, level triggered, 4 byte intervals, one 8259, ICW4 needed
        OUT  PIC_8259_LOW				;ICW1 is written to the low port of 8259
        MVI  A, 0FFH					;ICW2, MSB of IR0_VECT
        OUT	 PIC_8259_HIGH				;ICW2 is written to the high port of 8259
        MVI  A, 02H						;ICW4 - NOT special full nested mode, not buffored, master, automatic EOI, 8080 processor
        OUT  PIC_8259_HIGH				;ICW4 is written to the high port of 8259        
        MVI  A, 9BH						;OCW1 active TIMER, RTC and KBD interrupt
        OUT  PIC_8259_HIGH				;OCW1 is written to the high port of 8259
        MVI  A, 80H						;OCW2 - Rotation of priorities, no explicit EOI
        OUT  PIC_8259_LOW				;OCW2 is written to the low port of 8259
;        MVI  A, 4BH				    ;OCW3 - ESMM SMM RESET SPECIAL MASK, NO POLL COMMAND, RR_RIS_READ_IS_REG
;        OUT  PIC_8259_LOW				;OCW3 is written to the low port of 8259
        ;Initialize M6442B RTC
;        MVI  A, 04H                     ;30 AJD = 0, IRQ FLAG = 1 (required), BUSY = 0(?), HOLD = 0
;        OUT  RTC_CTRLD_REG
;        MVI  A, 06H                     ;Innterrupt mode, STD.P enabled, 1 s.
;        OUT  RTC_CTRLE_REG
;        MVI  A, 04H                     ;TEST = 0, 24h mode, STOP = 0, RESET = 0
;        OUT  RTC_CTRLF_REG
		EI
	ENDIF
		
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
        
;Interrupt routines
UART_RX_ISR:
        EI                              ;Re-enable interrupts
		RET								;Return to interrupted program

UART_TX_ISR:
        EI                              ;Re-enable interrupts
		RET								;Return to interrupted program

KBD_ISR:
        EI                              ;Re-enable interrupts
		RET								;Return to interrupted program

TIMER_ISR:
        EI                              ;Re-enable interrupts
		RET								;Return to interrupted program
		
RTC_ISR: 
        EI                              ;Re-enable interrupts
		RET								;Return to interrupted program
		
VDP_ISR:
        EI                              ;Re-enable interrupts
		RET								;Return to interrupted program		

;Interrupt vectors
IR0_VECT:
		ORG  0FFE0H
        EI	
        RET
        NOP
        NOP
IR1_VECT:
        EI
		RET
        NOP
        NOP
IR2_VECT:
		JMP TIMER_ISR
        NOP
IR3_VECT:
		JMP UART_TX_ISR
        NOP
IR4_VECT:
		JMP UART_RX_ISR
        NOP
IR5_VECT:
		JMP KBD_ISR
        NOP
IR6_VECT:
		JMP RTC_ISR
        NOP
IR7_VECT
		JMP VDP_ISR
        NOP
        
        ORG  7FFFH
STACK:  DS   0                          ;STACK STARTS HERE
;

CR      EQU  0DH
LF      EQU  0AH

		END
