//
//  모의고사.swift
//  CodingTest
//
//  Created by 이시안 on 3/28/24.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    //각 학생들의 찍은 패턴 정리
    let student1: [Int] = [1, 2, 3, 4, 5]
    let student2: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
    let student3: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    //답과 일치하는 경우만 걸러낸 후 그 개수를 각 학생들에게 부여
    //비교를 해서 더 큰쪽을 리턴, 개수가 동일하면 오름차순으로 리턴을 시키려고 했음
    //하지만 이 이상으로 어떻게 풀어야 할지 몰라서 실패
/*    let count1 = student1.filter { answers.contains($0) }.count
    let count2 = student2.filter { answers.contains($0) }.count
    let count3 = student3.filter { answers.contains($0) }.count
*/

    // 각 수포자들의 정답 개수
       var scores = [0, 0, 0]
       
       // 정답 확인 및 점수 계산
       for (index, answer) in answers.enumerated() {
           if answer == student1[index % student1.count] {
               scores[0] += 1
           }
           if answer == student2[index % student2.count] {
               scores[1] += 1
           }
           if answer == student3[index % student3.count] {
               scores[2] += 1
           }
       }
       
       // 가장 많은 문제를 맞힌 수포자(들) 찾기
       //가장 많은 스코어를 얻은 사람을 리턴하도록, 만약 동점자가 발생한다면 인덱스가 작은것에서 큰것으로(오름차순으로) 정렬되도록 리턴
       let maxScore = scores.max() ?? 0
       var result: [Int] = []
       for (index, score) in scores.enumerated() {
           if score == maxScore {
               result.append(index + 1)
           }
       }
       
       return result
   }
