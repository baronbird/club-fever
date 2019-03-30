//
//  LeaderboardViewCell.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit
import Foundation

class LeaderboardViewCell: UITableViewCell {

    @IBOutlet weak var userPoints: UILabel!
    @IBOutlet weak var userDorm: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let photo1 = UIImage(named: "UserIcon.png")
        self.userIcon.image = photo1
        print("Hello")
        print(self.userName.text)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
