//: [Previous](@previous)

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var queue = [[Int]]()
    var timeline = 0
    var processingtime = 0
    
    // 1. 작업 요청 시간 빠른 순, 같을  시 작업 시간 짧은 순으로 정렬
    var sortedJobs = jobs.sorted {
        if $0.first == $1.first! { return $0.last! < $1.last!}
        else { return $0.first! < $1.first! }
    }
    
    
    // 2. 처음 할 작업만 작업 큐에 삽입
    queue.append(sortedJobs.removeFirst())
    timeline = queue.first![0]
    
    // 3. 작업 수행
    while !queue.isEmpty {
        let task = queue.removeFirst()
        timeline += task.last!
        processingtime += timeline - task.first!
        
        // 3-1. 작업 수행 동안 도착한 작업들만 작업 큐에 작업 시간 짧은 순으로 저장
        while !sortedJobs.isEmpty && sortedJobs.first![0] <= timeline {
            queue.append(sortedJobs.removeFirst())
        }
        queue.sort { $0.last! < $1.last! }
        
        // 3-2. 요청 텀 때문에 작업이 남았는데 큐가 비었을 경우
        if queue.isEmpty && !sortedJobs.isEmpty {
            // 가장 빨리 도착하는 작업 큐에 넣고 현재 시간 초기화
            queue.append(sortedJobs.removeFirst())
            timeline = queue.last![0]
        }
    }
    
    return processingtime / jobs.count
}

//: [Next](@next)
