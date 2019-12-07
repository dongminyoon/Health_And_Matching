//
//  TrainerApplicantInformController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class TrainerApplicantInformController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    private var trainerApplicant: Trainer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setLabels()
    }
    
    private func setLabels() {
        guard let trainerApplicant = self.trainerApplicant else { return }
        nameLabel.text = trainerApplicant.name
        sexLabel.text = trainerApplicant.sex
        ageLabel.text = trainerApplicant.age
        heightLabel.text = trainerApplicant.height
        weightLabel.text = trainerApplicant.weight
    }
    
    func setTrainerApplicant(_ applicant: Trainer) {
        trainerApplicant = applicant
    }
    
    @IBAction func clickAccept(_ sender: Any) {
        guard let trainerApplicant = self.trainerApplicant else { return }
        trainerApplicant.applyStatus = .accepted
        DB.shared.removeTrainerApplicant(trainerApplicant)
        NotificationCenter.default.post(name: .acceptTrainerApplicant, object: nil)
    self.navigationController?.popToViewController(navigationController!.viewControllers[2], animated: true)
    }
}
