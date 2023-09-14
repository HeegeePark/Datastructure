//: [Previous](@previous)

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dict: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    
    for i in 0..<choices.count {
        let s = survey[i].map { String($0) }
        let choice = choices[i]
        
        switch choice {
            case 1:
            dict[s[0]]! += 3
            case 2:
            dict[s[0]]! += 2
            case 3:
            dict[s[0]]! += 1
            case 4:
            continue
            case 5:
            dict[s[1]]! += 1
            case 6:
            dict[s[1]]! += 2
            default:
            dict[s[1]]! += 3
        }
    }
    
    return [["R", "T"], ["C", "F"], ["J", "M"], ["A", "N"]].map {
        if dict[$0[0]]! == dict[$0[1]]! {
            return $0[0] < $0[1] ? $0[0]: $0[1]
        }
        else {
            return dict[$0[0]]! > dict[$0[1]]! ? $0[0]: $0[1]
        }
    }.joined()
}

//: [Next](@next)
