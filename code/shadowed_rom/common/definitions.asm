PORT_74237   		EQU		0E0H

UART_8251_DATA    	EQU     40H
UART_8251_CTRL		EQU		41H

COUNT_REG_0_8253 	EQU 	48H
COUNT_REG_1_8253 	EQU 	49H
COUNT_REG_2_8253 	EQU 	4AH
CONTR_W_8253 		EQU 	4BH

PIC_8259_LOW		EQU		58H
PIC_8259_HIGH		EQU		59H

KBD_DATA            EQU     50H
KBD_STATUS          EQU     51H
KBD_CMD             EQU     51H

RTC_1_SEC_REG		EQU		00H
RTC_10_SEC_REG		EQU		01H
RTC_1_MIN_REG		EQU		02H
RTC_10_MIN_REG		EQU		03H
RTC_1_HOUR_REG		EQU		04H
RTC_10_HOUR_REG		EQU		05H
RTC_1_DAY_REG		EQU		06H
RTC_10_DAY_REG		EQU		07H
RTC_1_MON_REG		EQU		08H
RTC_10_MON_REG		EQU		09H
RTC_1_YEAR_REG		EQU		0AH
RTC_10_YEAR_REG		EQU		0BH
RTC_WEEK_REG		EQU		0CH
RTC_CTRLD_REG		EQU		0DH
RTC_CTRLE_REG		EQU		0EH
RTC_CTRLF_REG		EQU		0FH

;8253 config
SEL_COUNTER_0 		EQU 	00H
SEL_COUNTER_1 		EQU 	40H
SEL_COUNTER_2 		EQU 	80H
COUNTER_LATCHING 	EQU 	00H 
RL_MSB_ONLY      	EQU 	20H
RL_LSB_ONLY      	EQU 	10H
RL_LSB_THEN_MSB  	EQU 	30H
MODE_0 				EQU 	00H
MODE_1 				EQU 	02H
MODE_2 				EQU 	04H
MODE_3 				EQU 	06H
MODE_4 				EQU 	08H
MODE_5 				EQU 	0AH
BCD 				EQU 	01H
BIN 				EQU 	00H

TxRDY_MASK   		EQU 	01H
RxRDY_MASK			EQU		02H	

; CF REGS
CFBASE              EQU     0F0H
CFREG0              EQU     CFBASE+0	;DATA PORT
CFREG1              EQU     CFBASE+1	;READ: ERROR CODE, WRITE: FEATURE
CFREG2              EQU     CFBASE+2	;NUMBER OF SECTORS TO TRANSFER
CFREG3              EQU     CFBASE+3	;SECTOR ADDRESS LBA 0 [0:7]
CFREG4              EQU     CFBASE+4	;SECTOR ADDRESS LBA 1 [8:15]
CFREG5              EQU     CFBASE+5	;SECTOR ADDRESS LBA 2 [16:23]
CFREG6              EQU     CFBASE+6	;SECTOR ADDRESS LBA 3 [24:27 (LSB)]
CFREG7              EQU     CFBASE+7	;READ: STATUS, WRITE: COMMAND

; DMA 8257 configuration
DMA_BASE			EQU		20H
DMA_CH0_ADDR		EQU		DMA_BASE+0
DMA_CH0_TC			EQU		DMA_BASE+1
DMA_CH1_ADDR		EQU		DMA_BASE+2
DMA_CH1_TC			EQU		DMA_BASE+3
DMA_CH2_ADDR		EQU		DMA_BASE+4
DMA_CH2_TC			EQU		DMA_BASE+5
DMA_CH3_ADDR		EQU		DMA_BASE+6
DMA_CH3_TC			EQU		DMA_BASE+7
DMA_MODE			EQU		DMA_BASE+8
DMA_STATUS			EQU		DMA_BASE+8

SCREEN_MAX_Y		EQU		24
SCREEN_MAX_X		EQU		10

LOAD_BASE			EQU		0CC00H
BIOS_ADDR			EQU		LOAD_BASE+1600H
