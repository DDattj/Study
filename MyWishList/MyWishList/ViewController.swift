//
//  ViewController.swift
//  MyWishList
//
//  Created by 이시안 on 4/16/24.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    //가져올 모델 설정 후 정보 이어주기
    var persistentContainer: NSPersistentContainer? {
        (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer
    }
    
    private var currentProduct: RemoteProduct? = nil {
        didSet {
            guard let currentProduct = self.currentProduct else { return }
            
            DispatchQueue.main.async {
                self.images.image = nil
                self.productTitle.text = currentProduct.title
                self.productDescription.text = currentProduct.description
                self.price.text = "\(currentProduct.price)$"
            }
            
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: currentProduct.images), let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.images.image = image
                    }
                }
            }
        }
    }
    
    
    
    
    //UI 설정
    //이름을 바꿔주기(숨겨진 기본 설정이라 겹치는것)
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var images: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchRemoteProduct()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextProduct(_ sender: UIButton) {
        self.fetchRemoteProduct()
    }
    @IBAction func addProduct(_ sender: UIButton) {
        self.saveMyList()
    }
    
    
    
    
    //URLSession 활용하여 정보 불러오기
    private func fetchRemoteProduct() {
        let productID = Int.random(in: 1...100)
        if let url = URL(string:  "https://dummyjson.com/products/\(productID)") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    do {
                        let product = try JSONDecoder().decode(RemoteProduct.self, from: data)
                        self.currentProduct = product
                    } catch {
                        print("Decode Error: \(error)")
                    }
                }
            }
            task.resume()
        }
    }
    
    private func saveMyList() {
        guard let context = self.persistentContainer?.viewContext else { return }
        guard let currentProduct = self.currentProduct else { return }
        
        let wishProduct = Product(context: context)
        wishProduct.id = Int32(currentProduct.id)
        wishProduct.title = currentProduct.title
        wishProduct.price = Int64(currentProduct.price)
        
        try? context.save()
        
    }
}
