//
//  DictionaryTableDataSource.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class DictionaryTableDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Dictionary Section 당 Row 수만큼 만들게 수정
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let routineDictionaryCell = tableView.dequeueReusableCell(withIdentifier: "routineDictionaryCell") as? RoutineDictionaryTableCell else { return UITableViewCell() }
        
        return routineDictionaryCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let workoutPart = WorkoutPart(rawValue: section) else { return nil }
        return workoutPart.getHeader()
    }
}

