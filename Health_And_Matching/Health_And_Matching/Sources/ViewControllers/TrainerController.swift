//
//  TrainerController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class TrainerController: UIViewController {
    @IBOutlet weak var applyButton: CustomButton!
    @IBOutlet weak var applicantListButton: CustomButton!
    @IBOutlet weak var managementButton: CustomButton!
    @IBOutlet var customButtons: [CustomButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()
        addObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setButtons() {
        applyButton.setButtonLabel("신청하기")
        applicantListButton.setButtonLabel("고객 신청 명단")
        managementButton.setButtonLabel("고객 관리 명단")
        
        for button in customButtons {
            button.makeShadow()
            button.layer.cornerRadius = button.frame.width / 20
        }
    }
}

extension TrainerController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(goNextView(_:)), name: .clickTrainerMyPageButton, object: nil)
    }
    
    @objc func goNextView(_ notification: NSNotification) {
        guard let clickedButton = notification.userInfo?["button"] as? CustomButton else { return }
        
        print(clickedButton)
        
        switch clickedButton {
        case applyButton:
            guard let trainerInformInputController = self.storyboard?.instantiateViewController(identifier: "InputTrainerInformController") as? InputTrainerInformController else { return }
            self.navigationController?.pushViewController(trainerInformInputController, animated: true)
        case applicantListButton: print("applicatn")
        case managementButton: print("awd")
        default: print("default")
        }
    }
}
