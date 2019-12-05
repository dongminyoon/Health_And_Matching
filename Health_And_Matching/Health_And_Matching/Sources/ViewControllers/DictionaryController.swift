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
    // 여기에 Workout Dictionary Data 넣기 ==> Network에서 가져오는 것 처럼 구현, 일단은 Defualt 값
    
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
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "dictionaryCell") as? DictionaryTableCell else { return UITableViewCell() }
        // cell.setLabel ==> Index별로 다르게 뜨게 수정
        return cell
    }
}

extension DictionaryController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        // 0번 : Chest 가슴
        // 1번 : Back 등
        // 2번 : Shoulder 어깨
        // 3번 : leg 다리
        guard let workoutPart = WorkoutPart(rawValue: section) else { return nil }
        return workoutPart.getHeader()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let workoutInformController = self.storyboard?.instantiateViewController(identifier: "workoutInformController") as? WorkoutInformController else { return }
//        workoutInformController.setLabels(<#T##name: String##String#>, <#T##part: String##String#>, <#T##kcal: String##String#>, <#T##youtubeLink: String##String#>, <#T##description: String##String#>)
//        workoutInformController.setWorkoutImage(UIImage())
        self.navigationController?.pushViewController(workoutInformController, animated: true)
    }
}

