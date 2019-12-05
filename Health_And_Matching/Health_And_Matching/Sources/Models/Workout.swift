//
//  WorkoutDictionary.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Workout {
    private var name: String
    private var part: WorkoutPart
    private var consumeKcal: Int
    private var url: String
    
    init(_ name: String, part: WorkoutPart, consumeKcal: Int, url: String) {
        self.name = name
        self.part = part
        self.consumeKcal = consumeKcal
        self.url = url
    }
}
