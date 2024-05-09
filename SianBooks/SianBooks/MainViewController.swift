//
//  ViewController.swift
//  SianBooks
//
//  Created by 이시안 on 5/1/24.
//

//검색바 아래엔 컬렉션뷰(옆으로 넘기는) -> 최근 검색
//최근검색 아래엔 컬렉션뷰(아래로 넘기는) -> 책 표지
//상단과 하단에 광고도 약간**

import UIKit

class MainViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let searchButton = UIButton()
    let logo = UIImageView()
    let title1 = UILabel()
    let subTitle1 = UILabel()
    let subTitle2 = UILabel()
    let currentView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 19
        layout.itemSize = .init(width: 86, height: 105)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    let bookCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 19//좌우
        layout.minimumInteritemSpacing = 17//상하
        layout.itemSize = .init(width: 102, height: 160)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    
    //컬렉션뷰와 커스텀 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == currentView {
            guard let cell = currentView.dequeueReusableCell(withReuseIdentifier: "CurrentViewCell", for: indexPath) as? CurrentViewCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        else if collectionView == bookCollection {
            guard let cell = bookCollection.dequeueReusableCell(withReuseIdentifier: "BookCollectionCell", for: indexPath) as? BookCollectionCell else {
                return UICollectionViewCell()
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    //셀 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionView == currentView ? 10 : 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailBooksInfo()
        present(vc, animated: true, completion: nil)
    }
        
    
    
    override func configureUI() {
        // 버튼 모양 설정
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.setTitle("오늘의 추천 책 : \(1)", for: .normal)
        searchButton.setTitleColor(.lightGray, for: .normal)
        searchButton.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        searchButton.tintColor = UIColor(red: 171/255, green: 191/255, blue: 126/255, alpha: 1.0)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.clipsToBounds = true
        searchButton.layer.cornerRadius = 10
        searchButton.layer.borderColor = CGColor(red: 171/255, green: 191/255, blue: 126/255, alpha: 1.0)
        searchButton.layer.borderWidth = 2

        
        //앱 타이틀
        logo.image = UIImage(systemName: "hare.fill")
        logo.tintColor = UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 1.0)
        title1.text = "RabbitBooks"
        title1.font = UIFont(name: "Ghanachocolate", size: 18)
        title1.tintColor = UIColor(red: 8/255, green: 28/255, blue: 33/255, alpha: 1.0)
        
        //항목타이틀
        subTitle1.text = "최근 열람한 책"
        subTitle1.font = UIFont.boldSystemFont(ofSize: 17)
        subTitle2.text = "전체 책 보기"
        subTitle2.font = UIFont.boldSystemFont(ofSize: 17)
        
        //최근 본 기록 컬렉션뷰
        currentView.register(CurrentViewCell.self, forCellWithReuseIdentifier: "CurrentViewCell")
        //삼항연산자 사용하여 색상 다크모드일때와 아닐때 컬러 변경!
        currentView.backgroundColor = self.traitCollection.userInterfaceStyle == .dark ? UIColor(red: 229/255, green: 200/255, blue: 144/255, alpha: 1) : UIColor(red: 171/255, green: 191/255, blue: 126/255, alpha: 0.5)

        currentView.delegate = self
        currentView.dataSource = self
        
        //책 목록 컬렉션뷰
        bookCollection.register(BookCollectionCell.self, forCellWithReuseIdentifier: "BookCollectionCell")
        bookCollection.delegate = self
        bookCollection.dataSource = self
    }
    
    
    override func setupConstraints() {
        
        //BaseViewController에서 setupConstraints과 configureUI가 먼저 실행되도록 설정이 되어있어서 addView를 여기다 집어넣어줘야 그릴 영역을 만들고 -> 위치가 잡힌 후 -> UI설정이 들어오게 된다.
        [searchButton, title1, logo, subTitle1, subTitle2, currentView, bookCollection].forEach {
            view.addSubview($0)  //전부 뷰에 등록
        }
        //서치바 오토레이아웃
        searchButton.snp.makeConstraints() {
            $0.top.equalTo(view).offset(115)
            $0.height.equalTo(55)
            $0.left.right.equalTo(view).inset(28)
        }
        //제목
        title1.snp.makeConstraints() {
            $0.top.equalTo(view).offset(73)
            $0.right.equalTo(view).offset(-112)
        }
        //로고
        logo.snp.makeConstraints() {
            $0.top.equalTo(view).offset(73)
            $0.left.equalTo(view).offset(112)
        }
        //최근 연람한 책
        subTitle1.snp.makeConstraints() {
            $0.top.equalTo(view).offset(190)
            $0.left.equalTo(view).inset(29)
        }
        //전체 책
        subTitle2.snp.makeConstraints() {
            $0.top.equalTo(view).offset(380)
            $0.left.equalTo(view).inset(29)
        }
        
        //최근 본 책 컬렉션뷰 오토레이아웃
        currentView.snp.makeConstraints() {
            $0.top.equalTo(searchButton.snp.bottom).offset(51)
            $0.left.right.equalTo(view).inset(0)
            $0.bottom.equalTo(bookCollection.snp.top).offset(-55)
        }
        //책 컬렉션뷰 오토레이아웃
        bookCollection.snp.makeConstraints() {
            $0.left.right.equalTo(view).inset(21)
            $0.height.equalTo(355)
            $0.bottom.equalTo(view).offset(-83)
        }
    }
    
    @objc func searchButtonTapped() {
        let searchVC = searchBooksPage()
        navigationController?.navigationBar.tintColor = UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 1.0) //뒤로가기 버튼 색상 변경
        navigationController?.pushViewController(searchVC, animated: true)
    }
}
