//
//  ApplicantStatus.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

enum ApplyStatus {
    case applied
    case accepted
    case none
    
    func getStatus() -> String {
        switch self {
        case .applied: return "신청중"
        case .accepted: return "매칭중"
        case .none: return "신청하기"
        }
    }
}
