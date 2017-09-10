
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h> //mmap
#include <stdlib.h>
#include "mapDriver.h"


void* virtual_base;
int first = 1;

void* getVirtualBase ()
{
	if(first)
	{
		first = 0;
		int fd;
		virtual_base= malloc(sizeof(void));
		fd=open("/dev/mem",(O_RDWR|O_SYNC));
		virtual_base=mmap(NULL,REG_SPAN,(PROT_READ|PROT_WRITE),MAP_SHARED,fd,REG_BASE);
	}
	return virtual_base;
}

void writeToSDRAM(char* character , int index)
{
	char* sdram_addr;
	sdram_addr = getVirtualBase() + SDRAM_BASE+ index;
	//printf("character: %c , index: %d   \n",*character,index);
	//printf("pointer: %p\n", sdram_addr);
	*(sdram_addr) = *character;
}

void writeToSDRAM_int(int* character , int index)
{
	void* sdram_addr;
	sdram_addr = getVirtualBase() + SDRAM_BASE+ index;
	//printf("character: %c , index: %d   \n",*character,index);
	//printf("pointer: %p\n", sdram_addr);
	*(int*)(sdram_addr) = *character;
}



int* getImageFromSDRAM(int image_size)
{
	void* sdram_addr = getVirtualBase() + SDRAM_BASE + BASE_COPY_IMG_SDRAM;
	int* buffer = (int*) malloc(image_size);
	int j =0;
	while(j < image_size){
		buffer[j] = *(int*)(sdram_addr + j*4);
		j++;
	}

	return buffer;
}

int* getIntFromSDRAM(int position)
{
	
	void * sdram_addr =  getVirtualBase() + SDRAM_BASE;
	

	return (int*)(sdram_addr+ position);
}

void *writeToLeds( void* character)
{
	void* led_addr;
	led_addr = getVirtualBase() + LED_BASE;
	*(char*)led_addr = *(char*)character;
}

