//: 다시 재도전하는 카카오 거리두기 확인하기

import Foundation
let D = [[-1, 0], [1,0], [0, -1], [0, 1]]   // 상, 하, 좌, 우
let range = 0..<5

func bfs(_ place: [[String]], _ row: Int, _ col: Int) -> Bool {
    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
    var q = [[Int]]()
    visited[row][col] = true
    q.append([row, col, 0]) // 마지막 원소는 depth
    
    while !q.isEmpty {
        let curr = q.removeFirst()
        
        if curr[2] > 2 {
            continue
        }
        if curr[2] != 0 && place[curr[0]][curr[1]] == "P" {  // 거리두기 안지켜짐
            return false
        }
        
        // 네 방향 체크
        for d in D {
            let nextRow = curr[0] + d.first!
            let nextCol = curr[1] + d.last!
            
            guard range.contains(nextRow) && range.contains(nextCol) else { continue }
            guard !visited[nextRow][nextCol] else { continue }
            
            if place[nextRow][nextCol] == "X" {
                continue
            }
            visited[nextRow][nextCol] = true
            q.append([nextRow, nextCol, curr[2] + 1])
        }
    }
    return true
}

func check(_ place: [String]) -> Bool {
    let placeArray = place.map { $0.map { String($0) }}
    
    for r in range {
        for c in range {
            if placeArray[r][c] == "P" {
                if bfs(placeArray, r, c) == false {
                    return false
                }
            }
        }
    }
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    var answer = [Int]()
    
    places.forEach {
        if check($0) {
            answer.append(1)
        } else {
            answer.append(0)
        }
    }
    return answer
}

solution([["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]])

