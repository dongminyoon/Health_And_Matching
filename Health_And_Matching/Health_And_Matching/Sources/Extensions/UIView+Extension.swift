//
//  UIView+Extension.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

extension UIView {
    func makeCornerRadius(_ radius: CGFloat?) {
        self.clipsToBounds = true
        guard let radius = radius else {
            self.layer.cornerRadius = self.frame.width / 2
            return
        }
        self.layer.cornerRadius = radius
    }
    
    func makeShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.16
        self.layer.shadowRadius = 7
    }
}

