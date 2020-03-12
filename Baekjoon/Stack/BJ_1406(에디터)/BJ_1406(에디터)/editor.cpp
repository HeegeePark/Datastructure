#include <iostream>
#include <stack>
using namespace std;

int main() {
	stack<char> leftS, rightS;
	int N;
	char sentence[100000];
	char order;
	char letter;

	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);

	cin >> sentence;
	
	for (int i = 0; sentence[i] != '\0'; i++) {
		leftS.push(sentence[i]);
	}
	cin >> N;

	// 에디터 명령어 처리
	for (int i = 0; i < N; i++) {
		cin >> order;

		if (order == 'L') {
			if (!leftS.empty()) {
				rightS.push(leftS.top());
				leftS.pop();
			}
			
		}

		else if (order == 'D') {
			if (!rightS.empty()) {
				leftS.push(rightS.top());
				rightS.pop();
			}
		}

		else if (order == 'B') {
			if (!leftS.empty()) {
				leftS.pop();
			}
		}

		else {
		cin >> letter;
		leftS.push(letter);
		}
	}
	
	while (!leftS.empty()) {
		rightS.push(leftS.top());
		leftS.pop();
	}
	while (!rightS.empty()) {
		cout << rightS.top();
		rightS.pop();
	}


	return 0;
}