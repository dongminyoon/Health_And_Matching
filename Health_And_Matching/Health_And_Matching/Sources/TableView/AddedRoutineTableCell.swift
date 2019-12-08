//
//  AddedRoutineTableCell.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/08.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class AddedRoutineTableCell: UITableViewCell {
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var eachCountLabel: UILabel!
    
    private var workoutRoutine: EachWorkoutRoutine?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setWorkoutRoutine(_ workoutRoutine: EachWorkoutRoutine) {
        self.workoutRoutine = workoutRoutine
        guard let image = UIImage(named: workoutRoutine.workout.profileImage) else { return }
        workoutImage.image = image
        nameLabel.text = workoutRoutine.workout.name
        eachCountLabel.text = "\(workoutRoutine.eachCount)"
    }
}
