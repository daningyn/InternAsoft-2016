//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, classes"

// Definition Syntax
struct SomeStruct {
    var someProperty = 10
    var someMoreProperty = "ABC"
}
class SomeClass {
    var someProperty: Int = Int()
    var someMoreProperty: String = String()
    var structInClass = SomeStruct()
}

// Class Instances
let someClass = SomeClass()

// Accessing Properties
print("someProperty in SomeClass: \(someClass.someProperty)") // someProperty in SomeClass: 0
print("structInClass in SomeClass: \(someClass.structInClass)") // structInClass in SomeClass: SomeStruct(someProperty: 0, someMoreProperty: "ABC")
print("someProperty in structInClass: \(someClass.structInClass.someProperty)") // someProperty in structInClass: 10

someClass.structInClass.someProperty = 99
print("someProperty in structInClass: \(someClass.structInClass.someProperty)") // someProperty in structInClass: 99

// Constructor and Destructor
class SomeMoreClass {
    var number: Int
    var someString: String
    init(_ number: Int, _ someString: String) { // Constructor
        self.number = number
        self.someString = someString
    }
    init(_ number: Int) {
        self.number = number
        self.someString = ""
    }
    init(_ someString: String) {
        self.number = Int()
        self.someString = someString
    }
    deinit {
        print("SomeMoreClass is being deallocated")
    }
}

//Classes Are Reference Types
// Identify Operators
// Identify to (===)
var someMoreClass = SomeMoreClass(0, "Danh")
var alsoSomeMoreClass = someMoreClass
alsoSomeMoreClass.number = 10
if someMoreClass === alsoSomeMoreClass {
    print("someMoreClass and alsoSomeMoreClass refer to the same SomeMoreClass instance")
    // someMoreClass and alsoSomeMoreClass refer to the same SomeMoreClass instance
} else {
    print("someMoreClass and alsoSomeMoreClass don't refer to the same SomeMoreClass instance")
}

// I changed number property in alsoSomeMoreClass and number property in someMoreClass was changed too
print("number property in alsoSomeMoreClass: \(alsoSomeMoreClass.number) \nnumber property in someMoreClass: \(someMoreClass.number)")
// number property in alsoSomeMoreClass: 10
// number property in someMoreClass: 10

// Not identify to (!==)
someMoreClass = SomeMoreClass(0, "Danh")
alsoSomeMoreClass = SomeMoreClass(0, "Danh")
if someMoreClass === alsoSomeMoreClass {
    print("someMoreClass and alsoSomeMoreClass refer to the same SomeMoreClass instance")
} else {
    print("someMoreClass and alsoSomeMoreClass don't refer to the same SomeMoreClass instance")
    // someMoreClass and alsoSomeMoreClass don't refer to the same SomeMoreClass instance
}

// ARC in class
class User {
    var name: String
    private(set) var phones: [Phone]
    init(_ name: String) {
        self.name = name
        self.phones = []
    }
    deinit {
        print("User \(name) is being deallocated")
    }
    func add(phone: Phone) {
        self.phones.append(phone)
        phone.owner = self
    }
}
class Phone {
    let model: String
    var owner: User?
    init(model: String) {
        self.model = model
    }
    deinit {
        print("Phone is being deallocated")
    }
}

do {
    let user = User("Danh")
    let phone = Phone(model: "iPhone 5s")
}
// Here console print Phone is being deallocated and User Danh is being deallocated
// It mean two classes instance is deallocated

// But
do {
    let user1 = User("Hau")
    let phone1 = Phone(model: "iPhone 6s")
    user1.add(phone: phone1)
}
// This is not deallocate










