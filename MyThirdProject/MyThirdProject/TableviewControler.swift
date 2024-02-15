//
//  TableviewControler.swift
//  MyThirdProject
//
//  Created by 이시안 on 1/24/24.
//

import UIKit

class TableviewControler: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var Tableview: UITableView!
    
    @IBOutlet weak var MyImage: UIImageView!
    let Index: [String] = ["MainHall", "Cafe", "NoticeBoard", "About Me"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Tableview.backgroundColor = .purple
        Tableview.delegate = self
        Tableview.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Index.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Tableview.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text = Index[indexPath.row]
        return cell
    }
  
    
}
