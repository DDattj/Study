import UIKit

/*
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
    
    //number가 0일때 오류가 날 경우도 작성해야한다!!!!
    func divide() -> Int {
        if number1 != 0 && number2 != 0 {
            return number1 / number2
        } else {
            return 0
        }
    }
    
    func remaind() -> Int {
        if number1 != 0 && number2 != 0 {
            return number1 % number2
        } else {
            return 0
        }
    }
}


    
//실행해보기
let calculator = Calculator(n1: 6, n2: 0)
print("더하면 \(calculator.add())")
print("빼면 \(calculator.subtract())")
print("곱하면 \(calculator.multiply())")
print("나누면 \(calculator.divide())")
print("나머지는 \(calculator.remaind())")
//print 내에서 줄바꿈 하고싶을땐 print("\n")공백을 프린트 해주면 된다
print("\n")
let calculator2 = Calculator(n1: 8, n2: 3)
print("더하면 \(calculator2.add())")
print("빼면 \(calculator2.subtract())")
print("곱하면 \(calculator2.multiply())")
print("나누면 \(calculator2.divide())")
//calculator 라고만 되어있어서 답이 이상하게 출력됐던것! 가리키는 대상이 옳게 연결되어있는지 잘 확인하자
print("나머지는 \(calculator2.remaind())")
*/


class Calculator {
    
    let number1: Int
    let number2: Int
    
    init(n1: Int, n2: Int) {
        self.number1 = n1
        self.number2 = n2
    }
    
    func calculate(){
                print("덧셈 결과: \(AddOperation(n1: number1, n2: number2).add())")
                print("뺄셈 결과: \(SubtractOperation(n1: number1, n2: number2).subtract())")
                print("곱셈 결과: \(MultiplyOperation(n1: number1, n2: number2).multiply())")
                print("나눗셈 결과: \(DivideOperation(n1: number1, n2: number2).divide())")
    }
}

class AddOperation {
    var x: Int
    var y: Int
    
    init(n1: Int, n2: Int) {
        self.x = n1
        self.y = n2
    }
    
    func add() -> Int{
        return x + y
    }
}

class SubtractOperation {
    var x: Int
    var y: Int
    
    init(n1: Int, n2: Int) {
        self.x = n1
        self.y = n2
    }
    
    func subtract() -> Int{
        return x - y
    }
}

class MultiplyOperation {
    var x: Int
    var y: Int
    
    init(n1: Int, n2: Int) {
        self.x = n1
        self.y = n2
    }
    
    func multiply() -> Int{
        return x * y
    }
}

class DivideOperation {
    var x: Int
    var y: Int
    
    init(n1: Int, n2: Int) {
        self.x = n1
        self.y = n2
    }
    
    func divide() -> Int{
        return x / y
    }
}


let answer = Calculator(n1: 40, n2: 4)
answer.calculate()

