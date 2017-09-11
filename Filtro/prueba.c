// ----------------------------------------	//
//											//
//        Código del hard processor       	//
//											//
//    Instituto Tecnológico de Costa Rica	//
//       Fecha: 11 de septiembre, 2017		//
//				 Versión 1.0				//	
//											//
// Incluye las funciones para coordinar a  	//
// los procesadores, además del filtro que	//
// aplica el procesador ARM y el mapeo a la //
// imagen final.							// 
//											//
// ----------------------------------------	//

// Importar las bibliotecas necesarias para el código
#include <stdio.h>
#include <stdlib.h>
#include "mapDriver.h"
#include <sys/time.h>



unsigned long current_timestamp() {
    struct timeval te; 
    gettimeofday(&te, NULL); // get current time
    unsigned long time_in_micros = 1000000 * te.tv_sec + te.tv_usec;
    return time_in_micros;
}

/**
 * Obtiene el porcentaje de la imagen que se le va asignar al procesador del NIOS
 * @return valor
 */
int get_porcen_Nios(){
	int valor;
	printf("Inserte el porcentaje que debe realiza el procesador del NIOS: ");
	scanf("%d",&valor);
	return valor;
}

/**
 * Obtiene el ancho de la imagen que se va a cargar
 * @return valor
 */
int get_anchoImage(){
	int valor;
	printf("Inserte el ancho de la imagen que cargo: ");
	scanf("%d",&valor);
	return valor;
}

/**
 * Obtiene el alto de la imagen que se va a cargar
 * @return valor
 */
int get_altoImage(){
	int valor;
	printf("Inserte el alto de la imagen que cargo: ");
	scanf("%d",&valor);
	return valor;
}

/**
 * Funcion en la cual se encarga de obtener la fila donde tiene que finalizar
 * el procesador del NIOS
 * @param  valor_Arm El porcentaje del procesador ARM 
 * @param  filas     Las filas de la imagen
 * @param  columnas  Las columnas de la imagen 
 * @return           retorna el valor de la fila
 */
int get_Fila(int valor_Arm, int filas, int columnas){
	
	int pixeles = filas * columnas;
	int final = (pixeles *valor_Arm)/100;
	return final/columnas;
}

/**
 * Funcion en la cual se encarga de obtener la columna donde tiene que finalizar
 * el procesador del NIOS
 * @param  valor_Arm    El porcentaje del procesador ARM 
 * @param  filas        Las filas de la imagen
 * @param  columnas     columnas  Las columnas de la imagen 
 * @param  filas_nuevas La fila donde termina el procesador NIOS
 * @return              retorna la columna
 */
int get_Columna(int valor_Arm, int filas, int columnas, int filas_nuevas){

	int pixeles = filas * columnas;
	int final = (pixeles *valor_Arm)/100;
	return (final- (filas_nuevas*columnas)); 
}

/*
 * Función que abre la imagen original, distribuye el procesamiento que
 * se va a realizar, envía las variables al procesador NIOS, ejecuta el 
 * filtro y calcula el tiempo de ejecución. Después vuelve a armar la 
 * imagen y la mapea a valores de 0-255
 */
int main(int argc, char** argv)
{
	//int ancho = 256, alto = 256;

	char nombre [10];
	printf("Inserte el nombre de la imagen a cargar con la extencion: ");
	scanf("%s",&nombre);

	FILE * imagen_con;
	imagen_con = fopen(nombre,"r+"); //Se abre el archivo original
	if(imagen_con == NULL) 
  	{
    	printf("Error abriendo archivo");
    	return 1;
  	}

  	//Se solicita las dimenciones de la imagen 
  	int ancho = get_anchoImage();
  	int alto = get_altoImage();
  	

  	char lista[alto][ancho];                      //Crea la imagen como una matriz
	fread(lista, sizeof(lista), 1, imagen_con);   //lee la imagen y se lo asigna a la matriz
	fclose(imagen_con);							  //cierra el archivo de la imagen
	
	//pasa la imagen por medio del driver a la memoria de la fpga
	int i = 0;
	int j = 0;
	for (i = 0; i < alto; i++)
	{
		for (j = 0; j < ancho; j++)
		{
			char * aux = (char *)malloc(sizeof(char));
			*aux = lista[i][j];
			writeToSDRAM( aux, i*ancho+j+ BASE_ORIG_IMG_SDRAM);
			//printf("el valor es: %d\n", lista[i][j]+128);
		}
		
	}


	//envio de valores constantes a la memoria 
	int * inicio_NIOS = (int *)malloc(sizeof(int));
	int * fin_NIOS = (int *)malloc(sizeof(int));
	int * alto_aux = (int *)malloc(sizeof(int));
	int * ancho_aux = (int *)malloc(sizeof(int));
	int * x_NIOS = (int *)malloc(sizeof(int));
	int * y_NIOS = (int *)malloc(sizeof(int));
	 
	*inicio_NIOS = 0;
	*fin_NIOS = 0;
	*alto_aux = alto;
	*ancho_aux = ancho;
	 

	writeToSDRAM_int(inicio_NIOS, INICIO_DIR);
	writeToSDRAM_int(fin_NIOS, FIN_DIR);
	writeToSDRAM_int(alto_aux, LARGO_DIR);
	writeToSDRAM_int(ancho_aux, ANCHO_DIR);



	int imgf[alto-2][ancho-2];			// se crea una matriz para la imagen nueva
	// se asegura que contenga los valores en 0
	for(i=0;i<alto-2;i++){
		for (j = 0; j < ancho-2; j++)
		{
			imgf[i][j]=0;
		}
	}

	// Obtiene el porcentaje para el NIOS y para el ARM
	int valor_Nios = get_porcen_Nios();
	int valor_Arm   = 100 - valor_Nios;

	// Obtiene la posición del último pixel que filtra el ARM
	int maximo_Fil_ARM = get_Fila(valor_Arm, alto, ancho);
	int maximo_Col_ARM = get_Columna(valor_Arm, alto, ancho, maximo_Fil_ARM);

	*x_NIOS = maximo_Fil_ARM;
	*y_NIOS = maximo_Col_ARM;

	writeToSDRAM_int(x_NIOS, X_DIR );
	writeToSDRAM_int(y_NIOS, Y_DIR );


	//Se inicia el filtro de la imagen 
	int final = ((alto*ancho) *valor_Arm)/100;
	int maxh = maximo_Fil_ARM;
  	int maxw = ancho - 1;
  	int result;
  	*inicio_NIOS = 1;
  	writeToSDRAM_int(inicio_NIOS, INICIO_DIR );

	//Obtiene el valor de tiempo inicial
	unsigned long tiempo_inicio = current_timestamp();

  	for (i = 1; i < maxh; i++)
 	{
    	for (j = 1; j < maxw; j++)
    	{
    		if ((j+i*ancho) <= final){
      			result = lista[i-1][j-1] + 2 * lista[i-1][j] + lista[i-1][j+1] - lista[i+1][j-1] - 2 * lista[i+1][j] - lista[i+1][j+1];
      			imgf[i-1][j-1] = result;

      		}
      		else{
      			break;
      		}
    	}
  	}


	//Obtiene el valor de tiempo final
	unsigned long tiempo_final = current_timestamp();
	
	// Obtiene la duración de la ejecución
	unsigned long duracion = tiempo_final - tiempo_inicio;
	
	printf("El tiempo que duró el procesador ARM es %lu milisegundos\n", duracion);
	
	*fin_NIOS = *getIntFromSDRAM(FIN_DIR);
	while(*fin_NIOS != 1)
	{	*fin_NIOS = *getIntFromSDRAM(FIN_DIR);
		//printf("wating nios: %d \n", *fin_NIOS);
		//printf("ancho %d\n",*getIntFromSDRAM( ANCHO_DIR));
	
	} //Espera aque el NIOS termine
	unsigned long duracion_nios = *getIntFromSDRAM(DURACION_DIR);
	printf("El tiempo que duró el procesador NIOS es %lu milisegundos\n", duracion_nios);
	*fin_NIOS = 0;
	writeToSDRAM_int(fin_NIOS,FIN_DIR);
	

	// Se une la imagen del NIOS con la del ARM
	int* bufer = getImageFromSDRAM(0x1000000);
	for (i = alto-2; i >= maxh; i--)
 	{
	    	for (j = ancho-2; j >= 1; j--)
	    	{
	    		if ((j+i*ancho) >= final)
			{   			
	      			int dir = (j-1 + (i-1) * ancho);
					
	      			imgf[i-1][j-1] = bufer[dir];
	      		}
	      		else{
	      			break;
	      		}
	    	}
  	}
	
	
	
  	//Se mapea la imagen 
  	
  	int h = alto-2;
	int w = ancho-2;
	int max = imgf[0][0];
  	int min = max;
  	for (i = 0; i < h; i++)
  	{
    	for (j = 0; j < w; j++)
    	{
      		int num = imgf[i][j];
      		max = (num > max)? num:max;
      		min = (num < min)? num:min;
    	}
  	}
  	printf("max = %d, min = %d \n", max, min);
  	for (i = 0; i < h; i++)
  	{
    	for (j = 0; j < w; j++)
    	{
      		int num = imgf[i][j];
      		imgf[i][j] = ((num - min) * 255) / (max - min);
    	}
  	}
  	
  	// Convierte la imagen de int a char para reducir el tamaño
	char numf[alto-2][ancho-2];
  
	  for (i = 0; i < alto-2; i++)
	  {
	    for (j = 0; j < ancho-2; j++)
	    {
	      numf[i][j] = imgf[i][j];
	    }
	  }


	// Almacena la imagen final
  	FILE * imagen_Final;
  	imagen_Final = fopen("final.data", "w+");

  	fwrite(numf,sizeof(numf),1, imagen_Final );
  	fclose(imagen_Final);



 return 0;
}
