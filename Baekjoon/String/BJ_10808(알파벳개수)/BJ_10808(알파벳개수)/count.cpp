#include <iostream>
#include <string.h>
using namespace std;

int main() {
	char S[100];	// 단어를 담을 문자열
	int cnt_S[26] = { 0 };		// 문자열의 해당 알파벳 개수를 담을 정수형 배열
		
	cin >> S;

	// 알파벳 개수 세기
	for (int i = 0; S[i] != NULL; i++) {
		cnt_S[S[i] - 97]++;		// 'a' = 97
	}

	// 출력
	for (int i = 0; i < sizeof(cnt_S)/sizeof(int); i++) {
		cout << cnt_S[i] << " ";
	}

	return 0;
}