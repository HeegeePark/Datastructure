#include <iostream>
#include <stdlib.h>
#include <algorithm>
using namespace std;

int N;
int A[100000];		// 수열 A
int D[100000];		// 연속된 가장 큰 합

void input() {
	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> A[i];
	}
}

void solution() {
	D[0] = A[0];
	for (int i = 1; i < N; i++) {
		if (A[i] < D[i - 1] + A[i]) {
			D[i] = D[i - 1] + A[i];
		}
		else {
			D[i] = A[i];
		}
	}
	cout << *max_element(D, D + N) << endl;
}

int main() {
	input();
	solution();
	
	system("pause");
	return 0;
}