//
//  모의고사.swift
//  CodingTest
//
//  Created by 이시안 on 3/26/24.
//

import Foundation

func solution(_ answers:[Int]) -> [Int] {
    let student1: [Int] = [1, 2, 3, 4, 5]
    let student2: [Int] = [2, 1, 2, 3, 2, 4, 2, 5]
    let student3: [Int] = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    let count1 = student1.filter { answers.contains($0) }.count
    let count2 = student2.filter { answers.contains($0) }.count
    let count3 = student3.filter { answers.contains($0) }.count
    let ranking = [count1, count2, count3]
    
    if count1 < count2 && count3 != 0 {
        return [2]
    } else if count2 < count1 && count3 != 0 {
        return [1]
    } else if count3 < count1 && count2 != 0 {
        return [3]
    } else {
        var result: [Int] = []
        for (index, count) in ranking.enumerated() {
            if count == ranking.max() {
                result.append(index + 1)
            }
        }
        return result
    }
}

let answers = [1, 2, 3, 4, 5]
print(return)
