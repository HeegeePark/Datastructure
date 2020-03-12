#include <iostream>
#include <queue>
#include <string.h>
using namespace std;

int main() {
	queue<int> q;
	int N;
	char order[100];
	int temp;

	cin >> N;
	for (int i = 0; i < N; i++) {
		cin >> order;

		// pop
		if (strcmp(order, "pop") == 0) {
			if (q.empty()) {
				cout << -1 << endl;
			}
			else {
				temp = q.front();
				cout << temp << endl;
				q.pop();
			}
		}

		// size
		else if (strcmp(order, "size") == 0) {
			temp = q.size();
			cout << temp << endl;
		}

		// empty
		else if (strcmp(order, "empty") == 0) {
			temp = q.empty();
			cout << temp << endl;
		}

		// front
		else if (strcmp(order, "front") == 0) {
			if (q.empty()) {
				cout << -1 << endl;
			}
			else {
				temp = q.front();
				cout << temp << endl;
			}
		}

		// back
		else if (strcmp(order, "back") == 0) {
			if (q.empty()) {
				cout << -1 << endl;
			}
			else {
				temp = q.back();
				cout << temp << endl;
			}
		}

		// push
		else {
			cin >> temp;
			q.push(temp);
		}
	}

	return 0;
}