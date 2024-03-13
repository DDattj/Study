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
        let number = makeNumber
        print("< 게임을 시작합니다 >")
        print("예상 숫자를 입력해주세요")
    }
    
    //문제로 낼 3자리 숫자 랜덤으로 만드는 함수
    func makeNumber() -> Int {
        var randomNumber: Int
        var firstDigit: Int
        var secondDigit: Int
        var thirdDigit: Int
        
        repeat {
            //3개의 숫자가 결합된 수 만들기
            randomNumber = Int.random(in: 100...998)
            firstDigit = randomNumber / 100
            secondDigit = (randomNumber / 10) % 10
            thirdDigit = randomNumber % 10
            
            //이때 3개의 숫자는 겹치지 않게. 하나라도 겹치는게 생기면 다시 처음부터 랜덤 돌리는걸로
        } while firstDigit == secondDigit || firstDigit == thirdDigit || secondDigit == thirdDigit
        // while 다음엔 {}안해도 됨!
        return randomNumber
    }
}

class Answer: BaseballGame {
    let answer = answerReturn
    //어떠한 3자리 수를 입력할 시 그 수를 분석
    func answerReturn(firstAnswer: Int, secondAnswer: Int, thirdAnswer : Int,  firstDigit: Int, secondDigit: Int, thirdDigit: Int ) -> String{
        if firstAnswer == firstDigit || secondAnswer == secondDigit || thirdAnswer == thirdDigit {
            //3자리수를 맞추면 게임 종료
            return "정답입니다!"
        } else {
            return "틀렸습니다."
        }
    }
}



//어떠한 3자리 수를 입력할 시 그 수를 분석
//같은 인덱스에 같은 값을 가지면 스트라이크 라고 표시
//그 수 내에 동일한 숫자가 있으면 볼 이라고 표시
//스트라이크와 볼의 개수를 표시
//올바르지 않은 입력값은 형식에 맞는 답을 써달라는 문구 표시


let game = BaseballGame()
game.start()
let answer = Answer()
let input = readLine()
