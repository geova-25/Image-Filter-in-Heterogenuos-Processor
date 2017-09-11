#define REG_BASE   0xC0000000
#define REG_SPAN   0x3C000000
#define SDRAM_BASE 0x04000000 //+ 0x1000000
#define SDRAM_END  0x07FFFFFF
#define LED_BASE   0x04001000

#define INICIO_DIR 		0x03000000
#define FIN_DIR    		0x03000004
#define LARGO_DIR  		0x03000008
#define ANCHO_DIR 		0x0300000C
#define X_DIR      		0x03000010
#define Y_DIR      		0x03000014
#define DURACION_DIR    	0x03000018
#define BASE_ORIG_IMG_SDRAM     0x01000000
#define BASE_COPY_IMG_SDRAM     0x02000000

void writeToSDRAM(char* , int);
int* getImageFromSDRAM(int);
void writeToSDRAM_int(int* , int);
void *writeToLeds(void*); 
int* getIntFromSDRAM(int);
