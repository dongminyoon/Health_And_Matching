//
//  CustomerTabbarController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class CustomerTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "My Page"
        self.navigationController?.navigationBar.isHidden = false
//        setNavigationImage()
    }
    
//    private func setNavigationImage() {
//        guard let height = self.navigationController?.navigationBar.frame.height else { return }
//        let frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: height / 5, height: height))
//
//        let imageView = UIImageView(frame: frame)
//        guard let image = UIImage(named: "111") else { return }
//        imageView.image = image
//        self.navigationItem.titleView = imageView
//    }
}
