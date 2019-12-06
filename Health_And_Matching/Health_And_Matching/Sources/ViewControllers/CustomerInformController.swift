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
    
    private var customerApplcant: Customer?         // 신청한 Customer
    private var trainer: Trainer?                   // Customer가 신청한 Trainer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "상세정보"
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
        self.navigationController?.popViewController(animated: true)
    }
}
