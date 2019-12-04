//
//  CustomerController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class CustomerController: UIViewController {
    @IBOutlet weak var applyButton: CustomButton!
    @IBOutlet weak var myRoutineButton: CustomButton!
    @IBOutlet weak var informationButton: CustomButton!
    @IBOutlet var customButtons: [CustomButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()
        addObserver()
    }
    
    private func setButtons() {
        applyButton.setButtonLabel("신청하기")
        myRoutineButton.setButtonLabel("마이 루틴")
        informationButton.setButtonLabel("내 정보")
        
        for button in customButtons {
            button.layer.cornerRadius = button.frame.width / 20
            button.makeShadow()
        }
    }
}

extension CustomerController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(goNextView(_:)), name: .clickCustomerMyPageButton, object: nil)
    }
    
    @objc func goNextView(_ notification: NSNotification) {
        guard let clickedButton = notification.userInfo?["button"] as? CustomButton else { return }
        switch clickedButton {
        case applyButton:
            print("applyButton")
        case myRoutineButton:
            print("MyRoutineButton")
        case informationButton:
            print("information")
        default:
            print("default")
        }
    }
}
