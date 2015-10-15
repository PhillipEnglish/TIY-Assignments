//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Phillip English on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var calcLabel: UILabel!

    
    @IBAction func updateNumber(sender: UIButton) {
        let number = sender.currentTitle!
        calcLabel.text = number
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

