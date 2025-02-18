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
	}
}

void display(unsigned int n1) {
	unsigned int lower;
	unsigned int higher;

	if (n1>= 10) {
			lower  = n1 % 10;
			higher  = (unsigned int) (n1 /10);
			P2 = pins[0];
			P0 = num(lower);
			delay(1);
			P2 = pins[1];
			P0 = num(higher);
		}
		else {
			P2 = pins[0];
			P0 = num(n1);
		}

}

void main() {
	unsigned int a = 0;
	unsigned int b = 1;
	unsigned int c = 0;
	unsigned int n = 10;
	while(n!=0) {
		display(a);
		c = a+b;
		a = b;
		b = c;
		n--;
		delay(800);	
	}

}