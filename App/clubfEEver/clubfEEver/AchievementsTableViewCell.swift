//
//  AchievementsTableViewCell.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit
import Foundation

class AchievementsTableViewCell: UITableViewCell {

    @IBOutlet weak var achievementTitle: UILabel!
    @IBOutlet weak var achievementIcon: UIImageView!
    @IBOutlet weak var achievementDesc: UILabel!
    @IBOutlet weak var achievementPoints: UILabel!
    
    let cellIdentifier = "AchievementsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let photo1 = UIImage(named: "TrophyIcon.png")
        self.achievementIcon.image = photo1
        
        //achievementTitle.text = "Hello"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
