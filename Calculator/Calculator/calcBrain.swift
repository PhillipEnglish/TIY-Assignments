//
//  calcBrain.swift
//  Calculator
//
//  Created by Phillip English on 10/16/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation


class calcBrain
    
{
    
     //var leftOperand: Double
    //var rightOperand: Double
    
    
    // init (leftOperand: Double, rightOperand: Double)
    //set these to empty strings. These are the only thing the brain needs to know
    var symbol: String = ""
    var operandOne: String = ""
    var operandTwo: String = ""
    var result = 0.0
    
    
    
    // how you define how to return something.  Adding a digit here.  Tells where the digit should go.
    // If the symbol has not been pressed then any number that follows goes into operandOne, "else" - meaning the symbol is pressed, then it goes in operand two.

    
    func addDigit(digit: String) -> String
    {
        if symbol == ""
        {
            operandOne += digit
            return operandOne
        }
        else
        {
            operandTwo += digit
            return operandTwo
        }
    }
    
    func clear ()
    {
        if symbol != ""
        {
            symbol = ""
        }
        //operandOne = ""
        //operandTwo = ""
    }
   
    func  pressedSymbol(addOperator: String) ->String
    {
        if operandOne != ""
        {
            symbol = addOperator
            
        }
        return symbol
    }
    
    
  /*  func calculate () -> Int
    {
        switch symbol
        {
            case "+": result = Int(operandOne)! + Int(operandTwo)!
            case "-": result = Int(operandOne)! - Int(operandTwo)!
            case "÷": result = Int(operandOne)! / Int(operandTwo)!
            case "x": result = Int(operandOne)! * Int(operandTwo)!
          
            
        default: result = Int(operandOne)!
        }
        return result
        
    } */
    
    func calculate () -> Double
    {
        switch symbol
        {
            case "+": result = Double(operandOne)! + Double(operandTwo)!
            case "-": result = Double(operandOne)! - Double(operandTwo)!
            case "÷": result = Double(operandOne)! / Double(operandTwo)!
            case "x": result = Double(operandOne)! * Double(operandTwo)!
            //case "%": result = Double(operandTwo)! * 0.01
            //case "+/-": result = Double (operandTwo)! * -1
            
                default: result = Double(operandOne)!
        }
        
        return result
    }
    
   
  


}