//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, NSCountedSet"

// Initialization

let array = ["Danh", "Toan", "Minh"]
let arraySet: Set<String> = ["Danh", "Toan", "Minh"]
let countedSet = NSCountedSet(array: array)
let countedSet1 = NSCountedSet(set: arraySet)
var countedSet2 = NSCountedSet(capacity: 2)

// Methods
// Add object
countedSet.add("Hau")
countedSet.add("Hau")

// Remove object
countedSet.remove("Danh")

// Count object
countedSet.count(for: "Hau") // 2

// Using method objectEnumerator to access each object
for i in countedSet.objectEnumerator() {
    print("object: \(i)")
}