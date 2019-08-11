// 후위 표기식 연산
#include <stdio.h>
#include <stdlib.h>
#include "stack1.h"

bool stack2::is_Full() {
	return (top == n);
}
bool stack2::is_Empty() {
	return (top == 0);
}

void stack2::push(float od) {
	if (is_Full()) {
		printf("Pushing in Full Stack\n");
	}

	arr[top] = od;
	top++;
}

float stack2::pop() {
	if (is_Empty()) {
		printf("Poping from Empty Stack\n");
	}
	top--;
	return arr[top];
}




