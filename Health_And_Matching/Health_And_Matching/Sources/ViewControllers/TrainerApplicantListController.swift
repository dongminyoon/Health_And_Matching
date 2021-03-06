//
//  TrainerApplicantListController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class TrainerApplicantListController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var trainerApplicantList: [Trainer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "트레이너 신청자 명단"
        self.navigationController?.navigationBar.topItem?.title = ""
        addObserver()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getTrainerApplicantList()
        tableView.reloadData()
    }
    
    private func getTrainerApplicantList() {
        trainerApplicantList = DB.shared.trainerApplicant
    }
}

extension TrainerApplicantListController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(removeApplicantTrainer), name: .acceptTrainerApplicant, object: nil)
    }
    
    @objc func removeApplicantTrainer() {
        tableView.reloadData()
    }
}


extension TrainerApplicantListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let trainerApplicantList = self.trainerApplicantList else { return 0 }
        return trainerApplicantList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let trainerApplicantCell = tableView.dequeueReusableCell(withIdentifier: "trainerApplicantCell") as? TrainerApplicantTableCell else { return UITableViewCell() }
        guard let trainerApplicant = self.trainerApplicantList?[indexPath.row] else { return UITableViewCell() }
        trainerApplicantCell.setLabels(trainerApplicant.name, trainerApplicant.sex, trainerApplicant.age)
        return trainerApplicantCell
    }
}

extension TrainerApplicantListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let trainerApplicantInformController = self.storyboard?.instantiateViewController(withIdentifier: "TrainerApplicantInformController") as? TrainerApplicantInformController else { return }
        guard let selectedTrainerApplicant = trainerApplicantList?[indexPath.row] else { return }
        trainerApplicantInformController.setTrainerApplicant(selectedTrainerApplicant)
        self.navigationController?.pushViewController(trainerApplicantInformController, animated: true)
    }
}
