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
    var workoutDictionary: Dictionary<WorkoutPart, [Workout]> = [:]
    var customerList: [Customer] = []
    var trainerApplicant: [Trainer] = []
    
    init() {
        initialCustomer()
        initialTrainer()
        initialDictionary()
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
        let trainer1 = Trainer(nil, "신주연", "여", "23", "163", "45", "필라테스 지도 3년", .none)
        let trainer2 = Trainer(nil, "허두영", "남", "22", "189", "90", "생활지도자격증 1급", .accepted)
        let trainer3 = Trainer(nil, "이석복", "남", "28", "195", "109", "헬스 트레이너 20년", .accepted)
        let trainer4 = Trainer(nil, "이동환", "남", "21", "168", "70", "축구 U 리그 선수", .accepted)
        let trainer5 = Trainer(nil, "용상호", "남", "23", "174", "75", "요가 강사 10년", .accepted)
        trainerList.append(trainer1)
        trainerList.append(trainer2)
        trainerList.append(trainer3)
        trainerList.append(trainer4)
        trainerList.append(trainer5)
    }
    
    private func initialDictionary() {
        let legWorkout = Workout("스쿼트", part: .leg, consumeKcal: 1.3, url: "https://www.youtube.com/watch?v=IfJcq4LDXKE", profileImage: "leg3")
        let legWorkout1 = Workout("레그 프레스", part: .leg, consumeKcal: 0.9, url: "https://www.youtube.com/watch?v=hYwJrXpzEfs", profileImage: "leg1")
        let legWorkout2 = Workout("레그 익스텐션", part: .leg, consumeKcal: 0.9, url: "https://www.youtube.com/watch?v=BsNxEFKNLvY", profileImage: "leg2")
        
        let chestWorkout = Workout("체스트 프레스", part: .chest, consumeKcal: 1.4, url: "https://www.youtube.com/watch?v=1pBcQ-77ho4", profileImage: "chest1")
        let chestWorkout1 = Workout("덤벨 플라이", part: .chest, consumeKcal: 1.36, url: "https://www.youtube.com/watch?v=HcDzxNNrSBo", profileImage: "chest2")
        let chestWorkout2 = Workout("푸쉬업", part: .chest, consumeKcal: 0.8, url: "https://www.youtube.com/watch?v=-_DUjHxgmWk", profileImage: "chest3")
        
        let shoulderWorkout = Workout("덤밸숄더 프레스", part: .shoulder, consumeKcal: 0.36, url: "https://www.youtube.com/watch?v=ywLWbwF42kE", profileImage: "shoulder1")
        let shoulderWorkout1 = Workout("사이드 레터럴 레이즈", part: .shoulder, consumeKcal: 0.36, url: "https://www.youtube.com/watch?v=dE5be4sTjxM", profileImage: "shoulder2")
        let shoulderWorkout2 = Workout("바벨 로우", part: .shoulder, consumeKcal: 0.4, url: "https://www.youtube.com/watch?v=4bx17wuyJ2o", profileImage: "shoulder3")
        
        let backWorkout = Workout("랫풀다운", part: .back, consumeKcal: 0.7, url: "https://www.youtube.com/watch?v=G11ySWVXA48", profileImage: "back1")
        let backWorkout1 = Workout("친업", part: .back, consumeKcal: 0.5, url: "https://www.youtube.com/watch?v=WXMCA3umX-w", profileImage: "back2")
        let backWorkout2 = Workout("원 암 바벨로우", part: .back, consumeKcal: 0.4, url: "https://www.youtube.com/watch?v=m5LO72gdYGQ", profileImage: "back3")
        
        let legWorkouts: [Workout] = [legWorkout, legWorkout1, legWorkout2]
        let chestWorkouts: [Workout] = [chestWorkout, chestWorkout1, chestWorkout2]
        let shoulderWorkouts: [Workout] = [shoulderWorkout, shoulderWorkout1, shoulderWorkout2]
        let backWorkouts: [Workout] = [backWorkout, backWorkout1, backWorkout2]
        
        workoutDictionary[.leg] = legWorkouts
        workoutDictionary[.chest] = chestWorkouts
        workoutDictionary[.back] = backWorkouts
        workoutDictionary[.shoulder] = shoulderWorkouts
    }
    
    func addTrainer(_ trainer: Trainer) {
        trainerList.append(trainer)
    }
    
    func addTrainerApplicant(_ trainer: Trainer) {
        self.trainerApplicant.append(trainer)
    }
    
    func removeTrainerApplicant(_ trainer: Trainer) {
        for index in 0..<trainerApplicant.count {
            if trainer === trainerApplicant[index] { trainerApplicant.remove(at: index) }
        }
    }
}
