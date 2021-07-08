// 백준 1022번 소용돌이 예쁘게 출력하기
import Foundation

// 소용돌이 value get 함수
func getSwirlValue(_ i: Int, _ j: Int) -> Int {
    let n = max(abs(i), abs(j))
    var val = (pow(Decimal(2 * n + 1), 2) as NSDecimalNumber).intValue   // n*n 크기의 소용돌이에서 우측 하단 값
    
    let diff = 2 * n    // 모서리별 값 차이
    if i == n { return  val - (n - j) }
    val -= diff
    if j == -n { return  val - (n - i) }
    val -= diff
    if i == -n { return  val - (j + n) }
    val -= diff
    return  val - (i + n)
}

// 몇자리 수인지 get하는 함수
func getDecimalCount(_ val: Int) -> Int {
    return val != 0 ? getDecimalCount(val / 10) + 1: 0
}

let input = readLine()!.split(separator: " ").map { Int($0) }

let maxIndex = input.max { $0! < $1! }

// 최대 자릿수 찾기
var maxDC = 0
for i in  input[0]!...input[2]! {
    for j in input[1]!...input[3]! { maxDC = max(getDecimalCount(getSwirlValue(i, j)), maxDC) }
}

// 소용돌이 출력하기
for i in  input[0]!...input[2]! {
    for j in input[1]!...input[3]! {
        let interval = maxDC - getDecimalCount(getSwirlValue(i, j))
        let space = [String](repeating: " ", count: interval).joined()
        print("\(space)\(getSwirlValue(i, j))", terminator: " ")
    }
    print("", terminator: "\n")
}
