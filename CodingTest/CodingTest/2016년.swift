//
//  2016년.swift
//  CodingTest
//
//  Created by 이시안 on 3/21/24.
//

import Foundation
//월과 일이 주어졌을때 요일을 리턴하는 함수
//1<= a <= 12
//1<= b <= 31 / 이때 a가 2일때는 29까지만
//let DayName: String = ""

func solution(_ a:Int, _ b:Int) -> String {
    let DayName: [String] = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    
    //범위 써줄때 사이에 낀 범위면 && 꼭 사용
    if (1 <= a && a <= 12) && (1 <= b && b <= 31) {
        //윤년 2월에 대한 처리 입력
        if a == 2 && b > 30 {
            return "없는 날 입니다"
        }
        
        //캘린더 어떻게 가져오는지 모름, 챗지피티 활용해서 따라치자
        //날짜를 원하는 형식으로 포맷하기 위한 클래스 사용. yyyy-MM-dd 형식으로 만들어줘
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        
        //형식 포맷한대로 2016-00-00이 될것 이때 a는 달이 되고 b는 일이 된다
        //%02d는 두자리 정수로 서식을 지정하는것. 한자리 정수 서식은 %d, 세자리 정수 서식은 %03d
        if let date = dateFormat.date(from: String(format: "2016-%02d-%02d", a, b)) {
            //그레고리력(태양력)을 기준으로 설정
            let calendar = Calendar(identifier: .gregorian)
            //캘린더 컴포넌트 = 날짜가 주어졌을때 그것을 7개당 1줄, 일요일로 시작하는 형식으로 바꿔달라는 말(캘린더 필수 형식)
            let weekday = calendar.component(.weekday, from: date)
            //요일은 1부터 시작하지만 배열은 0부터 시작이니깐 -1 해주고 시작.
            return DayName[weekday - 1]
        } else {
            return "없는 날 입니다"
        }
    } else {
        return "없는 날 입니다"
    }
}
