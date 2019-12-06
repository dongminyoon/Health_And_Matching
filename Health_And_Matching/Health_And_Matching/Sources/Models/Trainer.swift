//
//  Trainer.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class Trainer {
    var profileImage: UIImage?
    var name: String
    var sex: String
    var age: String
    var height: String
    var weight: String
    var career: String
    var applicantCustomer: [Customer] = []
    
    init(_ profileImage: UIImage?, _ name: String, _ sex: String, _ age: String, _ height: String, _ weight: String, _ career: String) {
        self.profileImage = profileImage
        self.name = name
        self.sex = sex
        self.age = age
        self.height = height
        self.weight = weight
        self.career = career
    }
    
    func addApplicant(_ customer: Customer) {
        applicantCustomer.append(customer)
    }
}
