import Foundation

func solution(_ s:String) -> Int {
    var answer = s.count
    
    for i in 1..<((s.count / 2) + 1) {
        var len = s.count
        var pos = 0
        
        while pos + i <= s.count {
            let unit = s[pos...pos + i]
            pos += 1
            
            var cnt = 0
            while pos + i <= s.count {      // 중복되는지 check
                if unit == s[pos...pos + i] {
                    cnt += 1
                    pos += 1
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
                    case 999..<9999:
                    len += 4
                }
            }
        }
        answer = min(answer, len)
    }
    return answer
}
