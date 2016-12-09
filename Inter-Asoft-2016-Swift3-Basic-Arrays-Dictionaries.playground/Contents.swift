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














