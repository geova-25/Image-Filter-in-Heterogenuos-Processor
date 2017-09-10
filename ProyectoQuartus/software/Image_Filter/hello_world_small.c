#include <stdio.h>
#include <stdlib.h>
#include "sys/alt_stdio.h"
#include "../Image_Filter_bsp/system.h"
#include "unistd.h"
int main()
{ 
	int* INICIO = SDRAM_BASE + 0x03000000;
	int* FIN    = SDRAM_BASE + 0x03000004;
	int* LARGO  = SDRAM_BASE + 0x03000008;
	int* ANCHO  = SDRAM_BASE + 0x0300000C;
	int* X      = SDRAM_BASE + 0x03000010;
	int* Y      = SDRAM_BASE + 0x03000014;
	/*int* led = LEDS_BASE;
	*led = 7;
	int* prueba = SDRAM_BASE + 0x8;*/
	printf("before filter \n flag inicio: %d\n",*INICIO);
	printf("flag fin : %d\n",*FIN);
	printf("largo %d\n",*LARGO);
	printf("ancho %d\n",*ANCHO);
	printf("x %d\n",*X);
	printf("y %d\n",*Y);

	doFilter();

	printf("AfterFilter \n flag inicio: %d\n",*INICIO);
	printf("flag fin : %d\n",*FIN);
	printf("largo %d\n",*LARGO);
	printf("ancho %d\n",*ANCHO);
	printf("x %d\n",*X);
	printf("y %d\n",*Y);
	usleep(1000000);

  return 0;
}

int ancho;

int index(int x, int y)
{
  return (ancho*x) + y;
}

char pix(int x, int y)
{
	char *dir = 0x1000000 + index(x,y);
	return dir;
}
int doFilter()
{
	int* INICIO = SDRAM_BASE + 0x03000000;
	int* FIN    = SDRAM_BASE + 0x03000004;
	int* LARGO  = SDRAM_BASE + 0x03000008;
	int* ANCHO  = SDRAM_BASE + 0x0300000C;
	int* X      = SDRAM_BASE + 0x03000010;
	int* Y      = SDRAM_BASE + 0x03000014;
	void* RESULT_BASE = 0x2000000;


  	while (*INICIO != 1)
  	{
  		//printf("wating, inicio = %d \n", *INICIO);
  		usleep(10000);
  	};
  	//int *dir = 0x3000008;
	int alto = *LARGO;
	ancho = *ANCHO;
	int x_max = *X;
	int y_max = *Y;

	//aplica el filtro

	int maxh = y_max;
  	int maxw = x_max;
  	int result;
  	int final = y_max + x_max * ancho;
  	int i;
  	int j;
  	for (i = alto-2; i >= maxh; i--)
 	{
    	for (j = ancho-2; j >= 1; j--)
    	{
    		if ((j+i*ancho) >= final){
    			result = pix(i-1,j-1) + 2 * pix(i-1,j) + pix(i-1,j+1)
    					- pix(i+1,j-1) - 2 * pix(i+1,j) - pix(i+1,j+1);

      			int *dir = (int*)malloc(sizeof(int));
      			dir = RESULT_BASE  + (j-1 + (i-1) * ancho) * 4;
      			*(int*)dir = result;
      		}
      		else{
      			break;
      		}
    	}
  	}

  	*FIN = 1;
  	*INICIO = 0; //reinicia
	return 0;
}

