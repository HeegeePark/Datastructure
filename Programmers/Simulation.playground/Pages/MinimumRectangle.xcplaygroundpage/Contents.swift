//: [Previous](@previous)

// 프로그래머스 최소직사각형 
import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var widths: [Int] = []
    var heights: [Int] = []
    
    // 가로, 세로 따로 리스트에 값 추가
    sizes.forEach {
        // 가로 길이가 작다면 swap (어차피 눕혀서 지갑에 넣을 것이므로)
        if $0[0] < $0[1] {
            widths.append($0[1])
            heights.append($0[0])
        } else {
            widths.append($0[0])
            heights.append($0[1])
        }
    }
    
    return widths.max()! * heights.max()!
}

//: [Next](@next)
