``` c++
#include <string>
#include <vector>
#include <iostream>

using namespace std;
int dp[101][101];

int solution(int m, int n, vector<vector<int>> puddles) {
    dp[1][1] = 1;
    
    for (auto p: puddles) {
        dp[p[1]][p[0]] = -1;
    }
    
    for (int r = 1; r <= n; r++) {
        for (int c = 1; c <= m; c++) {
            int up = 0;
            int left = 0;
            if (dp[r][c] == -1)
                continue;
            if (dp[r-1][c] != -1)
                up = dp[r-1][c];
            if (dp[r][c-1] != -1)
                left = dp[r][c-1];
            dp[r][c] += (up + left) % 1000000007;
        }
    }
    
    return dp[n][m];
}
```

