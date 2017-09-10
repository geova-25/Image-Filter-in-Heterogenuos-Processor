
#include <stdio.h>
//#include <iostream>
#include <stdlib.h>
#include "mapDriver.h"
#include <sys/time.h>



unsigned long current_timestamp() {
    struct timeval te; 
    gettimeofday(&te, NULL); // get current time
    unsigned long time_in_micros = 1000000 * te.tv_sec + te.tv_usec;
    return time_in_micros;
}

//sing namespace std;

/*int index(int x, int y, int h)
{
  return (h*x) + y;
}*/



/*cv::Mat carga_convierte_imagen (){
	cv::Mat imagen;
	imagen=cv::imread("p3.jpg");
	cv::Mat gris;
	cvtColor(imagen, gris, cv::COLOR_BGR2GRAY);
	return gris;
}*/

int get_porcen_Nios(){
	int valor;
	printf("Inserte el porcentaje que debe realiza el procesador del NIOS: ");
	//cout << "Inserte el porcentaje que debe realiza el procesador del NIOS: "<< endl;
	scanf("%d",&valor);

	return valor;
}

int get_Fila(int valor_Arm, int filas, int columnas){
	
	int pixeles = filas * columnas;
	int final = (pixeles *valor_Arm)/100;
	return final/columnas;
}

int get_Columna(int valor_Arm, int filas, int columnas, int filas_nuevas){

	int pixeles = filas * columnas;
	int final = (pixeles *valor_Arm)/100;
	return (final- (filas_nuevas*columnas)); 
}

int main(int argc, char** argv)
{
	int ancho = 256, alto = 256;


	FILE * imagen_con;
	imagen_con = fopen("original.data","r+"); //Se abre el archivo original
	if(imagen_con == NULL) 
  	{
    	printf("Error abriendo archivo");
    	return 1;
  	}

  	
  	char lista[alto][ancho];


	fread(lista, sizeof(lista), 1, imagen_con);
	//fscanf(imagen_con, "%c" ,lista);
	


	fclose(imagen_con);
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


	//envio de valores constantes
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


	int imgf[alto-2][ancho-2];

	for(i=0;i<alto-2;i++){
		for (j = 0; j < ancho-2; j++)
		{
			imgf[i][j]=0;
		}
	}


	
	
	//aplica el porcentaje del nios
	//printf("filas: %s\n",alto);
	//printf("columnas: %s\n",ancho);
	//cout << "filas: "<< alto<<endl;
	//cout << "columnas: "<< ancho<<endl;

	int valor_Nios = get_porcen_Nios();
	int valor_Arm   = 100 - valor_Nios;

	//printf("valor nios: %s\n",valor_Nios);
	//printf("valor arm: %s\n",valor_Arm);

	//cout << "valor nios: "<< valor_Nios<<endl;
	//cout << "valor arm: "<< valor_Arm<<endl;

	int maximo_Fil_ARM = get_Fila(valor_Arm, alto, ancho);
	int maximo_Col_ARM = get_Columna(valor_Arm, alto, ancho, maximo_Fil_ARM);

	*x_NIOS = maximo_Fil_ARM;
	*y_NIOS = maximo_Col_ARM;

	writeToSDRAM_int(x_NIOS, X_DIR );
	writeToSDRAM_int(y_NIOS, Y_DIR );


	//printf("Maximo fil arm: %s\n",maximo_Fil_ARM);
	//printf("Maximo col arm: %s\n",maximo_Col_ARM);

	//cout << "Maximo fil arm: "<< maximo_Fil_ARM<<endl;
	//cout << "Maximo col arm: "<< maximo_Col_ARM<<endl;

	//printf("el x nios: %s\n",*x_NIOS);
	//printf("el y nios: %s\n",*y_NIOS);
	//cout << "el x nios: "<< *x_NIOS<<endl;
	//cout << "el y nios: "<< *y_NIOS<<endl;


	//Obtiene el valor de tiempo inicial
	unsigned long tiempo_inicio = current_timestamp();


	//aplica el filtro
	
	int final = ((alto*ancho) *valor_Arm)/100;
	int maxh = maximo_Fil_ARM;
  	int maxw = ancho - 1;
  	int result;
  	*inicio_NIOS = 1;
  	writeToSDRAM_int(inicio_NIOS, INICIO_DIR );
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
      		//cout << "los resutados son: "<<imgf[i-1][j-1]<< endl;
    	}
  	}


	//Obtiene el valor de tiempo final
	unsigned long tiempo_final = current_timestamp();
	
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
	
	
	
  	// se mapea la imagen 
  	
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
  	


  	/*for (i = 0; i < alto-2; ++i)
	{
		for (j = 0; j < ancho-2; j++)
  		{
  			printf("el valor del pixel es: %d\n", imgf[i][j]+128);
  		}
		
	}*/

	char numf[alto-2][ancho-2];
  
	  for (i = 0; i < alto-2; i++)
	  {
	    for (j = 0; j < ancho-2; j++)
	    {
	      numf[i][j] = imgf[i][j];
	    }
	  }


  	FILE * imagen_Final;
  	imagen_Final = fopen("final.data", "w+");

  	fwrite(numf,sizeof(numf),1, imagen_Final );
  	fclose(imagen_Final);



 return 0;
}
