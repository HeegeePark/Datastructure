#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <stdlib.h>
using namespace std;

int main() {
	string S;
	vector<string> Suffixs;		// vector 형태의 접미사 배열
	string suffix;		// 접미사

	cin >> S;

	// Suffix라는 접미사 배열에 모든 접미사 삽입
	for (int i = 0; i < S.length(); i++) {
		for (int j = i; j < S.length(); j++) {
			suffix.push_back(S[j]);
		}
		Suffixs.push_back(suffix);
		suffix.clear();
	}

	// 접미사들을 알파벳순(사전순)으로 정렬
	sort(Suffixs.begin(), Suffixs.end());

	// 사전순으로 정렬된 접미사 출력
	for (int i = 0; i < Suffixs.size(); i++) {
		cout << Suffixs[i] << endl;
	}

	system("pause");
	return 0;
}