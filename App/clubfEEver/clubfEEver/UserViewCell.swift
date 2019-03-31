//
//  UserViewCell.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/31/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit

class UserViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var points: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
