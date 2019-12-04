//
//  TrainerListController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class TrainerListController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private var trainerList: TrainerList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "Trainer List"
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension TrainerListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return trainerList.countTrainer()
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as? TrainerTableCell else { return UITableViewCell() }
        // 데이터 있을 시 이런 느낌으로 작성
//        cell.setLabels("이름", "성별", age: "나이")
//        cell.setProfileImage("프로필이미지")
        return cell
    }
}

extension TrainerListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let trainerInformController = self.storyboard?.instantiateViewController(identifier: "trainerInformController") as? TrainerInformController else { return }
//        trainerList의 IndexPath 넘겨주게 코딩
//        trainerInformController.setTrainer(trainerList[indexPath.row])
        self.navigationController?.pushViewController(trainerInformController, animated: true)
    }
}
