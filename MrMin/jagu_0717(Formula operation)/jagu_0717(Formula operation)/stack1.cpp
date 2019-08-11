//후위 표기식 생성
#include <stdio.h>
#include <stdlib.h>
#include "stack1.h"

bool stack1::is_Full() {
	return (top == n);
}
bool stack1::is_Empty() {
	return (top == 0);
}

void stack1::push(int op) {
	if (is_Full()) {
		printf("Pushing in Full Stack\n");
	}

	arr[top] = op;
	top++;
}
int stack1::detect_op_index() {
	return (arr[top-1] - 1);
}

int stack1::pop() {
	if (is_Empty()) {
		printf("Poping from Empty Stack\n");
	}
	top--;
	return arr[top];
}




