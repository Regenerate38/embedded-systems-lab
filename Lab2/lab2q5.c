#include <reg51.h>

void delay(unsigned int ms){
   unsigned int i,j;
   for(i=0; i<ms; i++){
       for (j=0;j<127;j++);
   }
}

unsigned char pins[4] = {0x08, 0x04, 0x02, 0x01};	

unsigned char num(unsigned int n1) {
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
			return 0x6F;
		default:
			return 0x3F;
	}
}

void display(unsigned int n1) {
	unsigned int d0;
	unsigned int d1;
/*	unsigned int d2;
	unsigned int d3;
*/		
	/*d3 = (n1 & 0xF000) >> 12;
  d2 = (n1 & 0x0F00) >> 8; */
  d1 = (n1 & 0x00F0) >> 4;
  d0 = n1 & 0x000F;
			
	P2 = pins[0];
	P0 = d0;
	delay(10);
	P2 = pins[1];
	P0 = d1;

}

void main() {
	unsigned int a = 5; 
	unsigned int i = 1;
	while(i!=10) {
		display(a*i);
		i++;
		delay(800);	
	}

}