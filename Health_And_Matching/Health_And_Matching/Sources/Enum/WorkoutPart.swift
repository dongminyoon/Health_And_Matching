//
//  WorkoutPart.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

enum WorkoutPart: Int, CaseIterable {
    case chest = 0
    case back = 1
    case shoulder = 2
    case leg = 3
    
    func getHeader() -> String {
        switch self {
        case .chest: return "가슴"
        case .back: return "등"
        case .shoulder: return "어깨"
        case .leg: return "다리"
        }
    }
}
