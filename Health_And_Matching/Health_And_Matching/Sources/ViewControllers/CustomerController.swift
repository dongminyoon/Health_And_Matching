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
    
    private var customerID: Customer?                         // 김동해로 고정
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getCustomerID()
        setButtons()
        addObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
        setButtonByStatus()
    }
    
    private func getCustomerID() {
        customerID = DB.shared.customerList[0]
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
    
    private func setButtonByStatus() {
        guard let customerID = self.customerID else { return }
        applyButton.setButtonLabel(customerID.applyStatus.getStatus())
        if customerID.applyStatus == .none {
            applyButton.isUserInteractionEnabled = true
            applyButton.setBackgroundColor(.white)
            myRoutineButton.isUserInteractionEnabled = false
            myRoutineButton.setBackgroundColor(.lightGray)
            informationButton.isUserInteractionEnabled = false
            informationButton.setBackgroundColor(.lightGray)
        } else if customerID.applyStatus == .applied {
            applyButton.isUserInteractionEnabled = false
            applyButton.setBackgroundColor(.lightGray)
            myRoutineButton.isUserInteractionEnabled = false
            myRoutineButton.setBackgroundColor(.lightGray)
            informationButton.isUserInteractionEnabled = false
            informationButton.setBackgroundColor(.lightGray)
        } else {
            applyButton.isUserInteractionEnabled = false
            applyButton.setBackgroundColor(.lightGray)
            myRoutineButton.isUserInteractionEnabled = true
            myRoutineButton.setBackgroundColor(.white)
            informationButton.isUserInteractionEnabled = false
            informationButton.setBackgroundColor(.lightGray)
        }
    }
}

extension CustomerController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(goNextView(_:)), name: .clickCustomerMyPageButton, object: nil)
    }
    
    @objc func goNextView(_ notification: NSNotification) {
        guard let clickedButton = notification.userInfo?["button"] as? CustomButton else { return }
        guard let customerID = self.customerID else { return }
        
        switch clickedButton {
        case applyButton:
            guard let trainerListController = self.storyboard?.instantiateViewController(identifier: "TrainerListController") as? TrainerListController else { return }
//            guard let customerID = self.customerID else { return }
            trainerListController.setCustomer(customerID)
            self.navigationController?.pushViewController(trainerListController, animated: true)
        case myRoutineButton:
            guard let myRoutineController = self.storyboard?.instantiateViewController(identifier: "MyRoutineController") as? MyRoutineController else { return }
            myRoutineController.setCustomer(customerID)
            self.navigationController?.pushViewController(myRoutineController, animated: true)
        case informationButton:
            print("information")
        default:
            print("nothing")
        }
    }
}
