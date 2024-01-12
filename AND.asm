#include <P16F887.INC> ;Se incluyen las librer�as del pic
	ORG 00H ;banco de memoria 0
	
	BCF STATUS, RP1 ; Pone en cero RP1
	BSF STATUS, RP0 ;PONE EN 1 RP0
	MOVLW b'11111111' ;carga el a acumulador de la constante
	MOVWF TRISB ;mueve el valor del acumulador al registro
	MOVLW b'00000000'; carga el acumulador de la constante
	MOVWF TRISD ; mueve el valor del acumulador al registro TRISD
	BSF STATUS, RP1 ;POne en 1 RP1
	BSF STATUS, RP0 ; POne en 1 RP0
	CLRF ANSELH ;Limpia el registro f
	BCF STATUS, RP1 ;pone en cero a RP1 Y RP0
	BCF STATUS, RP0
	
	CLRF PORTD ;LIMPIA EL REGISTRO DEL PUERTO D
	
Principal ; FUNCI�N PRINCIPAL
	BTFSS PORTB, 0; Si el puerto bes 1, en el primer bit salta a la siguiente isntrucci�n, si no
	GOTO lab_01 ;Lo redirige a la funcion lab_01
	BTFSS PORTB, 1 ; Si el valor es 1 en el segudno bit s esalta a la siguiente isntrucci�n
	GOTO lab_01 ; Sino, se va a lab
	BTFSS PORTB,2 ; pregunta si hay un valor en el bit 3 
	GOTO lab_01 ; Va a la funci�n lab_01 
	BTFSS PORTB, 3	; Si en el puerto b los bits de 0 a 3 est�n activos salta a al siguiente instrucci�n
	GOTO lab_01 ; vuelve a lab_01
	BSF PORTD, 0 ; Pone en 1 a puerto d el primer bit
	GOTO Principal;Se retorna infinitamente
lab_01 
	BCF PORTD, 0 ; limpia el puerto d en el primer bit
	GOTO Principal ; regrea a la funci�n principal
	END ; termina el programa