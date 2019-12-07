//
//  TrainerInformController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class TrainerInformController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    private var customerID: Customer?
    private var requestTrainer: Trainer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "상세정보"
        setLabels()
    }
    
    private func setLabels() {
        nameLabel.text = requestTrainer?.name
        sexLabel.text = requestTrainer?.sex
        ageLabel.text = requestTrainer?.age
        heightLabel.text = requestTrainer?.height
        weightLabel.text = requestTrainer?.weight
    }
    
    func setTrainer(_ requestTrainer: Trainer) {
        self.requestTrainer = requestTrainer
    }
    
    func setCustomer(_ customerID: Customer) {
        self.customerID = customerID
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "toInformController" else { return }
        guard let informController = segue.destination as? InputInformController else { return }
        
        guard let requestTrainer = self.requestTrainer, let customerID = self.customerID else { return }
        informController.setTrainer(requestTrainer)
        informController.setCustomer(customerID)
    }
}
