//: [Previous](@previous)

import Foundation

var answer = Int.max
var tree = [Int: [Int]]()

func bfs(_ start: Int, _ checked: inout [Bool]) -> Int {
    var q = [Int]()
    q.append(start)
    
    var idx = 0
    while idx < q.count {
        let curr = q[idx]
        checked[curr] = true
        idx += 1
        
        guard let graph = tree[curr] else { continue }
        
        for node in graph {
            if !checked[node] {
                q.append(node)
            }
        }
    }
    return idx
}

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    // 1. 와이어 연결한 트리 만들기
    
    for wire in wires {
        tree[wire[0], default: []] += [wire[1]]
        tree[wire[1], default: []] += [wire[0]]
    }
    
    // 2. 트리에 대해 전선 하나씩 끊어가며 송전탑 개수 구하기
    /// 트리에서 방문 표시 == 엣지를 끊은 것
    for i in 1...n {
        var checked = [Bool](repeating: false, count: n + 1)
        checked[i] = true
        let cnt = bfs(1, &checked)
        answer = min(answer, abs(cnt - (n - cnt)))
    }
    
    return answer
}

//: [Next](@next)
