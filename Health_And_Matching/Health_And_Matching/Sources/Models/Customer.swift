//
//  Customer.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Customer {
    var name: String
    var age: String
    var sex: String
    var height: String
    var weight: String
    var request: String
    var applyStatus: ApplyStatus
    
    init(_ name: String, _ age: String, _ sex: String, _ height: String, _ weight: String, _ request: String, _ applyStatus: ApplyStatus) {
        self.name = name
        self.age = age
        self.sex = sex
        self.height = height
        self.weight = weight
        self.request = request
        self.applyStatus = applyStatus
    }
}
