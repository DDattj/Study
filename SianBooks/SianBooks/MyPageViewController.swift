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
    var Data = [[String]]()
    
    
    
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
            $0.height.equalTo(26)
            
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
        eraseAll.backgroundColor = UIColor(red: 109/255, green: 204/255, blue: 242/255, alpha: 1.0)
        eraseAll.layer.cornerRadius = 10
        eraseAll.setTitle("전체 삭제", for: .normal)
        eraseAll.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        eraseAll.titleLabel?.textColor = UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 1.0)
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myBooks.dequeueReusableCell(withIdentifier: "MyBooksCell", for: indexPath) as? MyBooksCell
        else {
            return UITableViewCell()
        }
        return cell
    }
    
    @objc func clickToRemove() {
        
    }
}

