//
//  InputInformController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class InputInformController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var sexSegment: UISegmentedControl!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var requestTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "내 정보 입력"
    }
    
    @IBAction func completeApply(_ sender: Any) {
        // 버튼들 비활성화 시키고, 버튼 이름 바꾸기, 신청정보, Trainer => Customer 신청 목록으로 보내기
        guard let name = nameTextField.text, let age = ageTextField.text,
                   let height = heightTextField.text, let weight = weightTextField.text,
                   let request = requestTextField.text else { return }
        let sex: String
        if sexSegment.selectedSegmentIndex == 0 { sex = "남자" }
        else { sex = "여자" }
        
        if name == "" || age == "" || height == "" || weight == "" {
            self.presentAlertView(title: "빈 칸을 채워주세요", message: "모든 입력 창을 입력해주세요")
        } else {
            let customerApplicant = Customer(name, age, sex, height, weight, request, .applied)
            self.navigationController?.popToViewController(navigationController!.viewControllers[1], animated: true)
        }
    }
}
