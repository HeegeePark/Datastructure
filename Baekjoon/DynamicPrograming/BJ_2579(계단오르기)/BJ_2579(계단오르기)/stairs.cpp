#include <iostream>
#include <stdlib.h>
using namespace std;
#define max(a,b) (((a)>(b))?(a):(b))

int main() {
	int N;
	long stairs[300];		// 계단의 점수
	long d[300];		// 계단의 최대점수 합 다이나믹 배열

	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> stairs[i];
	}

	d[0]= stairs[0];
	d[1] = d[0] + stairs[1];
	d[2] = max(d[0] + stairs[2], stairs[1] + stairs[2]);
	for (int i = 3; i < N; i++) {
		d[i] = max(
			d[i - 2] + stairs[i],		// 첫번째로 연속할 경우
			d[i - 3] + stairs[i - 1] + stairs[i]		// 두번째로 연속할 경우
		);
	}
	
	cout << d[N-1] << endl;		// 마지막 계단을 꼭 밟아야 하므로 최대점수 합 = d[N-1]
	
	system("pause");
	return 0;
}
