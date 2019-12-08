//
//  DictionaryTableDataSource.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class DictionaryTableDataSource: NSObject, UITableViewDataSource {
    private var workoutDictionary: Dictionary<WorkoutPart, [EachWorkoutRoutine]>?
    
    init(_ workoutDictionary: Dictionary<WorkoutPart, [EachWorkoutRoutine]>?) {
        self.workoutDictionary = workoutDictionary
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Dictionary Section 당 Row 수만큼 만들게 수정
        guard let workoutPart = WorkoutPart(rawValue: section) else { return 0 }
        guard let workoutList = workoutDictionary?[workoutPart] else { return 0 }
        return workoutList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return WorkoutPart.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let routineDictionaryCell = tableView.dequeueReusableCell(withIdentifier: "routineDictionaryCell") as? RoutineDictionaryTableCell else { return UITableViewCell() }
        guard let workoutPart = WorkoutPart(rawValue: indexPath.section) else { return UITableViewCell() }
        guard let workoutRoutine = workoutDictionary?[workoutPart]?[indexPath.row] else { return UITableViewCell() }
        
        routineDictionaryCell.setLabels(workoutRoutine: workoutRoutine)
        return routineDictionaryCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let workoutPart = WorkoutPart(rawValue: section) else { return nil }
        return workoutPart.getHeader()
    }
}

