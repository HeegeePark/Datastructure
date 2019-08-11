#include <stdio.h>
#include "stack2.h"

class stack1 {
public:
	int top=0;
	int n;
	int* arr = (int*)malloc(sizeof(int)*n);

	bool is_Full();
	bool is_Empty();
	int detect_op_index();
	void push(int tok);
	int pop();
};

class Token {
public:
	int opcnt = 0;
	int odcnt = 0;
	int tcnt = 0;
	
	stack1 s1;
	stack2 s2;

	char* op;
	float* od;
	int* tok;

	void print_tok();
	void token_parser(char* expr);
	void postfix();
	void evaluate();
};
