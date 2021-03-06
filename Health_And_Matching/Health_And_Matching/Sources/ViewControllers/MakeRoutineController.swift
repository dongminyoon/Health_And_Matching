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
    
    private var customerID: Customer?
//
    private var workoutRoutines: Dictionary<WorkoutPart, [EachWorkoutRoutine]> = [:]
    private var addedWorkoutRoutines: Dictionary<WorkoutPart, [EachWorkoutRoutine]> = [:]    // 기존에 있던 코드
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
        routineTableView.layer.cornerRadius = routineTableView.frame.width / 20
        routineTableView.layer.borderWidth = 3
        routineTableView.layer.borderColor = UIColor.black.cgColor
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
                let workoutRoutine = EachWorkoutRoutine(workout: workout, eachCount: 0)
                workoutRoutines[key]?.append(workoutRoutine)
            }
        }
    }
    
    func setCustomer(_ customerID: Customer) {
        self.customerID = customerID
    }
    
    @IBAction func completeMakeRoutine(_ sender: Any) {
        let makedRoutine = Routine(partRoutine: addedWorkoutRoutines)
        customerID?.setRoutines(makedRoutine)
        self.navigationController?.popViewController(animated: true)
    }
}

extension MakeRoutineController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(addMakingRoutine(_:)), name: .clickAddButton, object: nil)
    }
    
    @objc func addMakingRoutine(_ notification: NSNotification) {
        guard let addedRoutine = notification.userInfo?["workoutRoutine"] as? EachWorkoutRoutine else { return }
        let newRoutine: EachWorkoutRoutine = EachWorkoutRoutine(workout: addedRoutine.workout, eachCount: addedRoutine.eachCount)
        
        if newRoutine.eachCount == 0 { return }
        
        var markIndex: Int?
        
        for (key, _) in addedWorkoutRoutines {
            guard let eachPartRoutines = addedWorkoutRoutines[key] else { return }
            for index in 0..<eachPartRoutines.count {
                if eachPartRoutines[index].workout.name == newRoutine.workout.name {
                    markIndex = index
                    break
                }
                if markIndex != nil { break }
            }
        }
        
        if let markIndex = markIndex {
            addedWorkoutRoutines[addedRoutine.workout.part]?.remove(at: markIndex)
            addedWorkoutRoutines[addedRoutine.workout.part]?.insert(newRoutine, at: markIndex)
        } else {
            addedWorkoutRoutines[addedRoutine.workout.part]?.append(newRoutine)
        }
        routineTableDataSource.setAddedRoutine(addedWorkoutRoutines)
        routineTableView.reloadData()
    }
}
