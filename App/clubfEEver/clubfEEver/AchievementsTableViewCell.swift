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
    
    let cellIdentifier = "AchievementsTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //achievementTitle.text = "Hello"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
