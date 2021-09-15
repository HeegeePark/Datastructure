import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
  // 없는 사람 0 / 옷 한벌 1 / 여분 소지 2
  var student = [Int](repeating: 1, count: n)
  for i in lost {
    let index = i - 1
    student[index] -= 1
  }
  for i in reserve {
    let index = i - 1
    student[index] += 1
  }
  // 체육복 빌려주기
  for (index, value) in student.enumerated() {
    if value == 0 {
      if index > 0 && student[index - 1] == 2 {
        student[index - 1] -= 1
        student[index] += 1
      } else if index < student.count - 1 && student[index + 1] == 2 {
        student[index + 1] -= 1
        student[index] += 1
      }
    }
  }
    let answer = student.filter { $0 >= 1 }.count
  return answer
}
