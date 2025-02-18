#include <reg51.h>

void delay_ms(unsigned int ms){
    unsigned int i,j;
    for(i=0; i<ms; i++){
        for (j=0;j<127;j++);
    }
}


void onlyPrimes(unsigned char* ptr, unsigned char len) {
	unsigned char i = 2;
	unsigned char n, j, res;
	for(; i < len; i++) {
		n = ptr[i];
		res = 1;
		for(j = 2; j < n; j++) {
			if(n % j == 0) {
				res = 0;
				break;
			}
		}
		if(res) {
			P1 = n;
			delay_ms(1000);
		}
	}
}


void main() {
	unsigned char* ptr = 0x40;
	unsigned char len = 0x21;
	*ptr = 0x00;
	while(*ptr < 0x20) {
		*(ptr+0x01) = *(ptr) + 0x01;
		ptr++;
	}
	ptr = 0x40;
	while(1) {
		onlyPrimes(ptr, len);
	}
}