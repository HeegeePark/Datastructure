#include <iostream>
#include <queue>
using namespace std;

int main() {
	int N, K = 0;
	int temp = 0;
	
	cin >> N;
	cin >> K;

	queue<int> q;
	// queue에 원소 삽입
	for (int i = 0; i < N; i++) {
		q.push(i+1);
	}

	cout << "<";
	for (int i = 0; !q.empty(); i++) {		//queue가 빌 때가지 반복
		// K번째 사람의 번호가 queue의 프론트일때
		if (i % K == K - 1) {
			temp = q.front();
			cout << temp;
			q.pop();
			if (!q.empty()) {
				cout << ", ";
			}
		}
		else {		// 아닌경우 : pop해서 다시 큐의 뒤에 삽입
			temp = q.front();
			q.pop();
			q.push(temp);
		}
	}
	cout << ">";

	return 0;

}