//
//  ModalZipCodeViewController.swift
//  Forecaster
//
//  Created by Phillip English on 10/30/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ModalZipCodeViewController: UIViewController {

    @IBOutlet weak var zipCodeTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.purpleColor()
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
