 //: Playground - noun: a place where people can play

import UIKit

var str = "Hello, NSOrderedSet"

// Initialization
var array = ["Danh", "Minh", "Toan"]
var orderedSet = NSOrderedSet(array: array)

orderedSet = NSOrderedSet(array: array, copyItems: true)

orderedSet = NSOrderedSet(array: array, range: NSRange(location: 1, length: 2), copyItems: true)

orderedSet = NSOrderedSet(object: "Danh")

var unsafePointArray = ["Danh" as AnyObject, "Minh" as AnyObject, "Toan" as AnyObject]
orderedSet = NSOrderedSet(objects: unsafePointArray, count: 2)

var anotherOrderedSet = NSOrderedSet(orderedSet: orderedSet)

anotherOrderedSet = NSOrderedSet(orderedSet: orderedSet, copyItems: true)

anotherOrderedSet = NSOrderedSet(orderedSet: orderedSet, range: NSRange(location: 1, length: 1), copyItems: true)

let set: Set<AnyHashable> =  [2, 3, 5, 7, 11, 13, 17, 19, 23]
let set1: Set<AnyHashable> =  [2, 3, 5, 7, 11, 13, 17, 23, 19]
orderedSet = NSOrderedSet(set: set)
anotherOrderedSet = NSOrderedSet(set: set1)

orderedSet = NSOrderedSet(set: set, copyItems: true)
// Property
let count = orderedSet.count

let firstObject = orderedSet.firstObject

let lastObject = orderedSet.lastObject

let reversed = orderedSet.reversed

// Methods

if orderedSet.contains(7) {
    print("7 is in orderedSet")
} else {
    print("7 is not in orderedSet")
}
print("-----------------------")

orderedSet.enumerateObjects(at: NSIndexSet(indexesIn: NSRange(location: 2, length: 6)) as IndexSet, options: [], using: { (element, index, true) in
    print("The Element: \(element) at index \(index)")
})

print("-----------------------")

orderedSet.enumerateObjects({ (element, index, true) in
    print("The Element: \(element) at index \(index)")
})

print("-----------------------")

orderedSet.enumerateObjects(options: [], using: {(element, index, true) in
    print("The Element: \(element) at index \(index)")
})

print("-----------------------")

orderedSet.object(at: 3)
// Or
orderedSet[3]

let indexSet = NSIndexSet(indexesIn: NSRange(location: 2, length: 6)) as IndexSet
orderedSet.objects(at: indexSet)

orderedSet.index(of: 23)

let numberFinding = 5
orderedSet.index(ofObjectAt: indexSet, options: [], passingTest: {(element, index, true) in
    if element as! Int ==  numberFinding {
        print("Index: \(index)")
        return true
    }
    return false
})

orderedSet.index([], ofObjectPassingTest: {(element, index, true) -> Bool in
    if element as! Int ==  numberFinding {
        print("Index: \(index)")
        return true
    }
    return false
})

orderedSet.indexes(ofObjectsAt: indexSet, options: [], passingTest: {(element, index, true) -> Bool in
    if element as! Int ==  numberFinding {
        print("Index: \(index)")
        return true
    }
    return false
})

orderedSet.indexes(options: [], ofObjectsPassingTest: {(element, index, true) -> Bool in
    if element as! Int ==  numberFinding {
        print("Index: \(index)")
        return true
    }
    return false
})

for element in orderedSet.objectEnumerator() {
    print("Object: \(element)")
}
print("-----------------------")
for element in orderedSet.reverseObjectEnumerator() {
    print("Object: \(element)")
}

// Comparing Sets
orderedSet.isEqual(to: anotherOrderedSet)

orderedSet.intersects(anotherOrderedSet)

orderedSet.intersectsSet(set1)

orderedSet.isSubset(of: anotherOrderedSet)

orderedSet.isSubset(of: set)

// Sorted Array
orderedSet.sortedArray(using: [NSSortDescriptor(key: nil, ascending: false)])

orderedSet.sortedArray(comparator: { (obj1, obj2) -> ComparisonResult in
    let o1 = obj1 as! Int
    let o2 = obj2 as! Int
    if o1 > o2 {
        return ComparisonResult.orderedDescending
    } else {
        return ComparisonResult.orderedAscending
    }
})

// Filter
