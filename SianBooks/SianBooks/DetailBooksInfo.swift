//
//  DetailBooksInfo.swift
//  SianBooks
//
//  Created by 이시안 on 5/2/24.
//

import Foundation
import UIKit

class DetailBooksInfo: BaseViewController {
    
    let backgroundImage = UIImageView().then { //then 사용! 너무 쉽다!
        $0.contentMode = .scaleAspectFill
        $0.alpha = 0.6
    }
    
    let RabbitBooksLogo = UILabel()
    let background = UIImageView()
    let bookImage = UIImageView()
    let bookTitle = UILabel()
    let author = UILabel()
    let publisher = UILabel()
    let datetime = UILabel()
    let bookDetail = UILabel()
    let scrollView = UIScrollView()
    let gradientLayer = CAGradientLayer()
    let selectButton = UIButton()
    var bookSelected: Bool = false {
        didSet {
            updateSelectButtonUI()
        }
    }
    let closeButton = UIButton()
    var books = [Document]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        setupConstraints()
        configureUI()
        bookSelected = false
        
    }
    
    func fetchUI(for document: Document) {
        BookManager.shared.fetchUI(for: document) { [weak self] result in switch result {
        case .success(let imageData):
            DispatchQueue.main.async {
                self?.bookImage.image = UIImage(data: imageData)
                self?.backgroundImage.image = UIImage(data: imageData)
            }
        case .failure(let error):
            print("이미지를 불러오는 중 오류가 발생했습니다: \(error)")
        }
        }
        bookTitle.text = document.title
        //authors의 타입이 [String]이기 때문에 분해해주는 코드가 필요하다
        author.text = document.authors.joined(separator: ", ")
        bookDetail.text = document.contents
        publisher.text = document.publisher
        datetime.text = document.datetime
    }
    
    
    override func setupConstraints() {
        [backgroundImage, background, scrollView, author, publisher, datetime, bookTitle, bookImage, selectButton, closeButton, RabbitBooksLogo].forEach {
            view.addSubview($0)
            scrollView.addSubview(bookDetail)
        }
        //배경
        backgroundImage.snp.makeConstraints() {
            $0.width.height.equalTo(view)
        }
        
        //꾸밈 배경
        background.snp.makeConstraints() {
            $0.top.equalTo(view).offset(238)
            $0.left.right.bottom.equalToSuperview()
        }
        
        //앱 타이틀
        RabbitBooksLogo.snp.makeConstraints() {
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
            $0.top.equalTo(bookImage.snp.bottom).offset(23)
            $0.centerX.equalTo(view)
        }
        
        //저자
        author.snp.makeConstraints() {
            $0.top.equalTo(bookTitle.snp.bottom).offset(20)
            $0.right.equalTo(view).offset(-213)
        }
        //출판사
        publisher.snp.makeConstraints() {
            $0.top.equalTo(bookTitle.snp.bottom).offset(20)
            $0.left.equalTo(view).offset(213)
        }
        //출판날짜
        datetime.snp.makeConstraints() {
            $0.top.equalTo(publisher.snp.bottom).offset(15)
            $0.centerX.equalTo(view)
        }
        
        scrollView.snp.makeConstraints() {
            $0.top.equalTo(datetime.snp.bottom).offset(23)
            $0.left.right.equalTo(view).inset(33)
            $0.bottom.equalTo(selectButton.snp.top).offset(-23)
        }
        
        //스크롤뷰 내부에 들어갈 내용에 대한 오토레이아웃 역시 잡아줘야 한다.
        //텍스트바 사이즈 조절하는것과 비슷
        scrollView.contentLayoutGuide.snp.makeConstraints(){
            $0.edges.equalTo(bookDetail)
        }
        
        //너비를 같게 만들어주면 상하 스크롤 가능
        bookDetail.snp.makeConstraints() {
            $0.width.equalTo(scrollView)
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
        RabbitBooksLogo.text = "RabbitBooks"
        RabbitBooksLogo.font = UIFont(name: "Ghanachocolate", size: 18)
        RabbitBooksLogo.textColor = .white /*UIColor(red: 8/255, green: 28/255, blue: 33/255, alpha: 1.0)*/
        RabbitBooksLogo.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        RabbitBooksLogo.layer.shadowOpacity = 1
        RabbitBooksLogo.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //꾸밈 배경
        background.image = UIImage(named: "background")
        background.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        background.layer.shadowOpacity = 0.3
        background.layer.shadowOffset = CGSize(width: 0, height: -1)
        
        //책 표지
        bookImage.layer.cornerRadius = 5
        bookImage.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        bookImage.layer.shadowOpacity = 0.3
        bookImage.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        //책 제목
        bookTitle.textColor = .white
        bookTitle.font = UIFont.boldSystemFont(ofSize: 16)
        
        //저자
        author.textColor = .white
        author.textAlignment = .right
        author.font = UIFont.boldSystemFont(ofSize: 13)
        
        //출판사
        publisher.textColor = .white
        publisher.textAlignment = .left
        publisher.font = UIFont.boldSystemFont(ofSize: 13)
        
        //날짜
        datetime.textColor = UIColor(white: 1, alpha: 0.7)
        datetime.textAlignment = .center
        datetime.font = UIFont.boldSystemFont(ofSize: 13)
        
        //줄거리
        bookDetail.font = UIFont.systemFont(ofSize: 14)
        bookDetail.textColor = .white
        bookDetail.numberOfLines = 0
        bookDetail.textAlignment = .center
        
        //닫기 버튼
        closeButton.backgroundColor = UIColor(red: 171/255, green: 191/255, blue: 126/255, alpha: 0.5)
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
//        if let myBooks = bookSelected {
//                delegate?.addBookToMyPage(selectedBook)
//            }
    }
    
    //버튼이 선택 되었을때와 아닐때의 상태를 각각 정의
    func updateSelectButtonUI() {
        let buttonTitle = bookSelected ? "등록 취소" : "내 서재로 등록"
        let buttonColor = bookSelected ? UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 1.0) : UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 0.5)
        selectButton.backgroundColor = buttonColor
        selectButton.setTitle(buttonTitle, for: .normal)
    }
    
    @objc func clickToBack(){
        dismiss(animated: true, completion: nil) //closeButton 을 누르면 애니메이션과 함께 모달이 닫힘
    }
}
