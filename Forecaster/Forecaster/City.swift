//
//  City.swift
//  Forecaster
//
//  Created by Phillip English on 10/31/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

//NSCoding Constants
let kNameKey = "name"
let kZipCodeKey = "zipCode"
let kLatitudeKey = "latitude"
let kLongitudeKey = "longitude"

//^ Set up here per common convention named with a k for konstant. Set up here to prevent misspelling when used in multiple functions and so that you can change them here and that will be universal- as per Ben.

class City: NSObject, NSCoding

{
    let name: String
    let zipCode: String
    let latitude: Double
    let longitude: Double

    
    init(name: String, zip: String, lat: Double, lng: Double)
    {
        self.name = name
        self.zipCode = zip
        latitude = lat
        longitude = lng
    }
    
    
    // MARK: - NSCoding
    
    required convenience init?(coder aDecoder: NSCoder) //a decoder. Basically this is an initializer. is an optional initializer.
    {
        guard let name = aDecoder.decodeObjectForKey(kNameKey) as? String,  //guard statement is new in swift 2.0
        let zipCode = aDecoder.decodeObjectForKey(kZipCodeKey) as? String
            else { return nil }
        
        self.init(name: name, zip: zipCode, lat: aDecoder.decodeDoubleForKey(kLatitudeKey), lng: aDecoder.decodeDoubleForKey(kLongitudeKey))
    }
    
    func encodeWithCoder(aCoder: NSCoder) //an encoder.
    {
        aCoder.encodeObject(self.name, forKey: kNameKey)
        aCoder.encodeObject(self.zipCode, forKey: kZipCodeKey)
        aCoder.encodeObject(self.latitude, forKey: kLatitudeKey)
        aCoder.encodeObject(self.longitude, forKey: kLongitudeKey)
        
    }

    
//    static func cityWithJSON(results: NSArray) -> City
//    {
//        var city: City
//        var cityName = ""
//        var latStr = ""
//        var lngStr = ""
//        
//        
//        if results.count > 0
//        {
//            for result in results
//            {
//                let formattedAddress = result["formatted_address"] as? String
//                if formattedAddress != nil
//                {
//                    let addressComponentsForCity = formattedAddress!.componentsSeparatedByString(",")
//                    cityName = String(addressComponentsForCity[0])
//                }
//                
//                let geometry = result["geometry"] as? NSDictionary
//                if geometry != nil
//                {
//                    let latLong = geometry?["location"] as? NSDictionary
//                    if latLong != nil
//                    {
//                        let lat = latLong?["lat"] as! Double
//                        let lng = latLong?["lng"] as! Double
//                        
//                        latStr = String(lat)
//                        lngStr = String(lng)
//                    }
//                }
//            }
//            
//
//        }
//        
//        // print(cityName) ; print(latStr) ; print(lngStr)
//        city = City(name: cityName, zip: <#T##String#>, lat: <#T##Double#>, lng: <#T##Double#>)
//        
//        return city
//    
//    }
    
    

}