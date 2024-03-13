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
        
        //답 작성칸 만들기
        let input = readLine()
            if let userInput = Int(input){
                
            }
        }
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



class Answer: BaseballGame {
    let answer: Int
    //답이 구해질때까지 초기화
    init(answer: Int) {
        self.answer = answer
    }
    
    //입력한 값 분석하고 스트라이크와 볼 값 구하는 매서드
    func judge(userInput: String) -> (strike: Int, ball: Int, message: String) {
        var strike = 0
        var ball = 0
        
        // 적은 내용이 숫자가 아니라면 오류문구 띄우기
        guard let userNumber = Int(userInput) else {
            return (0, 0, "올바르지 않은 형식입니다. 숫자를 입력해주세요.")
        }
        
        //생각하지 못했던 내용
        //입력한 숫자를 (인덱스,값)으로 저장하도록 변환
        //내가 입력한 값을 (인덱스,값) 데이터로 변환
        let userInputArray = Array(userInput)
        //숫자로 써진 문자열 답을 (인덱스,값) 데이터로 변환
        let answerArray = Array(String(answer))
        
        //userInputArray의 인덱스와 값을 확인했을때
        for (index, number) in userInputArray.enumerated() {
            //answerArray 일치하면 스트라이트 1개씩 추가
            if number == answerArray[index] {
                strike += 1
            } //만약 숫자만 일치하면 볼 1개씩 추가
            else if answerArray.contains(number) {
                ball += 1
            }else{
                //옳게 입력하면 print "정답입니다!"
                return (strike, ball, "정답입니다!")
            }
        }
        return (strike, ball, "스트라이크: \(strike), 볼: \(ball)")
    }
}


 let game = BaseballGame()
 game.start()

