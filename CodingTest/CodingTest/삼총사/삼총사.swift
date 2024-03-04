//
//  main.swift
//  삼총사
//
//  Created by 이시안 on 2/29/24.
//

import Foundation

func solution(_ number: [Int]) -> Int {
    var count = 0
    let n = number.count
    
    for i in 0..<n {
        for j in (i + 1)..<n {
            for k in (j + 1)..<n {
                if number[i] + number[j] + number[k] == 0 {
                    count += 1
                }
            }
        }
    }
    
    return count
}
