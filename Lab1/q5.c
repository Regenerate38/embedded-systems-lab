#include <reg51.h>

void delay_ms(unsigned int ms)
{
	unsigned int i, j;
	for (i = 0; i < ms; i++)
	{
		for (j = 0; j < 1275; j++)
			;
	}
}

void getMaxMin(unsigned char nums[], unsigned char *maxIn, unsigned char *minIn, unsigned char len)
{
	*maxIn = *nums, *minIn = *nums;
	len--;
	for (; len; len--)
	{
		if (*maxIn < *(nums + len))
		{
			*maxIn = *(nums + len);
		}
		if (*minIn > *(nums + len))
		{
			*minIn = *(nums + len);
		}
	}
}

void main()
{
	unsigned char nums[] = {0xd6, 0xfa, 0xe4, 0xa8, 0xce, 0xb9, 0xfa, 0xae, 0xba, 0xcc};
	unsigned char maxEl;
	unsigned char minEl;
	unsigned char len = 10;
	getMaxMin(nums, &maxEl, &minEl, len);
	while (1)
	{
		P1 = minEl;
		delay_ms(100);
		P1 = maxEl;
		delay_ms(100);
	}
}