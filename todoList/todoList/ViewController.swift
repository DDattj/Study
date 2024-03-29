//
//  ViewController.swift
//  todoList
//
//  Created by 이시안 on 3/19/24.
//





import UIKit
import PhotosUI

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // 테이블뷰에 들어갈 내용 정의
    @IBOutlet weak var todoList: UITableView!
    struct Todo {
        var id: String
        var title: String //타입 바꾸기
        var complete: Bool
    }
    var data: [Todo] = [Todo(id: String(1), title: "테스트", complete: false)]
    
    
    
    
    //테이블뷰 자체에서 데이터 접근하고 동작구현
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        todoList.delegate = self //여기서 self란 ViewController이다
        todoList.dataSource = self//이 두 코드가 있어야만 시뮬레이터에서 보일것
        //xib 셀 가져오기
        let nibName = UINib(nibName: "TodoListCellTableViewCell", bundle: nil)
        todoList.register(nibName, forCellReuseIdentifier: "TodoListCellTableViewCell")
    }
    
    
    
    
    //날짜설정
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM / dd / yy"
        return formatter.string(from: date)
    }
    //테이블뷰 셀에 관한 설명
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count //셀 몇줄 만들것인가 설정
    }
    //어떤 셀이 들어갔으면 좋겠는가(셀 자체의 설정)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = todoList.dequeueReusableCell(withIdentifier: "TodoListCellTableViewCell") as! TodoListCellTableViewCell
        //해당구역에 어떤 값을 넣어줄것인지 설정
        let todo = data[indexPath.row]
        cell.ID.text = todo.id
        cell.title.text = todo.title
        cell.UISwitch.isOn = todo.complete
        cell.doneUI.isOpaque = todo.complete
        cell.doneUI.isHidden = !todo.complete
        cell.doneAlert.isHidden = !todo.complete
        cell.Emoji.image = UIImage(named: "Image")
        
        //날짜선택 버튼에 관한 설정
        cell.date.tag = indexPath.row
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        cell.date.addTarget(self, action: #selector(dateChange(datePicker:)), for: .valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        cell.date.setTitle(formatDate(date: Date()), for: .normal)
        
        //셀에 있는 완료버튼에 관한 설정
        cell.UISwitch.tag = indexPath.row
        cell.UISwitch.addTarget(self, action: #selector(didChangeSwitch(_:)), for: .valueChanged)
        return cell
    }
    @objc func didChangeSwitch(_ sender: UISwitch){
        let index = sender.tag
        data[index].complete = sender.isOn
        let indexPath = IndexPath(row: index, section: 0)
        if let cell = todoList.cellForRow(at: indexPath) as? TodoListCellTableViewCell {
            cell.doneUI.isOpaque = sender.isOn //투명도 조절은 alpha
            cell.doneUI.isHidden = !sender.isOn
            cell.doneAlert.isHidden = !sender.isOn
        }
    }// cell.accessoryView = cell.UISwitch(이것때문에 오토레이아웃을 걸어도 시뮬레이터에 이상하게 나왔던것) => 해당 뷰의 기능을 확장하거나 보완하는데 사용. 스토리보드에서 스위치의 위치를 제대로 잡아주어도 그 스위치랑 악세사리뷰로 잡은 스위치랑은 전혀다른 개체이기 때문임. 악세사리뷰 스위치는 코드로 위치를 따로 잡아줘야 했었던것
    
    
    
    
    //날짜설정버튼 데이터 및 보여질 화면 설정
    @objc func dateChange(datePicker: UIDatePicker) {
        
        }
    
    
    //안내창(추가버튼 누를 시)에 관한 설정
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

