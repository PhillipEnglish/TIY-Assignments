//
//  ToDoSchedulingViewController.swift
//  InDueTime
//
//  Created by Phillip English on 12/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ToDoSchedulingViewController: UIViewController
{

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var deadlinePicker: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func saveButtonPressed(sender: UIButton) {
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
