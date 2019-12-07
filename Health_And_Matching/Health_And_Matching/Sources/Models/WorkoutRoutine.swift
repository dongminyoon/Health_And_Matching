//
//  WorkoutRoutine.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/07.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class WorkoutRoutine {
    var workout: Workout
    var eachCount: Int

    init(workout: Workout, eachCount: Int) {
        self.workout = workout
        self.eachCount = eachCount
    }
}
