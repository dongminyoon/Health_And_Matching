//
//  MakeRoutineController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class MakeRoutineController: UIViewController {
    @IBOutlet weak var dictionaryTableView: UITableView!
    @IBOutlet weak var routineTableView: UITableView!

    private var workoutRoutines: Dictionary<WorkoutPart, [WorkoutRoutine]> = [:]
    private var addedWorkoutRoutines: Dictionary<WorkoutPart, [WorkoutRoutine]> = [:]
    // DB에서 데이터 받아오게 다시 코딩
    
    // 넘겨줄 고객의 ID을 가지고 있어야함
    // Dictionary 정보 가지고 있어야함
    // 추가된 운동 리스트 가지고 있어야함
    
    private lazy var dictionaryTableDataSource: DictionaryTableDataSource = DictionaryTableDataSource(workoutRoutines)
    private var dictionaryTableDelegate: DictionaryTableDelegate = DictionaryTableDelegate()
    private lazy var routineTableDataSource: RoutineTableDataSource = RoutineTableDataSource(addedWorkoutRoutines)
    private var routineTableDelegate: RoutineTableDelegate = RoutineTableDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "루틴만들기"
        addObserver()
        initWorkoutDictionary()
        initTableViews()
        dictionaryTableView.reloadData()
        routineTableView.reloadData()
    }
    
    private func initTableViews() {
        dictionaryTableView.dataSource = dictionaryTableDataSource
        dictionaryTableView.delegate = dictionaryTableDelegate
        routineTableView.dataSource = routineTableDataSource
        routineTableView.delegate = routineTableDelegate
    }
    
    private func initWorkoutDictionary() {
        for key in WorkoutPart.allCases {
            workoutRoutines[key] = []
            addedWorkoutRoutines[key] = []
        }
        
        let workoutDictionary = DB.shared.workoutDictionary         // DB에서 데이터 받아오게 구현
        
        for (key, _) in workoutDictionary {
            guard let dictionaryWorkoutList = workoutDictionary[key] else { return }
            for workout in dictionaryWorkoutList {
                let workoutRoutine = WorkoutRoutine(workout: workout, eachCount: 0)
                workoutRoutines[key]?.append(workoutRoutine)
            }
        }
    }
}

extension MakeRoutineController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(addMakingRoutine(_:)), name: .clickAddButton, object: nil)
    }
    
    @objc func addMakingRoutine(_ notification: NSNotification) {
        guard let addedRoutine = notification.userInfo?["workoutRoutine"] as? WorkoutRoutine else { return }
        let newRoutine: WorkoutRoutine = WorkoutRoutine(workout: addedRoutine.workout, eachCount: addedRoutine.eachCount)
        
        addedWorkoutRoutines[addedRoutine.workout.part]?.append(newRoutine)
        routineTableDataSource.setAddedRoutine(addedWorkoutRoutines)
        routineTableView.reloadData()
    }
}
