/*:
[프로그래머스_타겟 넘버]
n개의 음이 아닌 정수가 있습니다. 이 수를 적절히 더하거나 빼서 타겟 넘버를 만들려고 합니다. 예를 들어 [1, 1, 1, 1, 1]로 숫자 3을 만들려면 다음 다섯 방법을 쓸 수 있습니다.

-1+1+1+1+1 = 3
+1-1+1+1+1 = 3
+1+1-1+1+1 = 3
+1+1+1-1+1 = 3
+1+1+1+1-1 = 3
사용할 수 있는 숫자가 담긴 배열 numbers, 타겟 넘버 target이 매개변수로 주어질 때 숫자를 적절히 더하고 빼서 타겟 넘버를 만드는 방법의 수를 return 하도록 solution 함수를 작성해주세요.

제한사항
주어지는 숫자의 개수는 2개 이상 20개 이하입니다.
각 숫자는 1 이상 50 이하인 자연수입니다.
타겟 넘버는 1 이상 1000 이하인 자연수입니다.
*/
import Foundation

var numSize: Int = 0
var count: Int = 0

func dfs(_ idx: Int, _ sum: Int, _ numbers: [Int], _ target: Int) {
    if idx == numSize {
        if sum == target {
            count += 1
        }
        return
    }
    dfs(idx + 1, sum + numbers[idx], numbers, target)
    dfs(idx + 1, sum - numbers[idx], numbers, target)
}

func solution(_ numbers:[Int], _ target:Int) -> Int {
    numSize = numbers.count
    dfs(0, 0, numbers, target)
    
    return count
}
