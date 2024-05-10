//
//  BookManager.swift
//  SianBooks
//
//  Created by 이시안 on 5/9/24.
//

import Foundation

//클래스명 정의
class BookManager {
    //싱글톤 객체 shared 정의, 모든 파일에서 이 객체에 접근 가능하다.
    //기본으로 쓰일 url과 앱키를 정의
    static let shared = BookManager()
    private let baseURL = "https://dapi.kakao.com/v3/search/book"
    private let apiKey = "fe9c2ac7d40d56e35aa9932ff6c61427"
    
    
    //아무책이나 불러오기
    //get 매서드 실행, 성공하면 RabbitBooks를 불러오고 실패하면 아무것도 불러오지 않음
    func get(completion: @escaping (Result<RabbitBooks, Error>) -> Void) {
        
        //components 만드는 방법은 baseURL + parameters
        //parameter는 쿼리 아이템 여러개(혹은 한개)를 가지고 있는데 가지고 있는 쿼리아이템중 '쿼리'라는 이름의 문자열을 사용할것이다. 공백문자열을 사용하는 이유는 공백을 포함한 결과값을 모두 얻고 싶어서(랜덤한 책을 불러오겠다는 말)
        var components = URLComponents(string: baseURL)
        let parameters = [URLQueryItem(name: "query", value: "히가시노")]
        //컴포넌트에 쓰일 쿼리아이템을 파라미터라 부르겠다고 둘 사이 관계 설정
        components?.queryItems = parameters
        //url조합하기 = components라고 정의
        guard let url = components?.url else {
            print("URL만들기 실패!")
            return
        }
        //URL로 어떤 요청을 할것인지 정의.
        //정보를 불러와달라고 요청할것이다.
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("KakaoAK fe9c2ac7d40d56e35aa9932ff6c61427", forHTTPHeaderField: "Authorization")
        
        //본격적으로 get()이 할 일 지정하기
        //URL세션으로 데이터를 가져오는 역할 한다.총 3가지(요청거리 정리, 전달하고 정보받기, 에러코드 내보내기)를 수행하게 될것. 앞의 2개가 성공적이라면 에러코드 내보내기는 아무 에러코드도 내보내지 않는것으로 수행
        //JSONDecoder 사용해서 디코딩 하는데 디코딩 실패하면 nil(try 뒤에 옵셔널표시 ?때문에)로 반환, 성공하면 객체를 RabbitBooks에 할당
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {
                print("데이터가 존재하지 않습니다")
                return
            }
            if let RabbitBooks = try? JSONDecoder().decode(RabbitBooks.self, from: data) {
                //해당 데이터를 RabbitBooks 모델로 디코딩하여 사용할 수 있음
                //RabbitBooks에는 데이터가 채워져 있으며, 해당 데이터를 이후에 사용할 수 있다!
                completion(.success(RabbitBooks))
            }
        }
        //작업 시작!
        task.resume()
    }
    
    
    
    //검색창 책 찾기
    //아까 get과는 조금 다름. 실행할때 search(text: ) 이렇게 적어야 하고 입력한 텍스트에 따라 결과를 필터링할것
    func search(text: String, completion: @escaping (Result<RabbitBooks, Error>) -> Void) {
        var components = URLComponents(string: baseURL)
        let parameters = [URLQueryItem(name: "query", value: text)]
        components?.queryItems = parameters
        
        guard let url = components?.url else {
            print("URL만들기 실패!")
            return
        }
        //요청사항에 필터링 해달라고 보냄
        //보낸이는 나(나의 코드로 나라는거 증명)
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("KakaoAK fe9c2ac7d40d56e35aa9932ff6c61427", forHTTPHeaderField: "Authorization")
        
        // 정보를 받아올 공간을 searchBook이라고 지정해주고 거기 정보가 들어올 수 있게 미리 비워두기
        //여러타입을 가진 데이터를 하나의 형식(JSON)으로 정리하여 받겠다
        let searchBook : [Document] = []
        request.httpBody = try? JSONEncoder().encode(searchBook)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else {
                print("데이터가 존재하지 않습니다")
                return
            }
            if let RabbitBooks = try? JSONDecoder().decode(RabbitBooks.self, from: data) {
                completion(.success(RabbitBooks))
            }
        }
        task.resume()
    }
    
    
    
    //UI에 필요한 정보 넣기
    //왜 여기서는 Result<Data, Error>가 쓰이는가
    func fetchUI(for document: Document, completion: @escaping (Result<Data, Error>) -> Void) {
        
        //Document에 담긴 thumbnail 속성에서 이미지URL를 가져온다.
        guard let imageUrl = URL(string: document.thumbnail) else {
            print("이미지URL이 올바른 형식이 아닙니다")
            return
        }
        //가져온 URL사용하여 이미지 데이터 요청작업 작성
        let task = URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            if error != nil {
                print("이미지를 불러오는 중 오류가 생겼습니다")
                return
            }
            guard let data = data else {
                print("데이터가 존재하지 않습니다")
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
}
