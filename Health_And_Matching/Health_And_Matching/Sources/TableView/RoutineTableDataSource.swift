//
//  RoutineTableDataSource.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit


class RoutineTableDataSource: NSObject, UITableViewDataSource {
    private var addedRoutine: Dictionary<WorkoutPart, [WorkoutRoutine]>?
    
    init(_ addedRoutine: Dictionary<WorkoutPart, [WorkoutRoutine]>) {
        self.addedRoutine = addedRoutine
    }
    
    func setAddedRoutine(_ addedRoutine: Dictionary<WorkoutPart, [WorkoutRoutine]>) {
        self.addedRoutine = addedRoutine
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return WorkoutPart.allCases.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let workoutPart = WorkoutPart(rawValue: section) else { return "" }
        return workoutPart.getHeader()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // routine 만들어진 section 당 운동으로 생성
        guard let workoutPart = WorkoutPart(rawValue: section) else { return 0 }
        guard let workoutRoutines = addedRoutine?[workoutPart] else { return 0 }
        return workoutRoutines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let addedRoutineCell = tableView.dequeueReusableCell(withIdentifier: "addedRoutineCell") as? AddedRoutineTableCell else { return UITableViewCell() }
        guard let workoutPart = WorkoutPart(rawValue: indexPath.section) else { return UITableViewCell() }
        guard let workoutRoutine = addedRoutine?[workoutPart]?[indexPath.row] else { return UITableViewCell() }
        addedRoutineCell.setWorkoutRoutine(workoutRoutine)
        return addedRoutineCell
    }
}
