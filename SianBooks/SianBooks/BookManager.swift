//
//  BookManager.swift
//  SianBooks
//
//  Created by 이시안 on 5/9/24.
//

import Foundation

class BookManager {
    static let shared = BookManager()
    private let baseURL = "https://dapi.kakao.com/v3/search/book"
    private let apiKey = "fe9c2ac7d40d56e35aa9932ff6c61427"
    
    //아무책이나 불러오기
    func get() {
        var components = URLComponents(string: baseURL)
        components?.path = ""
        let parameters = [URLQueryItem(name: "query", value: "")]
        components?.percentEncodedQueryItems = parameters
        
        guard let url = components?.url else {return}
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            //여기서 에러 체크 및 받은 데이터 가공하여 사용
            guard let data,
                  let str = String(data: data, encoding:.utf8) else { return }
            print(str)
        }
        task.resume()
    }
    
    //검색창 책 찾기
    func search(text: String, completion: @escaping (Result<RabbitBooks, Error>) -> Void) {
        var components = URLComponents(string: baseURL)
        let parameters = [URLQueryItem(name: "query", value: text)]
        components?.queryItems = parameters
        
        guard let url = components?.url else { return }
        
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("KakaoAK fe9c2ac7d40d56e35aa9932ff6c61427", forHTTPHeaderField: "Authorization")
        
        //Codable 모델 생성
        let searchBook : [Document] = []
        //Codable 모델을 JSON 인코딩하여 데이터로 만든 후 http 바디에 추가
        request.httpBody = try? JSONEncoder().encode(searchBook)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data else { return }
            if let RabbitBooks = try? JSONDecoder().decode(RabbitBooks.self, from: data) {
                completion(.success(RabbitBooks))
            }
        }
        
        task.resume()
    }
    
    //이미지 불러오기
    func fetchThumbnail(for document: Document, completion: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: document.thumbnail) else {
                completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {
                    completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                    return
                }
                
                completion(.success(data))
            }
            
            task.resume()
        }
}
    
