import UIKit

//일단 클래스 생성, 이름은 Calculator
class Calculator {
    
    // 연산을 할 정수 2개 만들기
    // 컴퓨터 로컬에 '데스크탑''문서' 라는 기본 공간이름 정의라 생각하면 쉬움
    let number1: Int
    let number2: Int
    
    // '문서' 안에서 파일 이름 정하기
    init(n1: Int, n2: Int) {
        self.number1 = n1
        self.number2 = n2
    }
    
    
    /*프로그래머스 연산식 참고
     ()는 앞의 단계와 이름을 또 써줘야 하는걸 생략한 것
     -> 는 바꾸고 싶은 형식 포인트! 라고 생각하자 */
    func add() -> Int {
        return number1 + number2
    }
    
    func subtract() -> Int {
        return number1 - number2
    }
    
    func multiply() -> Int {
        return number1 * number2
    }
    
    //답을 2개 추출하고 싶을땐 앞에 string 붙여서 문자열로 인식하게
    // 그리고 꼭 \(답) 이거 해주기
    func divide() -> Int {
        return number1 / number2
    } //2가 0일때 오류가 날 경우의 로그도 작성해야한다!!!! (((내일 수정하기
    
    func remaind() -> Int {
            return number1 % number2
        }
    }


    
//실행해보기
let calculator = Calculator(n1: 6, n2: 0)
print(calculator.add())
print(calculator.subtract())
print(calculator.multiply())
print(calculator.divide())
print(calculator.remaind())

let calculator2 = Calculator(n1: 8, n2: 3)
print(calculator2.add())
print(calculator2.subtract())
print(calculator2.multiply())
print(calculator2.divide())
//calculator 라고만 되어있어서 답이 이상하게 출력됐던것! 가리키는 대상이 옳게 연결되어있는지 잘 확인하자
print(calculator2.remaind())


