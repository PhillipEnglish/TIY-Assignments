//
//  ContactDetailViewController.swift
//  FirstContact
//
//  Created by Phillip English on 11/22/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ContactDetailViewController: UIViewController
{

    @IBOutlet weak var nameLabel: UILabel!
   
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
