#include "sys/alt_stdio.h"
#include "system.h"
#include "unistd.h"
int main()
{ 
  while(1)
  {
	int* INICIO = SDRAM_BASE + 0x03000000;
	int* FIN    = SDRAM_BASE + 0x03000004;
	int* LARGO  = SDRAM_BASE + 0x03000008;
	int* ANCHO  = SDRAM_BASE + 0x0300000C;
	int* X      = SDRAM_BASE + 0x03000010;
	int* Y      = SDRAM_BASE + 0x03000014;
	int* led = LEDS_BASE;
	*led = 7;
	int* prueba = SDRAM_BASE + 0x8;


	printf("flag inicio: %d\n",*INICIO);
	printf("flag fin : %d\n",*FIN);
	printf("largo %d\n",*LARGO);
	printf("ancho %d\n",*ANCHO);
	printf("x %d\n",*X);
	printf("y %d\n",*Y);
	usleep(1000000);
  }
  return 0;
}
