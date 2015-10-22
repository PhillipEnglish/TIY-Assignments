//
//  TimeCircuitsViewController.swift
//  OutOfTime
//
//  Created by Phillip English on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

@objc protocol DatePickerDelegate
{
    func dateWasChosen(chosenDate: NSDate)
}

class TimeCircuitsViewController: UIViewController, DatePickerDelegate

{
    
    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    var currentSpeed = 0
    var timer : NSTimer?
    
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
        lastTimeDepartedLabel.text = formatTheDate(NSDate())  
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "ShowDatePickerSegue"
        {
          let datePickerVC = segue.destinationViewController as! DatePickerViewController //find out what is on the other side of the segue---"
            datePickerVC.delegate = self
        }
    }

  // MARK: DatePicker Delegate
    func dateWasChosen(chosenDate: NSDate)
    {
        destinationTimeLabel.text = formatTheDate(chosenDate)
    }
    
    
    // MARK: Action Handlers
    
    @IBAction func travelBackTapped(sender: UIButton)
    {
        startTimer()
    }
    
    // MARK: Private functions
    
    private func startTimer()
    {
        if timer == nil
        {
            timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateSpeedLabel", userInfo: nil, repeats: true)
        }
    }
    
    private func stopTimer() //Taken completely from Ben's countdown code. Is there a more original way to do this?
    {
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeedLabel()
    {
        if currentSpeed != 88
        {
            currentSpeed += 1
            speedLabel.text = String(currentSpeed) 
        }
        
        else
        
        {
            stopTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            speedLabel.text = String(currentSpeed)
        }
    }
    
    
}

