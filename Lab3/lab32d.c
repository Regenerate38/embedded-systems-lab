#include <reg51.h>
sbit OUTPUT_PIN = P0^0;

void timer_init() {
    TMOD = 0x03;  
    TL0 = 0x00; 
    TH0 = 0x00;
}

void delay_loop(unsigned char count) {
    while(count > 0) {
        TR0 = 1;      // Start timer
        while(!TF0);  // Wait for overflow
        TR0 = 0;      // Stop timer
        TF0 = 0;      // Clear overflow flag
        count--;
    }
    OUTPUT_PIN = !OUTPUT_PIN;  // Toggle output pin
}

void generate_waveform() {
    unsigned char i;
    
    // Initial pulse (100ms total)
    OUTPUT_PIN = 1;
    delay_loop(180);  // ON time
    delay_loop(180);  // OFF time
    
    // Generate 5 burst pulses (20ms each)
    for(i = 0; i < 10; i++) {
        delay_loop(36);  // Toggle every 36 counts
    }
}

void main() {
    timer_init();
    OUTPUT_PIN = 1;  // Set initial output high
    
    while(1) {
        generate_waveform();
    }
}