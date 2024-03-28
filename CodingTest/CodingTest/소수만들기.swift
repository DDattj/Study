//
//  소수만들기.swift
//  CodingTest
//
//  Created by 이시안 on 3/28/24.
//

/* 잘못된 식
 import Foundation

//배열 안 수를 더해서 소수 만들 수 있는 경우의 수 구하기
func solution(_ nums:[Int]) -> Int {
    var count = 0
    var sum = 0
    for sum in nums.reduce("", nums + nums + nums) //일단 이렇게 쓰는거 불가능
    if sum % 2 != 0 && sum % 3 != 0 && sum % 5 != 0 && sum % 7 != 0{
        return count += 1
    }
    return ""
}
 */
        
import Foundation

// 주어진 숫자 중 3개의 수를 더하여 소수가 되는 경우의 개수를 반환하는 함수
func solution(_ nums: [Int]) -> Int {
    var count = 0

    // 3개의 숫자를 골라 더하여 소수인지 확인
     for i in 0..<nums.count {
        for j in (i + 1)..<nums.count {
            for k in (j + 1)..<nums.count {
                //배열 안 임의의 수 3개를 모두 더한것을 sum
                let sum = nums[i] + nums[j] + nums[k]
               
                var isPrime = true // 소수면 true, 아래의 경우는 false
                if sum <= 1 {
                    isPrime = false  // 만약 세개의 수 더한게 1보다 작으면 false
                } else {
                    for n in 2..<sum {
                        if sum % n == 0 {
                            isPrime = false
                            break // 2부터 sum까지 수 중에서 세개의 수 더한게 나머지가 0이 나오는 경우가 존재하면 false
                        }
                    }
                }
                if isPrime {
                    count += 1 //true 값을 더해서 count로 리턴하도록
                }
            }
        }
    }

    return count
}
