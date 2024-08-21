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
