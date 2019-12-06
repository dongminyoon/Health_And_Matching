//
//  DictionaryController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class DictionaryController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let workoutDictionary: Dictionary<WorkoutPart, [Workout]> = DB.shared.workoutDictionary
    // DB에서 받아오는 과정은 핸들러 거치게 코딩 ==> 다시 하기
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
}


extension DictionaryController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return WorkoutPart.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let workoutPart = WorkoutPart(rawValue: section) else { return 0 }
        guard let workoutList = workoutDictionary[workoutPart] else { return 0 }
        return workoutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dictionaryTableCell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell") as? DictionaryTableCell else { return UITableViewCell() }
        // cell.setLabel ==> Index별로 다르게 뜨게 수정
        guard let workoutPart = WorkoutPart(rawValue: indexPath.section) else { return UITableViewCell() }
        guard let workout = workoutDictionary[workoutPart]?[indexPath.row] else { return UITableViewCell() }
        
        dictionaryTableCell.setLabels(name: workout.name, kcal: workout.consumeKcal)
        dictionaryTableCell.setWorkoutImage(image: workout.profileImage)
        return dictionaryTableCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // 0번 : Chest 가슴
        // 1번 : Back 등
        // 2번 : Shoulder 어깨
        // 3번 : leg 다리
        guard let workoutPart = WorkoutPart(rawValue: section) else { return nil }
        return workoutPart.getHeader()
    }
}

extension DictionaryController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let workoutInformController = self.storyboard?.instantiateViewController(identifier: "workoutInformController") as? WorkoutInformController else { return }
        guard let workoutPart = WorkoutPart(rawValue: indexPath.section) else { return }
        guard let workout = workoutDictionary[workoutPart]?[indexPath.row] else { return }
        workoutInformController.setWorkoutInform(workout)
        self.navigationController?.pushViewController(workoutInformController, animated: true)
    }
}

