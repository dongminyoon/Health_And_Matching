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
    
    private var trainerID: Trainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()
        addObserver()
        getTrainerID()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setButtonByStatus()
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func getTrainerID() {
        self.trainerID = DB.shared.trainerList[0]
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
    
    private func setButtonByStatus() {
        guard let trainerID = self.trainerID else { return }
        applyButton.setButtonLabel(trainerID.applyStatus.getStatus())
        switch trainerID.applyStatus {
        case .none:
            applyButton.isUserInteractionEnabled = true
            applyButton.setBackgroundColor(.white)
            applicantListButton.isUserInteractionEnabled = false
            applicantListButton.setBackgroundColor(.lightGray)
            managementButton.isUserInteractionEnabled = false
            managementButton.setBackgroundColor(.lightGray)
        case .applied:
            applyButton.isUserInteractionEnabled = false
            applyButton.setBackgroundColor(.lightGray)
            applicantListButton.isUserInteractionEnabled = false
            applicantListButton.setBackgroundColor(.lightGray)
            managementButton.isUserInteractionEnabled = false
            managementButton.setBackgroundColor(.lightGray)
        case .accepted:
            applyButton.setButtonLabel("승인완료")
            applyButton.isUserInteractionEnabled = false
            applyButton.setBackgroundColor(.lightGray)
            applicantListButton.isUserInteractionEnabled = true
            applicantListButton.setBackgroundColor(.white)
            managementButton.isUserInteractionEnabled = true
            managementButton.setBackgroundColor(.white)
        }
    }
}

extension TrainerController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(goNextView(_:)), name: .clickTrainerMyPageButton, object: nil)
    }
    
    @objc func goNextView(_ notification: NSNotification) {
        guard let clickedButton = notification.userInfo?["button"] as? CustomButton else { return }
        
        switch clickedButton {
        case applyButton:
            guard let trainerInformInputController = self.storyboard?.instantiateViewController(identifier: "InputTrainerInformController") as? InputTrainerInformController else { return }
            guard let trainerID = self.trainerID else { return }
            trainerInformInputController.setTrainer(trainerID)
            self.navigationController?.pushViewController(trainerInformInputController, animated: true)
        case applicantListButton:
            guard let customerApplicantListController = self.storyboard?.instantiateViewController(identifier: "CustomerApplicantListController") as? CustomerApplicantListController else { return }
            self.navigationController?.pushViewController(customerApplicantListController, animated: true)
        case managementButton:
            guard let managementListController = self.storyboard?.instantiateViewController(withIdentifier: "ManagementListController") as? ManagementListController else { return }
            self.navigationController?.pushViewController(managementListController, animated: true)
        default: return
        }
    }
}
