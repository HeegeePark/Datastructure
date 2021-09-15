import Foundation

//1. 주어진 `numbers` 배열 정렬
//   1. 첫번째 정수값($0)과 두번째 정수값($1)을 String으로 변환시킨다음, 두 String을 붙여 하나의 문자열을 만들기
//   2. 첫번째 정수값을 먼저 배치한 경우와 두번째 정수값을 먼저 배치한 경우 중 Int로 변환했을 대 어느 값이 큰지 비교하여 정렬
//      Ex. [0, 9] -> "09"와 "90"을 Int로 변환하여 비교
//2. 정렬된 배열의 첫번째 값이 0인지 확인하여 0일 경우 "0" 출력
//   - 정렬한 첫번째값이 0 = 모든 배열의 값이 0일 경우
//3. 정렬된 배열의 값을 하나씩 꺼내서 하나의 문자열로 합치고(reduce) 반환

func solution(_ numbers:[Int]) -> String {
    // 1. 주어진 numbers 비교하며 정렬
    let numbersSorted = numbers.sorted {
        Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }
    // 2. 정렬된 배열의 첫번째 값이 0인지 확인하여 0일 경우 "0" 출력
    if numbersSorted.first == 0 {
        return "0"
    }
    // 3. 정렬된 배열의 값을 하나씩 꺼내서 하나의 문자열로 합치고(reduce) 반환
    let answer = numbersSorted.reduce("") { $0 + "\($1)" }
    
    return answer
}

solution([3, 30, 34, 5, 9])
