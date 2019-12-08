//
//  ManagedTrainerListController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ManagedTrainerListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var trainerList: [Trainer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "트레이너 명단"
        getTrainerList()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
    }
    
    private func getTrainerList() {
        trainerList = DB.shared.trainerList
    }
}

extension ManagedTrainerListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trainerList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let systemTrainerCell = tableView.dequeueReusableCell(withIdentifier: "systemTrainerCell") as? SystemTrainerTableCell else { return UITableViewCell() }
        let trainer = trainerList[indexPath.row]
        systemTrainerCell.setLabels(name: trainer.name, age: trainer.age, accept: trainer.applyStatus)
        return systemTrainerCell
    }

}

extension ManagedTrainerListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
}
