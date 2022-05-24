//: [Previous](@previous)

// 2018 카카오 공채 1차 다트 게임
import Foundation

extension Character {
    var isPrize: Bool {
        let prizes = "*#"
        if prizes.contains(self) { return true }
        return false
    }
}

let pows = ["S": 1.0, "D": 2.0, "T": 3.0]

func calcPow(_ num: String, _ c: String) -> Int {
    let n = Double(num)!
    return Int(pow(n, pows[c]!))
}

func solution(_ dartResult:String) -> Int {
    var numBuffer = ""
    var nums = [Int]()
    
    dartResult.forEach {
        if $0.isLetter {
            nums += [calcPow(numBuffer, String($0))]
            numBuffer = ""
        } else if $0.isPrize {
            switch $0 {
                case "*":
                if nums.count < 2 {
                    let temp = nums.removeFirst()
                    nums += [temp * 2]
                } else {
                    var temps = [Int]()
                    for _ in 0..<2 { temps += [nums.removeLast()] }
                    nums += temps.reversed().map { $0 * 2 }
                }
                
                default:
                let temp = nums.removeLast()
                nums += [-temp]
            }
        } else {
            numBuffer.append($0)
        }
    }
    
    return nums.reduce(0, +)
}

solution("1S*2T*3S")

//: [Next](@next)
