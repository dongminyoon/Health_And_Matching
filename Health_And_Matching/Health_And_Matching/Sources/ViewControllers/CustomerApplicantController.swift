//
//  CustomerApplicantController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class CustomerApplicantListController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    private var trainerID: Trainer?
    
    // Trainer의 Applicant List 가져옴
    private var customerApplicant: [Customer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "고객 신청 명단"
        addObserver()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setTrainer(_ trainer: Trainer) {
        self.trainerID = trainer
    }
}

extension CustomerApplicantListController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(removeApplicantCustomer), name: .acceptCustomerApplicant, object: nil)
    }
    
    @objc func removeApplicantCustomer() {
        tableView.reloadData()
    }
}

extension CustomerApplicantListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let trainerApplicants = trainerID?.applicantCustomer else { return 0 }
        return trainerApplicants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let customerApplicantCell = tableView.dequeueReusableCell(withIdentifier: "applicantCell") as? CustomerApplicantTableCell else { return UITableViewCell() }
        guard let customerApplicant = self.trainerID?.applicantCustomer[indexPath.row] else { return UITableViewCell() }
        customerApplicantCell.setLabels(name: customerApplicant.name, sex: customerApplicant.sex, age: customerApplicant.age)
        return customerApplicantCell
    }
}

extension CustomerApplicantListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let customerInformController = self.storyboard?.instantiateViewController(withIdentifier: "CustomerInformController") as? CustomerInformController else { return }
        guard let trainerID = self.trainerID else { return }
        customerInformController.setInitData(trainerID, trainerID.applicantCustomer[indexPath.row])
        self.navigationController?.pushViewController(customerInformController, animated: true)
    }
}
