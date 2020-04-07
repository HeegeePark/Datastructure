#include <stdio.h>
#include <stdlib.h>

struct maxMachine
{
	int data[100];
	int len = 0;
	
	void insertNumber(int x) {		// 원소 삽입
		data[len++] = x;
	}

	void removeNumber(int x) {		// 원소 삭제
		for (int i = 0; i < len; i++) {
			if (data[i] == x) {
				for (int j = i; j < len; j++) {
					data[j] = data[j + 1];
				}
				return;
			}
		}
	}

	int getMax() {
		int max = 0;
		for (int i = 0; i < len; i++) {
			if (data[i] >= max) max = data[i];
		}
		return max;
	}
};

int main() {
	maxMachine m1;

	m1.insertNumber(10);
	m1.insertNumber(20);
	m1.insertNumber(5);
	m1.insertNumber(30);

	printf("%d\n", m1.getMax());		// 30

	m1.removeNumber(30);
	m1.removeNumber(10);

	printf("%d\n", m1.getMax());	// 20

	m1.removeNumber(20);

	printf("%d\n", m1.getMax());	// 5

	
	system("pause");
	return 0;
}