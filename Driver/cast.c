#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>


int main ()
{
	int entero = 113;
	char* ptr_char = malloc(sizeof(char));
	*ptr_char = (char)entero;
	printf("Entero: %d, Char: %c \n ",entero, *ptr_char);

}
