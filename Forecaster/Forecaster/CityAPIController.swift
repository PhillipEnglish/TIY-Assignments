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
    
    var task: NSURLSessionDataTask!
    
    init(cityDelegate: CityAPIControllerProtocol)
    {
        self.delegate = cityDelegate
    }
    func searchGoogleForCity(searchTerm: String)
    {
       // let googleSearchTerm = searchTerm
            //let urlPath = "http://maps.googleapis.com/maps/api/geocode/json?&components=postal_code:\(googleSearchTerm)&sensor=false"
            let url =  NSURL(string: "https://maps.googleapis.com/maps/api/geocode/json?address=santa+cruz&components=postal_code:\(searchTerm)&sensor=false") //NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
        task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
            print("Task completed")
            if error != nil
            {
                print(error!.localizedDescription)
            }
            else
            {
                if let results = self.parseJSON(data!)
                {
                    if let results: NSArray = results["results"] as? NSArray
                    {
                        self.delegate?.didReceiveMapsAPIResults(results)
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
            let dictionary: NSDictionary = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! NSDictionary
            return dictionary
        }
        catch let error as NSError
        {
            print(error)
            return nil
        }
    }
    
    }
    
    
    
    
