
#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h> //mmap
#include <stdlib.h>
#include "mapDriver.h"

void* getVirtualBase ()
{	
	int fd;
	void* virtual_base;
	fd=open("/dev/mem",(O_RDWR|O_SYNC));	
	virtual_base=mmap(NULL,REG_SPAN,(PROT_READ|PROT_WRITE),MAP_SHARED,fd,REG_BASE);
	return virtual_base;
}

void writeToSDRAM(char* character , int index)
{
	char* sdram_addr;
	sdram_addr = getVirtualBase() + SDRAM_BASE + index;
	*sdram_addr = *character;
}

char* getImageFromSRAM(int image_size)
{
	
	char* sdram_addr = getVirtualBase() + SDRAM_BASE;
	char* buffer = malloc(image_size*sizeof(char));
	int i;
	for(i=0; i< image_size; i = i +1)
	{

		buffer[i] = *(sdram_addr + i); 
	}
	return buffer;
	
}

void *writeToLeds( void* character)
{
	void* led_addr;
	led_addr = getVirtualBase () + LED_BASE;
	*(char*)led_addr = *(char*)character;
}
 
int main ()
{
	int fd;
	void* virtual_base;
	fd=open("/dev/mem",(O_RDWR|O_SYNC));	
	virtual_base=mmap(NULL,REG_SPAN,(PROT_READ|PROT_WRITE),MAP_SHARED,fd,REG_BASE);
	void* led_addr;
	void* sdram_addr;
	led_addr=virtual_base + LED_BASE;
	sdram_addr = virtual_base + SDRAM_BASE;
	*(int*) sdram_addr = 8;
	*(int*)led_addr=*(int*)sdram_addr; 
	usleep(1000);
	printf("%d\n",*(int*)led_addr);
	return 0;

}
