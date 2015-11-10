//
//  TempleDetailViewController.swift
//  TheGrailDiary
//
//  Created by Phillip English on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class TempleDetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var deityLabel: UILabel!
    @IBOutlet weak var builderLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var temple = Temple?()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = temple!.name
        deityLabel.text = temple!.deity
        builderLabel.text = temple!.builder
        locationLabel.text = temple!.location
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
