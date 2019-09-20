#include <iostream>
#include <map>
#include <utility>
#include <algorithm>
using namespace std;

int main() {
	ios_base::sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
	
	int N, M;
	string pokemon;
	char quiz[20];
	cin >> N >> M;
	map<string, int> PokemonsByName;
	map<int, string> PokemonsByNumber;

	// key가 포켓몬이름 및 번호에 따른 도감(맵) 등록
	for (int i = 0; i < N; i++) {
		cin >> pokemon;
		PokemonsByName.insert(pair<string, int>(pokemon, i + 1));
		PokemonsByNumber.insert(pair<int, string>(i + 1, pokemon));
	}

	// 도감 조회
	for (int i = 0; i < M; i++) {
		cin >> quiz;
		// 입력 = 포켓몬 이름 : 몇번째 포켓몬인지 출력
		if (atoi(quiz) == 0) {
			cout << PokemonsByName.find(quiz)->second << "\n";
		}
		// 입력 =  숫자 : 입력번째의 포켓몬이름 출력
		else {
			cout << PokemonsByNumber.find(atoi(quiz))->second << "\n";
		}
	}

	return 0;
}