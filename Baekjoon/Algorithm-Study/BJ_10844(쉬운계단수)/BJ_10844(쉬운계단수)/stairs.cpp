#include <iostream>
#include <stdlib.h>
#include <math.h>
using namespace std;

int main() {
	int N;
	long long ezStairs = 0;		// 계단수
	long long mod = 1000000000;		// 나머지 연산 수

	cin >> N;

	// N만큼의 길이를 가진 자릿수별 메모리 할당 및 0으로 초기화
	long long**stairs = (long long**)malloc(sizeof(long long*)*N);
	for (int i = 0; i < N; i++) {
		stairs[i] = (long long*)malloc(sizeof(long long) * 10);
		for (int j = 0; j < 10; j++) {
			stairs[i][j] = { 0 };
		}
	}

	// 계단수 구하기
	for (int i = 0; i < N; i++) {
		if (i == 0) {		// N이 한자리 수 일때 => 무조건 1(1 ~ 9)
			for (int j = 1; j < 10; j++) {
				stairs[i][j] = 1;
			}
		}
		
		else {		// N이 두자리 수 이상일 때
			for (int j = 0; j < 10; j++) {		// j를 기준으로 Top-Down으로 자릿수별 계단수 구하기
				if (j == 0) stairs[i][j] = stairs[i - 1][1] % mod;
				else if (j == 9) stairs[i][j] = stairs[i - 1][8] % mod;
				else stairs[i][j] = stairs[i - 1][j - 1] + stairs[i - 1][j + 1] % mod;
			}
		}
	}
		
	// N 길이의 쉬운계단수를 구하고, 1,000,000,000으로 나눈 나머지로 초기화 후 출력
	for (int i = 0; i < 10; i++) {
		ezStairs += stairs[N - 1][i];

	}
	ezStairs %= mod;

	cout << ezStairs << endl;	

	free(stairs);
	system("pause");
	return 0;
}