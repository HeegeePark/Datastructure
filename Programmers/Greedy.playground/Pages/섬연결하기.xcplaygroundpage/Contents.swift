//: [Previous](@previous)

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var parents: [Int] = Array(0...n-1)
    let costs = costs.sorted { $0[2] < $1[2] }
    
    // 최상위 부모 등록
    func unionSet(_ start: Int, _ end: Int) {
        var start = start
        var end = end
        
        start = findSet(start)
        end = findSet(end)
        if start != end {
            parents[end] = start
        }
    }
    
    // 최상위 부모 찾기
    func findSet(_ start: Int) -> Int {
        if parents[start] == start {
            return start
        }
        
        // 자신이 최상위 부모가 아니라면 재귀로 찾으러
        let parent = findSet(parents[start])
        parents[start] = parent
        
        // 자신을 부모로 가지는 노드들의 부모 업뎃
        for i in 0..<parents.count {
            if parents[i] == start {
                parents[i] = parent
            }
        }
        
        return parent
    }
    
    var answer = 0
    for cost in costs {
        let start = findSet(cost[0])
        let end = findSet(cost[1])
        let value = cost[2]
        
        if start != end {
            answer += value
            unionSet(start, end)
        }
    }
    
    return answer
}

solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])
//: [Next](@next)
