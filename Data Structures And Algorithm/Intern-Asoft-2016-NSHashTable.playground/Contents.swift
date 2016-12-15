//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, NSHashTable"

//Initialization
var someHashTable = NSHashTable<AnyObject>(options: [.weakMemory], capacity: 10)

someHashTable = NSHashTable<AnyObject>(pointerFunctions: NSPointerFunctions(options: [.weakMemory]), capacity: 10)

someHashTable = NSHashTable<AnyObject>(options: [.strongMemory])

// Properties

var anyObject = someHashTable.anyObject

var allObjects = someHashTable.allObjects

var set = someHashTable.setRepresentation

var count = someHashTable.count

// Methods
let object = "Danh" as AnyObject
if someHashTable.contains(object) {
    print("Object: \(object) is present in someHasTable")
} else {
    print("Object: \(object) is not present in someHasTable")
}

if someHashTable.member(object) != nil {
    print("Object: \(object) is member of someHasTable")
} else {
    print("Object: \(object) is not member of someHasTable")
}

for object in someHashTable.objectEnumerator() {
    print("Object: \(object)")
}

// Manipulating Membership

someHashTable.add(object)

let anotherObject = "Toan" as AnyObject
someHashTable.remove(anotherObject)
someHashTable.add(anotherObject)

let anotherHashTable = NSHashTable<AnyObject>()
anotherHashTable.add(anotherObject)
anotherHashTable.add(object)

someHashTable.add("Minh" as AnyObject)
anotherHashTable.add("Hau" as AnyObject)
// Comparing Hash Tables

someHashTable.intersect(anotherHashTable)

someHashTable.intersects(anotherHashTable)

someHashTable.isSubset(of: anotherHashTable)

someHashTable.isEqual(to: anotherHashTable)

// Set Function 

someHashTable.union(anotherHashTable)

anotherHashTable.minus(someHashTable)

