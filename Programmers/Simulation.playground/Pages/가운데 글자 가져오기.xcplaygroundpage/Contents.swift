//: [Previous](@previous)

func solution(_ s:String) -> String {
    var answer = ""
    let cIndex = s.index(s.startIndex, offsetBy: s.count / 2)
    
    if s.count % 2 == 0 {
        let bcIndex = s.index(before: cIndex)
        answer.append(s[bcIndex])
    }
    answer.append(s[cIndex])
    
    return answer
}

//: [Next](@next)
