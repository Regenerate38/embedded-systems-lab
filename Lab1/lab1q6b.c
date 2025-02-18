#include <reg51.h>

void delay_ms(unsigned int ms){
    unsigned int i,j;
    for(i=0; i<ms; i++){
        for (j=0;j<1275;j++);
    }
}

void bubbleSort(unsigned char* nums, unsigned char len) {
	unsigned char i, j, temp;
	for(i = 0; i < len; i++) {
		for(j = 0; j < len-i-1; j++) {
			if(nums[j+1] > nums[j]) {
				temp = nums[j+1];
				nums[j+1] = nums[j];
				nums[j] = temp;
			}
		}
	}
}


void store_array(unsigned char* start_addr, unsigned char nums[], unsigned char len) {
    unsigned char i;
    for (i = 0; i < len; i++) {
        *(start_addr + i) = nums[i]; 
    }
}

void printArray(unsigned char* array, unsigned char len) {
	unsigned char i = 0;
	for(; i < len; i++) {
		P1 = array[i];
		delay_ms(3000);
	}
}

void main() {
	unsigned char iniNums[] = {0xa5, 0xfd, 0x67, 0x42, 0xdf, 0x9a, 0x84, 0x1b, 0xc7, 0x31};
	unsigned char* nums = 0x60;
	unsigned char len = 10;
	store_array(nums, iniNums, len);
	bubbleSort(nums, len);
	while(1) {
		printArray(nums, len);
	}
}