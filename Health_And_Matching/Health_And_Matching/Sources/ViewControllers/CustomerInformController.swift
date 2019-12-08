//
//  CustomerInformController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class CustomerInformController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var requestTextView: UITextView!
    
    private var customerApplicantID: Customer?         // 신청한 Customer
    private var trainerID: Trainer?                   // Customer가 신청한 Trainer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "상세정보"
        initView()
    }
    
    private func initView() {
        guard let customerApplicantID = self.customerApplicantID else { return }
        nameLabel.text = customerApplicantID.name
        sexLabel.text = customerApplicantID.sex
        ageLabel.text = customerApplicantID.age
        heightLabel.text = customerApplicantID.height
        weightLabel.text = customerApplicantID.weight
        requestTextView.text = customerApplicantID.request
    }
    
    func setInitData(_ trainerID: Trainer, _ customerApplicantID: Customer) {
        self.trainerID = trainerID
        self.customerApplicantID = customerApplicantID
    }
    
    func setLabels(name: String, sex: String, age: String, height: String, weight: String, request: String) {
        nameLabel.text = name
        sexLabel.text = sex
        ageLabel.text = age
        heightLabel.text = height
        weightLabel.text = weight
        requestTextView.text = request
    }
    
    @IBAction func completeAccept(_ sender: Any) {
        // 신청을 받아준 Customer을 Trainer에게 보내준다.
        guard let customerApplicantID = self.customerApplicantID else { return }
        customerApplicantID.applyStatus = .accepted
        trainerID?.removeApplicant(customerApplicantID)
        trainerID?.addCustomer(customerApplicantID)
        NotificationCenter.default.post(name: .acceptCustomerApplicant, object: nil)
        self.navigationController?.popViewController(animated: true)
    }
}
