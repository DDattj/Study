//
//  푸드파이트.swift
//  CodingTest
//
//  Created by 이시안 on 3/15/24.
//

/*import Foundation

func solution(_ food: [Int]) -> String {
    // 0번째 수는 물의 개수
    let water = food[0]
    // 배열의 가운데 지점 정하기
    let middle = food.count / 2

    let firstFood = food[1]
    var foodList = Array(repeating: firstFood, count: water * 2)

    let secondFood = food[2]

    let availableSpace = foodList.count - 2
    if availableSpace >= 2 {
        foodList[middle - 1] = secondFood
        foodList[middle + 1] = secondFood
    } else if availableSpace == 1 {
        foodList[middle - 1] = secondFood
    } else {
        let thirdFood = food[3]
        foodList[middle] = thirdFood
    }

    // 배열을 문자열로 변환하여 반환
    return foodList.map { String($0) }.joined(separator: ", ")
}
*/

import Foundation

func solution(_ food:[Int]) -> String {
    var result = ""
    for i in food.indices {
        result += String(repeating: String(i), count: food[i] / 2)
    }
    return result + "0" + result.reversed()
}
