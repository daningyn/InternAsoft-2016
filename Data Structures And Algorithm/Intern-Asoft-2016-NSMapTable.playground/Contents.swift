//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, NSMapTable"

// Initialization

var someMapTable = NSMapTable<AnyObject, AnyObject>(keyOptions: [.weakMemory], valueOptions: [.strongMemory], capacity: 10)

someMapTable = NSMapTable<AnyObject, AnyObject>(keyOptions: [.strongMemory], valueOptions: [.weakMemory])

someMapTable = NSMapTable<AnyObject, AnyObject>(keyPointerFunctions: NSPointerFunctions(options: [.weakMemory]), valuePointerFunctions: NSPointerFunctions(options: [.weakMemory]), capacity: 10)


// Accessing Content
let someKey = "Danh" as AnyObject
if let object = someMapTable.object(forKey: someKey) {
    print("Object for \(someKey): \(object)")
} else {
    print("No value is associated with \(someKey) key")
}

for key in someMapTable.keyEnumerator() {
    print("Key: \(key)")
}

for value in someMapTable.objectEnumerator()! {
    print("Object: \(value)")
}

// Munipulating Content
someMapTable.setObject("Nguyen" as AnyObject, forKey: "Danh" as AnyObject)

someMapTable.removeObject(forKey: someKey)