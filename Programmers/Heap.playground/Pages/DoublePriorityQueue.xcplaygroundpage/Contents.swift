//: [Previous](@previous)

// 프로그래머스 이중우선순위큐
import Foundation

struct PriorityQueue {  // default: minHeap
    var data = [Int]()
    
    mutating func push(_ value: Int) {
        self.data.append(value)
        
        var currentIdx = self.data.count - 1
        
        while currentIdx > 0 {
            if self.data[currentIdx] < self.data[currentIdx >> 1] {
                let temp = self.data[currentIdx]
                self.data[currentIdx] = self.data[currentIdx >> 1]
                self.data[currentIdx >> 1] = temp
                
                currentIdx >>= 1
            } else {
                break
            }
        }
    }
    
    mutating func pop(_ value: Int) {
        if self.data.isEmpty { return }
        
        if value > 0 { // 최댓값 삭제
            self.data.removeLast()
        } else {    // 최솟값 삭제
            self.data.removeFirst()
        }
    }
    
    func min() -> Int {
        return self.data.first!
    }
    
    func max() -> Int {
        return self.data.max()!
    }

}

func solution(_ operations:[String]) -> [Int] {
    var pq = PriorityQueue()
    
    operations.forEach {
        var op = $0.split(separator: " ").map { String($0) }
        if op.removeFirst() == "I" {
            let num = Int(op.joined())!
            pq.push(num)
        } else {
            let num = Int(op.joined())!
            pq.pop(num)
        }
    }
    
    return pq.data.isEmpty ? [0,0]: [pq.max(), pq.min()]
}

//: [Next](@next)
