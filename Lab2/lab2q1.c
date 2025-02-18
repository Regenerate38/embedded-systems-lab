#include <reg51.h>

void delay(unsigned int ms){
    unsigned int i,j;
    for(i=0; i<ms; i++){
        for (j=0;j<1275;j++);
    }
}

sbit LED0 = P2^0;
sbit LED1 = P2^1;
sbit LED2 = P2^2;
sbit LED3 = P2^3;

unsigned char num(unsigned char n1) {
	switch(n1){
		case 0:
			return 0x3F;
		case 1:
			return 0x06;
		case 2:
			return 0x5B;
		case 3:
			return 0x4F;
		case 4:
			return 0x66;
		case 5:
			return 0x6D;
		case 6:
			return 0x7D;
		case 7:
			return 0x07;
		case 8:
			return 0x7F;
		case 9:
			return 0x4F;
	}
}



void main() {
	unsigned char n1 = 0x00;
	
	LED0 = 1;
	LED1 = 0;
	LED2 = 0;
	LED3 = 0;
	while(1) {

		P0 = num(n1);
		delay(1000);
		n1++;
		if (n1==0x0A) n1 = 0x00;
	}

}