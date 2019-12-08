//
//  AdminController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class AdminController: UIViewController {

    @IBOutlet weak var applicantListButton: CustomButton!
    @IBOutlet weak var trainerListButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()
        addObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setButtons() {
        applicantListButton.setButtonLabel("신청자 명단")
        trainerListButton.setButtonLabel("트레이너 명단")
        
        applicantListButton.makeShadow()
        applicantListButton.layer.cornerRadius = applicantListButton.frame.width / 20
        trainerListButton.makeShadow()
        trainerListButton.layer.cornerRadius = trainerListButton.frame.width / 20
    }
}

extension AdminController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(goNextView(_:)), name: .clickAdminMyPageButton, object: nil)
    }
    
    @objc func goNextView(_ notification: NSNotification) {
        guard let clickedButton = notification.userInfo?["button"] as? CustomButton else { return }
        
        switch clickedButton {
        case applicantListButton:
            guard let trainerApplicantListController = self.storyboard?.instantiateViewController(identifier: "TrainerApplicantListController") as? TrainerApplicantListController else { return }
            self.navigationController?.pushViewController(trainerApplicantListController, animated: true)
        case trainerListButton:
            guard let managedTrainerListController = self.storyboard?.instantiateViewController(identifier: "ManagedTrainerListController") as? ManagedTrainerListController else { return }
            self.navigationController?.pushViewController(managedTrainerListController, animated: true)
        default: return
        }
    }
}
