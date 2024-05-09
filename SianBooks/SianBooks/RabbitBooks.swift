//
//  Data.swift
//  SianBooks
//
//  Created by 이시안 on 5/6/24.
//

import Foundation

// MARK: - RabbitBooks
struct RabbitBooks: Codable {
    let documents: [Document]
    let meta: Meta
}

// MARK: - Document
struct Document: Codable {
    let authors: [String]
    let contents, datetime, isbn: String
    let publisher: String
    let thumbnail: String
    let title: String

    enum CodingKeys: String, CodingKey {
        case authors, contents, datetime, isbn, publisher
        case thumbnail, title
    }
}


// MARK: - Meta
struct Meta: Codable {
    let isEnd: Bool
    let pageableCount, totalCount: Int
    
    enum CodingKeys: String, CodingKey {
        case isEnd = "is_end"
        case pageableCount = "pageable_count"
        case totalCount = "total_count"
    }
}

