//
//  DatePickerViewController.swift
//  OutOfTime
//
//  Created by Phillip English on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController //, UIPickerViewDataSource, UIPickerViewDelegate
{
    @IBOutlet var picker: UIPickerView!
    var delegate: DatePickerDelegate?
    
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
      //  delegate?.timerWasChosen(60-picker.selectedRowInComponent(0))
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
            let datePickerVC = segue.destinationViewController
                as! DatePickerViewController
            datePickerVC.delegate = self
        }
    }
    
}
