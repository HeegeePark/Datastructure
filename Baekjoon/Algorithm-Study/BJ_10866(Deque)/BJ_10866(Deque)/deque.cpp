#include <iostream>
#include <deque>
#include <string.h>
using namespace std;

// 덱 구현
int main() {
	deque<int> d;
	int N;
	int X;
	char order[20];

	cin >> N;

	for (int i = 0; i < N; i++) {
		cin >> order;
		// front에 pop
		if (strcmp(order, "pop_front") == 0) {
			if (!d.empty()) {
				cout << d.front() << endl;
				d.pop_front();
			}
			else
			{
				cout << -1 << endl;
			}
		}
		// back에 pop
		else if (strcmp(order, "pop_back") == 0) {
			if (!d.empty()) {
				cout << d.back() << endl;
				d.pop_back();
			}
			else
			{
				cout << -1 << endl;
			}
		}
		// 덱 size 출력
		else if (strcmp(order, "size") == 0) {
			cout << d.size() << endl;
		}
		// 덱 empty() 출력
		else if (strcmp(order, "empty") == 0) {
			if (d.empty()) {
				cout << 1 << endl;
			}
			else
			{
				cout << 0 << endl;
			}
		}
		// front 출력
		else if (strcmp(order, "front") == 0) {
			if (!d.empty()) {
				cout << d.front() << endl;
			}
			else
			{
				cout << -1 << endl;
			}
		}
		// back 출력
		else if (strcmp(order, "back") == 0) {
			if (!d.empty()) {
				cout << d.back() << endl;
			}
			else
			{
				cout << -1 << endl;
			}
		}
		// front에 push
		else if (strcmp(order, "push_front") == 0) {
			cin >> X;
			d.push_front(X);
		}
		// back에 push
		else {
			cin >> X;
			d.push_back(X);
		}

	}

	return 0;
}