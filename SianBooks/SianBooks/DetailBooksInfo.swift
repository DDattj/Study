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
        $0.alpha = 0.5
    }
    
    let title1 = UILabel()
    let background = UIImageView()
    let bookImage = UIImageView()
    let bookTitle = UILabel()
    let author = UILabel()
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        setupConstraints()
        configureUI()
        bookSelected = false
        
    }
    
    override func setupConstraints() {
        [backgroundImage, background, scrollView, author, bookTitle, bookImage, selectButton, closeButton, title1].forEach {
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
        
        scrollView.snp.makeConstraints() {
            $0.top.equalTo(author.snp.bottom).offset(23)
            $0.left.right.equalTo(view).inset(33)
            $0.bottom.equalTo(selectButton.snp.top).offset(-23)
        }
        
        //스크롤뷰 내부에 들어갈 내용에 대한 오토레이아웃 역시 잡아줘야 한다.
        //텍스트바 사이즈 조절하는것과 비슷
        scrollView.contentLayoutGuide.snp.makeConstraints(){
            $0.edges.equalTo(bookDetail)
        }
        
        //너비를 같게 만들어주면 상하 스크롤 가능
        bookDetail.snp.makeConstraints { make in
            make.width.equalTo(scrollView)
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
        
        backgroundImage.image = UIImage(named: "책 표지2")
        
        //앱 타이틀
        title1.text = "RabbitBooks"
        title1.font = UIFont(name: "Ghanachocolate", size: 18)
        title1.textColor = .white /*UIColor(red: 8/255, green: 28/255, blue: 33/255, alpha: 1.0)*/
        title1.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        title1.layer.shadowOpacity = 1
        title1.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        //꾸밈 배경
        background.image = UIImage(named: "background")
        background.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        background.layer.shadowOpacity = 0.3
        background.layer.shadowOffset = CGSize(width: 0, height: -1)
        
        //책 표지
        bookImage.image = UIImage(named: "책 표지2")
        bookImage.layer.cornerRadius = 5
        bookImage.layer.shadowColor = UIColor.black.cgColor //그림자 설정
        bookImage.layer.shadowOpacity = 0.3
        bookImage.layer.shadowOffset = CGSize(width: 1, height: 2)
        
        //책 제목
        bookTitle.text = "지니, 너 없는 동안"//"책 제목"
        bookTitle.textColor = .white
        bookTitle.font = UIFont.boldSystemFont(ofSize: 15)
        
        //저자
        author.text = "이은정"//"저자"
        author.textColor = .white
        author.font = UIFont.boldSystemFont(ofSize: 13)
        
        //줄거리
        bookDetail.text = "만약, 램프의 요정 알라딘의 지니가 21세기 당신 앞에 불현듯 나타난다면 당신은 지금 어떤 소원을 빌 것인가? 열일곱 고등학생인 동안은 평소 외양 어선 선원이고 술주정뱅인 아버지 마주공에게 강한 불만을 지니고 있었다. 어느 날 동안은 아버지가 외국에서 가지고 온 주둥이가 작고 동그란 뚜껑에 몸통이 절구통처럼 패여 물 한 컵도 안 들어갈 것 같은 쓸모라곤 전혀 없어 보이는 주전자를 닦으면서 혼자 중얼거렸다. 그 순간 동화 속에서는 일어날 뻔한 램프의 요정인 지니가 나타난다. 동안은 기상천외한 일에 놀라서 한동안 맨붕에 빠져 헤어나지 못한다.아라비안나이트의 알라딘 지니는 주인의 소망을 들어주는 램프의 요정이었지만, 21세기 동안 앞에 나타난 지니는 그와 반대로 자신을 소유한 주인이 미워하는 사람의 불행을 빌어주는 주전자 요정이었다. 지니는 퉁명스럽게 동안에게 말한다. “인간은 천 년 전이나 지금이나 변한 게 없구나. 그저 돈, 명예, 돈, 명예. 미안하지만 나는 말이야. 불행만 들어줄 수 있어. 너 아닌 타인이 불행해지는 소원 말이야. 그게 누구든. 그게 뭐든. 불행만. 딱 다섯 번이야.” 옛날 알라딘 램프의 요정 지니는 주인이 원하는 소원을 무한대로 들어주었지만, 주전자 요정 지니는 단 다섯 번만의 기회를 주었다. 그것도 소원 아닌 불행을. 열일 곱살 동안은 먼저 자신이 미워하는 아버지를 죽게 해 달라고 빌었는데 결국 아버지는 바다 위에서 폭풍우를 만나 행방불명되었다. 그 후 동안은 자신이 좋아하는 친구에게 행복을 던져주기 위해 남의 불행을 주전자 요정에게 부탁했다. 그러나 동안은 남의 불행을 비는 소원을 한가지씩 이룰 때마다 남의 불행을 원하는 것이 좋지 않은 일임을 깨닫게 되고 마침내 주전자 요정 지니를 깊은 바닷속에 던져버린다. 다른 사람의 불행으로 인해 자신이 행복해지는 것이야말로 진짜 불행한 일이라는 걸 동안은 알게 되었던 것이다."//"줄거리"
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
