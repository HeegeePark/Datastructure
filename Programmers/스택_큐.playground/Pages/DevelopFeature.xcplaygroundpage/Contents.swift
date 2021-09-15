import Foundation


func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var task = 0
    var deployCnt = 1
    var answer: [Int] = []
    
    let residual = progresses.map { 100 - $0 }
    var Queue = residual.enumerated().map {
        $0.1 % speeds[$0.0] == 0 ? $0.1 / speeds[$0.0]: $0.1 / speeds[$0.0] + 1
    }
    print(Queue)
    task = Queue.removeFirst()
    while !Queue.isEmpty {
        print("Q: \(Queue)")
        let next = Queue.removeFirst()
        if next <= task {
            deployCnt += 1
        } else {
            answer.append(deployCnt)
            deployCnt = 1
            task = next
        }
        print("A: \(answer)")
    }
    answer.append(deployCnt)
    return answer
}
//solution([93, 30, 55], [1, 30, 5])
solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1])
