#include <reg51.h>

void delay(unsigned int ms) {
    unsigned int i, j;
    for (i = 0; i < ms; i++) {
        for (j = 0; j < 1275; j++);
    }
}

unsigned char impl_swap(unsigned char value) {
		value = (value >> 4) | (value << 4); 
    return value;
}

void main() {
    unsigned char acc_value = 0x6B;
    unsigned char swaped_value;
    swaped_value = impl_swap(acc_value);

    while (1) {
			P1 = acc_value; 
        delay(100);  
        P1 = swaped_value; 
        delay(100);       
    }
}
