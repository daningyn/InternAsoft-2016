//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var array: [Int] = [44, 13, 99, 82, 9, 91, 31, 20, 58, 7, 81, 55, 79, 7]
//for _ in 0..<14 {
//    array.append(Int(arc4random_uniform(100)))
//}
 print(array)

// QuickSort
func quickSort<T: Comparable>(_ array: [T]) -> [T] {
    if array.isEmpty {
        return array
    } else {
        let key: T = array[0]
        let newArray = array[1..<array.count]
        let left = quickSort(newArray.filter({$0 < key}))
        let right = quickSort(newArray.filter({$0 >= key}))
        return left + [key] + right
    }
}
//print(quickSort(array)) // O(n log n)

// Heap Sort
func heapSort<T: Comparable>(root1: Int, endNode: Int, array: inout [T]) {
    var root = root1
    var key = array[root]
    while root*2 <= endNode {
        key = array[root]
        var posValue = root*2
        if posValue < endNode && array[root*2+1] > array[root*2] {
            posValue = root*2+1
        }
        if key > array[posValue] {
            break
        }
        array[root] = array[posValue]
        root = posValue
    }
    array[root] = key
}
var count = (array.count-1)/2
while count >= 0 {
    heapSort(root1: count, endNode: array.count-1, array: &array)
    print(array)
    count-=1
}





