#include <iostream>
#include <stdlib.h>
#include <algorithm>
using namespace std;

int main() {
	int N;
	int A[1000];		// 수열 A
	int D[1000];		// 가장 긴 바이토닉 부분 수열의 길이
	int D_asc[1000];		// 가장 긴 증가하는 부분 수열의 길이
	int D_des[1000];		// 가장 긴 감소하는 부분 수열의 길이

	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> A[i];
	}
	
	for (int i = 0; i < N; i++) {
		D_asc[i] = 1;
		D_des[i] = 1;
		for (int j = 0; j < i; j++) {
			if (A[i] > A[j] && D_asc[i] < D_asc[j] + 1) {
				D_asc[i] = D_asc[j] + 1;
			}
			
		}
		D[i] = D_asc[i] + D_des[i] - 1;
	}
	for (int i = N; i >= 0; i--) {
		for (int j = N-1; j > i; j--) {
			if (A[i] > A[j] && D_des[i] < D_des[j] + 1) {
				D_des[i] = D_des[j] + 1;
			}
		}
	}
	for (int i = 0; i < N; i++) {
		D[i] = D_asc[i] + D_des[i] - 1;
	}

	cout << *max_element(D, D + N) << endl;

	system("pause");
	return 0;
}