//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, NSCache"

// Modifying the Cache Name
// Properties
let cache = NSCache<AnyObject, AnyObject>()
cache.name = "MyFirstCache"
cache.countLimit = 10
cache.totalCostLimit = 100 // bytes

// Methods
// Add Cached Values
cache.setObject("Nguyen" as AnyObject, forKey: "Danh" as AnyObject)
cache.setObject("Nguyen" as AnyObject, forKey: "Hau" as AnyObject, cost: 10)

// Removing Cached Values
cache.removeObject(forKey: "Danh" as AnyObject)

// Empties the cache
cache.removeAllObjects()