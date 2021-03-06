//
//  HeroDetailViewController.swift
//  HeroTracker
//
//  Created by Phillip English on 10/12/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class HeroDetailViewController: UIViewController
{

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var homeworldLabel: UILabel!
    @IBOutlet weak var powersLabel: UILabel!
    
    var hero = Hero?()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameLabel.text = hero!.name
        homeworldLabel.text = hero!.homeWorld
        powersLabel.text = hero!.powers
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   /* func updateLabels ()
    {
    nameLabel.text = hero?.name
    homeworldLabel.text = hero?.homeWorld
    powersLabel.text = hero?.powers
    } */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
