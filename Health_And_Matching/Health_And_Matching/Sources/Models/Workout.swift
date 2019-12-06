//
//  WorkoutDictionary.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Workout {
    var profileImage: String
    var name: String
    var part: WorkoutPart
    var consumeKcal: Float
    var url: String
    
    init(_ name: String, part: WorkoutPart, consumeKcal: Float, url: String, profileImage: String) {
        self.name = name
        self.part = part
        self.consumeKcal = consumeKcal
        self.url = url
        self.profileImage = profileImage
    }
}
