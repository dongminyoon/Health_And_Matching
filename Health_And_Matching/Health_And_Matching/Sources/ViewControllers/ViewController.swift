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
        addObserver()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
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

extension ViewController {
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(goNextView(_:)), name: .clickMainButton, object: nil)
    }
    
    @objc func goNextView(_ notification: NSNotification) {
        guard let clickedButton = notification.userInfo?["button"] as? CustomButton else { return }
        switch clickedButton {
        case customerButton:
            guard let customerController = self.storyboard?.instantiateViewController(withIdentifier: "CustomerTabController") as? UITabBarController else { return }
            self.navigationController?.pushViewController(customerController, animated: true)
        case trainerButton:
            guard let trainerController = self.storyboard?.instantiateViewController(identifier: "TrainerTabController") as? UITabBarController else { return }
            self.navigationController?.pushViewController(trainerController, animated: true)
        case adminButton:
            print("adminButton")
        default:
            print("default")
        }
    }
}

