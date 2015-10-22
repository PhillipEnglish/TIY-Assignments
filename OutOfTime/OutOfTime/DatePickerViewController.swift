//
//  DatePickerViewController.swift
//  OutOfTime
//
//  Created by Phillip English on 10/8/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController
{
    
    @IBOutlet weak var picker: UIDatePicker!
    var delegate: DatePickerDelegate?  // optional because it doesn't have to have a value
  
    
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillDisappear(animated: Bool)
    {
        super.viewWillDisappear(animated)
      //  delegate?.timerWasChosen(60-picker.selectedRowInComponent(0))
        //delegate?.dateWasChosen(picker.date)
        delegate?.dateWasChosen(picker.date)
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
  
    
}
