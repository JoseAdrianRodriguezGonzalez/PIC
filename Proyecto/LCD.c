#include<16f887.h>
#use delay(clock=20Mhz)
#fuses nolvp,noprotect,hs,nowdt
#include<lcd.c>

int x=1;
char a[]={"Nombre de equipo:Los dedos Locos"};

void main(){
   lcd_init();
   do{
   
      lcd_gotoxy(x,1);
      printf(lcd_putc,"%s",a);
      delay_ms(100);
      x--;
      if(x==-16){
         x=1;
      }
      lcd_gotoxy(1,2);
      printf(lcd_putc,"18 de marzo");
   }while(true);
}


