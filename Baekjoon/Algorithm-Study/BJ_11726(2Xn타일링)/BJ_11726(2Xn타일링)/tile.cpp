#include <iostream>
#include <stdlib.h>
using namespace std;

int tiling(int n);

int main() {
	int N;
	cin >> N;
	int tile[1000];

	//cout << tiling(N) % 10007 << endl;

	/*Bottom-up*/
	tile[0] = 1;
	tile[1] = 2;
	for (int i = 2; i < N; i++) {
		tile[i] = tile[i - 1] + tile[i - 2];
		tile[i] %= 10007;
	}
	cout << tile[N - 1] << endl;

	system("pause");
	return 0;
}

/*Top-down (이 방법대로 하면 시간초과)*/
int tiling(int n) {
	
	if (n == 1) {
		return 1;
	}
	else if (n == 2) {
		return 2;
	}
	// 피보나치원리과 같음(단, n은 3 이상)
	else {
		return tiling(n - 1) + tiling(n - 2);
	}
}