//
//  ManagementListController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ManagementListController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var trainerID: Trainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "고객관리명단"
        addObserver()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setTrainer(_ trainerID: Trainer) {
        self.trainerID = trainerID
    }
}

extension ManagementListController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(goNextView(_:)), name: .clickMakeRoutineButton, object: nil)
    }
    
    @objc func goNextView(_ notification: NSNotification) {
        guard let selectedCustomer = notification.userInfo?["managedCustomer"] as? Customer else { return }
        
        guard let makeRoutineController = self.storyboard?.instantiateViewController(identifier: "MakeRoutineController") as? MakeRoutineController else { return }
        // selectedCustomer 다음 makeRoutine으로 넘겨주기
        makeRoutineController.setCustomer(selectedCustomer)
        self.navigationController?.pushViewController(makeRoutineController, animated: true)
    }
}

extension ManagementListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let trainerID = self.trainerID else { return 0 }
        return trainerID.manageCutsomer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let manageCustomerCell = tableView.dequeueReusableCell(withIdentifier: "ManagementCell") as? ManageCustomerTableCell else { return UITableViewCell() }
        guard let trainerID = self.trainerID else { return UITableViewCell() }
        manageCustomerCell.setmanagedCustomer(trainerID.manageCutsomer[indexPath.row])
        // Cell 라벨, 이미지 설정하는 코드
        // IndexPath에 따라 Trainer.customerApplicantList[indexPath] 데이터 가져와서 설정
        
        guard let managedCustomer = self.trainerID?.manageCutsomer[indexPath.row] else { return UITableViewCell() }
        manageCustomerCell.setLabels(name: managedCustomer.name, age: managedCustomer.age, sex: managedCustomer.sex)
        return manageCustomerCell
    }
}

extension ManagementListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
}
