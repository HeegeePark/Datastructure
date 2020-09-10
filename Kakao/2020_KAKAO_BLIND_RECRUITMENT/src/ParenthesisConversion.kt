import java.util.*

class ParenthesisConversion {
    fun test() {
        val inputArr = arrayOf("(()())()", ")(", "()))((()")
        for (input in inputArr){
            println(solution(input))
        }
    }

    fun solution(p: String): String {
        var answer = ""
        answer = convert_right(p)
        return answer
    }

    // 올바른 괄호 문자열로 변환하는 재귀함수
    fun convert_right(p: String): String {
        var u: String = ""
        var v: String = ""

        // 올바른 문자열인지 확인
        if(check_right(p)) {
            return p
        }
        else {
            for (i in 2..p.length step 2) {     // step 2 == i += 2
                if(check_balance(p.substring(0,i))) {
                    // 문자열 u,v로 분리
                    u = p.substring(0,i)
                    if (i != p.length) {
                        v = p.substring(i,p.length)
                    }
                    break
                }
            }
            // u 올바른 문자열 여부에 따라 변환하여 리턴
            when(check_right(u)) {
                true -> {if (v == "") return u else return u + (convert_right(v))}
                false -> {
                    return "(" + if(v == "") v else {convert_right(v)} + ")" + process_u(u)
                }
            }
        }
        // 예외처리
//        return "-1"
    }

    // 문자열 u가 올바르지 않을 때, 프로세싱하는 함
    fun process_u(u: String): String {
        var processed_U=""
        for (i in 0 until u.length) {
            if (!(i == 0 || i == u.length - 1)) when {
                u[i].equals('(') -> processed_U += ")"
                u[i].equals(')') -> processed_U += "("
            }
        }
        return processed_U
    }

    // 올바른 괄호 문자열인지 확인하는 함수
    fun check_right(p: String): Boolean {
        // 스택으로 확인하기
        var stack = Stack<Char>()
        for (parenthesis in p) when {
            parenthesis.equals('(') -> {
                stack.push(parenthesis)
            }
            parenthesis.equals(')') -> {
                if (!stack.empty()) stack.pop()
                else return false
            }
        }
        return stack.empty()
    }

    // 균형잡힌 괄호 문자열인지 확인하는 함수
    fun check_balance(p: String): Boolean {
        // "(", ")" 개수가 같은지 확인
        var opened_p = 0
        var closed_p = 0
        for (parenthesis in p) when {
            parenthesis.equals('(') -> opened_p++
            parenthesis.equals(')') -> closed_p++
        }
        return opened_p == closed_p
    }
}