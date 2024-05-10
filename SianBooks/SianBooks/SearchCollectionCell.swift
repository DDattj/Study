//
//  SearchCollectionCell.swift
//  SianBooks
//
//  Created by 이시안 on 5/10/24.
//

import Foundation
import UIKit

class SearchCollectionCell: UICollectionViewCell {
    static let indentifier = "SearchCollectionCell"
    
    let bookTitle = UILabel()
    let bookImage = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        self.addSubview(bookImage)
        self.addSubview(bookTitle)
        
        bookImage.snp.makeConstraints(){
            $0.width.equalTo(102)
            $0.height.equalTo(134)
        }
        bookTitle.snp.makeConstraints(){
            $0.width.equalTo(bookImage.snp.width)
            $0.top.equalTo(bookImage.snp.bottom).offset(10)
        }
        
    }
    
    func configureUI() {
        
        bookImage.backgroundColor = .darkGray
        bookImage.layer.cornerRadius = 10
        bookImage.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        bookImage.layer.shadowOpacity = 0.3
        bookImage.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        bookTitle.font = UIFont.systemFont(ofSize: 13)
        bookTitle.textAlignment = .center
        bookTitle.numberOfLines = 2
        
    }
    
    //셀 내부에서 이미지 연결 연결
    func fetchUI(for document: Document) {
        BookManager.shared.fetchUI(for: document) { [weak self] result in switch result {
        case .success(let imageData):
            DispatchQueue.main.async {
                self?.bookImage.image = UIImage(data: imageData)
            }
        case .failure(let error):
            print("이미지를 불러오는 중 오류가 발생했습니다: \(error)")
        }
        }
        bookTitle.text = document.title
    }
}
