//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Closure"


//Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

//Closure expressions are a way to write inline closures in a brief focused syntax.
//i will demo the closure expression examples with sorted(by:) method
var names = ["Hau", "Vinh", "Huy", "Danh", "Minh", "Toan"]
//This example is sorting an array of String values
func check(_ s1: String, _ s2: String) -> Bool {
    return s1<s2
}

var reversedNames = names.sorted(by: check)
print("Array after sort: \(reversedNames)") // ["Danh", "Hau", "Huy", "Minh", "Toan", "Vinh"]

// Or not using method
var reversedNames1 = names.sorted(by: {(s1: String, s2: String) -> Bool in
    return s1<s2
})
print("Array after sort: \(reversedNames1)") // ["Danh", "Hau", "Huy", "Minh", "Toan", "Vinh"]

// Or
var reversedNames2 = names.sorted(by: {(s1,s2) -> Bool in return s1<s2})
print("Array after sort: \(reversedNames2)") // ["Danh", "Hau", "Huy", "Minh", "Toan", "Vinh"]

// Or
var reversedNames3 = names.sorted(by: {$0<$1})
print("Array after sort: \(reversedNames3)") // ["Danh", "Hau", "Huy", "Minh", "Toan", "Vinh"]

// Or using operator method
var reversedNames4 = names.sorted(by: <)
print("Array after sort: \(reversedNames4)") // ["Danh", "Hau", "Huy", "Minh", "Toan", "Vinh"]


// Capturing values
// A closure can capture constants and variables from the surrounding context in which it is defined
// Example for capturing values

func totalNumbers(number a: Int) -> (Int) -> Int {
    var temp = a
    func insideTotalNumber(b: Int) -> Int {
        temp = temp+b
        return temp
    }
    return insideTotalNumber
}

// First i set number a = 10
let firstStep = totalNumbers(number: 10)
// After i set number b = 10
let total = firstStep(5)
// The return type of totalNumbers is (Int) -> Int. This means that it returns a function
print("Total: \(total)") // Total: 15
// recall function firstStep
let total1 = firstStep(10)
print("Total1: \(total1)") // Total1: 25
// Again
print("Total Again: \(firstStep(20))") // Total Again: 45


// Retain cycles Closures
// Example
class TestClass {
    
    var aBlock: (() -> ())? = nil //Closure
    
    let aConstant = 5
    
    init() {
        print("init")
        aBlock = {
            print(self.aConstant)
        }
    }
    
    deinit {
        print("deinit")
    }
    
}

var testClass: TestClass? = TestClass() // init
testClass = nil // not deinit because TestClass has a strong reference to the closure and the closure has a strong reference to class


//TestClass2
// i can solve this by capturing the self reference as weak
class TestClass2 {
    
    var aBlock: (() -> ())? = nil //Closure
    
    let aConstant = 5
    
    init() {
        print("init")
        aBlock = { [weak self] in
            print(self?.aConstant)
        }
    }
    
    deinit {
        print("deinit")
    }
    
}

var testClass2: TestClass2? = TestClass2() // init
testClass2 = nil // deinit

// However, there won't always be a retain cycle when using closure. 
// The reason is, that there is no strong reference to the block, so the block will be deadllicated after the method returns

// unowned
class TestClass3 {
    
    var aBlock: (() -> ())? = nil //Closure
    
    let aConstant = 5
    
    init() {
        print("init")
        aBlock = { [unowned self] in
            print(self.aConstant)
        }
    }
    
    deinit {
        print("deinit")
    }
    
}

var testClass3: TestClass3? = TestClass3() // init
testClass3 = nil // deinit
print(testClass3?.aBlock!) //it is safe

// Escaping Closures
// Closure with Escaping
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
// Closure with non escaping
func someFunctionWithNonEscapingClosure(closure: () -> Void) {
    closure()
}

class SomeTestClass {
    var x = 26
    func doSomeThing() {
        someFunctionWithEscapingClosure {
            self.x = 200
        }
        someFunctionWithNonEscapingClosure(closure: {
            x = 100
        })
    }
}

let test = SomeTestClass()
test.doSomeThing()
// let's print x
print(test.x) // 100 => someFunctionWithNonEscapingClosure is ran

// call function in array completionHandlers
completionHandlers.first?()
// let's print x
print(test.x) // 200 => someFunctionWithEscapingClosure run right now, even though is called before


// Autoclosure
// Example

names = ["Hau", "Vinh", "Huy", "Danh", "Minh", "Toan"]
// let's print count of names 
print(names.count) //6
let autoclosure = { names.append("Cong") }
// After above command, print count of names to see how many items in array
print(names.count) // 6 items, nothing occer

// run closure
autoclosure()
// let's print count of names
print(names.count) // 7 items, that code is ran

//pass closure as as argument to a function
func addElementToArray(_ closure: () -> Void) {
    closure()
}

addElementToArray {
    names.append("Rin")
}

print(names.count) // 8 items

// use autoclosure
func addElementToArray1(closure: @autoclosure () -> Void) {
    closure()
}
// call function addElementToArray1
addElementToArray1(closure: names.append("Ron"))
// let's print count of names
print(names.count) //9 items


// use both escaping and autoclosure
names = ["Hau", "Vinh", "Huy", "Danh", "Minh", "Toan"] // create names with count = 6
//create array closure
var appendCommandClosures: [() -> Void] = []

func addElementToArray2(_ closure: @escaping @autoclosure () -> Void) {
    appendCommandClosures.append(closure)
}

// call function addElementToArray2
addElementToArray2(names.append("Rin"))
addElementToArray2(names.append("Ron"))

// let's print count of names
print(names.count) // 6 items

appendCommandClosures[0]()
print(names.count) // 7 items
appendCommandClosures[1]()
print(names.count) // 8 items

// let's print names array
print("names array: \(names)") // ["Hau", "Vinh", "Huy", "Danh", "Minh", "Toan", "Rin", "Ron"]

