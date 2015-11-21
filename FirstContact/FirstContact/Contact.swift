//
//  Contact.swift
//  FirstContact
//
//  Created by Phillip English on 11/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import RealmSwift

class Contact: Object
{
    dynamic var name = ""
    dynamic var phoneNumber = ""
    dynamic var birthDay = ""
    
    let friends = List<Contact>()
    let family = List<Contact>()
}
