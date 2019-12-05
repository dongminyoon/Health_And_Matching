//
//  WorkoutInformController.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/05.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class WorkoutInformController: UIViewController {
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partLabel: UILabel!
    @IBOutlet weak var kcalLabel: UILabel!
    @IBOutlet weak var youtubeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "운동정보"
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setLabels(_ name: String, _ part: String, _ kcal: String, _ youtubeLink: String, _ description: String) {
        nameLabel.text = name
        partLabel.text = part
        kcalLabel.text = kcal
        youtubeLabel.text = youtubeLink
        descriptionLabel.text = description
    }
    
    func setWorkoutImage(_ image: UIImage) {
        workoutImage.image = image
    }
}
