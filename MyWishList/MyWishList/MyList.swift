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
    var productList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        setProductList()
        
        let nibName = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "TableViewCell")
    }
    
    private func setProductList() {
        guard let context = self.persistentContainer?.viewContext else { return }
        
        let request: NSFetchRequest<Product> = Product.fetchRequest() // 올바른 fetchRequest 사용
        
        do {
            self.productList = try context.fetch(request) // 올바른 fetch 사용
        } catch {
            print("Failed to fetch products: \(error)")
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
        cell.myListStock.text = String(product.stock + 1)
        cell.myListPrice.text = "\(product.price)$"
        
        
//        func stockValueChange(_ sender: UIStepper) {
//            let index = sender.tag // Stepper의 태그를 사용하여 해당 제품의 인덱스를 가져옴
//            let product = self.productList[index]
//            let newStockValue = Int(sender.value) // 새로운 재고량 값
//            
//            product.stock = Int64(newStockValue) // 제품의 재고량 업데이트
//            self.tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .none) // 해당 셀만 리로드하여 업데이트된 값 표시
//            
//            if let cell = tableView.cellForRow(at: IndexPath(row: index, section: 0)) as? TableViewCell {
//                    cell.myListStock.text = "\(newStockValue)" // 셀의 재고량 레이블 업데이트
//                }
//
//            }
        
        
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedProduct = self.productList.remove(at: indexPath.row) // 삭제된 상품을 따로 저장
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveDeletedProduct(deletedProduct) // 삭제된 상품 저장
        }
    }
    
    // 삭제된 상품 정보를 저장하는 메서드
    private func saveDeletedProduct(_ product: Product) {
        guard let context = self.persistentContainer?.viewContext else { return }
        
        context.delete(product)
        
        do {
            try context.save()
        } catch {
            print("Failed to save context: \(error)")
        }
    }
    
    
}

