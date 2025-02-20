#include <reg51.h>

// Define segment display codes for 0-9
unsigned char code SEGMENT_CODES[] = {0x3F, 0x06, 0x5B, 
            0x4F, 0x66, 0x6D, 0x7D, 0x07, 0x7F, 0x6F};

// Function prototypes
void display_hour(void);
void display_min(void);
void display_sec(void);
void delay_small(void);
void timer0_init(void);

// Global variables
unsigned char hour = 23;
unsigned char minute = 59;
unsigned char second = 53;

unsigned char digits[4]; // Array to store the four digits (hour, minute, second)

void main(void) {
    timer0_init(); // Initialize Timer 0 for 1 second delay
    
    while(1) {
        // Update time every second
        digits[0] = hour / 10;      // Tens place of hour
        digits[1] = hour % 10;      // Ones place of hour
        digits[2] = minute / 10;    // Tens place of minute
        digits[3] = minute % 10;    // Ones place of minute
        
        // Display the time
        display_hour();             // Display hour
        display_min();              // Display minute
        display_sec();              // Display second
        
        // Increment second
        second++;
        if(second == 60) {
            second = 0;
            minute++;
            if(minute == 60) {
                minute = 0;
                hour++;
                if(hour == 24) {
                    hour = 0;
                }
            }
        }
    }
}

// Timer 0 initialization for 1-second delay
void timer0_init(void) {
    TMOD = 0x01; // Timer 0 in mode 1 (16-bit timer)
    TH0 = (65536 - 12000) >> 8; // Load timer value for 1-second delay (12 MHz clock)
    TL0 = (65536 - 12000) & 0xFF;
    TR0 = 1; // Start Timer 0
}

// Timer 0 interrupt handler for 1-second delay
void timer0_isr(void) interrupt 1 {
    TH0 = (65536 - 12000) >> 8; // Reload Timer value for next overflow
    TL0 = (65536 - 12000) & 0xFF;
    TF0 = 0; // Clear Timer 0 interrupt flag
}

// Function to display each digit on the 7-segment display
void display_digit(unsigned char digit, unsigned char display) {
    P0 = SEGMENT_CODES[digit];  // Set the 7-segment display pattern for the digit

    // Multiplexing logic to select which digit to display
    switch(display) {
        case 0: // Display hour tens place
            P1 &= ~(0x03); // Clear P1.0 and P1.1
            P1 |= 0x01;    // Set P1.0 (select the first digit)
            break;
        case 1: // Display hour ones place
            P1 &= ~(0x03); // Clear P1.0 and P1.1
            P1 |= 0x02;    // Set P1.1 (select the second digit)
            break;
        case 2: // Display minute tens place
            P1 &= ~(0x0C); // Clear P1.2 and P1.3
            P1 |= 0x04;    // Set P1.2 (select the third digit)
            break;
        case 3: // Display minute ones place
            P1 &= ~(0x0C); // Clear P1.2 and P1.3
            P1 |= 0x08;    // Set P1.3 (select the fourth digit)
            break;
    }
    delay_small();  // Allow the digit to be visible for a short period
}

// Display hour function (multiplexing each digit one by one)
void display_hour(void) {
    display_digit(digits[0], 0);  // Display hour tens
    display_digit(digits[1], 1);  // Display hour ones
}

// Display minute function (multiplexing each digit one by one)
void display_min(void) {
    display_digit(digits[2], 2);  // Display minute tens
    display_digit(digits[3], 3);  // Display minute ones
}

// Display second function (multiplexing each digit one by one)
void display_sec(void) {
    unsigned char ones = second % 10; // Get ones place of second
    P3 = SEGMENT_CODES[ones]; // Display second digit (ones place)
    P1 &= ~(0x30); // Clear P1.4 and P1.5
    P1 |= 0x10;    // Set P1.4 (select second ones place)
    delay_small(); // Allow the second digit to be visible
}

// Small delay function to allow for multiplexing
void delay_small(void) {
    unsigned char i;
    
    // Loop count adjusted for proper multiplexing delay
    for(i = 0; i < 1000; i++) {  // Increased loop count for a slower update
        // This creates a small delay for multiplexing each digit
    }
}
