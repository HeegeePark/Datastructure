//: [Previous](@previous)


// 2021 카카오 인턴십 표 편집
import Foundation

class Node {
    var isRemoved: Bool
    var prev: Node?
    var next: Node?
    
    init() {
        self.isRemoved = false
        self.prev = nil
        self.next = nil
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    let nodeArr = Array(repeating: Node(), count: n)    // 삭제 여부를 담는 노드 배열
    var selected: Node = nodeArr[k]     // 현재 선택 행
    var deletedStack = [Node]() // 삭제된 행을 담는 스택 휴지통
    var answer = ""
    
    // 링크드 리스트 연결하기
    for i in 1..<n {
        nodeArr[i].prev = nodeArr[i-1]
        nodeArr[i-1].next = nodeArr[i]
    }
    
    // 명령어 실행
    cmd.forEach {
        let c = $0.first!
        switch c {
            case "U":
            let move = $0.last!.wholeNumberValue!
            for _ in 0..<move { selected = selected.prev! }
            case "D":
            let move = $0.last!.wholeNumberValue!
            for _ in 0..<move { selected = selected.next! }
            case "C":
            deletedStack.append(selected)
            selected.isRemoved.toggle()
            let up = selected.prev
            let down = selected.next
            if up != nil { up!.next = down }
            if down != nil {
                down!.prev = up
                selected = down!
            } else {
                selected = up!
                return
            }
            default:
            let node = deletedStack.removeLast()
            node.isRemoved.toggle()
            let up = node.prev
            let down = node.next
            if up != nil { up!.next  = node }
            if down != nil { down!.prev  = node }
        }
    }
    
    nodeArr.forEach { answer += !$0.isRemoved ? "O": "X" }
    return answer
}

solution(8, 2, ["D 2", "C", "U 3", "C", "D 4", "C", "U 2", "Z", "Z"])

//: [Next](@next)
