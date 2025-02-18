#include <reg51.h>

extern void store4(void);
extern void store5(void);

void main() {
	unsigned char* ptr = 0x3e;
	unsigned char quo = 0;
	*ptr = 0xaf;
	while(*ptr >= 0x12) {
		*ptr -= 0x12;
		quo++;
	}
	ACC = quo;
	store4();
	store5();
}