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
    func searchGoogleForCity(searchTerm: String)
    {
        let googleSearchTerm = searchTerm
            let urlPath = "http://maps.googleapis.com/maps/api/geocode/json?&components=postal_code:\(googleSearchTerm)&sensor=false"
            let url = NSURL(string: urlPath)
            let session = NSURLSession.sharedSession()
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                print("Task completed")  //"in" means "The instructions you want to run when this completes"
                if error != nil
                {
                    print(error!.localizedDescription)
                }
                else
                {
                    if let dictionary = self.parseJSON(data!)
                    {
                        if let results: NSArray =
                            dictionary ["results"] as? NSArray
                        {
                            self.delegate.didReceiveAPIResults (results)  //delegate lets us return results to view controller
                        }
                    }
                }
                
                
            })
            task.resume()  //"closure is a set of instructions that are run at some future time"
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
    
    
    
    
