#include <iostream>

int main() {
	int N;
	std::cin >> N;

	// (회의시작시간, 회의종료시간) 2차원 배열로 담기 
	int** Confs = new int*[N]();
	for (int i = 0; i < N; i++) {
		Confs[i] = new int[N]();
	}

	// (회의시작시간, 회의종료시간) 입력받기
	for (int i = 0; i < N; i++) {
		for (int j = 0; j < N; j++) {
			std::cin >> Confs[i][j];
		}
	}

	// Sorting
	for (int i = 0; i < N; i++) {
		for (int j = i+1; j < N; j++) {
			if (Confs[i] == Confs[i-1])
		}
	}
}