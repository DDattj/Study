//
//  콜라_문제.swift
//  CodingTest
//
//  Created by 이시안 on 3/19/24.
//

func solution(_ a: Int, _ b: Int, _ n: Int) -> Int {
    var remainingBottles = n //가지고 있는 콜라 정의
    var totalCola = 0 //최종 답
    
    //가지고 있는것이 a보다 크거나 같으면 계속 실행
    while remainingBottles >= a {

        let newCola = remainingBottles / a //가지고 있는것에서 몇묶음이 나오는지 계산
        totalCola += newCola * b // 교환받을 콜라
        
        //가지고 있는 콜라 = 교환하고 남은 콜라 + 받을 수 있는 콜라
        remainingBottles = remainingBottles % a + newCola * b
    }
    
    return totalCola
}
