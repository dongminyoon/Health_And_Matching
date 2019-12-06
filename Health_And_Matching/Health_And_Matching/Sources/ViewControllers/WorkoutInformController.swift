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
    
    private var workout: Workout?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "운동정보"
        self.navigationController?.navigationBar.topItem?.title = ""
        setInitialView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setInitialView() {
        guard let workout = self.workout else { return }
        guard let image = UIImage(named: workout.profileImage) else { return }
        workoutImage.image = image
        nameLabel.text = workout.name
        partLabel.text = workout.part.getHeader()
        kcalLabel.text = "\(workout.consumeKcal)"
        youtubeLabel.text = workout.url
    }
    
    func setWorkoutInform(_ workout: Workout) {
        self.workout = workout
    }
}
