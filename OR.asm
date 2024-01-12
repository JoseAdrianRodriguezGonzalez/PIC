#include<P16F887.INC> ;Icnluye la libreria de pic
	ORG 00h ; banco de memoria 00h
	
	BCF STATUS, RP1 ;Se pone en 0 rp1
	BSF STATUS, RP0 ; se pone en 1 rp0
	MOVLW b'11111111' ; Se mueven los 8 bits en alto a trisb declarando como entrada
	MOVWF TRISB
	MOVLW b'00000000' ;Se mueven los 8 bits en bajo a trisd declarandolo como salida
	MOVWF TRISD
	BSF STATUS, RP1 ; se pone en 1 rp1
	BSF STATUS,RP0 ; se pone en 1 rp0
	CLRF ANSELH ; se estabalce que va a haber señales digitales de entrada y salida
	BCF STATUS, RP1 ; se ponen en 0 todos
	BCF STATUS, RP0
	
	CLRF PORTD ; se limpia el puerto d
	
Principal
	BTFSC PORTB,0 ; pregunta si en el bit 0 hay un 0, si es así, se salta a la siguiente instrucción
	GOTO Salida ; si no se va a la funcion Salida
	BTFSC PORTB,1; pregunta si en el bit 1 hay un 0, si es así, se salta a la siguiente instrucción
	GOTO Salida ; si no se va a la funcion Salida
	BTFSC PORTB,2 ; pregunta si en el bit 2 hay un 0, si es así, se salta a la siguiente instrucción
	GOTO Salida ; si no se va a la funcion Salida
	BTFSC PORTB,3; pregunta si en el bit 3 hay un 0, si es así, se salta a la siguiente instrucción
	GOTO Salida; si no se va a la funcion Salida
	BCF PORTD, 0; Si todo esto se cumple, la salida se mantendrá a en 0
	GOTO Principal ; y lo hará infinitamente
Salida
	BSF PORTD, 0 ; Se pone en 1 el bit 0 del puerto d
	GOTO Principal ; vuelve a la función prinicipal
	END