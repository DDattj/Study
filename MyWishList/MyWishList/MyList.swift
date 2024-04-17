//
//  MyList.swift
//  MyWishList
//
//  Created by 이시안 on 4/16/24.
//

import Foundation
import UIKit
import CoreData

class MyList: UITableViewController{
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    private var productList: [MyProduct] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        setProductList()
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
        // Do any additional setup after loading the view.
    }
    
    private func setProductList(){
        guard let context = self.persistentContainer?.viewContext else { return }
        
        let request = MyProduct.fetchRequest()
        if let productList = try? context.fetch(request) {
            self.productList = productList
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {
                return UITableViewCell()
            }
        let product = self.productList[indexPath.row]
        
        cell.myListTitle.text = product.title
        cell.myListStock.text = String(product.stock)
        cell.myListPrice.text = "\(product.price)$"
        
        return cell
    }
}
