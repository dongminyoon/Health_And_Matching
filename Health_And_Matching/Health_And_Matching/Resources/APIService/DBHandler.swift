//
//  DBHandler.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

struct DBHandler {
    static let factory: DBHandler = DBHandler()
    
    
    
    func requestTrainerList() -> [Trainer] {
        return DB.shared.trainerList
    }
}
