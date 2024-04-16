//
//  RemoteProducts.swift
//  MyWishList
//
//  Created by 이시안 on 4/16/24.
//

import Foundation

//URL로 가져올 정보의 틀
struct RemoteProduct: Decodable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}
