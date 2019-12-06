//
//  RoutineDictionaryTableCell.swift
//  Health_And_Matching
//
//  Created by 윤동민 on 2019/12/06.
//  Copyright © 2019 윤동민. All rights reserved.
//

import UIKit

class RoutineDictionaryTableCell: UITableViewCell {
    @IBOutlet weak var workoutImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var kcalLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setLabels(name: String, kcal: Float, image: String) {
        guard let image = UIImage(named: image) else { return }
        workoutImage.image = image
        nameLabel.text = name
        kcalLabel.text = "\(kcal)"
    }
}
