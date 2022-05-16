// 리트코드 거꾸로 해도 똑같은 가장 긴 부분 문자열 찾기
class Solution {
    // 부분 문자열 확장하는 함수
    func expand(_ left: Int, _ right: Int, _ s: [String]) -> String {
        var newLeft = left
        var newRight = right
        while newLeft >= 0 && newRight < s.count && s[newLeft] == s[newRight] {
            newLeft -= 1
            newRight += 1
        }
        return s[newLeft + 1..<newRight].joined()
    }
    
    func longestPalindrome(_ s: String) -> String {
        let sArr = s.map { String($0) }
        var answer = ""
        
        if s.count < 2 || s == sArr.last! { return s }
        
        for i in 0..<s.count-1 {
            answer = [answer, expand(i, i, sArr), expand(i, i+1, sArr)].max { $0.count < $1.count }!
        }
        
        return answer
    }
}


let s = Solution()
s.longestPalindrome("ibvjkmpyzsifuxcabqqpahjdeuzaybqsrsmbfplxycsafogotliyvhxjtkrbzqxlyfwujzhkdafhebvsdhkkdbhlhmaoxmbkqiwiusngkbdhlvxdyvnjrzvxmukvdfobzlmvnbnilnsyrgoygfdzjlymhprcpxsnxpcafctikxxybcusgjwmfklkffehbvlhvxfiddznwumxosomfbgxoruoqrhezgsgidgcfzbtdftjxeahriirqgxbhicoxavquhbkaomrroghdnfkknyigsluqebaqrtcwgmlnvmxoagisdmsokeznjsnwpxygjjptvyjjkbmkxvlivinmpnpxgmmorkasebngirckqcawgevljplkkgextudqaodwqmfljljhrujoerycoojwwgtklypicgkyaboqjfivbeqdlonxeidgxsyzugkntoevwfuxovazcyayvwbcqswzhytlmtmrtwpikgacnpkbwgfmpavzyjoxughwhvlsxsgttbcyrlkaarngeoaldsdtjncivhcfsaohmdhgbwkuemcembmlwbwquxfaiukoqvzmgoeppieztdacvwngbkcxknbytvztodbfnjhbtwpjlzuajnlzfmmujhcggpdcwdquutdiubgcvnxvgspmfumeqrofewynizvynavjzkbpkuxxvkjujectdyfwygnfsukvzflcuxxzvxzravzznpxttduajhbsyiywpqunnarabcroljwcbdydagachbobkcvudkoddldaucwruobfylfhyvjuynjrosxczgjwudpxaqwnboxgxybnngxxhibesiaxkicinikzzmonftqkcudlzfzutplbycejmkpxcygsafzkgudy")
