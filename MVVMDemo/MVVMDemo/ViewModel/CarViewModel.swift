//
//  CarViewModel.swift
//  MVVMDemo
//
//  Created by Danh Nguyen on 12/18/16.
//  Copyright © 2016 Danh Nguyen. All rights reserved.
//

import Foundation

class CarViewModel {
    
    internal var car: Car
    
    var model: String
    let kilowatts: Int
    let photoURL: String
    
    init(car: Car) {
        self.car = car
        self.model = CarViewModel.getName(of: self.car)
        self.kilowatts = CarViewModel.getKilowatts(of: self.car)
        self.photoURL = CarViewModel.getPhotoURL(of: self.car)
    }
    
    private static func getName(of car: Car) -> String {
        return car.model
    }
    
    private static func getKilowatts(of car: Car) -> Int {
        return car.kilowatts
    }
    
    private static func getPhotoURL(of car: Car) -> String {
        return car.photoURL
    }
    
    // Networking...
    // In a real world application, i'd fetching data from an external source, but for this example, i just let our AppDelegate hold an array of cars
    
}

extension CarViewModel {
    func rename(newName name: String) {
        self.car.model = name
        self.model = name
    }
}
