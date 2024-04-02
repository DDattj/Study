//
//  기사단원의 무기.swift
//  CodingTest
//
//  Created by 이시안 on 4/2/24.
//


import Foundation
//각 번호는 약수의 개수 값을 얻는다
//만약 약수가 limit보다 크다면 power값을 얻는다
//number 배열의 모든 수가 위의 과정을 따르고 모든 값을 합친 답을 리턴
func solution(_ number: Int, _ limit: Int, _ power: Int) -> Int {
    var sum = 0
    
    for i in 1...number {
        var n = 0
        
        let sqrtI = Int(sqrt(Double(i))) //이 부분에서 제곱근 활용하면 좀 더 효율적으로 바뀜
        for j in 1...sqrtI {
            if i % j == 0 {
                if j * j == i {
                    n += 1
                } else {
                    n += 2 //약수이자 이미 나온 수의 제곱수(예: 8의 약수 (2,4)) 때문에 그런 경우까지 다 생각해 구하는것
                }
            }
        }
        
        if n > limit {
            sum += power
        } else {
            sum += n
        }
    }
    
    return sum
}
/*
 for j in 1...i {
 if i % j == 0 {
 n += 1
 }
 }
 
 if n > limit {
 sum += power
 } else {
 sum += n
 }
 }
 
 return sum
 }
 */
