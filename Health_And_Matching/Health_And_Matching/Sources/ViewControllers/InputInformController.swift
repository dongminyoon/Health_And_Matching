//
//  InputInformController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class InputInformController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "내 정보 입력"
    }
    
    @IBAction func completeApply(_ sender: Any) {
        // 버튼들 비활성화 시키고, 버튼 이름 바꾸기, 신청정보, Trainer => Customer 신청 목록으로 보내기
    self.navigationController?.popToViewController(navigationController!.viewControllers[1], animated: true)
    }
}
