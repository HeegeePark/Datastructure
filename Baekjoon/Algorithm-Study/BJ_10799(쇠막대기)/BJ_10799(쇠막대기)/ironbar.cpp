#include <iostream>
#include <stack>
using namespace std;

int main() {
	stack<char> s;
	char parentheses[100000];		//괄호 담는 char 배열
	int parCnt = 0;		// 괄호 개수
	int i = 0;
	int barCnt = 0;
	bool is_bar = false;
	cin >> parentheses;

	// 레이저 지점 detect 및 괄호 stack에 push
	for (i = 0; parentheses[i] != NULL; i++) {
		if (parentheses[i] == ')') {
			if (!s.empty()) {		// 닫힌 괄호가 나올 때, 스택이 비어서는 안됨
				if (parentheses[i - 1] == '(') {	// 이전 괄호가 열린 괄호일 때(레이저)
					// 레이저 괄호 pop
					s.pop();

					// 스택에 남은 괄호 수 만틈 작대기 개수 ++
					barCnt += s.size();

				}
				else {			// 작대기가 닫힐 때
					s.pop();
					barCnt += 1;
				}
			}

		}
		else {		// 현재 괄호는 닫는 괄호 X
			s.push(parentheses[i]);
		}
	}

	cout << barCnt << "\n";

	return 0;
}