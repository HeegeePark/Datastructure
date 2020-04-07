#include <stdio.h>
#include <iostream>
#include <stdlib.h>
#include <string>
using namespace std;

struct Stack
{
	char data[100];
	int len = 0;
	int capacity = 0;

	void create(int y) {
		capacity = y;
	}

	void push(char x) {
		if (len >= capacity) {
			printf("overflow!\n");
		}
		else {
			data[len++] = x;
		}
	}

	void pop() {
		if (len <= 0) {
			printf("underflow!\n");
		}
		else {
			data[len - 1] = 0;
			len--;
		}
	}

	int top() {
		if (len <= 0) {
			return -1;
		}
		else {
			return data[len - 1];
		}
	}

	int size() {
		return len;
	}
};

string determineParentheses(string ps) {
	Stack s;

	s.create(ps.length());

	for (int i = 0; i < ps.length(); i++) {
		if (ps[i] == ')') {
			if (s.size() == 0) {
				return "No";
			}
			else {
				s.pop();
			}
		}
		else {
			s.push(ps[i]);
		}
	}

	if (s.size() == 0) return "Yes";
	else return "No";
}

int main() {
	string parentheses;
	cin >> parentheses;

	cout << determineParentheses(parentheses) << endl;

	system("pause");
	return 0;
}