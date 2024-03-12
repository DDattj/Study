//
//  main.swift
//  BaseballGame
//
//  Created by 이시안 on 3/12/24.
//

import Foundation

class BaseballGame {
    func start() {
        //문제로 낼 3자리 숫자 이름 만들기
        let function1 = makeNumber
        print("< 게임을 시작합니다 >")
    }
    
    //문제로 낼 3자리 숫자 랜덤으로 만드는 함수
    func makeNumber() -> Int {
        //범위 정하기. 앞자리가 00이 되어선 안되니깐 100부터 시작
        let randomNumber = Int.random(in: 100...999)
        return randomNumber
    }
}





//어떠한 3자리 수를 입력할 시 그 수를 분석
//같은 인덱스에 같은 값을 가지면 스트라이크 라고 표시
//그 수 내에 동일한 숫자가 있으면 볼 이라고 표시
//스트라이크와 볼의 개수를 표시
//올바르지 않은 입력값은 형식에 맞는 답을 써달라는 문구 표시
//3자리수를 맞추면 게임 종료



let game = BaseballGame()
game.start()

