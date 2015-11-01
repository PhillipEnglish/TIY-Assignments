//
//  City.swift
//  Forecaster
//
//  Created by Phillip English on 10/31/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct City

{
    let city: String
    let lat: String
    let long: String
    let state: String
    
    init(city: String, state: String, lat: String, long: String)
    {
        self.city = city
        self.state = state
        self.lat = lat
        self.long = long
    }
    
    static func citiesWithJSON(results: NSDictionary) -> [City]
    {
        var cities = [City]()
        
        if results.count > 0
        {
            for result in results
            {
                var name = result["]
            }
        }
    }
}