//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Phillip English on 10/15/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{
    
    var brain = calcBrain()
    var isTyping: Bool = false
    
    
    @IBOutlet weak var calcLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: Action Handlers
    
    @IBAction func updateNumber(sender: UIButton)
    {
        let number = sender.currentTitle!
        let bSymbol = brain.symbol
        brain.addDigit(number)
    
        if calcLabel.text == "0" ||  calcLabel.text == String(bSymbol)
        {
            calcLabel.text = " "
        }
        calcLabel.text = calcLabel.text! + number
    }
    
    @IBAction func clearLabel(sender: UIButton)
    {
        calcLabel.text = "0"
        clearEverything()
        
    }
    
    @IBAction func equalsSign(sender: UIButton)
    {
        let result = brain.calculate()
        calcLabel.text = "\(result)"
    }
    
    @IBAction func operatorClicked(sender: UIButton)
    {
        let symbol = sender.currentTitle
        brain.pressedSymbol(symbol!)
        calcLabel.text = sender.currentTitle
    }
    
    
    
    func clearEverything ()
    {
        brain.operandOne = ""
        brain.operandTwo = ""
        brain.symbol = ""
    }
    


}

