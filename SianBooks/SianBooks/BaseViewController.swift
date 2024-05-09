//
//  BaseViewController.swift
//  SianBooks
//
//  Created by 이시안 on 5/1/24.
//

import UIKit
import SnapKit
import Then

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConstraints() // 자식 뷰의 제약 조건 설정
        configureUI() // 자식 뷰의 UI 설정
    }
    
    func setupConstraints(){
    }
    
    func configureUI(){
    }
    
}
