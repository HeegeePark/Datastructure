#include <iostream>
#include <stdlib.h>
using namespace std;

int main() {
	int N;
	long long ascendNum = 0;		// 오르막수
	long long mod = 10007;		// 나머지 연산 수
	cin >> N;

	// 길이가 N인 자릿수별 오르막수를 저장할 배열 할당 및 초기화
	long long**a = (long long**)malloc(sizeof(long long*)*N);
	for (int i = 0; i < N; i++) {
		a[i] = (long long*)malloc(sizeof(long long) * 10);
		for (int j = 0; j < 10; j++) {
			a[i][j] = { 0 };
		}
	}
	
	// 오르막수 구하기
	for (int i = 0; i < N; i++) {
		if (i == 0) {		// N이 한자리 수 일때 => 무조건 1(1 ~ 9)
			for (int j = 0; j < 10; j++) {
				a[i][j] = 1;
			}
		}

		else {		// N이 두자리 수 이상일 때
			for (int j = 0; j < 10; j++) {		// j를 기준으로 Top-Down으로 자릿수별 오르막수 구하기
				for (int k = 0; k <= j; k++) {
					a[i][j] += a[i - 1][k];
				}
				a[i][j] %= mod;
			}
		}
	}

	// N 길이의 오름차수를 구하고, 10,007으로 나눈 나머지로 초기화 후 출력
	for (int i = 0; i < 10; i++) {
		ascendNum += a[N - 1][i];

	}
	ascendNum %= mod;

	cout << ascendNum << endl;

	system("pause");
	return 0;
}