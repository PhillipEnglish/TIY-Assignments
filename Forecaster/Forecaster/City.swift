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
    let cityName: String
    let lat: String
    let long: String
   // let state: String
    //let location: NSDictionary
    
    init(cityName: String, lat: String, long: String) //state: String, lat: String, long: String)
    {
        self.cityName = cityName
        self.lat = lat
        self.long = long
    }
    
    
    

    
    static func cityWithJSON(results: NSArray) -> City
    {
        var city: City
        var cityName = ""
        var latStr = ""
        var lngStr = ""
        
        
        if results.count > 0
        {
            for result in results
            {
                let formattedAddress = result["formatted_address"] as? String
                if formattedAddress != nil
                {
                    let addressComponentsForCity = formattedAddress!.componentsSeparatedByString(",")
                    cityName = String(addressComponentsForCity[0])
                }
                
                let geometry = result["geometry"] as? NSDictionary
                if geometry != nil
                {
                    let latLong = geometry?["location"] as? NSDictionary
                    if latLong != nil
                    {
                        let lat = latLong?["lat"] as! Double
                        let lng = latLong?["lng"] as! Double
                        
                        latStr = String(lat)
                        lngStr = String(lng)
                    }
                }
            }
            

        }
        
        // print(cityName) ; print(latStr) ; print(lngStr)
        city = City(cityName: cityName, lat: latStr, long: lngStr)
        return city
    
    }
    
    

}