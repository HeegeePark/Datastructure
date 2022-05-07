//: [Previous](@previous)

// 2020 카카오 인턴십 경주로 건설
import Foundation

func calculateCost(_ depth: Int, _ cornerCnt: Int) -> Int {
    return depth * 100 + cornerCnt * 500
}

func searchTrack(_ cur: (x: Int, y: Int, dir: Int, cost: Int), _ board: [[Int]], _ costBoard: inout [[Int]], _ dirs: [[Int]]) {
    guard cur.cost <= costBoard[cur.x][cur.y] else {
        return
    }
    
    costBoard[cur.x][cur.y] = cur.cost
    
    for i in 0..<4 {
        let nextX = cur.x + dirs[0][i]
        let nextY = cur.y + dirs[1][i]
        guard 0..<board.count ~= nextX && 0..<board.count ~= nextY else { continue }
        if board[nextX][nextY] == 0 {
            if cur.dir != i {
                searchTrack((x: nextX, y: nextY, dir: i, cost: cur.cost + 600), board, &costBoard, dirs)
            } else {
                searchTrack((x: nextX, y: nextY, dir: i, cost: cur.cost + 100), board, &costBoard, dirs)
            }
        }
    }
}

func solution(_ board:[[Int]]) -> Int {
    let N = board.count
    let dirs = [[0, 1, 0, -1], [1, 0, -1, 0]]
    var costBoard = Array(repeating: [Int](repeating: Int.max, count: board.count), count: board.count)
    
    searchTrack((x: 0, y: 0, dir: 0, cost: 0), board, &costBoard, dirs)
    searchTrack((x: 0, y: 0, dir: 1, cost: 0), board, &costBoard, dirs)
    
    return costBoard[N-1][N-1]
}

//solution([[0,0,0],[0,0,0],[0,0,0]])
//solution([[0,0,0,0,0,0,0,1],[0,0,0,0,0,0,0,0],[0,0,0,0,0,1,0,0],[0,0,0,0,1,0,0,0],[0,0,0,1,0,0,0,1],[0,0,1,0,0,0,1,0],[0,1,0,0,0,1,0,0],[1,0,0,0,0,0,0,0]])
solution([[0,0,1,0],[0,0,0,0],[0,1,0,1],[1,0,0,0]])
//solution([[0,0,0,0,0,0],[0,1,1,1,1,0],[0,0,1,0,0,0],[1,0,0,1,0,1],[0,1,0,0,0,1],[0,0,0,0,0,0]])

//: [Next](@next)
