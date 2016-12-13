//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, Big-O Notation"

// O(1)
var intArray = [1]
intArray.append(2)
intArray.removeLast()

// O(log n)
intArray = [1,3,4,7,11,17,23,28,31,46,57,68,74,82,90]
func binarySearch(left: inout Int, right: inout Int, value: Int) -> Int? {
    if left > right {
        return nil
    } else {
        let mid = (left+right)/2
        if intArray[mid] == value {
            return mid
        } else if intArray[mid] < value {
            left = mid + 1
        } else if intArray[mid] > value {
            right = mid - 1
        }
        return binarySearch(left: &left, right: &right, value: value)
    }
}
var left = 0
var right = intArray.count-1
if let index = binarySearch(left: &left, right: &right, value: 23) {
    print(index)
} else {
    print("nil")
}

// O(n)
for i in intArray {
    print("i = \(i)")
}

let aName = "Danh"
let bName = "Toan"
if aName == bName {
    print("Two Strings are equal")
} else {
    print("Two Strings are not equal")
}

// O(n (log n))
func quickSort<T: Comparable>(array: [T]) -> [T] {
    if array.isEmpty {
        return array
    } else {
        let head = array[0]
        let body = array[1..<array.count]
        let left = quickSort(array: body.filter({$0 < head}))
        let right = quickSort(array: body.filter({$0 >= head}))
        return left + [head] + right
    }
}

print(quickSort(array: [3, 1, 7, 9, 4, 2, 8]))
print(quickSort(array: ["goat", "arm", "toe", "dog", "bat"]))

// O(n^2)
var array = [3, 1, 7, 9, 4, 2, 8]
func swap<T>(a: inout T, b: inout T) {
    let temp = a
    a = b
    b = temp
}
func bubbleSort() {
    for i in 0..<array.count-1 {
        for j in i+1..<array.count {
            if array[i] > array[j] {
                swap(&array[i], &array[j])
            }
        }
    }
}
bubbleSort()
print(array)
array = [3, 1, 7, 9, 4, 2, 8]
func insertionSort() {
    for i in 0..<array.count {
        let temp = array[i]
        var j = i - 1
        while j >= 0 && array[j] > temp {
            array[j+1] = array[j]
            j = j - 1
        }
        array[j+1] = temp
    }
}
insertionSort()
print(array)

// O(2^n)
func fibonacci(n: Int) -> Int {
    if n == 0 || n == 1 {
        return 1
    } else {
        return fibonacci(n: n-1) + fibonacci(n: n-2)
    }
}
print(fibonacci(n: 15))

// O(n!)
func testFactorial(n: Int) {
    for _ in 0..<n {
        testFactorial(n: n-1)
    }
}

