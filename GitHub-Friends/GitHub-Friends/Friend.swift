//
//  Friend.swift
//  GitHub-Friends
//
//  Created by Phillip English on 10/27/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import Foundation

struct Friend
{
    let name: String
    let login: String
    let blog: String
    let location: String
    
    init(name: String, login: String, blog: String, location: String)
    {
        self.name = name
        self.login = login
        self.blog = blog
        self.location = location
    }
    
    
    static func friendInfoWithJSON(results: NSDictionary) -> [Friend]
    {
        var friendInfo = [Friend]()
        
        if results.count > 0
        {
           // for result in results
           // {
                let name = result.valueForKey("name") as? String
            
                let login = result.valueForKey("login") as? String
                let blog = result.valueForKey("blog") as? String
                let location = result.valueForKey("location") as? String
                friendInfo.append(Friend(name: name!, login: login!, blog: blog!, location: location!))

           // }
            
        }
        
        return friendInfo
        
    }
    
    
}