//: [Previous](@previous)

// 2020 카카오 공채 괄호변환
import Foundation

extension String {
    // 올바른 괄호 문자열인지 확인하는 Bool
    var isRightP: Bool {
        return self.first! == "(" ? true: false
    }
}

// 올바른 괄호 문자열로 수정
func edit(_ u: String, _ v: String) -> String {
    var w = "(\(v))"
    
    u.enumerated().forEach {
        if $0.0 != 0 && $0.0 != u.count - 1 {
            w += $0.1 == ")" ? "(": ")"
        }
    }
    return w
}

func implement(_ p: String) -> String {
    // 입력이 빈 문자열인 경우, 빈 문자열을 반환
    guard !p.isEmpty else { return "" }
    
    // 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리
    var pCopy = p
    var left = 0, right = 0
    var u = "", v = ""
    repeat {
        switch pCopy.first! {
            case "(":
            left += 1
            default:
            right += 1
        }
        u.append(pCopy.removeFirst())
    } while !pCopy.isEmpty && left != right
    v = pCopy
    
    // 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행
    // 수행한 결과 문자열을 u에 이어 붙인 후 반환
    return u.isRightP ? u + implement(v): edit(u, implement(v))
}

func solution(_ p:String) -> String {
    return implement(p)
}

solution("(()())()")
solution(")(")
solution("()))((()")

//: [Next](@next)
