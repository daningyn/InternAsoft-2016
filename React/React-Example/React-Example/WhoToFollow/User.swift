//
//  User.swift
//  React-Example
//
//  Created by Danh Nguyen on 12/19/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import Foundation

class User {
    
    var id: String
    var name: String
    var avatarURL: String
    
    init(id: String, name: String, avatarURL: String) {
        self.id = id
        self.name = name
        self.avatarURL = avatarURL
    }
    
}
