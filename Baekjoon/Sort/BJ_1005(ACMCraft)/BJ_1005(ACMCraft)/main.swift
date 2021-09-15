// 백준 1005 ACM Craft (풀이중)
import Foundation

// MARK: - properties
struct Graph<T>: Equatable where T: Equatable {
    var childs: [T]
    
    mutating func push(_ child: T) {
        self.childs.append(child)
    }
}
var T = 0   // test case 개수
var N = 0   // 건물 개수
var K = 0   // 규칙 개수
var D = [Int]()   // 건물 건설 시간 list
var Rules: [Int: [Int]] = [:]   // 규칙 dictionary [건물 번호: 선행 건물 list]
var W = 0   // 지어야 할 건물

// MARK: - functions

func getInputs() {
    let nkArr = readLine()!.split(separator: " ")
        N = Int(nkArr[0])!
        K = Int(nkArr[1])!
        D = readLine()!.split(separator: " ").map { Int($0)! }
        
        for _ in 0..<K {
            let R = readLine()!.split(separator: " ").map { Int($0)! }
            if (Rules[R[1]]) != nil {   // 2번째 이상 진입차수 추가 시
                Rules[R[1]]! += [R[0]]
            } else {
                Rules[R[1]] = [R[0]]
            }
        }
    W = Int(readLine()!)!
}

func topologicalSort() -> [Int] {
    // 결과를 담을 배열과 Queue
    var result = [Int]()
    var q = [Int]()
    
    // 진입차수가 0인 건물들 큐에 담기
    for i in 0..<N {
        if Rules[i] == nil {
            q.append(i)
        }
    }
    
    // 정렬하기
    for _ in 0..<N {
        
    }
    
}

// MARK: - main
T = Int(readLine()!)!

for _ in 0..<T {
    getInputs()
}

