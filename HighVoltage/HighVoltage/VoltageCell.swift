//
//  VoltageCell.swift
//  HighVoltage
//
//  Created by Phillip English on 10/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class VoltageCell: UITableViewCell {

    @IBOutlet weak var voltageLabel: UILabel!
    
    @IBOutlet weak var voltageTextField: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
