/*
 75. 최대 수입 스케쥴(priority_queue 응용문제)
 현수는 유명한 강연자이다. N개이 기업에서 강연 요청을 해왔다. 각 기업은 D일 안에 와서 강연을 해 주면 M만큼의 강연료를 주기로 했다.
 각 기업이 요청한 D와 M를 바탕으로 가장 많을 돈을 벌 수 있도록 강연 스케쥴을 짜야 한다. 단 강연의 특성상 현수는 하루에 하나의 기업에서만 강연을 할 수 있다.
 ▣ 입력설명
 첫 번째 줄에 자연수 N(1<=N<=10,000)이 주어지고, 다음 N개의 줄에 M(1<=M<=10,000)과 D(1<=D<=10,000)가 차례로 주어진다.
 ▣ 출력설명
 첫 번째 줄에 최대로 벌 수 있는 수입을 출력한다.
 ▣ 입력예제 1
 6
 50 2
 20 1
 40 2
 60 3
 30 3
 30 1
 ▣ 출력예제 1
 150
    
 */

#include <iostream>
#include <stdio.h>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;
struct Comp {
    int money;
    int when;
    Comp(int a, int b) {
        money = a;
        when = b;
    }
    bool operator<(Comp &b) {   // 내림차순 정렬(money도 같이 정렬됨)
        return when>b.when;
        
    }
};
int main(int argc, const char * argv[]) {
    int n, i, j, a, b, res=0, max=-10000000;
    vector<Comp> T;
    priority_queue<int> pQ; // 최대힙
    scanf("%d\n", &n);
    for (i=1; i<=n; i++) {
        scanf("%d %d\n", &a, &b);
        T.push_back(Comp(a, b));
        if(b > max) // 강연 날짜 max 찾기
            max = b;
    }
    sort(T.begin(), T.end());
    j=0;
    for (i=max; i>=1; i--) {    // 강연 날짜 역순으로 순회
        for (; j<n; j++) {
            if(T[j].when < i) break;    // 해당 날짜보다 같거나 큰 기업의 돈만 push
            pQ.push(T[j].money);
        }
        if(!pQ.empty()) {
            res += pQ.top();    // 큐에는 해당 날짜 안에 강연 가능한 돈만 들어있으므로 top을 더하기!
            pQ.pop();
        }
    }
    printf("%d\n", res);
    return 0;
}
