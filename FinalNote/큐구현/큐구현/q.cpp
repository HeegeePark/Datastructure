#include <stdio.h>
#include <stdlib.h>

struct Queue {
	int data[100];
	int f, r;
	int capacity = 0;
	
	void create(int y) {
		capacity = y;
		f = 0;
		r = 0;
	}

	void push(int y) {
		if (r-f >=capacity) {
			printf("overflow!\n");
		}
		else {
			data[r++] = y;
		}
	}

	void pop() {
		if (r - f <= 0) {
			printf("underflow\n");
		}
		else {
			data[f++] = 0;
		}
	}

	int front() {
		if (r - f <= 0) {
			return -1;
		}
		else {
			return data[f];
		}
	}

	int size() {
		return r - f;
	}
};

int main() {
	Queue q1;

	q1.create(3);

	q1.push(1);
	q1.push(2);
	q1.push(3);
	q1.push(4);	// overflow
	q1.push(5);	// overflow

	printf("%d\n", q1.front());	// 1

	q1.pop();
	q1.pop();

	printf("%d\n", q1.front());	// 3
	printf("%d\n", q1.size());	// 1

	q1.pop();
	q1.pop();	// underflow

	system("pause");
	return 0;

}