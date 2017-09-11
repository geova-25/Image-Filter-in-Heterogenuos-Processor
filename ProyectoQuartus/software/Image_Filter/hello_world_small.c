#include <stdio.h>
#include <stdlib.h>
#include "sys/alt_stdio.h"
#include "../Image_Filter_bsp/system.h"
#include "unistd.h"
#include <sys/time.h>

int main()
{ 
	int* INICIO = SDRAM_BASE + 0x03000000;
	int* FIN    = SDRAM_BASE + 0x03000004;
	int* LARGO  = SDRAM_BASE + 0x03000008;
	int* ANCHO  = SDRAM_BASE + 0x0300000C;
	int* X      = SDRAM_BASE + 0x03000010;
	int* Y      = SDRAM_BASE + 0x03000014;

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

  return 0;
}

int ancho;

int index(int x, int y)
{
  return (ancho*x) + y;
}

unsigned char pix(int x, int y)
{
	unsigned char *dir = 0x1000000 + index(x,y);
	return *dir;
}

unsigned long current_timestamp() {
    struct timeval te;
    gettimeofday(&te, NULL); // get current time
    unsigned long time_in_micros = 1000000 * te.tv_sec + te.tv_usec;
    return time_in_micros;
}
int doFilter()
{
	int* INICIO 		= SDRAM_BASE + 0x03000000;
	int* FIN    		= SDRAM_BASE + 0x03000004;
	int* LARGO  		= SDRAM_BASE + 0x03000008;
	int* ANCHO  		= SDRAM_BASE + 0x0300000C;
	int* X      		= SDRAM_BASE + 0x03000010;
	int* Y      		= SDRAM_BASE + 0x03000014;
	long long* DURACION       = SDRAM_BASE + 0x03000018;

	void* RESULT_BASE 	= SDRAM_BASE + 0x2000000;

	*INICIO = 0; //reinicia
  	while (*INICIO != 1)
  	{
  		//printf("wating, inicio = %d \n", *INICIO);
  		usleep(10);
  	}
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
  	//Obtiene el valor de tiempo inicial
  	long long tiempo_inicio = current_timestamp();

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

  	//Obtiene el valor de tiempo final
  	long long tiempo_final = current_timestamp();
  	*DURACION = tiempo_final - tiempo_inicio;
  	printf("tiempo %llu \n", *DURACION);
  	*FIN = 1;
  	*INICIO = 0; //reinicia
	return 0;
}

