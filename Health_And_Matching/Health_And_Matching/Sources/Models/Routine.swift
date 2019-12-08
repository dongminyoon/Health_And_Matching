//
//  Routine.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class Routine {
    var partRoutine: Dictionary<WorkoutPart, [EachWorkoutRoutine]> = [:]
    
    init(partRoutine: Dictionary<WorkoutPart, [EachWorkoutRoutine]>?) {
        if let partRoutine = partRoutine { self.partRoutine = partRoutine }
        else {
            for workoutPart in WorkoutPart.allCases {
                self.partRoutine[workoutPart] = []
            }

        }
    }
}
