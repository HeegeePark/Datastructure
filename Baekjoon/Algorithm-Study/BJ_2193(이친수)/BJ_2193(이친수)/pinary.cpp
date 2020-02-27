#include <iostream>
#include <stdlib.h>
using namespace std;

// 이친수 규칙
// 1. 0으로 시작하지 않는다.
// 2. 1이 두 번 연속으로 일어나지 않는다.

int main() {
	int N;
	long piNum = 0;
	
	cin >> N;
	
	// N 길이를 가진 이친수 배열 할당 및 초기화 (long으로 초기화하는것 중요!)
	long**binum = (long**)malloc(sizeof(long*)*N);
	for (int i = 0; i < N; i++) {
		binum[i] = (long*)malloc(sizeof(long) * 2);
		for (int j = 0; j < 2; j++) {
			binum[i][j] = { 0 };
		}
	}

	// 이친수 개수 구하기
	for (int i = 0; i < N; i++) {
		// N이 한자리 수
		if (i == 0) {
			binum[i][1] = 1;
		}
		else {
			for (int j = 0; j < 2; j++) {
				if (j == 0) binum[i][j] = binum[i - 1][0] + binum[i - 1][1];
				if (j == 1) binum[i][j] = binum[i - 1][0];
			}
		}
	}

	// 이친수 출력
	for (int i = 0; i < 2; i++) {
		piNum += binum[N - 1][i];
	}
	cout << piNum << endl;

	free(binum);
	system("pause");
	return 0;
}