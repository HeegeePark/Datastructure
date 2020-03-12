#include <iostream>
#include <stdlib.h>
using namespace std;


int main() {
	int N;
	cin >> N;
	int tile[1000];

	/*Bottom-up*/
	tile[0] = 1;
	tile[1] = 3;
	for (int i = 2; i < N; i++) {
		tile[i] = tile[i - 1] + 2 * tile[i - 2];
		tile[i] %= 10007;
	}
	cout << tile[N - 1] << endl;

	system("pause");
	return 0;
}