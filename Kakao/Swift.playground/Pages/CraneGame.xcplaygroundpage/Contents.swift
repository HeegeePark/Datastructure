//: 2019 카카오 겨울 인턴십 크레인 인형뽑기 게임
import Foundation

class Doll {
    let value: Int
    var next: Doll?
    
    init(value: Int, next: Doll?) {
        self.value = value
        self.next = next
    }
}
class DollsLinkedList {
    var head: Doll?
    
    func insert(_ value: Int) {
        // 노드x: 헤드가 첫 노드 가리킴
        if head == nil {
            head = Doll(value: value, next: nil)
            return
        }
        // 인형 넣기
        var current = head
        // 마지막 노드로 접근
        while current?.next != nil {
            current = current?.next
        }
        // current는 마지막 노드를 가리키므로 그 다음에 새 노드 삽입
        current?.next = Doll(value: value, next: nil)
    }
    
    func claw() -> Int {
        guard head?.value != nil else { return -1 }
        let item = head!.value
        head = head?.next
        return item
    }
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    // 제대로 연결되는지 확인용 연결리스트 출력 함수
    func printLL(_ idx: Int) {
        if self.isEmpty() {
            print("empty")
            return
        }
        print("cranes[\(idx)]: ")
        var current = head
        while current != nil {
            print("\(current?.value) ")
            current = current?.next
        }
    }
}

struct Stack<T> {
    var elements = [T]()
    init() {}
    
    mutating func push(_ element: T) {
        self.elements.append(element)
    }
    
    mutating func pop() -> T? {
        self.elements.popLast()
    }
    
    func last() -> T? {
        return self.elements.last
    }
    
    func isEmpty() -> Bool {
        return self.elements.isEmpty
    }
}

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var answer: Int = 0
    var cranes = [DollsLinkedList]()    // 격자별 인형 담을 연결리스트 배열
    var movesCopy = moves
    var bucket = Stack<Int>()   // stack으로 바구니 구현
    
    // moves 값 범위 변경 (0 ~ n-1)
    movesCopy = movesCopy.map { $0 - 1 }
    
    // crane 초기화
    for _ in 0..<board.count {
        let list = DollsLinkedList()
        cranes.append(list)
    }
    // 연결리스트에 인형 담기
    for row in board {
        for (i,doll) in row.enumerated() {
            if doll == 0 { continue }
            cranes[i].insert(doll)
        }
    }
    
    for move in movesCopy {
        // 뽑기
        if cranes[move].isEmpty() { continue }
        let doll = cranes[move].claw()
        
        // 바구니에 넣기
        if !bucket.isEmpty() {
            if doll == bucket.last() {
                var _ = bucket.pop()
                answer += 2
            } else { bucket.push(doll) }
        } else {
            bucket.push(doll)
        }
    }
    return answer
}

solution([[0,0,0,0,0],[0,0,1,0,3],[0,2,5,0,1],[4,2,4,4,2],[3,5,1,3,1]], [1,5,3,5,1,2,1,4])

