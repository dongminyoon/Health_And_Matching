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
    private var acceptedTrainerList: [Trainer] = []
    private var customerID: Customer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "트레이너 명단"
        getTrainerList()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func getTrainerList() {
        // 승인된 트레이너만 받아오게 코딩
        var acceptedTrainers: [Trainer] = []
        for trainer in DB.shared.trainerList {
            if trainer.applyStatus == .accepted { acceptedTrainers.append(trainer) }
        }
        acceptedTrainerList = acceptedTrainers
    }
    
    func setCustomer(_ customerID: Customer) {
        self.customerID = customerID
    }
}

extension TrainerListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return acceptedTrainerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let trainerCell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as? TrainerTableCell else { return UITableViewCell() }
        let acceptedTrainer = acceptedTrainerList[indexPath.row]
        trainerCell.setLabels(name: acceptedTrainer.name, sex: acceptedTrainer.sex, age: acceptedTrainer.age)
        return trainerCell
    }
}

extension TrainerListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let trainerInformController = self.storyboard?.instantiateViewController(identifier: "trainerInformController") as? TrainerInformController else { return }
        trainerInformController.setTrainer(acceptedTrainerList[indexPath.row])
        guard let customerID = self.customerID else { return }
        trainerInformController.setCustomer(customerID)
        self.navigationController?.pushViewController(trainerInformController, animated: true)
    }
}
