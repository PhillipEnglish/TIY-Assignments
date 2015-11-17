//
//  ClockCell.swift
//  GlobalTime
//
//  Created by Phillip English on 11/17/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ClockCell: UITableViewCell
{

    @IBOutlet weak var timezoneClock: ClockView!
    
    
    @IBOutlet weak var timezoneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
