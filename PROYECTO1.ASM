#include<P16F887.INC>
	ORG 00h
	BCF STATUS, RP1
	BSF STATUS, RP0
	MOVLW b'11111111'
	MOVWF TRISB 
	MOVLW b'00000000'	
	MOVWF TRISD
	BSF STATUS, RP1
	BSF STATUS, RP0
	CLRF ANSELH
	BCF STATUS, RP1
	BCF STATUS, RP0
	
	CLRF PORTD
Principal
	BTFSS PORTB, 0
	GOTO AND1
	BTFSS PORTB, 1
	GOTO AND1
	BTFSS PORTB, 2
	GOTO AND1
	BSF PORTD, 0 
	GOTO INAND2
AND1
	BCF PORTD,0

INAND2
	BTFSS PORTB, 3
	GOTO AND2
	BTFSS PORTB, 4
	GOTO AND2
	BTFSS PORTB, 5
	GOTO AND2
	BSF PORTD, 1
	GOTO OR
AND2
	BCF PORTD, 1
 
OR
	BTFSC PORTB, 6
	GOTO OROUT
	BTFSC PORTB, 7
	GOTO OROUT
	BCF PORTD, 2 
	GOTO Principal
OROUT
	BSF PORTD, 2
	GOTO Principal
	END
