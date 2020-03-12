#include <iostream>
#include <stdlib.h>
#define max(a,b) (((a)>(b))?(a):(b))
using namespace std;

int main() {
	int T;
	long N;
	int scoreSum = 0;		// 최대 점수
	long**s;		// 점수저장
	long**d;		// 스티커 최대점수저장

	cin >> T;

	// 테스트케이스 반복문
	for (int i = 0; i < T; i++) {
		cin >> N;
		// 스티커점수 2차원배열(2*N)에 저장
		s = (long**)malloc(sizeof(long*) * 2);
		for (int i = 0; i < 2; i++) {
			s[i] = (long*)malloc(sizeof(long) * N);
		}
		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < N; j++) {
				cin >> s[i][j];
			}
		}

		// 스티커의 최대점수를 저장할 2차원배열(2*N) 생성
		// d[i][j] : i번째 열에서 j상태(0= 안뜯, 1= 위뜯, 2= 아래뜯)에 따른 최대점수
		d = (long**)malloc(sizeof(long*) * N);
		for (int i = 0; i < N; i++) {
			d[i] = (long*)malloc(sizeof(long) * 3);
		}
		


		// 스티커 최대 점수 구하기(다이나믹)
		for (int i = 0; i < N; i++) {
			if (i == 0) {
				d[0][0] = 0;
				d[0][1] = s[0][0];
				d[0][2] = s[1][0];
			}
			else {
				d[i][0] = max(d[i - 1][0], max(d[i - 1][1], d[i - 1][2]));
				d[i][1] = max(d[i - 1][0], d[i - 1][2]) +s[0][i];
				d[i][2] = max(d[i - 1][0], d[i - 1][1]) + s[1][i];
			}
		}

		for (int i = 0; i < N; i++) {
			for (int j = 0; j < 3; j++) {
				if (d[i][j] >=scoreSum) {
					scoreSum = d[i][j];
				}
			}
		}
		cout << scoreSum << endl;

		// 메모리 해제, 최대점수 리셋
		delete[] s;
		delete[] d;
		scoreSum = 0;
	}

	system("pause");
	return 0;
}