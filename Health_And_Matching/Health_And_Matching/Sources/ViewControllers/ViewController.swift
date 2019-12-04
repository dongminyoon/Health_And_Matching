//
//  ViewController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var customerButton: CustomButton!
    @IBOutlet weak var trainerButton: CustomButton!
    @IBOutlet weak var adminButton: CustomButton!
    @IBOutlet var customButtons: [CustomButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setButtons()
    }

    private func setButtons() {
        customerButton.setButtonLabel("Customer")
        trainerButton.setButtonLabel("Trainer")
        adminButton.setButtonLabel("Admin")
        
        for button in customButtons {
            button.makeShadow()
            button.layer.cornerRadius = button.frame.width / 20
        }
    }
}

