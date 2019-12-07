//
//  RoutineTableDelegate.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class RoutineTableDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
