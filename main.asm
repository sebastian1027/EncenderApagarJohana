    list P=16f887
    #include "p16f887.inc"

; CONFIG1
; __config 0xFFFD
 __CONFIG _CONFIG1, _FOSC_INTRC_CLKOUT & _WDTE_ON & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_ON
; CONFIG2
; __config 0xFFFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF
    
    CONTA_1 EQU 0x20	    ;variable CONTA_1
    CONTA_2 EQU 0x21	    ;variable CONTA_2
    CONTA_3 EQU 0x22	    ;variable CONTA_3
 
    org 0x00
    nop			;espera
    nop			;espera
    bsf STATUS, RP0	;Ingresamos al banco 1 
    BCF STATUS, RP1	
    MOVLW B'00000000'	;Ponemos los 8 pines como salidas 
    MOVWF TRISB		;del puerto B
    BCF STATUS, RP0	;volver al banco 0
    BCF STATUS, RP1
    
    bucle 
	bsf PORTB, 0	
	call retardo
	bcf PORTB, 0
	call retardo
	goto bucle    
    
    retardo	;subrrutina retardo	
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
	goto $-.10		;Se devuelve 8 lineas
	retlw 00
	
   end			;finaliza el programa 