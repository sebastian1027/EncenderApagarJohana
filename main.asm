    list P=16f887
    #include "P16f887.inc"
    
    CONTA_1 EQU 0x20
    CONTA_2 EQU 0x21
    CONTA_3 EQU 0x22
 
    org 0x00
    nop 
    nop 
    bsf STATUS, RP0	;banco 1 
    BCF STATUS, RP1
    MOVLW B'00000000'	;puerto B como salidas
    MOVWF TRISB		
    BCF STATUS, RP0	;volver al banco 0
    BCF STATUS, RP1
    
    
    
       
    retardo	;subrrutina retardo
	;movlw b'00000001'
	;movwf TRISB
	movlw d'4'	;movemos el valor 4
	movwf CONTA_3	;movemos el valor a CONTA_1
	movlw d'250'	;movemos el valor 250
	movwf CONTA_2	;movemos el valor a CONTA_2
	movlw d'250'		;movemos el valor 250
	movwf CONTA_1	;movemos el valor a CONTA_3
	nop			;retardo de 1 uS
	decfsz CONTA_1, f	;decrementa CONTA_1 en 1,(CONTA_1 - 1) si es 0 salta
	goto $-.2		;se devuleve 2 lineas
	decfsz CONTA_2, F	;decrementa CONTA_2 en 1,(CONTA_2 - 1) si es 0 salta
	goto $-.6		;Se devuelve 6 lineas
	decfsz CONTA_3, F	;decrementa CONTA_3 en 1,(CONTA_3 - 1) si es 0 salta
	goto $-.8		;Se devuelve 8 lineas
	movlw b'00000000'	;apagamos el led
	movwf TRISB		;ubicado en el puerto B
	goto retardo2	;va a la subrrutina 2
    
    retardo2
	movlw d'4'	;movemos el valor 4
	movwf CONTA_3	;movemos el valor a CONTA_1
	movlw d'250'	;movemos el valor 250
	movwf CONTA_2	;movemos el valor a CONTA_2
	movlw d'250'		;movemos el valor 250
	movwf CONTA_1	;movemos el valor a CONTA_3
	nop			;retardo de 1 uS
	decfsz CONTA_1, f	;decrementa CONTA_1 en 1,(CONTA_1 - 1) si es 0 salta
	goto $-.2		;se devuleve 2 lineas
	decfsz CONTA_2, F	;decrementa CONTA_2 en 1,(CONTA_2 - 1) si es 0 salta
	goto $-.6		;Se devuelve 6 lineas
	decfsz CONTA_3, F	;decrementa CONTA_3 en 1,(CONTA_3 - 1) si es 0 salta
	goto $-.8		;Se devuelve 8 lineas
	movlw b'11111111'	;apagamos el led
	movwf TRISB		;ubicado en el puerto B
	goto retardo	;va a la subrrutina 2
	
end			;finaliza el programa 