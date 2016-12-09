//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, properties"

struct LengthRange {
    var firstValue: Int
    let range: Int
}

// Stored Properties
var first = LengthRange(firstValue: 5, range: 2)
// Change property value
first.firstValue = 10

// Stored Properties of Constant Structure
let second = LengthRange(firstValue: 4, range: 2)
//second.firstValue = 8 // this will report an error, even though firstValue is a variable property

// Lazy Stored Properties

struct DataImporter {

    var fileName = "data.txt"
    
}

struct DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    
}

var manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

// let's print importer
print(manager.importer.fileName) // data.txt

// Computed Properties

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        //get value center
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        //set value for center
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
// Define Rect struct
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
square.center = Point(x: 15.0, y: 15.0) // set loction for computed
print("square.origin is (\(square.origin.x), \(square.origin.y))") // square.origin is (10.0, 10.0)














