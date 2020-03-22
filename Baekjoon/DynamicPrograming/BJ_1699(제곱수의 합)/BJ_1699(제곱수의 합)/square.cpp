#include <iostream>
#include <stdlib.h>
#include <algorithm>
#include <math.h>
using namespace std;

int N;
int D[100001];		// 제곱수의 합으로 나타낼 때, 제곱수 항의 최소 개수
int last_t = 0;		// 마지막 항

void solution() {
	cin >> N;

	for (int i = 1; i <= N; i++) {
		D[i] = i;
		for (int j = 1; i >= pow(j, 2); j++) {
			last_t = pow(j, 2);
			if (D[i] > D[i - last_t] + 1) {		// 현재 j 기준 항 개수가 작으면 새로 초기화
				D[i] = D[i - last_t] + 1;
			}
		}
	}
	cout << D[N] << endl;
}

int main() {
	solution();
	system("pause");
	return 0;
}