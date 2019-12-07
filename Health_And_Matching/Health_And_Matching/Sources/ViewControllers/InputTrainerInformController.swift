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
    
    private var trainerID: Trainer?
    
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
    
    func setTrainer(_ trainerID: Trainer) {
        self.trainerID = trainerID
    }
    
    @IBAction func completeApply(_ sender: Any) {
        guard let name = nameTextField.text, let age = ageTextField.text, let height = heightTextField.text, let weight = weightTextField.text, let career = careerTextView.text else { return }
        
        if name == "" || age == "" || height == "" || weight == "" || career == "" {
            self.presentAlertView(title: "빈 칸을 채워주세요", message: "모든 입력 창을 입력해주세요")
        } else {
            trainerID?.applyStatus = .applied
            self.navigationController?.popToViewController((navigationController?.viewControllers[1])!, animated: true)
        }
        
    }
}
