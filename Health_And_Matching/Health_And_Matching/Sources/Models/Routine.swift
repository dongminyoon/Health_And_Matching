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
    
    func count(by part: WorkoutPart) -> Int {
        guard let partWorkoutRoutine = partRoutine[part] else { return 0 }
        return partWorkoutRoutine.count
    }
    
    func getEachWorkoutRoutine(by part: WorkoutPart, of index: Int) -> EachWorkoutRoutine? {
        guard let eachRoutines = partRoutine[part] else { return nil }
        return eachRoutines[index]
    }
    
    func caluateTotalConsumeKcal() -> Float {
        var totalKcal: Float = 0
        for (_, value) in partRoutine {
            for eachWorkoutRoutin in value {
                totalKcal += Float(eachWorkoutRoutin.eachCount) * eachWorkoutRoutin.workout.consumeKcal
            }
        }
        return totalKcal
    }
    
    func calculateTotalConsumeKG() -> Float {
        return self.caluateTotalConsumeKcal() / 9000
    }
}
