#include <stdio.h>
#include <iostream>
#include <stack>
#include <stdlib.h>
using namespace std;

int main() {
	int T;
	char curPs;
	stack<char> psStack;	// 괄호를 담을 스택 선언
	char buf[50];
	string vps = "YES";

	cin >> T;
	
	for (int i = 0; i < T; i++) {
		//gets_s(buf);
		cin >> buf;
		
		vps = "YES"; // 갱신
		for (int j = 0; buf[j] != '\0'; j++) {
			curPs = buf[j];
			if (curPs == ')') {
				if (!(psStack.empty())) {
					psStack.pop();
				}
				else {		// pop해줄 괄호가 없을 때 (VPS X)
					vps = "NO";
					break;
				}
			}
			else {
				psStack.push(curPs);
			}
		}

		if (!(psStack.empty())) {
			vps = "NO";
			while (!(psStack.empty())) {
				psStack.pop();
			}
		}
		
		cout << vps << "\n";

	}

	return 0;
}