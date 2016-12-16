//
//  CarModel.swift
//  MVVMDemo
//
//  Created by Danh Nguyen on 12/16/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import Foundation

class Car {
    
    var model: String
    var make: String
    var kilowatts: Int
    var photoURL: String
    
    init(model: String, make: String, kilowatts: Int, photoURL: String) {
        self.model = model
        self.make = make
        self.kilowatts = kilowatts
        self.photoURL = photoURL
    }
    
}

class CarService { // todo something about network, GET POST...
    
}

class CarModel {
    
    let car: [Car] = []
    let carService: CarService = CarService()
    
}
