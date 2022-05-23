import Foundation

struct Graph {
    var edges: [Int]
    
    init() {
        self.edges = []
    }
}

func bfs(_ start: Int, _ visited: inout [Bool], _ graph: inout [Graph], _ distances: inout [Int]) {
    var queue = [Int]()
    var count = 0
    distances[start] = 0
    visited[start] = true
    queue.append(start)
    
    
    while !queue.isEmpty {
        let current = queue.removeFirst()
        
        for i in 0..<graph[current].edges.count {
            let next = graph[current].edges[i]
            
            if !visited[next] && distances[next] > distances[current] + 1 {
                distances[next] = distances[current] + 1
                visited[next] = true
                queue.append(next)
            }
        }
    }
}

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [Graph](repeating: Graph(), count: n + 1)
    var visited = [Bool](repeating: false, count: n + 1)
    var distances = [Int](repeating: Int.max, count: n + 1)
    
    // 노드에 간선 연결하기
    for e in edge {
        graph[e[0]].edges.append(e[1])
        graph[e[1]].edges.append(e[0])
    }
    
    // 1에서 2~N까지 최단거리를 BFS로 구하기
    bfs(1, &visited, &graph, &distances)
    
    // 가장 먼 노드 구하기
    distances.removeFirst() // 0번 제거
    let max = distances.max()!
    let answer = distances.filter { $0 == max }.count
    
    return answer
}
