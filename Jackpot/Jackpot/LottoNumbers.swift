//
//  LottoNumbers.swift
//  Jackpot
//
//  Created by Phillip English on 10/13/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class LottoNumbers {
    var arrayOfNum: Array<Int> = []
    
    init()
    {
        var i = 0
        
        while i <= 6
        {
            let num = generateNumber()
            if arrayOfNum.contains(num)
            {
                generateNumber()
            }
            else
            {
                arrayOfNum.append(num)
                i++
            }
        }
    }
    
    func toString() -> String
    {
        return "\(arrayOfNum)"
    }
    
    func generateNumber() -> Int
    {
        return Int(arc4random() % 53)
    }
    
    
}