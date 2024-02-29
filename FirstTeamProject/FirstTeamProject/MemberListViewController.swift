//
//  ViewController.swift
//  FirstTeamProject
//
//  Created by 이시안 on 2/26/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var BackgroundImage: UIImageView!
    @IBOutlet weak var JJY_B: UIButton!
    @IBOutlet weak var BJY_B: UIButton!
    @IBOutlet weak var BHR_B: UIButton!
    @IBOutlet weak var LSA_B: UIButton!
    @IBOutlet weak var JYJ_B: UIButton!
    
    @IBOutlet weak var ProfileBackGround: UIImageView!
    @IBOutlet weak var ProfileBackGround2: UIImageView!
    @IBOutlet weak var ProfileBackGround3: UIImageView!
    @IBOutlet weak var ProfileBackGround4: UIImageView!
    @IBOutlet weak var ProfileBackGround5: UIImageView!
    var profileBackgrounds: [UIImageView] = []
    
    
    @IBOutlet weak var JJJComment: UILabel!
    @IBOutlet weak var BJYComment: UILabel!
    @IBOutlet weak var BHYCommnt: UILabel!
    @IBOutlet weak var LSAComment: UILabel!
    @IBOutlet weak var JYJComment: UILabel!
    var Comments: [UILabel] = []
    
    
    @IBOutlet weak var ChangeButton: UIImageView!
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
        {
            print("do something.")
        }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tapImageViewRecognizer
                    = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        ChangeButton.isUserInteractionEnabled = true
        ChangeButton.addGestureRecognizer(tapImageViewRecognizer)
               
        
        
        profileBackgrounds.append(ProfileBackGround)
               profileBackgrounds.append(ProfileBackGround2)
               profileBackgrounds.append(ProfileBackGround3)
               profileBackgrounds.append(ProfileBackGround4)
               profileBackgrounds.append(ProfileBackGround5)

               for profileBackground in profileBackgrounds {
                   profileBackground.backgroundColor = UIColor(red: 238/255, green: 232/255, blue: 220/255, alpha: 1.0)
                   profileBackground.layer.masksToBounds = true
                   profileBackground.layer.cornerRadius = profileBackground.frame.height / 2
               }
        
        
        func JJY_B(_ sender: Any) {
        }
        func BJY_B(_ sender: Any) {
        }
        func BHR_B(_ sender: Any) {
        }
        func LSA_B(_ sender: Any) {
        }
        func JYJ_B(_ sender: Any) {
        }
    }
}

