//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, NSIndexSet"

// Initialization

var someIndexSet = NSIndexSet(index: 5)


someIndexSet = NSIndexSet(indexesIn: NSRange(location: 2, length: 10))

var anotherIndexSet = NSIndexSet(indexSet: someIndexSet as IndexSet)
anotherIndexSet = NSIndexSet(indexesIn: NSRange(location: 5, length: 8))

// Querying Index Sets

someIndexSet.contains(11)

someIndexSet.contains(anotherIndexSet as IndexSet)

someIndexSet.contains(in: NSRange(location: 5, length: 7))

someIndexSet.intersects(in: NSRange(location: 12, length: 2))

someIndexSet.countOfIndexes(in: NSRange(location: 10, length: 3))

let a = someIndexSet.indexes(options: [], passingTest: {(index, true) -> Bool in
    return true
})

someIndexSet.index(in: NSRange(location: 2, length: 5), options: [], passingTest: {(index, true) -> Bool in
    return true
})

someIndexSet.indexes(in: NSRange(location: 2, length: 7), options: [], passingTest: {(indexSet, true) -> Bool in
    return true
})

someIndexSet.enumerateRanges(in: NSRange(location: 2, length: 7), options: [], using: {(range, true) in
    
})

someIndexSet.enumerateRanges({ (range, true) in
    
})

someIndexSet.enumerateRanges(options: [], using: {(range, true) in
    
})

// Comparing Index Sets
someIndexSet.isEqual(to: anotherIndexSet as IndexSet)

// Getting Indexes

someIndexSet.indexLessThanIndex(10)

someIndexSet.indexLessThanOrEqual(to: 10)

someIndexSet.indexGreaterThanOrEqual(to: 10)

someIndexSet.indexGreaterThanIndex(10)

let array = [1,5,8,13,16]
someIndexSet.getIndexes(UnsafeMutablePointer<Int>(mutating: array), maxCount: 15, inIndexRange: nil)

// Enumerating Indexes
someIndexSet.enumerate ({ (index, true) in
    print(index)
})

someIndexSet.enumerate(options: [.concurrent], using: {(index, true) in
    
})

someIndexSet.enumerate(in: NSRange(location: 5, length: 4), options: [], using: {(index, true) in
    print(index)
})

