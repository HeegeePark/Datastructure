#include <iostream>
#include <stdlib.h>
#include <vector>
#include <algorithm>
using namespace std;

int main() {
	int N;
	int A[1000];		// 수열
	int d[1000];		// 가장 긴 수열 길이를 저장하는 다이나믹 벡터 배열
	vector<int> temp;		// max를 찾을 temp 벡터
	int len_max = 0;

	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> A[i];
	}

	d[0] = 1;
	if (A[1] > A[0]) d[1] = 2; else d[1] = 1;
	for (int i = 2; i < N; i++) {
		// 0~ i-1 사이 수열 중 i번째 수열이 더 큰 경우의 다이나믹 중 최대에 1더하기
		for (int j = 0; j < i; j++) {
			if (A[i] > A[j]) {
				temp.push_back(d[j]);
			}
		}
		if (!temp.empty()) {
			d[i] = *max_element(temp.begin(), temp.end()) + 1;		// *max_element : 벡터 속 최대값을 찾아내는 함수
			temp.clear();
		}
		else d[i] = 1;
	}

	cout << *max_element(d,d+N) << endl;
	
	system("pause");
	return 0;
}