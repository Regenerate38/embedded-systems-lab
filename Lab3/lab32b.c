#include <reg51.h>

sbit OUTPUT_PIN = P0^0;

void timer_init() {
    TMOD = 0x10;  // Timer 1, Mode 1 (16-bit)
}
void loop() {
    unsigned int timer_value = 55536;
    TL1 = timer_value & 0xFF;
    TH1 = timer_value >> 8;
    TR1 = 1;        // Start Timer 1
    while(!TF1);    // Wait for overflow
    TR1 = 0;        // Stop Timer 1
    TF1 = 0;        // Clear overflow flag
    OUTPUT_PIN = !OUTPUT_PIN;  // Toggle output pin
}

void generate_waveform() {
    unsigned char i;
    unsigned int initial_timer = 15536;

    OUTPUT_PIN = 1;
    TR1 = 0;
    TL1 = initial_timer & 0xFF;
    TH1 = initial_timer >> 8;
    TR1 = 1;
    while(!TF1);
    TR1 = 0;
    TF1 = 0;

    OUTPUT_PIN = 0;
    TL1 = initial_timer & 0xFF;
    TH1 = initial_timer >> 8;
    TR1 = 1;
    while(!TF1);
    TR1 = 0;
    TF1 = 0;
    OUTPUT_PIN = 1;
    
    for(i = 0; i < 10; i++) {
        loop();
    }
}

void main() {
    timer_init();
    while(1) {
        generate_waveform();
    }
}