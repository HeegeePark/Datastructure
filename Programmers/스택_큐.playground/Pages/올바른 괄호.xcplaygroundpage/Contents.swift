//: [Previous](@previous)

import Foundation

func solution(_ s:String) -> Bool {
    var stack = [Character]()
    
    for c in s {
        switch c {
            case "(":
            stack.append(c)
            default:
            guard !stack.isEmpty else { return false }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty ? true: false
}

//: [Next](@next)
