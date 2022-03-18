//: [Previous](@previous)

// 프로그래머스 N-Queen
import Foundation

func placeQueens(n: Int, depth: Int, checked: [Int], answer: inout Int) {
    if depth == n { // 마지막 퀸까지 다 놓았을 때
        answer += 1
        return
    }
    
    for i in 0..<n {
        // 현재 행에 퀸을 놓을 수 있는지 확인
        if canPutQueen(x: depth, y: i, checked: checked) {
            var newChecked = checked
            newChecked[depth] = i
            // dfs
            placeQueens(n: n, depth: depth+1, checked: newChecked, answer: &answer)
        }
    }
}

func canPutQueen(x: Int, y: Int, checked: [Int]) -> Bool {
    // abs를 이용하기 때문에 0~x-1까지
    for i in 0..<x {
        if checked[i] == y || // 열 체크
        abs(x-i) == abs(y-checked[i]) { // 대각선 체크
            return false
        }
    }
    return true
}

func solution(_ n:Int) -> Int {
    var answer = 0
    var checked = [Int](repeating: -1, count: n)
    
    placeQueens(n: n, depth: 0, checked: checked, answer: &answer)
    
    return answer
}

//: [Next](@next)
