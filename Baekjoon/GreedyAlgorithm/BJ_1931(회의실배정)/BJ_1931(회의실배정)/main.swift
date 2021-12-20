//
//  main.swift
//  BJ_1931(회의실배정)
//
//  Created by 박희지 on 2021/12/20.
//

import Foundation

let n = Int(readLine()!)!
var meetings = Array(repeating: [0, 0], count: n)

for i in 0..<n {
    let meeting = readLine()!.split(separator: " ").map { Int($0)! }
    meetings[i] = meeting
}

// 1. 회의가 일찍 끝나는 순으로 정렬
    // 종료시간이 같을 경우 시작시간이 작은 순으로
meetings = meetings.sorted {
    if $0.last! == $1.last! {
        return $0.first! < $1.first!
    }
    return $0.last! < $1.last!
}
// 2. 회의 선정
var count = 1
var selected = meetings[0]
for i in 1..<n {
    // 마지막으로 선정한 회의와 시간이 겹칠 때
    if meetings[i].first! >= selected.last! {
        count += 1
        selected = meetings[i]
    }
}

print(count)

