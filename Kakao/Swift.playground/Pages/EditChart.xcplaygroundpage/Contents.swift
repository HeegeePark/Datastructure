//: [Previous](@previous)


// 2021 카카오 인턴십 표 편집
import Foundation

class Node {
    var idx = 0
    var prev: Node?
    var next: Node?
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var node = Node()
    var selected = node     // 현재 선택 행
    var deletedStack = [Node]() // 삭제된 행을 담는 스택 휴지통
    var answer = [String](repeating: "O", count: n)
    
    // 링크드 리스트 연결하기
    for i in 1..<n {
        node.next = Node()
        node.next?.prev = node
        node.next?.idx = i
        if i == k { selected = node.next! }
        node = node.next!
    }
    
    // 명령어 실행
    cmd.forEach {
        let c = $0.first!
        switch c {
        case "U":       // "U X"
            let move = Int($0.split(separator: " ").map { String($0) }[1])!
            for _ in 0..<move { selected = selected.prev! }
        case "D":       // // "D X"
            let move = Int($0.split(separator: " ").map { String($0) }[1])!
            for _ in 0..<move { selected = selected.next! }
        case "C":       // "C"
            deletedStack.append(selected)
            answer[selected.idx] = "X"
            let up = selected.prev
            let down = selected.next
            up?.next = down
            guard down != nil else {
                selected = up!
                return
            }
            down!.prev = up
            selected = down!
        default:        // "Z"
            let restore = deletedStack.removeLast()
            answer[restore.idx] = "O"
            let up = restore.prev
            let down = restore.next
            up?.next = restore
            down?.prev = restore
        }
    }
    
    return answer.joined()
}

solution(8, 2, ["D 2", "C", "U 3", "C", "D 4", "C", "U 2", "Z", "Z"])

//: [Next](@next)
