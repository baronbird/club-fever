//
//  CalendarViewCell.swift
//  clubfEEver
//
//  Created by Abby Greentree on 3/30/19.
//  Copyright © 2019 Abby Greentree. All rights reserved.
//

import UIKit

class CalendarViewCell: UITableViewCell {

    @IBOutlet weak var locName: UILabel!
    @IBOutlet weak var eventName: UILabel!
    @IBOutlet weak var eventTime: UILabel!
    @IBOutlet weak var eventIcon: UIImageView!
    @IBOutlet weak var eventDescription: UILabel!
    @IBOutlet weak var eventPoints: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        eventName.font = UIFont.boldSystemFont(ofSize: 16.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
