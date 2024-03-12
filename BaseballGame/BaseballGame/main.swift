//
//  main.swift
//  BaseballGame
//
//  Created by 이시안 on 3/12/24.
//

import Foundation

//
class BaseballGame {
    func start() {
        //문제로 낼 3자리 숫자 이름 만들기
        let number = makeNumber
    }
    //문제로 낼 3자리 숫자 랜덤으로 만드는 함수
    func makeNumber() -> Int {
        //범위 정하기. 앞자리가 00이 되어선 안되니깐 100부터 시작
        let randomNumber = Int.random(in: 100...999)
        return randomNumber
        // 함수 내부를 구현하기
    }
}

let game = BaseballGame()
game.start()
