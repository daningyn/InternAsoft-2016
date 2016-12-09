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
















