#include <iostream>
#include <string>
//#include <string.h>
using namespace std;

int main() {
	string S = "";
	int alp;

	cin >> S;	

	for (int i = 0; i < 26; i++) {
		alp = i + 97;
		if (S.find(alp) != string::npos) {		// 존재하는 경우
			cout << S.find(alp) << " ";		// 'a'=97
		}else {
			cout << -1 << " ";		// 'a'=97
		}
	}

 	return 0;
}
