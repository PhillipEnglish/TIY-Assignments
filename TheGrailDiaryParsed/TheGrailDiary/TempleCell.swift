//
//  TempleCell.swift
//  TheGrailDiary
//
//  Created by Phillip English on 11/5/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TempleCell: UITableViewCell
{
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!

    @IBOutlet weak var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
