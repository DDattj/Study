//
//  TableViewCell.swift
//  MyWishList
//
//  Created by 이시안 on 4/17/24.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var myListImage: UIImageView!
    @IBOutlet weak var myListTitle: UILabel!
    @IBOutlet weak var myListPrice: UILabel!
    @IBOutlet weak var myListStepper: UIStepper!
    @IBOutlet weak var myListStock: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func stockButton(_ sender: UIStepper) {
    }
    
    
}
