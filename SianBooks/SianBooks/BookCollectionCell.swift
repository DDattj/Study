//
//  BookCollectionCell.swift
//  SianBooks
//
//  Created by 이시안 on 5/2/24.
//

import Foundation
import UIKit

class BookCollectionCell: UICollectionViewCell {
    static let indentifier = "BookCollectionCell"
    
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
            $0.centerX.equalTo(bookImage)
            $0.top.equalTo(bookImage.snp.bottom).offset(10)
        }
        
    }
    
    func configureUI() {
        
        bookImage.backgroundColor = .darkGray
        bookImage.layer.cornerRadius = 10
        bookImage.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        bookImage.layer.shadowOpacity = 0.3
        bookImage.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        bookTitle.text = "책 제목"
        bookTitle.font = UIFont.systemFont(ofSize: 13)
        
    }
}

