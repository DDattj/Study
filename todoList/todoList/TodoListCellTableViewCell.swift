//
//  TodoListCellTableViewCell.swift
//  todoList
//
//  Created by 이시안 on 3/25/24.
//

import UIKit

class TodoListCellTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBOutlet weak var ID: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var UISwitch: UISwitch!
    @IBOutlet weak var doneUI: UIView!
    @IBOutlet weak var doneAlert: UILabel!
    
}



