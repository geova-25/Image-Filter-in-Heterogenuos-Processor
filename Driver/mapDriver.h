#define REG_BASE   0xC0000000
#define REG_SPAN   0x3C000000
#define SDRAM_BASE 0x04000000
#define SDRAM_END  0x07FFFFFF
#define LED_BASE   0x04001000

void writeToSDRAM(char* character , int index);
char* getImageFromSDRAM(int);
void *writeToLeds(void*); 
