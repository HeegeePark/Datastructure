#include <iostream>
#include <string>
using namespace std;

//소문자, 대문자, 숫자, 공백의 개수 구하기
int main() {
	string S;
	int small = 0;
	int big = 0;
	int number = 0;
	int space = 0;
	
	while (getline(cin, S)) {
		for (int i = 0; S[i]!=NULL; i++) {
			if (S[i] > 47 && S[i] < 58) { // '0'= 48
				number++;
			}
			else if (S[i] > 64 && S[i] < 91) { // 'A'= 65
				big++;
			}
			else if (S[i] > 96 && S[i] < 123) { // 'a'= 97
				small++;
			}
			else {
				space++;
			}
		}
		cout << small<<" "<< big << " "<< number << " "<< space << " "<< endl;

		// 초기화
		small = 0;
		big = 0;
		number = 0;
		space = 0;
	}

	return 0;
}
