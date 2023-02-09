//: [Previous](@previous)

import SwiftUI

// 1. Los arrays NO PUEDEN tener distintos tipos de datos
// 2. Los arrays son tipos de datos por VALOR
// 3. La mutabilidad se define en su creación en un LET o VAR
// 4. Los ARRAYS NO TIENEN TAMAÑO

let c1: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 4, 4, 5, 6, 6, 4]
let c2 = [1, 2, 3, 4, 5, 56, 4, 3, 3, 23, 435, 54, 45, 32, 32]
var c3 = [2, 4, 4, 6, 6, 4, 3, 4, 5, 43, 3]
var c4 = c2
var c5: [Int] = []
var c6 = [Int]()
let c7 = [Int](repeating: 3, count: 100)
// let c8 = Array<Int>()
// let c9:Array<Int> = []

// let c3 = (age: 23, location: "Pamplona", maxSpeed: 388.33)
// var (age, location, maxSpeed) = c3

c1[0]

// Breaks
// c2[45]

let a = c1[5 ... 8]
print(c3)
c3[1 ... 3] = [5, 6, 7]
print(c3)

// It will delete an element because the third position is no set
c3[1 ... 3] = [5, 6]
// insert extra value
c3[1 ... 3] = [5, 6, 88, 55, 99, 343, 99]
print(c3)

print(c1.count)

print(c3.count)
// already reserved memory
print(c3.capacity)

c6.isEmpty

// Interesting if we know for example that we are going to insert 10K elements
c6.reserveCapacity(90)
print(c6.capacity)

c6.removeAll(keepingCapacity: true)

c3.append(44)
c3.append(contentsOf: [2, 4, 4, 6])

c3.insert(0, at: 12)
c3.insert(contentsOf: [3, 3, 3, 3, 3, 3], at: 10)
c3 = [1, 2, 3, 4, 5]
c3.insert(contentsOf: [3, 3, 3, 3, 3, 3], at: 1)

c3.contains(5)
c3.max()
c3.min()

var firstOfC3 = c3.first

if let firstOfC3 {
    print(firstOfC3)
}

c2
var c10 = c2.shuffled()
c10.sorted()

let reversed = "pampalaon".reversed()

for char in reversed {
    print(char)
}

c10.randomElement()

c10.firstIndex(of: 5)

c10.lastIndex(of: 5)
c10.starts(with: [1, 2, 3])

c3
c3.swapAt(0, 2)

var c11 = c3.dropFirst()
c11
c3
c3.removeFirst()
c11
c3

for value in c11 {
    print(value)
}

for v in c11 {
    print(v)
}

var reversed2 = c11.reversed()

var arrayNuevo = Array(reversed2)

let r = Text("aupa")

let rr = r.bold().italic()
