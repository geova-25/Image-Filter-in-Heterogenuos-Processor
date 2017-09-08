
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
	printf("character: %c , index: %d   \n",*character,index);
	printf("pointer: %p\n", sdram_addr);
	*(sdram_addr) = *character;
}


char* getImageFromSDRAM(int image_size)
{
	void* sdram_addr = getVirtualBase() + SDRAM_BASE;
	char* buffer = (char*) calloc(image_size,sizeof(char));
	int j =0;
	int i = 0;
	while(j < image_size){
	//if(*(char*)(sdram_addr + j) == '\0' )
	//	{
	//	break;
	//	}
		printf("j: %d\n",j);
		printf("char : %c\n",*(char*)(sdram_addr + j));
		buffer[j] = *(char*)(sdram_addr + j);
		j++;
	}

	return buffer;
}

void *writeToLeds( void* character)
{
	void* led_addr;
	led_addr = getVirtualBase() + LED_BASE;
	*(char*)led_addr = *(char*)character;
}

int main ()
{
	getVirtualBase();
	void* ptr_char0 = malloc(1);
	void* ptr_char1 = malloc(1);
	void* ptr_char2 = malloc(1);
	void* ptr_char3 = malloc(1);
	void* ptr_char4 = malloc(1);
	*(char*)ptr_char0 = 'a';
	*(char*)ptr_char1 = 'b';
	*(char*)ptr_char2 = 'c';
	*(char*)ptr_char3 = 'd';
	*(char*)ptr_char4 = 'e';
	writeToSDRAM(ptr_char0,8);
	writeToSDRAM(ptr_char1,9);
	writeToSDRAM(ptr_char2,10);
        writeToSDRAM(ptr_char3,11);
	writeToSDRAM(ptr_char4,12);
	char* result = getImageFromSDRAM(13);
	//printf("%c,",  result[0]);
	//printf("%c,",  result[1]);
	//printf("%c,",  result[2]);
	void* num = malloc(1) ;
	*(char*)num = 0xAA;
	writeToLeds(num);
	return 0;

}
