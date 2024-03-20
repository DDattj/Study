//
//  명예의_전당(1).swift
//  CodingTest
//
//  Created by 이시안 on 3/20/24.
//

import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    //명예의 전당에 올라온 점수 중 k번째 값 구하기
    //k번째 전까지는 쌓여진 숫자배열중 제일 작은 수를 리턴
    
    var sortedScore: [Int] = [] //sortedScore를 쓰기 위해 이름 붙이기
    var answer: [Int] = [] //1일차부터 n일차까지의 최저점수를 나열하는 답 출력하기 위한 코드
    for (index, number) in score.enumerated(){
        sortedScore.append(number) //원래 배열은 내버려두고 일차가 늘어날때마다 배열도 같이 늘어남(append 사용)
        sortedScore = sortedScore.sorted(by: >) //sort는 초기 배열 바꾸기, sorted는 변경된 내용 안에서 배열 바꾸기
        //배열이 잘 출력되는지 확인하기 위해 print (sortedScore) 해보기
        
        if index < k {
            let lastNumber = sortedScore.last!//배열이 비어있을 경우도 존재하니깐 옵셔널로 처리
            answer.append(lastNumber) //만약 k보다 index값이 낮다면 나온 값의 배열에서 가장 작은 수 리턴 / return 안쓰고 answer 어펜드만 한 이유는 그 값을 answer에 보내서 배열을 추출하는 문제기 때문, 만약 return 했다면 딱 이 수만 리턴이 되었을것
        } else {
            let kthNumber = sortedScore[k - 1]
            answer.append(kthNumber) //만약 index값이 k와 같거나 크다면 나온 값의 배열에서 k번째 수를 리턴
        }
    }
    return answer
}
