//
//  TimeCircuitsViewController.swift
//  OutOfTime
//
//  Created by Phillip English on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    var currentSpeed = 0
    
    func formatTheDate (cDate: NSDate) -> String
    {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = NSDateFormatter.dateFormatFromTemplate("MMM dd yyyy", options: 0, locale: NSLocale(localeIdentifier: "en-US"))
        let currentDate = dateFormatter.stringFromDate(cDate).uppercaseString
        
        return String(currentDate)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    //presentTimeLabel.text = STRING(formatTheDate()
        presentTimeLabel.text = formatTheDate(NSDate())
        speedLabel.text = "\(currentSpeed)"
        lastTimeDepartedLabel.text = formatTheDate(NSDate())  //Come back to this and possibly re-write.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    
}

