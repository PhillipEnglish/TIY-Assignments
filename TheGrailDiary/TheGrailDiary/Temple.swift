//
//  Temple.swift
//  TheGrailDiary
//
//  Created by Phillip English on 10/19/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class Temple
{
    var name: String
    var deity: String
    var builder: String
    var location: String
    
    init (dictionary: NSDictionary)
    {
        name = dictionary["name"] as! String
        deity = dictionary["deity"] as! String
        builder = dictionary["builder"] as! String
        location = dictionary["location"] as! String
    }
}


