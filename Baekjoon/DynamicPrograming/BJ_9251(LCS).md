``` swift
import Foundation

let s1 = readLine()!.map { String($0) }
let s2 = readLine()!.map { String($0) }
var d = Array(repeating: Array(repeating: 0, count: s2.count+1), count: s1.count+1)

for i in 1...s1.count {
    for j in 1...s2.count {
        if s1[i-1] == s2[j-1] {
            d[i][j] = d[i-1][j-1] + 1
        }
        else {
            d[i][j] = max(d[i][j-1], d[i-1][j])
        }
    }
}

print(d[s1.count][s2.count])
```

