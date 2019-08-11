#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include "sparse.h"
#include <time.h>

int n;
int** matA;
int** matB;
int** matC;

smatrix smatA;
smatrix smatB;
smatrix smatC;
smatrix smatBT;

extern void load(FILE* fpA, FILE* fpB);
extern int** transpose(int n, int** mat);
extern int** add(int n, int** matA, int** matB);
extern int** multiply(int n, int** matA, int** matB);

int main() {
	// 1. load 
	FILE* fpA = fopen("matA\\matA_k.txt", "r+t");
	FILE* fpB = fopen("matB\\matB_k.txt", "r+t");

	clock_t tik, tok;


	// matA와 matB에 행렬이 저장
	tik = clock();
	load(fpA, fpB);
	tok = clock();
	printf("Loading: %f\n", (float)(tok - tik) );
	   	
	// matA --> smatA, matB --> smatB
	tik = clock();
	smatA.convert_to_smatrix(n, matA);
	smatB.convert_to_smatrix(n, matB);
	tok = clock();
	printf("Convert to smatrix: %f\n", (float)(tok - tik) / CLOCKS_PER_SEC);

	// 2. transpose
		// 2.1 ordinary transpose

	tik = clock();
	matC = transpose(n, matA);
	tok = clock();
	printf("Transpose: %f\n", (float)(tok - tik) / CLOCKS_PER_SEC);
	
	

		// 2.2 fast transpose

	tik = clock();
	smatBT.fastTranspose(smatB);
	tok = clock();
	printf("Fast Transpose: %f\n", (float)(tok - tik) / CLOCKS_PER_SEC);

	// 3. add
		// 3.1 ordinary add
	
	tik = clock();
	matC = add(n, matA, matB);
	tok = clock();
	printf("Add: %f\n", (float)(tok - tik) / CLOCKS_PER_SEC);

		// 3.2 fast add
	
	tik = clock();
	smatC.fastAdd(smatA, smatB);
	tok = clock();
	printf("Fast Add: %f\n", (float)(tok - tik) / CLOCKS_PER_SEC);

	// 4. multiply
		// 4.1 ordinary multiply
	
	tik = clock();
	matC = multiply(n, matA, matB);
	tok = clock();
	printf("Multiply: %f\n", (float)(tok - tik) / CLOCKS_PER_SEC);

		// 4.2 fast multiply

	tik = clock();
	smatC.fastMult(smatA, smatB);
	tok = clock();
	printf("Fast Multiply: %f\n", (float)(tok - tik) / CLOCKS_PER_SEC);
	
	system("pause");
	return 0;
}



