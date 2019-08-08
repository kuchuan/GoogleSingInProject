//
//  ProfileViewController.swift
//  GoogleSinginProject
//
//  Created by 堀川浩二 on 2019/08/08.
//  Copyright © 2019 堀川浩二. All rights reserved.
//

import UIKit
import Firebase

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mailLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //ログインしているユーザー情報
        let user = Auth.auth().currentUser!
        
        do {
            // プロフィール写真の設定
            // URLから写真データを取得
            let imageData = try Data(contentsOf: user.photoURL!)
            
            // 写真データから画像を作成
            let image = UIImage(data: imageData)
            
            imageView.image = image
            
            // メールアドレスの設定
            mailLabel.text = user.email
            
            // 名前の設定
            nameLabel.text = user.displayName
            
        } catch let error {
            
            print(error.localizedDescription)
            
        }
        
    }
    


}
