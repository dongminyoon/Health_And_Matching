//
//  ManageCustomerTableCell.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ManageCustomerTableCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var makeRoutineButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    
    private var managedCustomer: Customer? // 관리받는 Customer을 가지고 있다가 루틴 짜주기 버튼이 들어오면 넘겨준다
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        makeRoutineButton.layer.cornerRadius = makeRoutineButton.frame.width / 20
        makeRoutineButton.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setLabels(name: String, age: String, sex: String) {
        nameLabel.text = name
        ageLabel.text = age
        sexLabel.text = sex
    }
    
    func setProfileImage(_ image: UIImage) {
        profileImageView.image = image
    }
    
    func setmanagedCustomer(_ managedCustomer: Customer) {
        self.managedCustomer = managedCustomer
    }
    
    @IBAction func goNextView(_ sender: Any) {
        NotificationCenter.default.post(name: .clickMakeRoutineButton, object: nil, userInfo: ["managedCustomer": managedCustomer])
    }
}
