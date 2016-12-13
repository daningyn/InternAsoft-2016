//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Generics"

// Generics function swaps two values of any types
func swapTwoValues<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}

// let's check
var a: Int = 10
var b: Int = 20
swapTwoValues(a: &a, b: &b)
print("a = \(a) And b = \(b)") // a = 20 And b = 10
var string1: String = "Danh"
var string2: String = "Nguyen"
swapTwoValues(a: &string1, b: &string2)
print("string1 = \(string1) And string2 = \(string2)") // string1 = Nguyen And string2 = Danh
var double1: Double = 1.5
var double2: Double = 12.3
swapTwoValues(a: &double1, b: &double2)
print("double1 = \(double1) And double2 = \(double2)") // double1 = 12.3 And double2 = 1.5

// Generic types
// Stack using generic

struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        self.items.append(item)
    }
    mutating func pop() {
        self.items.removeLast()
    }
    mutating func remove(at: Int) {
        self.items.remove(at: self.items.count-at-1)
    }
    func showItemInStack() {
        print(items)
    }
}

// let's check
var stack = Stack<Int>()
stack.push(item: 10)
stack.push(item: 4)
stack.push(item: 6)
stack.push(item: 24)
stack.push(item: 17)
stack.showItemInStack() // [10, 4, 6, 24, 17]
stack.pop()
stack.showItemInStack() // [10, 4, 6, 24]
stack.remove(at: 2)
stack.showItemInStack() // [10, 6, 24]

// Extending a Generic Type
extension Stack {
    var topItem: Element? {
        return self.items.isEmpty ? nil : self.items[self.items.count-1]
    }
}
if let topItem = stack.topItem {
    print("top item is \(topItem)") // top item is 24
} else {
    print("Stack is nil")
}

// Type Constraint Syntax
class SomeClass{ }
protocol SomeProtocol {}
func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
    
}

// Type Constraint in Action
func findIndex<Element: Equatable>(element: Element, stack: [Element]) -> Int? {
    for (index, value) in stack.enumerated() {
        if value == element {
            return index
        }
    }
    return nil
}

let index = findIndex(element: 6, stack: stack.items)
if index != nil {
    print("Index = \(index!)") // Index = 1
} else {
    print("Index is nil")
}

// Associated Types in Action
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

// non-generic IntStack
struct IntStack: Container {
    var items = [Int]()
    var count: Int {
        return self.items.count
    }
    typealias ItemType = Int
    
    mutating func append(item: Int) {
        self.push(item: item)
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
    
    mutating func push(item: Int) {
        self.items.append(item)
    }
    mutating func pop() {
        self.items.removeLast()
    }
}

// The generic stack 
struct Stack1<Element>: Container {
    var items = [Element]()
    var count: Int {
        return items.count
    }
    mutating func append(item: Element) {
        self.push(item: item)
    }
    mutating func push(item: Element) {
        self.items.append(item)
    }
    mutating func pop() {
        self.items.removeLast()
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}


func allItemMatch<C1: Container, C2: Container>(someContainer: C1, anotherContainer: C2) -> Bool where C1.ItemType == C2.ItemType, C1.ItemType: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    return true
}



var someContainer = Stack1<Int>()
someContainer.push(item: 10)
someContainer.push(item: 14)
someContainer.push(item: 4)
someContainer.push(item: 21)

var anotherContainer = Stack1<Int>()
anotherContainer.push(item: 10)
anotherContainer.push(item: 14)
anotherContainer.push(item: 4)

if allItemMatch(someContainer: someContainer, anotherContainer: anotherContainer) {
    print("All Items match")
} else {
    print("Not all items match") // Not all items match
}






