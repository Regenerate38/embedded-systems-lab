#include <reg51.h>

sbit OUTPUT_PIN = P2^0;

void timer_init() {
    TMOD = 0x03;  // Timer 0, Mode 3 (8-bit split timer)
    TL0 = 235;    // Initial value for TL0
}

void generate_waveform() {
    unsigned char i;

    // ON time
    OUTPUT_PIN = 1;
    for(i = 0; i < 11; i++) {
        TR0 = 1;
        while(!TF0);
        TR0 = 0;
        TF0 = 0;
    }

    // OFF time
    OUTPUT_PIN = 0;
    for(i = 0; i < 44; i++) {
        TR0 = 1;
        while(!TF0);
        TR0 = 0;
        TF0 = 0;
    }
}

void main() {
    timer_init();
    while(1) {
        generate_waveform();
    }
}