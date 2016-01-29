//
//  APIController.swift
//  VenueMenu
//
//  Created by Phillip English on 11/29/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

class APIController
{
    var foursquareDelegate: FoursquareAPIResultsProtocol?
    
    init(foursquareDelegate: FoursquareAPIResultsProtocol)
    {
        self.foursquareDelegate = foursquareDelegate
    }
    
    func searchFoursquareFor(searchTerm: String)
    {
        let location = "Orlando, FL"
        let escapedLocation = location.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let escapedSearchTerm = searchTerm.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let urlPath = "https://api.foursquare.com/v2/venues/search?client_id=CRVV3NOQJLB4ZNJJFL1JI5GQ2BUOFELOPMQ14VWQ15TZF3MA&client_secret=MXLI2QDWN0WWDBAQEHEBFBEFLU45GG1I1AI1LTZFMWW40XSI&v=20130815&near=\(escapedLocation!)&query=\(escapedSearchTerm!)"
        let url = NSURL(string: urlPath)
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
                    if let responseDictionary: NSDictionary = dictionary["response"] as? NSDictionary
                    {
                        self.foursquareDelegate!.didReceiveFoursquareAPIResults(responseDictionary)
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