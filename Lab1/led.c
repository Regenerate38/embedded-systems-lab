#include <reg51.h>

sbit LED0 = P1^0;
sbit LED1 = P1^1;
sbit LED2 = P1^2;
sbit LED3 = P1^3;
sbit LED4 = P1^4;
sbit LED5 = P1^5;
sbit LED6 = P1^6;
sbit LED7 = P1^7;

void delay_ms(unsigned int ms){
    unsigned int i,j;
    for(i=0; i<ms; i++){
        for (j=0;j<1275;j++);
    }
}

void turn_off_all(){
    LED0 = 0;
    LED1 = 0;
    LED2 = 0;
    LED3 = 0;
    LED4 = 0;
    LED5 = 0;    
    LED6 = 0;
    LED7 = 0;
}

void main(){
    while(1){
    LED0 = 1;delay_ms(100);turn_off_all();
    LED1 = 1;delay_ms(100);turn_off_all();
    LED2 = 1;delay_ms(100);turn_off_all();
    LED3 = 1;delay_ms(100);turn_off_all();
    LED4 = 1;delay_ms(100);turn_off_all();
    LED5 = 1;delay_ms(100);turn_off_all();
    LED6 = 1;delay_ms(100);turn_off_all();
    LED7 = 1;delay_ms(100);turn_off_all();
    }
}