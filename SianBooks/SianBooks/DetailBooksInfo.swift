//
//  DetailBooksInfo.swift
//  SianBooks
//
//  Created by 이시안 on 5/2/24.
//

import Foundation
import UIKit

class DetailBooksInfo: BaseViewController {
    
    let title1 = UILabel()
    let background = UIImageView()
    let bookImage = UIImageView()
    let bookTitle = UILabel()
    let author = UILabel()
    let bookDetail = UILabel()
    let selectButton = UIButton()
    var bookSelected: Bool = false {
        didSet {
            updateSelectButtonUI()
        }
    }
    let closeButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupConstraints()
        configureUI()
        bookSelected = false
        
    }
    
    override func setupConstraints() {
        [background, bookDetail, author, bookTitle, bookImage, selectButton, closeButton, title1].forEach {
            view.addSubview($0)
        }
        //꾸밈 배경
        background.snp.makeConstraints() {
            $0.top.equalTo(view).offset(238)
            $0.left.right.bottom.equalToSuperview()
        }
        
        //앱 타이틀
        title1.snp.makeConstraints() {
            $0.top.equalTo(view).offset(34)
            $0.centerX.equalTo(view)
        }
        
        //책 표지
        bookImage.snp.makeConstraints() {
            $0.top.equalTo(view).offset(87)
            $0.left.right.equalTo(view).inset(96)
            $0.height.equalTo(262)
        }
        
        //책 제목
        bookTitle.snp.makeConstraints() {
            $0.top.equalTo(bookImage.snp.bottom).offset(16)
            $0.centerX.equalTo(view)
        }
        
        //저자
        author.snp.makeConstraints() {
            $0.top.equalTo(bookTitle.snp.bottom).offset(8)
            $0.centerX.equalTo(view)
        }
        
        //책 줄거리
        bookDetail.snp.makeConstraints() {
            $0.top.equalTo(author.snp.bottom).offset(23)
            $0.left.right.equalTo(view).inset(33)
        }
        //창 닫기 버튼
        closeButton.snp.makeConstraints() {
            $0.top.equalTo(view).offset(683)
            $0.left.equalTo(view).offset(26)
            $0.width.equalTo(92)
            $0.height.equalTo(62)
        }
        //관심 담기 버튼
        selectButton.snp.makeConstraints() {
            $0.top.equalTo(view).offset(683)
            $0.left.equalTo(closeButton.snp.right).offset(15)
            $0.right.equalTo(view).inset(26)
            $0.height.equalTo(62)
        }
    }
    
    
    override func configureUI() {
        //앱 타이틀
        title1.text = "RabbitBooks"
        title1.font = UIFont(name: "Ghanachocolate", size: 18)
        title1.tintColor = UIColor(red: 8/255, green: 28/255, blue: 33/255, alpha: 1.0)
        
        //꾸밈 배경
        background.image = UIImage(named: "background")
        background.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        background.layer.shadowOpacity = 0.3
        background.layer.shadowOffset = CGSize(width: 0, height: -1)
        
        //책 표지
        bookImage.backgroundColor = .green
        bookImage.layer.cornerRadius = 5
        bookImage.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        bookImage.layer.shadowOpacity = 0.3
        bookImage.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        //책 제목
        bookTitle.text = "책 제목"
        bookTitle.textColor = .white
        bookTitle.font = UIFont.boldSystemFont(ofSize: 15)
        
        //저자
        author.text = "저자"
        author.textColor = .white
        author.font = UIFont.boldSystemFont(ofSize: 13)
        
        //줄거리
        bookDetail.text = "줄거리"
        bookDetail.font = UIFont.systemFont(ofSize: 14)
        bookDetail.textColor = .white
        bookDetail.textAlignment = .center
        
        //닫기 버튼
        closeButton.backgroundColor = UIColor(red: 159/255, green: 169/255, blue: 161/255, alpha: 1.0)
        closeButton.layer.cornerRadius = 10
        closeButton.setImage(UIImage(systemName: "x.circle"), for: .normal)
        closeButton.imageView?.tintColor = .white
        closeButton.addTarget(self, action: #selector(clickToBack), for: .touchUpInside)
        
        
        //관심 담기 버튼
        //겹칠 내용들은 전부 아래에서 정의
        selectButton.layer.cornerRadius = 10
        updateSelectButtonUI() // 버튼 UI 설정
        selectButton.addTarget(self, action: #selector(clickToAdd), for: .touchUpInside)
        
    }
    
    @objc func clickToAdd() {
        //버튼이 선택되었을때의 값을 정의. 버튼이 선택되면 버튼의 상태는 true가 되고 알림창이 뜬다
        //이 코드를 써주는 이유는 버튼의 상태를 false로 바꿀때는 알림창이 뜨지 않도록 하기 위해
        bookSelected.toggle()
        // 버튼 선택하면 알림창 뜨기
        if bookSelected {
            let alert = UIAlertController(title: "책 담기 완료!", message: "현재 보고계신 책을 내 서재에 등록했습니다", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
    }
    
    //버튼이 선택 되었을때와 아닐때의 상태를 각각 정의
    func updateSelectButtonUI() {
        let buttonTitle = bookSelected ? "등록 취소" : "내 서재로 등록"
        let buttonColor = bookSelected ? UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 1.0) : UIColor(red: 104/255, green: 140/255, blue: 79/255, alpha: 1.0)
        selectButton.backgroundColor = buttonColor
        selectButton.setTitle(buttonTitle, for: .normal)
    }
    
    @objc func clickToBack(){
        dismiss(animated: true, completion: nil) //closeButton 을 누르면 애니메이션과 함께 모달이 닫힘
    }
}
