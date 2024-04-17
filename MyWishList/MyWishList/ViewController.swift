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
    
    private var currentProduct: RemoteProduct? {
        didSet {
            guard let currentProduct = self.currentProduct else { return }
            
            DispatchQueue.main.async { [weak self] in
                // 이미지를 설정하는 부분
                // 여기서는 이미지 URL을 가져와 이미지를 다운로드하여 설정합니다.
                if let imageURL = currentProduct.images.first, let imageURL = URL(string: imageURL) {
                    DispatchQueue.global().async {
                        if let data = try? Data(contentsOf: imageURL), let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                self?.productImages.image = image
                            }
                        }
                    }
                }
                //가격에 1000단위 콤마 붙이기 작업
                func formatPrice(price: Double) -> String? {
                    let formatter = NumberFormatter()
                    formatter.numberStyle = .decimal
                    formatter.minimumFractionDigits = 0 // 소수점 이하 자리수를 0으로 설정하면 정수로 출력됩니다.
                    
                    // 가격을 포맷팅하여 콤마로 구분하여 반환
                    return formatter.string(from: NSNumber(value: price))
                }
                
                // 나머지 제품 정보 설정
                self?.id.text = "#\(currentProduct.id)"
                self?.productTitle.text = currentProduct.title
                self?.productDescription.text = currentProduct.description
                self?.rating.text = String(currentProduct.rating)
                if let formattedPrice = formatPrice(price: Double(currentProduct.price)) {
                    self?.price.text = "\(formattedPrice)$"
                } else {
                    self?.price.text = "\(currentProduct.price)$"
                }
            }
        }
    }
    
    
    
    
    
    //UI 설정
    //이름을 바꿔주기(숨겨진 기본 설정이라 겹치는것)
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var productImages: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var rating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchRemoteProduct()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextProduct(_ sender: UIButton) {
        self.fetchRemoteProduct()
    }
    
    //내 위시리스트로 정보 보내기
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

