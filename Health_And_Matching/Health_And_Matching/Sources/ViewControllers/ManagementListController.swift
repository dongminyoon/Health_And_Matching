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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "고객관리명단"
        addObserver()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ManagementListController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(goNextView(_:)), name: .clickMakeRoutineButton, object: nil)
    }
    
    @objc func goNextView(_ notification: NSNotification) {
//        guard let selectedCustomer = notification.userInfo?["managedCutsomer"] as? Customer else { return }
        guard let makeRoutineController = self.storyboard?.instantiateViewController(identifier: "MakeRoutineController") as? MakeRoutineController else { return }
        
        // selectedCustomer 다음 makeRoutine으로 넘겨주기
        self.navigationController?.pushViewController(makeRoutineController, animated: true)
    }
}

extension ManagementListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ManagementCell") as? ManageCustomerTableCell else { return UITableViewCell() }
        
        // Cell 라벨, 이미지 설정하는 코드
        // IndexPath에 따라 Trainer.customerApplicantList[indexPath] 데이터 가져와서 설정
        return cell
    }
}

extension ManagementListController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
}
