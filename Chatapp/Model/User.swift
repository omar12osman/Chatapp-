//
//  Model.swift
//  Chatapp
//
//  Created by Majid Osman on 2018-12-12.
//  Copyright © 2018 Majid Osman. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var email: String?
    var profileImageUrl: String?
    
    init(dictionary: [String: Any]) {
        self.name = dictionary["name"] as? String
        self.email = dictionary["email"] as? String
        self.profileImageUrl = dictionary["profileImageUrl"] as? String
    }
    
}
