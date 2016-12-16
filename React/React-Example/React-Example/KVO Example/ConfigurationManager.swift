//
//  ConfigurationManager.swift
//  React-Example
//
//  Created by Danh Nguyen on 12/16/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import UIKit

class ConfigurationManager: NSObject {
    
    var configuration: Configuration
    
    init(withConfiguration configuration: Configuration) {
        self.configuration = configuration
        super.init()
    }
    
    lazy private var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd HH:mm:ss"
        return dateFormatter
    }()
    
    var createAt: String {
        return dateFormatter.string(from: configuration.createAt)
    }
    
    var updateAt: String {
        return dateFormatter.string(from: configuration.updateAt)
    }
    
    func updateConfiguration() {
        configuration.updateAt = Date()
    }
    
}
