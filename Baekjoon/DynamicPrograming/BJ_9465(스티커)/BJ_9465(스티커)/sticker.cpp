#include <iostream>
#include <stdlib.h>
using namespace std;

int main() {
	int T;
	long N;
	int scoreSum = 0;		// 최대 점수
	long**s;		// 점수저장
	long**d;		// 스티커 사용여부저장

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

		// 탐색 및 선택 여부를 저장할 2차원배열(2*N) 생성하고 0(스티커를 뜯지않음)으로 초기화
		d = (long**)malloc(sizeof(long*) * 2);
		for (int i = 0; i < 2; i++) {
			d[i] = (long*)malloc(sizeof(long) * N);
		}
		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < N; j++) {
				d[i][j] = { 0 };
			}
		}


		// 스티커 최대 점수 구하기(다이나믹)
		for (int i = 0; i < 2; i++) {
			// 첫번째 행
			if (i == 0) {
				for (int j = 0; j < N; j++) {
					if (j == 0) {		// 처음에는 뜯고 시작하기
						d[i][j] = 1;
					}
					if (s[i][j] > s[i][j - 1]) {		// 현재 스티커점수가 좌측 스티커점수보다 클 때
						d[i][j] = 1;
						d[i][j - 1] = 0;
					}
				}
			}

			// 두번째 행 (첫번째 행을 고려하며 탐색)
			else {
				for (int j = 0; j < N; j++) {
					if (d[i - 1][j] == 1) {		// 위로 인접한 스티커가 뜯어져있을 때
						if (s[i][j] > s[i - 1][j]) {		// 점수는 현재 스티커가 높을 때 => 위 스티커 0, 현재 스티커 1
							d[i][j] = 1;
							d[i - 1][j] = 0;
						}
					}
					else {		// 위 스티커를 안뜯었다면 현재 스티커 뜯고 이전 스티커랑도 점수 비교
						if (j == 0) d[i][j] = 1;
						else {
							if (s[i][j] > s[i][j - 1]) {		// 현재 스티커점수가 좌측 스티커점수보다 클 때
								d[i][j] = 1;
								d[i][j - 1] = 0;
							}
						}
					}
				}
			}
		}

		for (int i = 0; i < 2; i++) {
			for (int j = 0; j < N; j++) {
				if (d[i][j] == 1) {
					scoreSum += s[i][j];
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