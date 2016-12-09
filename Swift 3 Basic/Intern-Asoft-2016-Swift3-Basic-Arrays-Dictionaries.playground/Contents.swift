//: Playground - noun: a place where people can play

import UIKit

//Create an empty Array
var someArray = [Int]()   //this is empty array Int type
print("someArray is of type [Int] with \(someArray.count) items")
//The empty array have 0 items

//Add 1 item to array 
someArray.append(10)
//print it
print("someArray have \(someArray.count) items")

//Set someArray become empty array
someArray = [] //someArray become empty right now and it is still of type [Int]
//someArray.append("Danh Nguyen") //When i add 1 item String to Array, error!

//Create array with a default value
var fiveStrings = Array(repeating: "DanhNguyen", count: 5)
//print it to check
print("fiveStrings: \(fiveStrings)")

//Create an array by adding two arrays together
 var twoStrings = Array(repeating: "Intern", count: 2) //Create an array of type [String]

var sevenStrings = fiveStrings + twoStrings
//print it to check
print("sevenStrings: \(sevenStrings)")

//Create an array with an Array Literal
var foodList1: [String] = ["Eggs", "Fish"]
//Or 
var foodList2 = ["Eggs", "Fish"]


//Accessing and modifying an array
print("the Food List contains \(foodList1.count) items")

//Use the Boolean isEmpty property for checking amount of array
if foodList1.isEmpty == true {
    print("The food list is empty")
} else {
    print("The food list is not empty")
}
// Add 1 item to array
foodList1.append("Meat")
foodList1 += ["Pho"]
// Add items to array
foodList1 += ["Chicken", "Milk"]

// Accessing item in array
var item = foodList1[1]
print("The second item is \(item)")

// Change an existing value at a given index
foodList1[1] = "Vegetable"
print("The second item is \(foodList1[1])")

print("The food list have \(foodList1.count) items") // have 6 items
//Change a range of values
foodList1[2...4] = ["Ride", "Noodle", "Duck"]
print("The food list is \(foodList1)")

// If the replacement set of values has a different length than the range i am replacing
foodList1[2...4] = ["Noodle", "Duck"]
print("The food list is \(foodList1)")
print("The food list have \(foodList1.count) items") // have 5 items

// Insert an item into the array at a specified index
foodList1.insert("Chicken", at: 0)
print("The food list is \(foodList1)")
print("The food list have \(foodList1.count) items") // have 6 items

// Remove an item into the array at a specified index
foodList1.remove(at: 0)
print("The food list is \(foodList1)")
print("The food list have \(foodList1.count) items") // have 5 items
// Or remove an last item into the array
foodList1.removeLast()

//Use for loop for iterating over an array
for item in foodList1 {
    print(item)
}

//Or interating over an array with index, item
for (index, item) in foodList1.enumerated() {
    print("Item \(index): \(item)")
}

//--------------------------------------------------End Array---------------------------------------

//--------------------------------------------------Dictionaries---------------------------------------

// Create an empty dictionary
var namesOfIntegers = [Int: String]()

// Set 1 key-value pair for dictionary
namesOfIntegers[7] = "Seven"
print("Dictionary: \(namesOfIntegers)") //Dictionary: [7: "Seven"]

// Set empty for dictionary
namesOfIntegers = [:] //It is an empty dictionary of type [Int: String]

// Create a dictionary with a dictionary literal
var fullNames1: [String: String] = ["Danh": "Nguyen", "Toan": "Nguyen", "Minh": "Dang"]
// Or
var fullNames2 = ["Danh": "Nguyen", "Toan": "Nguyen", "Minh": "Dang"]

// Accessing and modifying a Dictionary
print("the fullNames contains \(fullNames1.count) items")

//Use the Boolean isEmpty property for checking amount of dictionary
if fullNames1.isEmpty == true {
    print("The fullNames is empty")
} else {
    print("The fullNames is not empty")
}

//Access 1 item in dictionary
var value = fullNames1["Danh"]
print(value!)

// Add a new item to a dictionary
fullNames1["Hau"] = "Tran"
print("The fullNames1 is \(fullNames1)")

// Change the value associated with a particular key
fullNames1["Hau"] = "Nguyen"

// Or can use updateValue to set or update the value for a particular key
// The method sets a value for a key if none exists or updates the value if that key already exists.
// It will return the old value after performing an update
// And it returns an optional value
// Example
// Current value for "Hau" key is "Nguyen"
if let oldValue = fullNames1.updateValue("Tran", forKey: "Hau") {
    print("The old value for \"Hau\" key is \(oldValue)")
}
print("The new value for \"Hau\" key is \(fullNames1["Hau"]!)") //Using ! for forced unwraping

// Using if let for checking
if let value = fullNames1["Danh"] {
    print("value: \(value)")
} else {
    print("value is nil or \"Danh\" key is not in dictionary")
}

if let value = fullNames1["Cong"] {
    print("value: \(value)")
} else {
    print("value is nil or \"Cong\" key is not in dictionary")
}

// Remove a key-value pair
fullNames1["Hau"] = nil
print("fullNames1: \(fullNames1)") // ["Minh": "Dang", "Toan": "Nguyen", "Danh": "Nguyen"]

// Or use method removeValue(forKey:)
fullNames1.removeValue(forKey: "Toan")
print("fullNames1: \(fullNames1)") // ["Minh": "Dang", "Danh": "Nguyen"]    

// Use for loop for iterating over a dictionary
for (key, value) in fullNames1 {
    print("\(key): \(value)")
}

// Or iterating over a keys
for key in fullNames1.keys {
    print("key: \(key)")
}

// Or iterating over a values
for value in fullNames1.values {
    print("value: \(value)")
}

// Case keys to array
let keyArray = [String](fullNames1.keys)
print("Key array is \(keyArray)") // ["Minh", "Danh"]

// Case values to array 
let valueArray = [String](fullNames1.values)
print("Value array is \(valueArray)") // ["Dang", "Nguyen"]





