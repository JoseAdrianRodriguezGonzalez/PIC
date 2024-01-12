#include<P16F887.INC> ;Incluye la libreria de pic
	ORG 00h ; banco de memoria 00h	
	BCF STATUS, RP1 ;Se pone en 0 rp1
	BSF STATUS, RP0 ; se pone en 1 rp0
	MOVLW b'11111111';Se mueven los 8 bits a trsia haciendolo entrada
	MOVWF TRISA
	MOVLW b'11111111' ; Se mueven los 8 bits en alto a trisb declarando como entrada
	MOVWF TRISB
	MOVLW b'00000000' ; se mueven los 8 bits en bajo a trsic declarandolo como salida
	MOVWF TRISC
	MOVLW b'00000000' ;Se mueven los 8 bits en bajo a trisd declarandolo como salida
	MOVWF TRISD
	BSF STATUS, RP1 ; se pone en 1 rp1
	BSF STATUS,RP0 ; se pone en 1 rp0
	CLRF ANSELH ; se estabalce que va a haber señales digitales de entrada y salida
	CLRF ANSEL	; Para habilitar los puertos A y C
	BCF STATUS, RP1 ; se ponen en 0 todos
	BCF STATUS, RP0
	CLRF PORTC	; Se limpia el puerto c
	CLRF PORTD ; se limpia el puerto d
;Display dos
;Hace exactamente lo mismo que con el portb y d, solamente que con el porta y c
Display_2
	MOVF PORTA, 0
	ANDLW b'11111111'
	CALL Tabla2
	MOVWF PORTC
	GOTO INICIO
INICIO
	MOVF PORTB, 0;Mueve del registro PORTB al acumulador
	ANDLW b'11111111'	;Hace la operacion lógica AND con lo de la constante y lo que se guarda en el acumulador, para así guardar el resultado
	CALL Tabla ;Se mueve a la siguiente funcion
	MOVWF PORTD ;Manda del acumulador al registro	
	GOTO Display_2	;Genera el bulce infinito
Tabla
	ADDWF PCL, 1	;Hace la suma entre el registro y el acumulador y se guarda al final en el registro
;Se colocan los numeros del 0 al 7, al llegar a una instruccion el siguiente paso será volver al call y continuar el código
	RETLW b'01111111'	
 	RETLW b'00001101'
	RETLW b'10110111'
	RETLW b'10011111'
	RETLW b'11001101'
	RETLW b'11011011'
	RETLW b'11111011'
	RETLW b'00001111'
	RETLW b'11111111'
	RETLW b'11001111'
Tabla2
	ADDWF PCL, 1	;Hace la suma entre el registro y el acumulador y se guarda al final en el registro
;Se colocan los numeros del 0 al 7, al llegar a una instruccion el siguiente paso será volver al call y continuar el código
	RETLW b'01111111'	
 	RETLW b'00001101'
	RETLW b'10110111'
	RETLW b'10011111'
	RETLW b'11001101'
	RETLW b'11011011'
	RETLW b'11111011'
	RETLW b'00001111'
	RETLW b'11111111'
	RETLW b'11001111'

END ;finalzia el programa