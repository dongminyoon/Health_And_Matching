//
//  InputTrainerInformController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class InputTrainerInformController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexSegment: UISegmentedControl!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var careerTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "내 정보 입력"
        setInitalView()
    }
    
    private func setInitalView() {
        careerTextView.layer.borderWidth = 1
        careerTextView.layer.borderColor = UIColor.lightGray.cgColor
        careerTextView.layer.cornerRadius = careerTextView.frame.height / 30
    }
    
    @IBAction func completeApply(_ sender: Any) {
        let sex: String
        if sexSegment.selectedSegmentIndex == 0 { sex = "남자" }
        else { sex = "여자" }
        guard let name = nameTextField.text, let age = ageTextField.text, let height = heightTextField.text, let weight = weightTextField.text, let career = careerTextView.text else { return }
        
        if name == "" || age == "" || height == "" || weight == "" || career == "" {
            self.presentAlertView(title: "빈 칸을 채워주세요", message: "모든 입력 창을 입력해주세요")
        } else {
            let trainerApplicant = Trainer(nil, name, sex, age, height, weight, career, .none)
            self.navigationController?.popToViewController((navigationController?.viewControllers[1])!, animated: true)
        }
        
    }
}
