//
//  MyRoutineController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class MyRoutineController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var resultView: UIView!
    
    @IBOutlet weak var totalConsumeLabel: UILabel!
    @IBOutlet weak var totalReduceWeightLabel: UILabel!
    
    private var customerID: Customer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "마이루틴"
        initResultView()
        initTotalLabel()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func initTotalLabel() {
        guard let routines = customerID?.routines else { return }
        totalConsumeLabel.text = "\(routines.caluateTotalConsumeKcal())"
        totalReduceWeightLabel.text = "\(routines.calculateTotalConsumeKG())"
    }
    
    private func initResultView() {
        resultView.layer.cornerRadius = resultView.frame.width / 20
        resultView.clipsToBounds = true
        resultView.layer.borderColor = UIColor.black.cgColor
        resultView.layer.borderWidth = 3
    }
    
    func setCustomer(_ customerID: Customer) {
        self.customerID = customerID
    }
}

extension MyRoutineController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return WorkoutPart.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let customerRoutines = customerID?.routines else { return 0 }
        guard let partBySection = WorkoutPart(rawValue: section) else { return 0 }
        return customerRoutines.count(by: partBySection)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let myRoutineCell = tableView.dequeueReusableCell(withIdentifier: "myRoutineCell") as? AddedRoutineTableCell else { return UITableViewCell() }
        
        guard let customerRoutines = customerID?.routines else { return UITableViewCell() }
        guard let partBySection = WorkoutPart(rawValue: indexPath.section) else { return UITableViewCell() }
        
        guard let eachWorkoutRoutine = customerRoutines.getEachWorkoutRoutine(by: partBySection, of: indexPath.row) else { return UITableViewCell() }
        
        myRoutineCell.setWorkoutRoutine(eachWorkoutRoutine)
        
        return myRoutineCell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return WorkoutPart(rawValue: section)?.getHeader()
    }
}

extension MyRoutineController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
