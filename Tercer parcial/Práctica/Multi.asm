#include<P16F887.INC> ;Incluye la libreria de pic
	ORG 00h ; banco de memoria 00h	
	BCF STATUS, RP1 ;Se pone en 0 rp1
	BSF STATUS, RP0 ; se pone en 1 rp0
	;MOVLW b'11111111'
	;MOVWF TRISA
	MOVLW b'11111111' ; Se mueven los 8 bits en alto a trisb declarando como entrada
	MOVWF TRISB
	MOVLW b'00000000' ;Se mueven los 8 bits en alto a trisc declarandolo como salida
	MOVWF TRISC
	MOVLW b'00000000' ;Se mueven los 8 bits en bajo a trisd declarandolo como salida
	MOVWF TRISD
	BSF STATUS, RP1 ; se pone en 1 rp1
	BSF STATUS,RP0 ; se pone en 1 rp0
	CLRF ANSELH ; se estabalce que va a haber señales digitales de entrada y salida
	CLRF ANSEL	;Habilita el puerta a y c como entradas y salidas digitales
	BCF STATUS, RP1 ; se ponen en 0 todos
	BCF STATUS, RP0
	CLRF PORTC ;limpia el puerto c
	CLRF PORTD ; se limpia el puerto d

INICIO
	MOVF PORTB, 0;Mueve del registro PORTB al acumulador
	ANDLW b'11111111'	;Hace la operacion lógica AND con lo de la constante y lo que se guarda en el acumulador, para así guardar el resultado
	CALL Tabla2 ;Se mueve a la siguiente funcion
	MOVWF PORTD ;Manda del acumulador al registro d
	GOTO Segundo ; Va a la segunda función
	
Segundo
	MOVF PORTB,0 ;Mueve del registro PORTB al acumulador
	ANDLW b'11111111'	;Hace la operacion lógica AND con lo de la constante y lo que se guarda en el acumulador, para así guardar el resultado
	CALL Tabla ;Se mueve a la siguiente funcion
	MOVWF PORTC	;Manda del acumulador al registro del puerto c
	GOTO INICIO	;Genera el bulce infinito
Tabla2
	ADDWF PCL, 1	;Hace la suma entre el registro y el acumulador y se guarda al final en el registro
;Se colocan los numeros del 0 al 7, al llegar a una instruccion el siguiente paso será volver al call y continuar el código
	RETLW b'01111111';0
 	RETLW b'00001101';1
	RETLW b'10110111';2
	RETLW b'10011111';3
	RETLW b'11001101';4
	RETLW b'11011011';5
	RETLW b'11111011';6
	RETLW b'00001111';7
	RETLW b'11111111';8
	RETLW b'11001111';9
;10
	RETLW b'01111111';0
 	RETLW b'00001101';1
	RETLW b'10110111';2
	RETLW b'10011111';3
	RETLW b'11001101';4
	RETLW b'11011011';5
	RETLW b'11111011';6
	RETLW b'00001111';7
	RETLW b'11111111';8
	RETLW b'11001111';9
;20
	RETLW b'01111111';0
Tabla
	ADDWF PCL, 1; Suma lo que hay en el registro y el acumulador, es decir, suma PCL con el acumulador y lo guarda en el acumulador
	;Números	
	RETLW b'01111111';0
	RETLW b'01111111';0
	RETLW b'01111111';0
	RETLW b'01111111';0
	RETLW b'01111111';0
	RETLW b'01111111';0
	RETLW b'01111111';0
	RETLW b'01111111';0
	RETLW b'01111111';0
	RETLW b'01111111';0
;10
	RETLW b'00001101';1
	RETLW b'00001101';1
	RETLW b'00001101';1
	RETLW b'00001101';1
	RETLW b'00001101';1
	RETLW b'00001101';1
	RETLW b'00001101';1
	RETLW b'00001101';1
	RETLW b'00001101';1
	RETLW b'00001101';1
	;20
	RETLW b'10110111';2

END ;finalzia el programa