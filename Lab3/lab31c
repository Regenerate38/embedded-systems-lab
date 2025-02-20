#include <reg51.h>

sbit OUTPUT_PIN = P2^0;

void timer_init() {
    TMOD = 0x20;  // Timer 1, Mode 2 (8-bit auto-reload)
    TH1 = 235;    // Auto-reload value
}

void generate_waveform() {
    unsigned char i;

    // ON time
    OUTPUT_PIN = 1;
    for(i = 0; i < 11; i++) {
        TR1 = 1;
        while(!TF1);
        TR1 = 0;
        TF1 = 0;
    }

    // OFF time
    OUTPUT_PIN = 0;
    for(i = 0; i < 44; i++) {
        TR1 = 1;
        while(!TF1);
        TR1 = 0;
        TF1 = 0;
    }
}

void main() {
    timer_init();
    while(1) {
        generate_waveform();
    }
}