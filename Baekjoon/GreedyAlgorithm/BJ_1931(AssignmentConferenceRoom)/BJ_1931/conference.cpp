#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;
vector<pair<int, int> > Conference;		// 회의 정보를 벡터에 저장
int main() {
	int N;
	int ConferenceCount = 0; // 출력하고자 하는 하루 최대 회의수
	
	cin >> N;
	for (int i = 0; i < N; i++) {
		int start, end;
		cin >> start >> end;
		Conference.push_back(make_pair(start, end));
	}
	
	// 회의 정보를 오름차순으로 정렬
	sort(Conference.begin(), Conference.end());

	// 각 회의가 끝나고 이어서 할 수 있는 회의정보 총갯수 배열로 저장
	int* CountNextPoss = new int[N];
	for (int i = 0; i < N; i++) {
		CountNextPoss[i] = 0;
	}
	int MaxCount = 0;
	int MaxCountIndex = 0;
	int NextIndex = 0;

	
	for (int i = 0; i < N; i++) {
		for (int j = i + 1; j < N; j++) {
			if (Conference[i].second < Conference[j].first) {
				CountNextPoss[i]++;
			}
		}
		if (CountNextPoss[i] > MaxCount) {
			MaxCount = CountNextPoss[i];
			MaxCountIndex = i;
		}
	}
	//  총갯수(배열의 value)가 가장 크고 회의시간이 빠른 인덱스의 회의정보(MaxCountIndex)를 택하고(회의수++), 
	// 택한 회의 다음으로 가능한 인덱스 중 value가 가장 큰 인덱스 선택
	// 이 과정을 인덱스를 택할 때 마지막 인덱스를 접근하거나 넘어설때까지 반복
	while (NextIndex < N ) {
		for (int i = NextIndex; i < N; i++) {
			if (CountNextPoss[i] > MaxCount) {
				MaxCount = CountNextPoss[i];
				MaxCountIndex = i;
			}
		}
		ConferenceCount++;
		
		// 다음으로 이어질 회의가 없으므로 끝
		if (MaxCount == 0) {
			break;
		}

		for (int i = MaxCountIndex + 1; i < N; i++) {
			if (Conference[i].first > Conference[MaxCountIndex].second) {
				NextIndex = i;
				break;
			}
		}
		MaxCount = 0;
	}

	// 하루에 최대 가능한 회의수 출력
	cout << ConferenceCount << endl;
	return 0;
}