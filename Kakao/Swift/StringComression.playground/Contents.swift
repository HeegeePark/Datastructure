// 2020 카카오 채용 문자열 압축
import Foundation

func solution(_ s:String) -> Int {
    var stringCopy = s
    var answer = s.count
    
    for i in 1..<((s.count / 2) + 1) {
        var len = s.count
        var pos = 0
        
        while pos + i <= s.count {
            let start = stringCopy.index(stringCopy.startIndex, offsetBy: pos)
            let end = stringCopy.index(stringCopy.startIndex, offsetBy: pos + i)
            let unit = stringCopy[start..<end]
            pos += i
            
            var cnt = 0
            while pos + i <= s.count {      // 중복되는지 check
                let start = stringCopy.index(stringCopy.startIndex, offsetBy: pos)
                let end = stringCopy.index(stringCopy.startIndex, offsetBy: pos + i)
                if unit == stringCopy[start..<end] {
                    cnt += 1
                    pos += i
                } else { break }
            }
            
            if cnt > 0 {        // 중복되는게 있을 시
                len = len - i * cnt
                switch cnt {
                    case 1..<9:
                        len += 1
                    case 9..<99:
                        len += 2
                    case 99..<999:
                        len += 3
                    default:
                        len += 4
                }
            }
        }
        answer = min(answer, len)
    }
    return answer
}
