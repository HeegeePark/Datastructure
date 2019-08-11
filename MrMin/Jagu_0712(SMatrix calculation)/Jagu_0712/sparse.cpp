#include <stdio.h>
#include <stdlib.h>
#include "sparse.h"

void smatrix::convert_to_smatrix(int n, int** mat) {
	this->n = n;
	cnt = 0;
	list = (element*)malloc(sizeof(element) * (2*n));

	// 리스트로 변환
	list[0].row = n, list[0].col = n;
	for (int i = 0; i < n; i++) {
		for (int j = 0; j < n; j++) {
			if (mat[i][j] != 0) {
				cnt++;
				list[cnt].row = i;
				list[cnt].col = j;
				list[cnt].val = mat[i][j];
			}
		}
	}
	list[0].val = cnt;

	// print list
	printf("=== List ===\n");
	printf("row col val\n");
	for (int i = 0; i < cnt + 1; i++) {
		printf("%d %d %d\n", list[i].row, list[i].col, list[i].val);
	}
	printf("\n");
	
}

void smatrix::fastTranspose(smatrix smat) {
	int i, j, numCols = smat.list[0].col, numTerms = smat.list[0].val;
	this->list = (element*)malloc(sizeof(element) * (2 * n));
	this->list[0].row = numCols; 
	this->list[0].col = smat.list[0].row;
	this->list[0].val = numTerms;

	//printf("%d %d %d\n", this->list[0].row, this->list[0].col, this->list[0].val);
	
	//error
	if (numTerms <= 0) {
		return;
	}

	//printf("numCols : %d\n", numCols);

	rowTerms = (int*)malloc(sizeof(int) * numCols);
	startPos = (int*)malloc(sizeof(int) * numCols);
	
	// rowTerm
	for (i = 0; i < numCols; i++) {
		rowTerms[i] = 0;
	}

	for (i = 1; i <= numTerms; i++) {
		//printf("list %d %d \n", i-1, smat.list[i].col);
		rowTerms[smat.list[i].col]++;
	}

	// startPos
	startPos[0] = 1;
	for (i = 1; i < numCols; i++) {
		startPos[i] = startPos[i - 1] + rowTerms[i - 1];
	}

	/*for (i = 0; i < numCols; i++) {
		printf("list %d %d \n", i, startPos[i]);
	}*/

	// fast transpose
	for (i = 1; i <= numTerms; i++)
	{
		j = startPos[smat.list[i].col]++;
		this->list[j].row = smat.list[i].col; 
		this->list[j].col = smat.list[i].row; 
		this->list[j].val = smat.list[i].val;
	}

	/*for (int i = 0; i <=numTerms ; i++) {
		printf("%d %d %d\n", list[i].row, list[i].col, list[i].val);
	}
	printf("\n");*/
	

	// print  fast tran list
	/*printf("=== tran List ===\n");
	printf("row col val\n");
	for (int i = 0; i < cnt + 1; i++) {
		printf("%d %d %d\n", list[i].row, list[i].col, list[i].val);
	}
	printf("\n");*/
	
	free(rowTerms);
	free(startPos);
}
void smatrix::fastAdd(smatrix smatA, smatrix smatB) {
	int idx_a = 0, idx_b = 0, idx_c = 0;	// 각 배열의 항목을 가리키는 인덱스
	bool is_start = true;

	this->list = (element*)malloc(sizeof(element) * (2 * smatA.n));
	
	//error
	if (smatA.list[0].row != smatB.list[0].row || 
		smatA.list[0].col != smatB.list[0].col) {
		return;
	}

	while (idx_a <= smatA.cnt && idx_b <= smatB.cnt) {
		if (is_start) {
			// C list에 행렬 정보 담기
			this->list[idx_c].row = smatA.n, list[idx_c].col = smatA.n;
			this->list[idx_c].val = 0;
			idx_c++;
			idx_a++;
			idx_b++;
			is_start = false;
		}
		else {
			// 위치값 1차원화 (for 위치 비교)
			int coor_1d_a = smatA.list[idx_a].row * smatA.n + smatA.list[idx_a].col;
			int coor_1d_b = smatB.list[idx_b].row * smatB.n + smatB.list[idx_b].col;

			// a의 값이 앞쪽일 경우, a list 값 먼저 더하기
			if (coor_1d_a < coor_1d_b) {
				this->list[idx_c++] = smatA.list[idx_a++];
			}

			// 같은 위치일 때
			else if (coor_1d_a == coor_1d_b) {
				if (smatA.list[idx_a].val + smatB.list[idx_b].val != 0) {
					this->list[idx_c].row = smatA.list[idx_a].row;
					this->list[idx_c].col = smatA.list[idx_a].col;
					this->list[idx_c++].val = smatA.list[idx_a++].val + smatB.list[idx_b++].val;
				}
				else {
					idx_a++;
					idx_b++;
				}
			}

			// b의 값이 앞쪽일 경우, b list 값 먼저 더하기
			else {
				this->list[idx_c++] = smatB.list[idx_b++];
			}
		}
	}

	this->list[0].val = idx_c - 1;
	this->cnt = this->list[0].val;
	
	// print  fast add list
	/*printf("=== Fast add List ===\n");
	printf("row col val\n");
	for (int i = 0; i <= cnt ; i++) {
		printf("%d %d %d\n", list[i].row, list[i].col, list[i].val);
	}
	printf("\n");*/
	
	free(list);
}
void smatrix::fastMult(smatrix smatA, smatrix smatB) {
	int i, j, numCols = smatA.list[0].col, numTerms = smatA.list[0].val;
	int idx_c = 0;
	int past_rowA = -1, past_colB = -1;

	this->list = (element*)malloc(sizeof(element) * (2 * smatA.n));
	
	for (int i = 1; i <= numTerms ; i++) {
		for (int j = 1; j <= numTerms; j++) {
			if (smatA.list[i].col == smatB.list[j].row) {
				
				if (smatA.list[i].row != past_rowA || smatB.list[j].col != past_colB) {
					idx_c += 1;
					list[idx_c].val = 0;
				}
				this->list[idx_c].row = smatA.list[i].row;
				this->list[idx_c].col = smatB.list[j].col;
				this->list[idx_c].val += (smatA.list[i].val) * (smatB.list[j].val);
				past_rowA = smatB.list[i].row;
				past_colB = smatB.list[j].col;				
			}
		}
	}
	this->list[0].row = numCols;
	this->list[0].col = numCols;
	this->list[0].val = idx_c;
	this->cnt = list[0].val;

	// print  fast mult list
	/*printf("=== Fast mult List ===\n");
	printf("row col val\n");
	for (int i = 0; i <= this->cnt; i++) {
		printf("%d %d %d\n", list[i].row, list[i].col, list[i].val);
	}
	printf("\n");*/

	free(list);
}