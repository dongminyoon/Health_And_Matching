//
//  DB.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import Foundation

class DB {
    static let shared = DB()
    
    var trainerList: [Trainer] = []
    var workoutDictionary: Dictionary<String, [Workout]> = [:]
    var customerList: [Customer] = []
    
    init() {
        initialCustomer()
        initialTrainer()
    }
    
    private func initialCustomer() {
        let customer1 = Customer("김동해", "25", "남", "159", "96", "살을 뺴고 싶어요", .none)
        let customer2 = Customer("허준영", "25", "남", "189", "80", "3개 700 찍고 싶어요", .none)
        let customer3 = Customer("김민형", "25", "남", "137", "97", "키가 크고 싶어요", .none)
        let customer4 = Customer("경주현", "25", "남", "190", "47", "성냥개비가 되기 싫어요", .none)
        customerList.append(customer1)
        customerList.append(customer2)
        customerList.append(customer3)
        customerList.append(customer4)
    }
    
    private func initialTrainer() {
        let trainer1 = Trainer(nil, "허두영", "남", "22", "189", "90", "생활지도자격증 1급", .none)
        let trainer2 = Trainer(nil, "이석복", "남", "28", "195", "109", "헬스 트레이너 20년", .none)
        let trainer3 = Trainer(nil, "신주연", "여", "23", "163", "45", "필라테스 지도 3년", .none)
        trainerList.append(trainer1)
        trainerList.append(trainer2)
        trainerList.append(trainer3)
    }
    
}
