#include <stdio.h>
#include <stdlib.h>

struct Stack
{
	int data[100];
	int len = 0;
	int capacity = 0;
	
	void create(int y) {
		capacity = y;
	}

	void push(int y) {
		if (len >= capacity) {
			printf("Stack overflow!\n");
		}
		else {
			data[len++] = y;
		}
	}

	void pop() {
		if (len <= 0) {
			printf("Stack underflow!\n");
		}
		else {
			data[len - 1] = 0;
			len--;
		}
	}

	int top() {
		// 아무것도 없으면 -1 반환
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

int main() {
	Stack s1;

	s1.create(5);

	s1.push(1);
	s1.push(2);
	s1.push(3);
	s1.push(4);
	s1.push(5);
	s1.push(6);	// overflow
	s1.push(7);	// overflow

	printf("%d\n", s1.top());	// 5

	s1.pop();

	printf("%d\n", s1.top());	// 4

	s1.push(6);
	s1.push(7);	// overflow

	printf("%d\n", s1.top());	// 6

	s1.pop();
	s1.pop();
	s1.pop();
	s1.pop();
	s1.pop();
	
	s1.pop();	// underflow

	printf("%d\n", s1.size());	// 0

	system("pause");
	return 0;
}