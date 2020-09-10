class StringCompression{
    fun test() {
        val inputArr = arrayOf("aabbaccc","ababcdcdababcdcd","abcabcdede","abcabcabcabcdededededede","xababcdcdababcdcd")
        for (input in inputArr){
            println(solution(input))
        }
    }

    fun solution(s: String): Int {
        var answer = s.length
        for (i in 1..(s.length / 2) + 1) {       // 절반까지만 중복 단위 개수 세기
            var len: Int = s.length
            var pos: Int = 0

            while (pos + i <= s.length) {      // 중복 단위 수에 따른 문자열 압축 while문
                var unit = s.substring(pos, pos + i)
                pos += i

                var cnt: Int = 0
                while (pos + i <= s.length) {      // 중복되는지 check
                    if (unit.equals(s.substring(pos, pos + i))) {
                        cnt++
                        pos += i
                    } else break
                }

                if (cnt > 0) {      // 중복되는게 있다면 압축하기
                    len = len - i * cnt

                    when {     // 중복되는 개수 자릿수에 따라 숫자 문자열 추가
                        cnt < 9 -> len += 1
                        cnt < 99 -> len += 2
                        cnt < 999 -> len += 3
                        cnt < 9999 -> len += 4
                    }
                }
            }
            answer = Math.min(answer, len)
        }
        return answer
    }
}
