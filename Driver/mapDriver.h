#define REG_BASE   0xC0000000
#define REG_SPAN   0x3C000000
#define SDRAM_BASE 0x00000000
#define SDRAM_END  0x03FFFFFF
#define LED_BASE   0x04000000

void writeToSDRAM(char* character , int index);
char* getImageFromSRAM(int);
void *writeToLeds(void*); 
