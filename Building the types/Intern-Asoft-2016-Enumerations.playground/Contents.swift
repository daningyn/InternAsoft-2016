//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Enumerations"

// Enumeration Syntax
enum SomeEnumeration {
    case per1
    case per2
    case per3
}

var someTest = SomeEnumeration.per1
//or 
let someTest1: SomeEnumeration
someTest1 = .per2

// Matching Enumeration Values with a Switch Statement
switch someTest1 {
case .per1:
    print("per1")
case .per2:
    print("per2")
case .per3:
    print("per2")
}

// Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(1, 2, 3, 4)
var productBarcode1 = Barcode.qrCode("ABCDEFGHKLMN")

switch productBarcode {
case .upc(let num1, let num2, let num3, let num4):
    print("Number 1: \(num1), Number 2: \(num2), Number 3: \(num3), Number 4: \(num4)")
case .qrCode(let string):
    print("QR Code: \(string)")
}
// Number 1: 1, Number 2: 2, Number 3: 3, Number 4: 4

switch productBarcode1 {
case .upc(let num1, let num2, let num3, let num4):
    print("Number 1: \(num1), Number 2: \(num2), Number 3: \(num3), Number 4: \(num4)")
case .qrCode(let string):
    print("QR Code: \(string)")
}
// QR Code: ABCDEFGHKLMN

// Raw Values
enum ASCIICharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

// Implicitly Assigned Raw Values
enum Planet: Int {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let earth = Planet.earth.rawValue // 2

enum Planet1: String {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
let venus = Planet1.venus.rawValue // venus

// Initializing from a Raw Value
let possiblePlanet = Planet(rawValue: 5) // saturn

let positionToFind = 8
if let somePlanet = Planet(rawValue: positionToFind) {
    print("This position is possiable planet")
} else {
    print("There isn't a planet at position \(positionToFind)") // There isn't a planet at position 8
}

// Recursive Enumerations
indirect enum ArithmeticExpression {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case subtraction(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let numberTwo = ArithmeticExpression.number(2)
let numberNine = ArithmeticExpression.number(9)
let sum = ArithmeticExpression.addition(numberTwo, numberNine)
let sub = ArithmeticExpression.subtraction(numberNine, numberTwo)
let multiplication = ArithmeticExpression.multiplication(sum, sub)

func evaluate(_ product: ArithmeticExpression) -> Int {
    switch product {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left)+evaluate(right)
    case let .subtraction(left, right):
        return evaluate(left) - evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left)*evaluate(right)
    }
}

print(evaluate(multiplication))
