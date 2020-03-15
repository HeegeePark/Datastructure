#include <iostream>
#include <stdlib.h>
using namespace std;
#define max(a,b) (((a)>(b))?(a):(b))

int main() {
	int N;
	long d[10000][4];		// 최대 포도주 양을 저장할 다이나믹 배열([i][0]: i-1,i안마심, [][1]: i-1 X,i O, [][2]: i-1 O,i X, [][3]: i-1 O,i O)
	long wine[10000];		// wine[i] : i번째 포도주 잔의 양
	int wine_max = 0;		// 최대로 마실 수 있는 포도주의 양

	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> wine[i];
	}

	for (int i = 0; i < N; i++) {
		if (i == 0) {
			d[i][0] = 0;
			d[i][1] = wine[i];
			d[i][2] = 0;
			d[i][3] = 0;
		}
		else {
			d[i][0] = max(d[i - 1][0], d[i - 1][2]);
			d[i][1] = max(d[i - 1][0], d[i - 1][2]) + wine[i];
			d[i][2] = max(d[i - 1][1], d[i - 1][3]);
			d[i][3] = d[i - 1][1] + wine[i];		// d[i-1][3]은 i-2,i-1이 연속으로 마셨으므로 고려X
		}
	}

	for (int i = 0; i < N; i++) {
		for (int j = 0; j < 4; j++) {
			if (d[i][j] > wine_max) {
				wine_max = d[i][j];
			}
		}
	}

	cout << wine_max << endl;

	system("pause");
	return 0;
}