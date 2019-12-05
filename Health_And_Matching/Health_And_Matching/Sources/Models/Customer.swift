//
//  Customer.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Customer {
    private var name: String
    private var age: String
    private var sex: String
    private var height: String
    private var weight: String
    private var request: String
    
    init(_ name: String, _ age: String, _ sex: String, _ height: String, _ weight: String, _ request: String) {
        self.name = name
        self.age = age
        self.sex = sex
        self.height = height
        self.weight = weight
        self.request = request
    }
}
