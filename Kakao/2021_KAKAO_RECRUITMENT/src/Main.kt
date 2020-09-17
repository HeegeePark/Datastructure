fun main(){
    val info: Array<String> = arrayOf("java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50")
    val query: Array<String> = arrayOf("java and backend and junior and pizza 100","python and frontend and senior and chicken 200","cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150")
    println(Solution().solution(info, query))
}

data class Volunteer(
    val language: String,
    val jobgroup: String,
    val career: String,
    val soulfood: String,
    val score: Int
)

// 3번 문제 (풀이중)
class Solution {
    fun solution(info: Array<String>, query: Array<String>): IntArray {
        var answer: IntArray = intArrayOf()
        val volunteerList :ArrayList<Volunteer> = arrayListOf()
        var who_selected: ArrayList<Int> = arrayListOf()

        // 지원자 정보 엔티티에 저장
        for (data in info) {
            val person = data.split(" ")
            volunteerList.add(Volunteer(person[0], person[1], person[2], person[3], person[4].toInt()))
        }

        // 쿼리 분석하여 answer에 결과 저장
        for (i in 0..query.size) {
            query[i] = query[i].replace(" and ", " ")
            val filters = query[i].split(" ")

            who_selected = filter_volunteer(filters, volunteerList)
            answer[i] = who_selected.size
            who_selected.clear()
        }

        return answer
    }

    fun filter_volunteer(property: List<String>, volunteers: ArrayList<Volunteer>): ArrayList<Int> {
        var selectList: ArrayList<Int> = ArrayList()

        volunteers = volunteers.filter {
            (it.language.equals(property[0])) &&
                    (it.jobgroup.equals(property[1])) &&
                    (it.career.equals(property[2])) &&
                    (it.soulfood.equals(property[3])) &&
                    (it.score.toString().equals(property[4])) &&

        }.forEach(selectList.add(it.))

        return selectList
    }
}

// 1번 문제 (채점 완료)
//class Solution {
//    fun solution(new_id: String): String {
//        var answer: String = new_id
//
//        // 1단계
//        for (c in new_id) when(c) {
//            in 'A'..'Z' -> {
//                answer= answer.replace(c,c.toLowerCase())
//            }
//        }
//        // 2단계
//        answer.filterNot {
//            (it in 'a'..'z') ||
//                    (it in '0'..'9') ||
//                    (it == '-') ||
//                    (it == '_') ||
//                    (it == '.')
//        }.forEach { answer = answer.replace(it.toString(), "") }
//
//        // 3단계
//        for (cnt in answer.length downTo 2) {
//            var mark = Array<String>(cnt) {i -> "."}
//            val mark_s = mark.joinToString()
//                .replace(", ","")
//            answer = answer.replace(mark_s, ".")
//        }
//
//        // 4단계
//        if (answer.first().equals('.')) answer = answer.substring(1,answer.length)
//        if (answer != "" && answer.last().equals('.')) answer = answer.substring(0,answer.length-1)
//
//        // 5단계
//        if (answer == "") answer = "a"
//
//        // 6,7단계
//        when {
//            answer.length >= 16 -> {
//                answer = answer.substring(0,15)
//                if (answer.last().equals('.')) answer = answer.substring(0,answer.length-1)
//            }
//            answer.length <= 2 -> {
//             while (answer.length < 3) {
//                 answer += answer.last()
//             }
//            }
//        }
//        return answer
//    }
//}

//class Solution {
//    fun solution(v: Array<IntArray>): IntArray {
//        var answer = intArrayOf(0,0)
//        val x = arrayListOf<Int>()
//        val y = arrayListOf<Int>()
//        for (pair in v) {
//            x.add(pair[0])
//            y.add(pair[1])
//        }
//        for (i in 0..x.size) when{
//            !(x.get(0) == x.get(1)) -> {
//                if (x.get(1) == x.get(2)) answer[0] = x.get(0)
//                else answer[0] = x.get(1)
//            }
//            else -> {
//                answer[0] = x.get(2)
//            }
//        }
//        for (i in 0..y.size) when{
//            !(y.get(0) == y.get(1)) -> {
//                if (y.get(1) == y.get(2)) answer[1] = y.get(0)
//                else answer[1] = y.get(1)
//            }
//            else -> {
//                answer[1] = y.get(2)
//            }
//        }
//        // 나머지 한 점의 좌표 return
//        return answer
//    }
//}