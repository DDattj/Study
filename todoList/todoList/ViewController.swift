//
//  ViewController.swift
//  todoList
//
//  Created by 이시안 on 3/19/24.
//

import UIKit

class ViewController: UIViewController {
    // 테이블뷰 자체에 관한 설명은 여기
    @IBOutlet weak var todoList: UITableView!
    struct Todo {
    let title: String
    let complete: Bool
    }
    let data: [Todo] = [Todo(title: "물 마시기", complete: true)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoList.backgroundColor = .systemBackground //테이블뷰 컬러 설정
        todoList.delegate = self //여기서 self란 ViewController이다
        todoList.dataSource = self//이 두 코드가 있어야만 시뮬레이터에서 보일것
    }
}

//테이블뷰 셀에 관한 설정은 여기서!
//뷰컨트롤러란 클래스에 확장할 기능을 구현
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count //셀 몇줄 만들것인가 설정
        
    }
    //어떤 셀이 들어갔으면 좋겠는가(셀 자체의 설정)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoList.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].title//'data'라는 배열에서 'indexPath.row' 데이터를 가져와서 각각의 셀에 집어넣는것.
        return cell
    }
}

