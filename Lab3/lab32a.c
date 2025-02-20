#include <reg51.h>

sbit OUTPUT_PIN = P2^0;
void timer_init() {
    TMOD = 0x00;  // Timer 0, Mode 0
}
void delay_timer() {
    TH0 = 0x00;
    TL0 = 0x00;
    TR0 = 1;      // Start timer
    while(!TF0);  // Wait for overflow
    TR0 = 0;      // Stop timer
    TF0 = 0;      // Clear overflow flag
}
void generate_waveform() {
    unsigned char i;
    OUTPUT_PIN = 1;
    for(i = 0; i < 6; i++) {
        delay_timer();
    }
    OUTPUT_PIN = 0;
    for(i = 0; i < 6; i++) {
        delay_timer();
    }
    for(i = 0; i < 5; i++) {
        // ON period
        OUTPUT_PIN = 1;
        delay_timer();
        // OFF period
        OUTPUT_PIN = 0;
        delay_timer();
    }
}

void main() {
    timer_init();
    while(1) {
        generate_waveform();
    }
}
