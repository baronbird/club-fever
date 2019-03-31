//
//  AchievementsTableViewCell.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit
import Foundation

var cellCategory: String = ""
class AchievementsTableViewCell: UITableViewCell {

    @IBOutlet weak var achievementTitle: UILabel!
    @IBOutlet weak var achievementIcon: UIImageView!
    @IBOutlet weak var achievementDesc: UILabel!
    @IBOutlet weak var achievementPoints: UILabel!
    
    let cellIdentifier = "AchievementsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let general  = UIImage(named: "TrophyIcon.png")
        self.achievementIcon.image = general
        
        let multicultural = UIImage(named: "Multicultural.png")
        let sports = UIImage(named: "Sports.png")
        let arts = UIImage(named: "Arts.png")
        let academic = UIImage(named: "Academic.png")
        let wellness = UIImage(named: "Wellness.png")
        let social = UIImage(named: "Social.png")
        
        //self.achievementIcon.image = general
        /*
        switch cellCategory{
        case "Sports":
            self.achievementIcon.image = sports
        case "Multicultural":
            self.achievementIcon.image = multicultural
        case "Arts":
            self.achievementIcon.image = arts
        case "Academic":
            self.achievementIcon.image = academic
        case "Wellness":
            self.achievementIcon.image = wellness
        case "Social":
            self.achievementIcon.image = social
        default:
            self.achievementIcon.image = general
        }
        */
        
        //achievementTitle.text = "Hello"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
