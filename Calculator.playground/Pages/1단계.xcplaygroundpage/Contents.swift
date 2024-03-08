import UIKit

//일단 클래스 생성, 이름은 Calculator
class Calculator {
    
    // 연산을 할 정수 2개 만들기
    // 컴퓨터 로컬에 '데스크탑''문서' 라는 기본 공간이름 정의라 생각하면 쉬움
    let number1: Double
    let number2: Double
    
    // '문서' 안에서 파일 이름 정하기
    //    위의 이름과 아래의 이름이 다를 경우 self. 쓰지 않아도 됨
    init(n1: Double, n2: Double) {
        number1 = n1
        number2 = n2
    }
    
    
    // ()는 앞의 단계와 이름을 또 써줘야 하는걸 생략한 것
    // -> 는 바꾸고 싶은 형식 포인트! 라고 생각하자
    func add() -> Double {
        return number1 + number2
    }
    
    func subtract() -> Double {
        return number1 - number2
    }
    
    func multiply() -> Double {
        return number1 * number2
    }
    
    //number가 0일때 오류가 날 경우도 작성해야한다!!!!
    func divide() -> Double {
            if number1 != 0 && number2 != 0 {
                return number1 / number2
            } else {
                return 0
            }
        }
    }

let calculator = Calculator(n1: 5, n2: 8)
print("더하면 \(calculator.add())")

let calculator2 = Calculator(n1: 34, n2: 21)
print("빼면 \(calculator2.subtract())")

let calculator3 = Calculator(n1: 9, n2: 6)
print("곱하면 \(calculator3.multiply())")

let calculator4 = Calculator(n1: 21, n2: 4)
print("나누면 \(calculator4.divide())")
//print 내에서 줄바꿈 하고싶을땐 print("\n")공백을 프린트 해주면 된다
print("\n")
let calculator5 = Calculator(n1: 13, n2: 0)
print("나누면 \(calculator5.divide())")
//calculator 라고만 되어있어서 답이 이상하게 출력됐던것! 가리키는 대상이 옳게 연결되어있는지 잘 확인하자
