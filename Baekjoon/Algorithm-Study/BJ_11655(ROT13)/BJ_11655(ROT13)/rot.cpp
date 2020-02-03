#include <iostream>
#include <string>
#include <stdlib.h>
using namespace std;

int main() {
	string S;
	int rot;
	getline(cin, S);
	
	for (int i = 0; i < S.length(); i++) {
		if (S[i] > 64 && S[i] < 91) {	// 대문자인 경우
			rot = S[i] + 13;
			if (rot >= 91) rot -= 26;
			S[i] = rot;
		}
		if (S[i] > 96 && S[i] < 123) {	// 소문자인 경우
			rot = S[i] + 13;
			if (rot >= 123) rot -= 26;
			S[i] = rot;
		}
	}

	cout << S << endl;

	//system("pause");
	return 0;
}