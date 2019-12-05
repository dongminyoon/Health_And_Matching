//
//  Trainer.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class Trainer {
    private var profileImage: UIImage?
    private var name: String?
    private var sex: String?
    private var age: String?
    private var height: String?
    private var weight: String?
    private var career: String?
    
    private var applicantCustomer: [Customer] = []
    
    func addApplicant(_ customer: Customer) {
        applicantCustomer.append(customer)
    }
}
