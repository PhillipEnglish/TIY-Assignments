//
//  CityAPIController.swift
//  Forecaster
//
//  Created by Phillip English on 11/1/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class CityAPIController
{
    
    var delegate: CityAPIControllerProtocol?
    
    //var task: NSURLSessionDataTask!
    
    init(cityDelegate: CityAPIControllerProtocol)
    {
        self.delegate = cityDelegate
    }
    
    func searchGoogleForCity(searchTerm: Int)
    {
//        let googleSearchTerm = searchTerm
//    let urlPath = "http://maps.googleapis.com/maps/api/geocode/json?&components=postal_code:\(googleSearchTerm)&sensor=false"
//            //let url =  NSURL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(searchTerm)&sensor=false") //NSURL(string: urlPath)
//        let urlPath = "https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(searchTerm)&sensor=false"
//        let url = NSURL(string: urlPath)
//        let session = NSURLSession.sharedSession()
//        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
//            //print("Task completed")
//            if error != nil
//            {
//                print(error!.localizedDescription)
//            }
//            else
//            {
//                if let dictionary = self.parseJSON(data!)
//                {
//                    if let results: NSArray = dictionary["results"] //as? NSArray
//                    {
//                        self.delegate?.didReceiveMapsAPIResults(results)
//                    }
//                }
//            }
//        })
//        task.resume()
//        }
        
        let url = NSURL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(searchTerm)&sensor=false")
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            if error != nil
            {
                print(error!.localizedDescription)
            }
            else
            {
                if let dictionary = self.parseJSON(data!)
                {
                    if let resultArray: NSArray = dictionary["results"] as? NSArray
                    {
                        if let cityInnerResultDictionary = resultArray[0] as? NSDictionary
                        {
                            self.delegate!.didReceiveMapsAPIResults(cityInnerResultDictionary)
                        }
                    }
                    
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
    
    
    
    
