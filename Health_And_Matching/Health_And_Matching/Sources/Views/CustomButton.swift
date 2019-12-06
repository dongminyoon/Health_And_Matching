//
//  CustomButton.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class CustomButton: UIView {
    @IBOutlet weak var buttonLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    private var view: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialView()
    }
    
    private func initialView() {
        guard let view = Bundle.main.loadNibNamed("CustomButton", owner: self, options: nil)?.first as? UIView else { return }
        self.view = view
        view.frame = self.bounds
        view.makeCornerRadius(view.frame.width / 20)
        self.addSubview(view)
    }
    
    func setButtonLabel(_ text: String) {
        buttonLabel.text = text
    }
}

extension CustomButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view?.backgroundColor = .black
        buttonLabel.textColor = .white
        arrowImage.tintColor = .white
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view?.backgroundColor = .white
        arrowImage.tintColor = .black
        buttonLabel.textColor = .black
        NotificationCenter.default.post(name: .clickMainButton, object: nil, userInfo: ["button": self])
        NotificationCenter.default.post(name: .clickCustomerMyPageButton, object: nil, userInfo: ["button": self])
        NotificationCenter.default.post(name: .clickTrainerMyPageButton, object: nil, userInfo: ["button": self])
    }
}
