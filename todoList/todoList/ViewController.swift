//
//  ViewController.swift
//  todoList
//
//  Created by 이시안 on 3/19/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    // 테이블뷰 자체에 관한 설명은 여기
    @IBOutlet weak var todoList: UITableView!
    struct Todo {
        var id: String
        var title: String
        var complete: Bool
    }
    @objc @objc var data: [Todo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoList.delegate = self //여기서 self란 ViewController이다
        todoList.dataSource = self//이 두 코드가 있어야만 시뮬레이터에서 보일것
        //xib 셀 가져오기
        let nibName = UINib(nibName: "TodoListCellTableViewCell", bundle: nil)
        todoList.register(nibName, forCellReuseIdentifier: "TodoListCellTableViewCell")
            }
    

    
    
    
    //테이블뷰 셀에 관한 설정은 여기서!
    //뷰컨트롤러란 클래스에 확장할 기능을 구현
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count //셀 몇줄 만들것인가 설정
    }
    //어떤 셀이 들어갔으면 좋겠는가(셀 자체의 설정)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoList.dequeueReusableCell(withIdentifier: "TodoListCellTableViewCell") as! TodoListCellTableViewCell
        //'data'의 타이틀 속성을 셀에 넣기. 각 행에 대한 데이터를 가져오고 싶으면 indexPath.row를 사용한다.
        cell.ID.text = data[indexPath.row].id
        cell.title.text = data[indexPath.row].title
        cell.UISwitch.isOn = data[indexPath.row].complete
        
        
        
        
        let switchView = UISwitch(frame: .zero)
        switchView.setOn(false, animated: true)
        switchView.tag = indexPath.row
        cell.UISwitch.addTarget(self, action: #selector(self.switchDidChange(_:)), for: .valueChanged)
        return cell
    }
    
    
    
    
    //안내창에 나올 문구 정하기
    @IBAction func addList(_ sender: Any) {
        let title = "할 일 추가하기"
        let message = "정보를 입력해주세요"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        let ok = UIAlertAction(title: "확인", style: .default) { [self] (_) in
            //확인 누를 시 만들어질 셀에 관한 정보
            guard let add = alert.textFields?.first?.text else {return}
            self.data.append(Todo(id: String(data.count + 1), title: add, complete: false))//셀 추가와 함께 데이터에도 새로운 정보가 쌓이도록
            self.todoList.reloadData()
        }
        //알림창 기능 실행
        alert.addAction(cancel)
        alert.addAction(ok)
        //입력창 설정
        alert.addTextField(){ (tf) in
            tf.placeholder = "ex)일기쓰기"
            //tf.isSecureTextEntry = false로 해줘도 되고 안써도 됨
        }
        self.present(alert, animated: true)
    }
    
    
    
    

    //셀 삭제 기능
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        data.remove(at: indexPath.row)//이부분은 셀에서 정보를 삭제
        tableView.deleteRows(at: [indexPath], with: .automatic)//이부분은 셀에서 줄을 삭제(줄 삭제장소와 삭제방식)
    }
}
