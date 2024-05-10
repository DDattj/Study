//
//  searchBooksPage.swift
//  SianBooks
//
//  Created by 이시안 on 5/7/24.
//

import Foundation
import UIKit

class searchBooksPage: BaseViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    let logo = UIImageView()
    let title1 = UILabel()
    let searchBar = UISearchBar()
    let alertText = UILabel()
    let findNothing = UIImageView()
    let allBooks: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 19
        layout.minimumInteritemSpacing = 17
        layout.itemSize = .init(width: 102, height: 160)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    var searchResults: [Document] = [] {
        didSet {
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        setupConstraints()
        configureUI()
    }
    
    
    override func setupConstraints() {
        [logo, title1, searchBar, findNothing, alertText, allBooks].forEach {
            view.addSubview($0)
        }
        
        logo.snp.makeConstraints() {
            $0.top.equalTo(view).offset(73)
            $0.left.equalTo(view).offset(112)
        }
        
        title1.snp.makeConstraints() {
            $0.top.equalTo(view).offset(73)
            $0.right.equalTo(view).offset(-112)
        }
        
        searchBar.snp.makeConstraints() {
            $0.top.equalTo(view).offset(115)
            $0.left.right.equalTo(view).inset(28)
        }
        
        findNothing.snp.makeConstraints() {
            $0.top.equalTo(searchBar.snp.bottom).offset(238)
            $0.centerX.equalTo(view)
            $0.width.height.equalTo(70)
        }
        
        alertText.snp.makeConstraints() {
            $0.top.equalTo(findNothing.snp.bottom).offset(20)
            $0.left.right.equalTo(view).inset(97)
        }
        
        allBooks.snp.makeConstraints() {
            $0.top.equalTo(view).offset(210)
            $0.left.right.equalTo(view).inset(21)
            $0.bottom.equalTo(view).offset(-83)
        }
    }
    
    
    override func configureUI() {
        
        searchBar.delegate = self
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 10
        searchBar.layer.borderColor = CGColor(red: 171/255, green: 191/255, blue: 126/255, alpha: 1.0) // 00/255 라고 해줘야 한다. 255 = 1로 인식하기 때문에 21이라고만 쓰면 21/1로 인식
        searchBar.layer.borderWidth = 2 //테두리 선 색상과 두께 지정
        searchBar.setImage(UIImage(systemName: "magnifyingglass"), for: .search, state: .normal)
        searchBar.setImage(UIImage(systemName: "x.circle.fill"), for: .clear, state: .normal)
        searchBar.tintColor = UIColor(red: 171/255, green: 191/255, blue: 126/255, alpha: 1.0)
        searchBar.searchTextField.backgroundColor = .systemBackground
        
        logo.image = UIImage(systemName: "hare.fill")
        logo.tintColor = UIColor(red: 21/255, green: 89/255, blue: 31/255, alpha: 1.0)
        title1.text = "RabbitBooks"
        title1.font = UIFont(name: "Ghanachocolate", size: 18)
        title1.tintColor = UIColor(red: 8/255, green: 28/255, blue: 33/255, alpha: 1.0)
        
        findNothing.image = UIImage(named: "rabbit_hat")
        alertText.text = "검색 결과가 없습니다. 키워드를 확인해주세요"
        alertText.textAlignment = .center
        alertText.numberOfLines = 2
        alertText.font = UIFont.systemFont(ofSize: 17)
        
        //책 목록 컬렉션뷰
        allBooks.register(BookCollectionCell.self, forCellWithReuseIdentifier: "BookCollectionCell")
        allBooks.delegate = self
        allBooks.dataSource = self
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = allBooks.dequeueReusableCell(withReuseIdentifier: "BookCollectionCell", for: indexPath) as? BookCollectionCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchResults.isEmpty {
            // 검색 결과가 없는 경우
            findNothing.isHidden = false
            alertText.isHidden = false
            allBooks.isHidden = true
        } else {
            findNothing.isHidden = true
            alertText.isHidden = true
            allBooks.isHidden = false
        }
        BookManager.shared.search(text: searchText) { result in
            switch result {
            case .success(let RabbitBooks):
                self.searchResults = RabbitBooks.documents
                DispatchQueue.main.async {
                    self.allBooks.reloadData()
                }
            case .failure(_):
                return
            }
        }
        
    }
}

