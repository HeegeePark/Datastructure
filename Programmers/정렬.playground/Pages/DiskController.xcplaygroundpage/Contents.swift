//: [Previous](@previous)

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var queue = [[Int]]()
    var timeline = 0
    var answer = 0
    var task: [Int] = []
    
    // 1. 작업 요청 시간 빠른 순으로 큐에 삽입
    queue = jobs.sorted {
        if $0.first == $1.first! { return $0.last! < $1.last!}
        else { return $0.first! < $1.first! }
    }
    
    print(queue)
    
    // 2. 현재 시간 이전 작업 큐에 있을 시 반영 후 큐에 삭제
    while !queue.isEmpty {
        task = queue.first!
        if task.first! <= timeline {
            timeline += task.last!
            answer += timeline - task.first!
            queue.removeFirst()
        }
    }
    return answer / jobs.count
}

//: [Next](@next)
