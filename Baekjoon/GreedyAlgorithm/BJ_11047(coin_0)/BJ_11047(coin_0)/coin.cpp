#include <iostream>
using namespace std;

int main() {
	int N, K = 0;
	int mincoin = 0;
	cin >> N >> K;

	int* A = new int[N]();
	for (int i = 0; i < N; i++) {
		cin >> A[i];
	}

	for (int i = N - 1; i >=0 ; i--) {
		if (K >= A[i]) {
			mincoin += K / A[i];
			K %= A[i];
		}
	}

	cout << mincoin;

	delete A;
	A = NULL;

	return 0;
}