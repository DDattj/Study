//
//  MyBooksCell.swift
//  SianBooks
//
//  Created by 이시안 on 5/3/24.
//

import Foundation
import UIKit

class MyBooksCell: UITableViewCell {
    
    static let identifier = "MyBooksCell"
    
    let bookImage = UIImageView()
    let bookTitle = UILabel()
    let author = UILabel()
    let pages = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        [bookImage,bookTitle,author,pages].forEach {
            self.addSubview($0)
        }
        
        bookImage.snp.makeConstraints(){
            $0.top.equalTo(self)
            $0.width.height.equalTo(105)
            $0.left.equalTo(self)
            $0.centerY.equalTo(self)
        }
        bookTitle.snp.makeConstraints(){
            $0.top.equalTo(self).offset(27)
            $0.left.equalTo(bookImage.snp.right).offset(21)
        }
        author.snp.makeConstraints(){
            $0.top.equalTo(bookTitle.snp.bottom).offset(12)
            $0.left.equalTo(bookImage.snp.right).offset(21)
        }
        pages.snp.makeConstraints(){
            $0.centerY.equalTo(self)
            $0.right.equalTo(self).inset(29)
        }
    }
    
    func configureUI() {
        bookImage.backgroundColor = .red
        
        bookTitle.text = "\(1)"
        bookTitle.font = UIFont.boldSystemFont(ofSize: 15)
        
        author.text = "\(1)"
        author.font = UIFont.boldSystemFont(ofSize: 13)
        
        pages.text = "\(1)p"
        pages.font = UIFont.boldSystemFont(ofSize: 14)
    }
    
}

