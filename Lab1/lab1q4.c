#include <reg51.h>

extern void store4(void);
extern void store5(void);

void main() {
    unsigned char dividend = *(unsigned char *)0x3E = ;
    unsigned char divisor = * (unsigned char *)0x12 = ;
	
    unsigned char quotient = 0;
    unsigned char remainder = 0;

    if (divisor == 0) {
        quotient = 0;
        remainder = dividend;
    } else {
        while (dividend >= divisor) {
            dividend -= divisor;
            quotient++;
        }
        remainder = dividend;
    }

			ACC = quotient;
		store4();
		store5();
    while (1);
}
