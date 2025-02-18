 #include <reg52.h>
    #define LED_PORT P1

    void delay() {
        unsigned int i, j;
        for (i = 0; i < 1000; i++) {
            for (j = 0; j < 1000; j++);            
        }
    }

    void main() {
        unsigned char num1[] = {0x9A, 0x7F, 0x89}; 
        unsigned char num2[] = {0x48, 0xBC, 0x34}; 
        unsigned char result[3];                  
        unsigned int sum;
        unsigned char carry = 0;
        int i;
    
        
        for (i = 0; i < 3; i++) {
            sum = num1[i] + num2[i] + carry;     
            result[i] = sum & 0xFF;               
            carry = (sum >> 8) & 0x01;            
        }
    
        while (1) {
            for (i = 0; i < 3; i++) {
                LED_PORT = result[i];             
                delay();                          
            }
        }
    }