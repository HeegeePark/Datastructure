//: [Previous](@previous)

// 프로그래머스 2016년
import Foundation

func solution(_ a:Int, _ b:Int) -> String {
    let days = ["FRI", "SAT", "SUN", "MON", "TUE", "WED", "THU"] // 1/1은 금요일이므로 금요일부터 시작
    let months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var dDays = 0
    
    // 1. 디데이 계산 (1월 1일로부터)
    for i in 0..<a-1 {
        dDays += months[i]
    }
    dDays += b - 1
    
    // 2. 요일 구하기
    var answer = days[dDays%7]
    
    return answer
}

//: [Next](@next)
