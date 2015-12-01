//
//  ToDoCell.swift
//  InDueTime
//
//  Created by Phillip English on 10/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ToDoCell: UITableViewCell {
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var isDoneSwitch: UISwitch!
    


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
