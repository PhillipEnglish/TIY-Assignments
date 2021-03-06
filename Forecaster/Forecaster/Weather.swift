//
//  Weather.swift
//  Forecaster
//
//  Created by Phillip English on 2/1/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

struct Weather
{
    let location: [String: Double]
    let latitude: Double
    let longitude: Double
    let summary: String
    let icon: String
    let precipProbability: Double
    let precipIntensity: Double
    let temperature: Double
    let apparentTemperature: Double
    let dewpoint: Double
    let humidity: Double
    let pressure: Double
    
    
    init(latitude: Double, longitude: Double, summary: String, icon: String, temperature: Double, precipProb: Double, precipIntensity: Double, apparentTemp: Double, dewpoint: Double, humidity: Double, pressure: Double)
    {
        
        self.latitude = latitude
        self.longitude = longitude
        self.location = ["lat": latitude, "lng": longitude]
        self.summary = summary
        self.icon = icon
        self.precipProbability = precipProb
        self.precipIntensity = precipIntensity
        self.temperature = temperature
        self.apparentTemperature = apparentTemp
        self.dewpoint = dewpoint
        self.humidity = humidity
        self.pressure = pressure
    }
    
    static func weatherWithJSON(weatherDictionaryResults: NSDictionary) -> Weather
    {
        var weather: Weather!
        let currentWeatherDictionary = weatherDictionaryResults.valueForKey("currently")
        
        if currentWeatherDictionary!.count > 0
        {
            let latitude = weatherDictionaryResults.valueForKey("latitude") as! Double
            let longitude = weatherDictionaryResults.valueForKey("longitude") as! Double
            let summary = currentWeatherDictionary!.valueForKey("summary") as! String
            let icon = currentWeatherDictionary!.valueForKey("icon") as! String
            let precipProbability = currentWeatherDictionary!.valueForKey("precipProbability") as! Double
            let precipIntensity = currentWeatherDictionary!.valueForKey("precipIntensity") as! Double
            let temperature = currentWeatherDictionary!.valueForKey("temperature") as! Double
            let apparentTemperature = currentWeatherDictionary!.valueForKey("apparentTemperature") as! Double
            let dewpoint = currentWeatherDictionary!.valueForKey("dewPoint") as! Double
            let humidity = currentWeatherDictionary!.valueForKey("humidity") as! Double
            let pressure = currentWeatherDictionary!.valueForKey("pressure") as! Double
            
            weather = Weather(latitude: latitude, longitude: longitude, summary: summary, icon: icon, temperature: temperature, precipProb: precipProbability, precipIntensity: precipIntensity, apparentTemp: apparentTemperature, dewpoint: dewpoint, humidity: humidity, pressure: pressure)
        }
        return weather
    }
  
}