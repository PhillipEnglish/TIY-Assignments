//
//  WeatherAPIController.swift
//  Forecaster
//
//  Created by Phillip English on 2/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

class WeatherAPIController
{
    var weatherDelegate: WeatherAPIResultsProtocol?
    
    let apiKey = "0b170c5cb9388e89a3ebf29a8a3c10c9"
    
    init(weatherDelegate: WeatherAPIResultsProtocol)
    {
        self.weatherDelegate = weatherDelegate
    }
    
    func searchForecastFor(lat: Double, lng: Double)
    {
        let url = NSURL(string: "https://api.forecast.io/forecast/\(apiKey)/\(lat),\(lng)")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print(error!.localizedDescription)
            }
            else
            {
                if let weatherDictionary = self.parseJSON(data!)
                {
                    self.weatherDelegate!.didReceiveWeatherAPIResults(weatherDictionary)
                }
            }
        })
        task.resume()
    }
    
    func parseJSON(data: NSData) -> NSDictionary?
    {
        do
        {
            let dictionary: NSDictionary! = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }

}