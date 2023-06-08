import Foundation

class Queue<T: Equatable> {
    var enqueue: [T]
    var dequeue: [T] = []
    
    var first: T? {
        if dequeue.isEmpty {
            return enqueue.first
        }
        return dequeue.last
    }
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
    
    func push(_ n: T) {
        enqueue.append(n)
    }
}

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var answer = 0
    var q1 = Queue<Int>(queue1)
    var q2 = Queue<Int>(queue2)
    var sum1 = queue1.reduce(0, +)
    var sum2 = queue2.reduce(0, +)
    
    var limit = 3 * queue1.count
    while answer < limit {
        if sum1 == sum2 { return answer }
        
        if sum1 > sum2 {
            if let n = q1.pop() {
                q2.push(n)
                sum1 -= n
                sum2 += n
            }
        }
        else {
            if let n = q2.pop() {
                q1.push(n)
                sum2 -= n
                sum1 += n
            }
        }
        answer += 1
    }
    
    return -1
}
