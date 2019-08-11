#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "stack1.h"
#include <math.h>

void remove_delimiters(char* expr2, char* expr);

int main()
{
	char expr[256] = "31.6 + (19.3 - 2.1)*((1.4^0.6) + 8.5)";
	char expr2[256];
	Token token;

	remove_delimiters(expr2, expr);
	token.token_parser(expr2);
	token.print_tok();

	token.postfix();
	token.print_tok();

	token.evaluate();

	system("pause");
	return 0;
}

void remove_delimiters(char* expr2, char* expr) {
	int i = 0;
	int cnt = 0;
	while(i < strlen(expr)) {
		if (expr[i] != ' ' && expr[i] != NULL)
			expr2[cnt++] = expr[i];
		i++;
	}
	for ( i = cnt; i < strlen(expr2); i++)
	{
		expr2[i] = NULL;
	}
}

void Token::token_parser(char* expr2) {
	int i, j = 0;
	char od_buf[10] = { 0 };
	this->op = (char*)malloc(sizeof(char)*20);
	this->od = (float*)malloc(sizeof(float)*20);
	this->tok = (int*)malloc(sizeof(int)*50);
	char *p = od_buf;

	for (int i = 0; i < strlen(expr2); i++) {
		if (expr2[i] == '+' || expr2[i] == '-' || expr2[i] == '*' || expr2[i] == '/' || expr2[i] == '(' || expr2[i] == ')' || expr2[i] == '^') {
			if (j != 0) {
				// 버퍼에 담긴 값 피연산자 배열에 넣기
				this->od[this->odcnt++] = atof(p);
				//od_buf[0] = '\0';
				for (int j = 0; j < 10; j++) {
					od_buf[j] = '\0';
				}
				j = 0;
				this->tok[this->tcnt++] = (-1)*this->odcnt;
			}
			// 연산자인 i번째 값을 연산자 배열에 넣기
			this->op[this->opcnt++] = expr2[i];
			this->tok[this->tcnt++] = this->opcnt;

		}
		else {
			od_buf[j++] = expr2[i];
		}
	}
	// print
	for (int i = 0; i < this->tcnt; i++) {
		printf("[%d] ", this->tok[i]);
	}
	printf("\n");
	printf("\n");
	for (int i = 0; i < this->opcnt; i++) {
		printf("op token %d: %c\n", (i + 1), this->op[i]);
	}
	printf("\n");
	for (int i = 0; i < this->odcnt; i++) {
		printf("od token %d: %.1f\n", (i + 1), this->od[i]);
	}
	printf("\n");
}
void Token::print_tok() {
	int idx_tok_od = 0;
	int idx_tok_op = 0;
	for (int i = 0; i < this->tcnt; i++) {
		if (this->tok[i] < 0) {		// operand
			idx_tok_od = abs(this->tok[i]) - 1;
			printf("%0.1f ", this->od[idx_tok_od]);
		}
		else {		//operator
			idx_tok_op = this->tok[i] - 1;
			printf("%c ", this->op[idx_tok_op]);
		}
	}
	printf("\n");
	printf("\n");
}
void Token::postfix() {
	int i, j = 0;
	s1.n = 10;
	int idx_tok_od = 0, idx_tok_op = 0;
	int* tok_fixed = (int*)malloc(sizeof(int) * tcnt);
	
	for ( i = 0; i < this->tcnt; i++) {
		if (this->tok[i] < 0) {		// operand
			idx_tok_od = abs(this->tok[i]) - 1;
			tok_fixed[j++] = this->tok[i];
		}
		else {		//operator
			idx_tok_op = this->tok[i] - 1;
			if (this->op[idx_tok_op] == '(') {
				s1.push(this->tok[i]);
			}
			else if (this->op[idx_tok_op] == ')') {
				int temp = s1.detect_op_index();
				while (this->op[temp] != '(') {
					tok_fixed[j++] = this->s1.pop();
					temp = s1.detect_op_index();
				}
				this->s1.pop();
			}
			else {
				s1.push(this->tok[i]);
			}
		}
		
	}
	while (!(s1.is_Empty())) {
		tok_fixed[j++] = this->s1.pop();
	}
	
	// 후위 표기식으로 변경된 토큰 순서와 개수 초기화
	for ( i = 0; i < tcnt; i++)
	{
		if (i >= j) {
			this->tok[i] = NULL;
		}
		else {
			this->tok[i] = tok_fixed[i];
		}
	}
	this->tcnt = j;
}
void Token::evaluate() {
	int i, j = 0;
	s2.n = 5;
	int idx_tok_od = 0, idx_tok_op = 0;
	float value = 0;
	float od1, od2 = 0;

	for (i = 0; i < this->tcnt; i++) {
		if (this->tok[i] < 0) {		// operand
			idx_tok_od = abs(this->tok[i]) - 1;
			s2.push(od[idx_tok_od]);
		}
		else {		//operator
			od1 = s2.pop();
			od2 = s2.pop();
			idx_tok_op = this->tok[i] - 1;
			switch (op[idx_tok_op])
			{
			case '+':	s2.push(od1 + od2);
				break;

			case '-':	s2.push(od2 - od1);
				break;

			case '*':	s2.push(od1 * od2);
				break;

			case '/':	s2.push(od1 / od2);
				break;

			case '^':	s2.push(pow(od2,od1));
				break;
			}
		}
	}
	value = this->s2.pop();

	printf("%f", value);
	printf("\n");
}

