//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, struct"

// Structures, or structs, are one of the named types in Swift that allow you to encapsulate related properties and behavious. You can define it, give it a name and use it in code

// Create Structure use syntax
struct Location {
    let lat: Double // a "member" of the struct
    let lng: Double
} // First Structure

// Define struct
let sanBayDaNangLocation = Location(lat: 16.053510, lng: 108.203061)

// Create Structure in Structure
struct Place {
    let name: String
    var location: Location
}

// Define struct DaNang
let sanBay = Place(name: "SanBayDaNang", location: sanBayDaNangLocation)

// print member in structure
print(sanBayDaNangLocation.lat) // 16.05351
print(sanBay.location.lat) // 16.05351
print(sanBay.name) // SanBayDaNang

// If i don't create constructor in structure, Swift automaticlly generated a way to create these values
// Create constructor in structure
struct Location1 {
    let lat: Double
    let lng: Double
    init(LocationString coordinateString: String) {
        let arraySplit = coordinateString.characters.split(separator: ",")
        lat = Double(String(arraySplit.first!))!
        lng = Double(String(arraySplit.last!))!
    }
}

// Can create one, two or more constructor like below struct

struct Place1 {
    let name: String?
    var location: Location1?
    init(_ name: String, _ location: Location1) {
        self.name = name
        self.location = location
    }
    
    init(_ name: String) {
        self.name = name
        self.location = nil
    }
    
    init(_ location: Location1) {
        self.location = location
        self.name = nil
    }
}

// Define structure
let sanBayDaNangLocation1 = Location1(LocationString: "16.053510,108.203061")
let sanBay1 = Place1("SanBayDaNang", sanBayDaNangLocation1)

print(sanBay1.location!.lat) // 16.05351
print(sanBay1.location!.lng) // 108.203061
print(sanBay1.name!) // SanBayDaNang
print(sanBayDaNangLocation1.lat) // 16.05351
print(sanBayDaNangLocation1.lng) // 108.203061

// Method in structure

struct Place2 {
    var name: String?
    var location: Location1?
    init(_ name: String, _ location: Location1) {
        self.name = name
        self.location = location
    }
    
    init(_ name: String) {
        self.name = name
        self.location = nil
    }
    
    init(_ location: Location1) {
        self.location = location
        self.name = nil
    }
    // It is a method
    func isInRange(_ location: Location1) -> Bool {
        let temp = sqrt(pow((location.lat - self.location!.lat), 2) + pow((location.lng - self.location!.lng), 2))
        return temp < 0.02
    }
    
}

let cauSongHanLocation = Location1(LocationString: "16.071985,108.226632")

let places: [Place2] = [Place2("SanBayDaNang", sanBayDaNangLocation1), Place2("CauSongHan", cauSongHanLocation)]
let tempLocation = "16.053537,108.203027"

for place in places {
    if place.isInRange(Location1(LocationString: tempLocation)) {
        print("Location: \(tempLocation) in range of \(place.name!)") // Location: 16.053537,108.203027 in range of SanBayDaNang
    } else {
        print("Location: \(tempLocation) not in range of \(place.name!)") // Location: 16.053537,108.203027 not in range of CauSongHan
    }
}

// Structure as Values
// Build a place
var place1: Place2 = Place2("SanBayDaNang", sanBayDaNangLocation1)
// Assign the value in place1 to place2
var place2: Place2 = place1
// let's see
print(place1.name!) // SanBayDaNang
print(place2.name!) // SanBayDaNang

place2.name = "Da Nang"

// let's see
print(place1.name!) // SanBayDaNang
print(place2.name!) // Da Nang

// So when i assign place2 the value from place1, it gets an exact copy of the value.
