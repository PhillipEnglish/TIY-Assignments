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
    //let lat: String
   // let long: String
   // let state: String
    let location: NSDictionary
    
    init(city: String, location: NSDictionary) //state: String, lat: String, long: String)
    {
        self.city = city
        //self.state = state
        //self.lat = lat
        //self.long = long
        self.location = location
    }
    
    static func cityWithJSON(results: NSDictionary) -> City
    {
        var aCity: City!
        
        if results.count > 0
        {
            let formattedAddress = results.valueForKey("formatted_address") as? String
            let addressComponents = formattedAddress!.characters.split(",").map { String($0) }
            let name = addressComponents[0]
            let geometry = results.valueForKey("geometry") as? NSDictionary
            
            let location = geometry!.valueForKey("location") as? NSDictionary
            
            aCity = (City(city: name, location: location!))
        }
        return aCity
    }
}