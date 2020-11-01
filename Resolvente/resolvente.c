#include <stdio.h>
#include <stdlib.h>

extern void CMAIN(float a, float b, float c);

int main()
{
	float a;
	float b;
	float c;

	printf("Introduzca el valor de a \n");
	scanf("%f", &a);
	printf("Introduzca el valor de b \n");
	scanf("%f", &b);
	printf("Introduzca el valor de c \n");
	scanf("%f", &c);

	CMAIN(a, b, c);
	
	return 0;
}

// nasm -f elf32 resolvente.asm -o resolvente.o
// gcc -m32 -o resolvente  resolvente.o resolvente.c  
// ./resolvente
