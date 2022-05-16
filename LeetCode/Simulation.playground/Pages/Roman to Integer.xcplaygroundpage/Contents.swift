// 리트코드 Roman to Integer
class Solution {
    func romanToInt(_ s: String) -> Int {
        var sArr = s.map { String($0) }
        let romanDict = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        var answer = 0
        
        var prevRom = "I"
        for rom in sArr.reversed() {
            if romanDict[rom]! < romanDict[prevRom]! {
                answer -= romanDict[rom]!
            } else {
              answer += romanDict[rom]!
            }
            prevRom = rom
        }
        
        return answer
    }
}
let sol = Solution()
sol.romanToInt("III")

