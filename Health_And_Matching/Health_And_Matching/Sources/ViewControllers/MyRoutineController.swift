//
//  MyRoutineController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class MyRoutineController: UIViewController {
    
    private var customerID: Customer?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func setCustomer(_ customerID: Customer) {
        self.customerID = customerID
    }
}
