#include <reg51.h>

sbit OUTPUT_PIN = P2^0;

void timer_init() {
    TMOD = 0x00;  // Timer 1, Mode 0 (13-bit)
}

void generate_waveform() {
    // ON time
    OUTPUT_PIN = 1;
    TH1 = (5428 >> 8) & 0x1F;  // High 5 bits
    TL1 = 5428 & 0xFF;         // Low 8 bits
    TR1 = 1;
    while(!TF1);
    TR1 = 0;
    TF1 = 0;

    // OFF time (two cycles)
    OUTPUT_PIN = 0;
    TH1 = (8192 >> 8) & 0x1F;
    TL1 = 8192 & 0xFF;
    TR1 = 1;
    while(!TF1);
    TR1 = 0;
    TF1 = 0;

    TH1 = (5328 >> 8) & 0x1F;
    TL1 = 5328 & 0xFF;
    TR1 = 1;
    while(!TF1);
    TR1 = 0;
    TF1 = 0;
}

void main() {
    timer_init();
    while(1) {
        generate_waveform();
    }
}
