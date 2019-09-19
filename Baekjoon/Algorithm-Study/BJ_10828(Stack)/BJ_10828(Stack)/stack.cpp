#include <cstdlib>
#include <cstdio>
#include <iostream>
#include <algorithm>
#include <stack>
#include <string.h>
using namespace std;

void push(int num);
int pop();
int size();
int empty();
int top();



int main() {
	int N;
	int temp = 0;
	char order[100];
	stack<int> S;

	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> order;
		
		// pop
		if (strcmp(order, "pop")==0) {
			if (!(S.empty())) {
				cout << S.top() << endl;
				S.pop();
			}
			else {
				cout << -1 << endl;
			}
		}

		// size
		else if (strcmp(order, "size") == 0) {
			cout << S.size() << endl;
		}

		// empty
		else if (strcmp(order, "empty") == 0) {
			if (S.empty()) {
				cout << 1 << endl;
			}
			else {
				cout << 0 << endl;
			}
		}

		// top
		else if (strcmp(order, "top") == 0) {
			if (!(S.empty())) {
				cout << S.top() << endl;
			}
			else {
				cout << -1 << endl;
			}
		}

		// push
		else {
			char* p = strtok(order, " ");
			cin >> temp;
			S.push(temp);
		}

	}

	return 0;
	
}

