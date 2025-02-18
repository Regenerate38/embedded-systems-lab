#include <reg51.h>

extern void store3(void);
extern void get3(void);

void delay_ms(unsigned int ms){
    unsigned int i,j;
    for(i=0; i<ms; i++){
        for (j=0;j<1275;j++);
    }
}

void main() {
	unsigned int fact = 0x01, dec = 0;
	unsigned char n, i;
	unsigned char *ptr;
	ACC = 0x05;
	store3();
	get3();
	n = ACC;
	for(i = 2; i <= n; i++) {
		fact *= i;
	}
	ptr = 0x40;
	*ptr = fact & 0xff;
	*(++ptr) = (fact >> 8) & 0xff;
	while(fact >= 0x0a) {
		fact -= 0x0a;
		dec++;
		if(dec % 0x0a == 0) {
			dec += 0x06;
		}
	}
	dec *= 0x10;
	dec += fact;
	*(++ptr) = dec & 0xff;
	*(++ptr) = (dec >> 0x08) & 0xff;
	ptr = 0x40;
	while(1) {
		for(i = 0x04; i > 0x00; i--) {
			P1 = *(ptr + i - 0x01);
			delay_ms(100);
		}
	}
}