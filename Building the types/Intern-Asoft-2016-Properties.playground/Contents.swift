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

// Shorthand Setter Declaration
struct TestSetter {
    
    var lastName: String = String()
    var firstName: String = String()
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        set {
            let spl = newValue.characters.split{$0 == " "}.map(String.init)
            firstName = spl[0]
            lastName = spl[1]
        }
    }
    
}

// let's run
var testSetter = TestSetter(lastName: "Nguyen", firstName: "Danh")
print(testSetter.fullName) // Danh Nguyen
testSetter.fullName = "Toan Nguyen"
print(testSetter.fullName) // Toan Nguyen

// Read-Only Computed Properties
struct Rectangle {
    var length: Int
    var width: Int
    var area: Int {
        get {
            return length*width
        }
    }
}

var testGetter = Rectangle(length: 20, width: 5)
print("Area is \(testGetter.area)")
//testGetter.area = 100 // Area is read-only computed property, so can not set value. Error!

// Property Observers
struct TestPropertyObserver {
    var number: Int = 0 {
        willSet {
            print("Prepare to set new value: \(newValue)")
        }
        didSet {
            print("Added \(number) to number, old value: \(oldValue)")
        }
    }
}

var testPropertyObserver = TestPropertyObserver(number: 0)
testPropertyObserver.number = 10
//Prepare to set new value: 10
//Added 10 to number, old value: 0
testPropertyObserver.number = 44
//Prepare to set new value: 44
//Added 44 to number, old value: 10

// Querying and Setting Type Properties

struct FindMinNumber {
    var minNumber = 0
    var haveMin = false
    var number = 0 {
        didSet {
            if number < minNumber {
                minNumber = number
                haveMin = true
            } else {
                haveMin = false
            }
        }
    }
}

var findMinNumber = FindMinNumber(minNumber: 100, haveMin: true, number: 100)

findMinNumber.number = 90
if findMinNumber.haveMin {
    print("Number \(findMinNumber.number) is min number") // Number 90 is min number
} else {
    print("Number \(findMinNumber.number) is not min number, the min number is \(findMinNumber.minNumber)")
}

findMinNumber.number = 99
if findMinNumber.haveMin {
    print("Number \(findMinNumber.number) is min number")
} else {
    print("Number \(findMinNumber.number) is not min number, the min number is \(findMinNumber.minNumber)") // Number 99 is not min number, the min number is 90
}