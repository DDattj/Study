//
//  currentViewCell.swift
//  SianBooks
//
//  Created by 이시안 on 5/2/24.
//

import Foundation
import UIKit

class CurrentViewCell: UICollectionViewCell {
    static let indentifier = "CurrentViewCell"
    
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
            $0.left.equalTo(28)
            $0.width.equalTo(86)
            $0.height.equalTo(86)
        }
        bookTitle.snp.makeConstraints(){
            $0.centerX.equalTo(bookImage)
            $0.top.equalTo(bookImage.snp.bottom).offset(5)
        }
        
    }
    
    func configureUI() {
        
        bookImage.backgroundColor = .darkGray
        bookImage.layer.cornerRadius = 30
        bookImage.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        bookImage.layer.shadowOpacity = 0.3
        bookImage.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        bookTitle.text = "최근 열람한 책"//"\(<#any Any.Type#>)"
        bookTitle.font = UIFont.systemFont(ofSize: 13)
        
    }
    
    
}
