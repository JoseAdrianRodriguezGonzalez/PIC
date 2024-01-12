#include <16f877.h>
#fuses HS,NOWDT,NOPROTECT,NOPUT,NOLVP,BROWNOUT 
#use delay(clock=20M)
#use standard_io(D)

#define LCD_DB4   PIN_D4         // Pines de la pantalla LCD
#define LCD_DB5   PIN_D5
#define LCD_DB6   PIN_D6
#define LCD_DB7   PIN_D7
#define LCD_RS    PIN_D2
#define LCD_E     PIN_D3
#include <LCD_16X2.c>            // Libreria para el manejo de la pantalla LCD

void main()
{
  char a[5]={'H','O','L','A','\n'};
  lcd_init();                    // Inicializa la pantalla LCD
  
  while(true)
  {
    lcd_gotoxy(1,1);             // Columna 1, Fila 1
    lcd_putc("Hola");
    delay_ms(500);
    
    lcd_gotoxy(1,2);             // Columna 1, Fila 2
    lcd_putc("Como estas");
    delay_ms(1000);
    
    lcd_clear();
    delay_ms(200);
    for(int i=16 i>0;i--){
      for(int j=0;j<6;j++){
         lcd_gotoxy(i,2);
         lcd_putc(a[j]);
         delay_ms(100);
         }
      }
   }
}
