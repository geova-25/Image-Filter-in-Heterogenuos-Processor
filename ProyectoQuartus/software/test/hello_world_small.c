#include "sys/alt_stdio.h"
#include "system.h"
#include "unistd.h"
int main()
{ 
  //printf("Hello from Nios II!\n");
	char x = 'x';
  void* sdram_base =  SDRAM_BASE;
 // int* sdram_base =  SDRAM_BASE;
  int* led_base = LEDS_BASE;
  //*sdram_base = 5;
  /* Event loop never exits. */
 // while (1){
	//  alt_putstr("Hello from Nios II!\n");
	//  *sdram_base =*sdram_base + 1;
	 // *led_base = * sdram_base;
	  usleep(1000);
	  printf("-%c\n",*(char*)(sdram_base));
	  printf("-%c\n",*(char*)(sdram_base+1));
	  printf("-%c\n",*(char*)(sdram_base+2));
	  printf("-%c\n",*(char*)(sdram_base+3));
	  printf("-%c\n",*(char*)(sdram_base+4));
	  *led_base = 9;
  //}

  return 0;
}
