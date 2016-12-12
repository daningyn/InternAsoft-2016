//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Methods"

// Example for Instance Methods
class Counter {
    
    var count = 0 // Init count
    
    func increment() {
        self.count += 1
    }
    func increment(by step: Int) {
        self.count += step
    }
    func resetCount() {
        self.count = 0
    }
    
}

// let's run
let counter = Counter()
print("Count: \(counter.count)") // count property was made 0
counter.increment()
print("Count: \(counter.count)") // Count: 1, increment 1
counter.increment(by: 5)
print("Count: \(counter.count)") // Count: 6, increment by step 5
counter.resetCount()
print("Count: \(counter.count)") // Count: 0


// Modifying Value Types from Within Instance Methods
struct Point {
    var x = 0.0, y = 0.0
    mutating func moveBy(_ x: Double, _ y: Double) {
        self.x += x
        self.y += y
    }
}
var point = Point(x: 1.0, y: 1.0)
point.moveBy(5.0, 6.0)
print("The point is now at: (\(point.x), \(point.y))") // The point is now at: (6.0, 7.0)
// If use let for point, a error will occur

// Assigning to self Within a Mutating Method
struct Point1 {
    var x = 0.0, y = 0.0
    mutating func moveBy(_ x: Double, _ y: Double) {
        self = Point1(x: self.x + x, y: self.y + y)
    }
}
var point1 = Point1(x: 1.0, y: 1.0)
point1.moveBy(5.0, 2.0)
print("The point is now at: (\(point1.x), \(point1.y))") // The point is now at: (6.0, 3.0)

// With enumeration 
enum Speed {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        default:
            self = .off
        }
    }
}

// let's run
var speed = Speed.high
speed.next()
print("speed is now \(speed)") // speed is now off
speed.next()
print("speed is now \(speed)") // speed is now low
speed.next()
print("speed is now \(speed)") // speed is now hight

// Type Methods
class SomeClass {
    class func someTypeMethod() {
        print("Here")
    }
}
SomeClass.someTypeMethod() //Here




















