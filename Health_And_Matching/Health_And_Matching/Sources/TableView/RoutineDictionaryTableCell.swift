//
//  RoutineDictionaryTableCell.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit
import GMStepper

class RoutineDictionaryTableCell: UITableViewCell {
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kcalLabel: UILabel!
    @IBOutlet weak var routineCountStepper: GMStepper!
    @IBOutlet weak var addButton: UIButton!
    
    private var workoutRoutine: EachWorkoutRoutine?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setStepper()
        setButton()
    }
    
    private func setStepper() {
        routineCountStepper.stepValue = 1
        routineCountStepper.minimumValue = 0
        routineCountStepper.maximumValue = 10
        routineCountStepper.labelFont = UIFont.boldSystemFont(ofSize: 12)
    }
    
    private func setButton() {
        addButton.layer.cornerRadius = 6
        addButton.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setLabels(workoutRoutine: EachWorkoutRoutine) {
        self.workoutRoutine = workoutRoutine
        guard let image = UIImage(named: workoutRoutine.workout.profileImage) else { return }
        workoutImage.image = image
        nameLabel.text = workoutRoutine.workout.name
        kcalLabel.text = "\(workoutRoutine.workout.consumeKcal)"
        routineCountStepper.value = Double(workoutRoutine.eachCount)
    }
    
    @IBAction func clickStepper(_ sender: Any) {
        workoutRoutine?.eachCount = Int(routineCountStepper.value)
    }
    
    @IBAction func clickAddButton(_ sender: Any) {
        guard let workoutRoutine = self.workoutRoutine else { return }
        NotificationCenter.default.post(name: .clickAddButton, object: nil, userInfo: ["workoutRoutine": workoutRoutine])
    }
}
