//
//  CityWeatherTableViewCell.swift
//  Forecaster
//
//  Created by Phillip English on 11/2/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CityWeatherTableViewCell: UITableViewCell

{

    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
