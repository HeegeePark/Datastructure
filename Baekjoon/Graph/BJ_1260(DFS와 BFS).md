# 1260 DFS와 BFS

``` swift
import Foundation

public class Vertex {
    var key: Int
    var neighbors: Array<Vertex> {
        didSet {
            self.neighbors = self.neighbors.sorted { $0.key < $1.key }
        }
    }
    
    init(_ key: Int) {
        self.key = key
        self.neighbors = Array<Vertex>()
    }
}

public class Graph {
    private var canvas: Array<Vertex>
    var visited = [Bool]()
  
    init(_ n: Int) {
        canvas = Array<Vertex>()
        (0...n).forEach {
            addVertex(key: $0)
        }
    }
  
    func addVertex(key: Int) {
        let vertex = Vertex(key)
        visited.append(false)
        
        canvas.append(vertex)
    }

    func addEdge(_ source: Int, _ neighbor: Int) {
        let sour = canvas[source]
        let dest = canvas[neighbor]
        
        sour.neighbors.append(dest)
        dest.neighbors.append(sour)
    }
    
    func dfs(_ x: Int) {
        visited[x] = true
        print("\(x) ", terminator: "")
    
        for i in 0..<canvas[x].neighbors.count {
            let y = canvas[x].neighbors[i]
            
            if !visited[y.key] {
              dfs(y.key)
            }
        }
    }
    
    func bfs(_ start: Int) {
        var queue: [Int] = []
        queue.append(start)
        visited[start] = true
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            print("\(current) ", terminator: "")
            
            for next in canvas[current].neighbors {
                if !visited[next.key] {
                    visited[next.key] = true
                    queue.append(next.key)
                }
            }
        }
    }
    
    func clearVisited() {
        self.visited = [Bool](repeating: false, count: canvas.count)
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M, V) = (input[0], input[1], input[2])

let graph = Graph(N)

// 간선 연결
for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    graph.addEdge(edge[0], edge[1])
}

graph.dfs(V)
graph.clearVisited()
print()
graph.bfs(V)
```

