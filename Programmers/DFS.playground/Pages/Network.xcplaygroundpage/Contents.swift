//: 프로그래머스 네트워크
import Foundation

var network: Int = 0
var checked = [Int]()   // 방문: 1, 미방문: 0

func dfs(_ idx: Int, _ computers: [[Int]]) {
    checked[idx] = 1
    for i in 0..<computers.count {
        if computers[idx][i] == 1 && idx != i && checked[i] != 1 {
            dfs(i, computers)
        }
    }
    return
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    checked = [Int](repeating: 0, count: n)
    for i in 0..<n {
        if(checked[i] == 0) {
            dfs(i, computers)
            network += 1
        }
    }
    return network
}
