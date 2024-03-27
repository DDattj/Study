//
//  모의고사.swift
//  CodingTest
//
//  Created by 이시안 on 3/26/24.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    //각 학생들의 찍은 패턴 정리
    let student1: [Int] = [1, 2, 3, 4, 5]
    let student2: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
    let student3: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    //답과 일치하는 경우만 걸러낸 후 그 개수를 각 학생들에게 부여
    //비교를 해서 더 큰쪽을 리턴, 개수가 동일하면 오름차순으로 리턴을 시키려고 했음
/*    let count1 = student1.filter { answers.contains($0) }.count
    let count2 = student2.filter { answers.contains($0) }.count
    let count3 = student3.filter { answers.contains($0) }.count
    let ranking = [count1, count2, count3]
    
    
    if count1 < count2 && count3 != 0 {
        return [2]
    } else if count2 < count1 && count3 != 0 {
        return [1]
    } else if count3 < count1 && count2 != 0 {
        return [3]
    } else if count1 == count2 || count2 == count3 || count1 == count3 {
        return [raking.sorted(by: >)]
    }
    return result
}*/

    // 각 수포자들의 정답 개수
       var scores = [0, 0, 0]
       
       // 정답 확인 및 점수 계산
       for (index, answer) in answers.enumerated() {
           if answer == pattern1[index % pattern1.count] {
               scores[0] += 1
           }
           if answer == pattern2[index % pattern2.count] {
               scores[1] += 1
           }
           if answer == pattern3[index % pattern3.count] {
               scores[2] += 1
           }
       }
       
       // 가장 많은 문제를 맞힌 수포자(들) 찾기
       let maxScore = scores.max() ?? 0
       var result: [Int] = []
       for (index, score) in scores.enumerated() {
           if score == maxScore {
               result.append(index + 1)
           }
       }
       
       return result
   }
