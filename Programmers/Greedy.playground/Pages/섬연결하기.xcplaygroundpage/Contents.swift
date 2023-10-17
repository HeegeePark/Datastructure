//: [Previous](@previous)

import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var graph: [Int: [(key: Int, value: Int)]] = [:]
    var answer = Int.max
    
    for info in costs {
        graph[info[0], default: []] += [(info[1], info[2])]
        graph[info[1], default: []] += [(info[0], info[2])]
    }
    
    func bfs(_ start: Int, _ visited: inout [Bool]) -> Int {
        var q = [Int]()
        q.append(start)
        var cost = 0
        
        var idx = 0
        while idx < q.count {
            let curr = q[idx]
            print("curr", curr)
            visited[curr] = true
            idx += 1
            
            guard idx < n else { break }
            
            guard let nodes = graph[curr] else { continue }
            
            var temp = (key: -1, value: Int.max)
            for node in nodes {
                if !visited[node.key] && node.value < temp.value {
                    print(node)
                    temp = (node.key, node.value)
                }
            }
            cost += temp.value
            q.append(temp.key)
        }
        print(cost)
        return cost
    }
    
    for i in 0..<n {
        var visited = Array(repeating: false, count: n)
        print("----", i)
        answer = min(answer, bfs(i, &visited))
    }
    
    return answer
}

solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])
//: [Next](@next)
