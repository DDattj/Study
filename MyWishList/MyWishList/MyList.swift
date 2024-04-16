//
//  MyList.swift
//  MyWishList
//
//  Created by 이시안 on 4/16/24.
//

import Foundation
import UIKit
import CoreData

class MyList: UITableViewController {
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    private var productList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        setProductList()
        // Do any additional setup after loading the view.
    }
    
    private func setProductList(){
        guard let context = self.persistentContainer?.viewContext else { return }
        
        let request = Product.fetchRequest()
        if let productList = try? context.fetch(request) {
            self.productList = productList
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let product = self.productList[indexPath.row]
        
        let id = product.id
        let title = product.title ?? ""
        let price = product.price
        
        cell.textLabel?.text = "[\(id)]\(title) - \(String(describing: price))$"
        return cell
    }
}
