//
//  MyPageViewController.swift
//  SianBooks
//
//  Created by 이시안 on 5/1/24.
//

import UIKit

class MyPageViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource {
    
    let logo = UIImageView()
    let eraseAll = UIButton()
    let profileImage = UIImageView()
    let name = UILabel()
    let likes = UILabel()
    let line = UIImageView()
    let myBooks = UITableView()
    var books = [Document]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupConstraints()
        configureUI()
        
    }
    
    override func setupConstraints() {
        [logo, eraseAll, profileImage, name, likes, line, myBooks].forEach {
            view.addSubview($0)
        }
        logo.snp.makeConstraints(){
            $0.top.equalTo(view).offset(77)
            $0.left.equalTo(view).offset(25)
            $0.width.equalTo(38)
            $0.height.equalTo(25)
            
        }
        eraseAll.snp.makeConstraints(){
            $0.top.equalTo(view).offset(77)
            $0.right.equalTo(view).inset(25)
            $0.width.equalTo(75)
            $0.height.equalTo(36)
        }
        profileImage.snp.makeConstraints(){
            $0.top.equalTo(view).offset(120)
            $0.left.equalTo(view).offset(25)
            $0.width.equalTo(81)
            $0.height.equalTo(81)
        }
        name.snp.makeConstraints(){
            $0.top.equalTo(view).offset(133)
            $0.left.equalTo(profileImage.snp.right).offset(20)
        }
        line.snp.makeConstraints(){
            $0.top.equalTo(view).offset(218)
            $0.width.equalTo(368)
            $0.height.equalTo(2)
            $0.centerX.equalTo(view)
        }
        likes.snp.makeConstraints(){
            $0.top.equalTo(name.snp.bottom).offset(12)
            $0.left.equalTo(profileImage.snp.right).offset(20)
        }
        myBooks.snp.makeConstraints(){
            $0.top.equalTo(view).offset(240)
            $0.left.right.equalTo(view)
            $0.bottom.equalTo(view).offset(90)
        }
    }
    
    override func configureUI() {
        //앱 타이틀
        logo.image = UIImage(systemName: "hare.fill")
        logo.tintColor = UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 1.0)
        //전체삭제
        eraseAll.backgroundColor = UIColor(red: 171/255, green: 191/255, blue: 126/255, alpha: 0.3)
        eraseAll.layer.cornerRadius = 10
        eraseAll.setTitle("전체 삭제", for: .normal)
        eraseAll.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        eraseAll.setTitleColor(UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 1.0), for: .normal)
        eraseAll.addTarget(self, action: #selector(clickToRemove), for: .touchUpInside)
        // 내 프로필 이미지
        profileImage.image = UIImage(named: "myImage")
        //내이름
        name.text = "땃지"
        name.font = UIFont.boldSystemFont(ofSize: 16)
        //화면분할 선
        line.backgroundColor = UIColor(red: 171/255, green: 191/255, blue: 126/255, alpha: 1.0)
        line.layer.cornerRadius = 5
        //담은 책 개수
        likes.text = "담은 책 개수 : \(1)개"
        likes.font = UIFont.systemFont(ofSize: 15)
        
        myBooks.delegate = self
        myBooks.dataSource = self
        myBooks.register(MyBooksCell.self, forCellReuseIdentifier: MyBooksCell.identifier)
        myBooks.separatorStyle = .singleLine
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myBooks.dequeueReusableCell(withIdentifier: "MyBooksCell", for: indexPath) as? MyBooksCell
        else {
            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ collectionView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailBooksInfo()
        if collectionView == myBooks {
            let selectedBook = books[indexPath.row]
            vc.fetchUI(for: selectedBook)
        }
        present(vc, animated: true, completion: nil)
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // "삭제하기" 작업을 생성
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제하기") { (action, view, completionHandler) in
            // 여기에 삭제 작업을 구현
            // indexPath를 사용하여 데이터를 삭제하고, 테이블 뷰에서 해당 행을 삭제
            completionHandler(true) // 핸들러를 호출하여 스와이프 작업을 완료했음을 시스템에 알리기(만약 실패한다면 오류코드가 뜨고 시뮬레이터가 멈추겠지)
        }
        // "삭제하기" 작업의 배경색 설정
        deleteAction.backgroundColor = UIColor(red: 104/255, green: 140/255, blue: 79/255, alpha: 1.0) // 원하는 색상으로 변경 가능
        
        // 스와이프를 하면 삭제작업이 실행되도록 순서를 정리, 연결
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction])
        return swipeConfiguration
    }
    
    @objc func clickToRemove(){
        let alert = UIAlertController(title: "전체 삭제 알림", message: "담긴 책을 전부 삭제 하시겠습니까?", preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor(red: 239/255, green: 253/255, blue: 209/255, alpha: 0.7) //그냥 배경색만 바꾸게 되면 제일 뒤쪽 레이어 색상만 바뀌면서 앞 레이어에 깔린 라운드 및 그라데이션 효과가 무용지물이 된다. 레이어 한 4계층까지 들어와서 바꿔야 적용됨
        let action = UIAlertAction(title: "네", style: .destructive, handler: nil)
        let cancel = UIAlertAction(title: "아니오", style: .cancel, handler: nil)
        alert.addAction(action)
        alert.addAction(cancel)
        
        present(alert, animated: true, completion: nil)
    }
}

