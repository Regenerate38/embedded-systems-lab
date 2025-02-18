#include <reg51.h> 

void main() {
    unsigned char multiplicand = *(unsigned char *)0x22 = 0xFF; 
    unsigned char multiplier = *(unsigned char *)0x15 = 0xDE;   
    unsigned int result = 0;
    unsigned char i;

    for (i = 0; i < multiplier; i++) {
        result += multiplicand; 
    }

    *(unsigned char *)0x19 = (unsigned char)(result & 0xFF); 
		  
    *(unsigned char *)0x1A = (unsigned char)((result >> 8) & 0xFF); 

    while (1); 
}
