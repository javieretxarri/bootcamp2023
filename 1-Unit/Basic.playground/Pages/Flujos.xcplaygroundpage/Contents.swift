//: [Previous](@previous)

import Foundation

let a = 26
let b = 5
let c = 30.01
let d = 98.8
let e = "Hola"
let f = "Adios"

if a > 4 {
    print("Mayor de cuatro")
} else {
    print("Menor o igual a cuatro")
}

let g = 33

switch g {
    case 1, 4, 9:
        print("No está mal")
    case 3:
        print("valor tres")
    case 5:
        print("valor cinco")
    case 10 ... 40:
        print("Número grande")
    default:
        print("Vete tu a saber")
}

for index in 0 ..< 10 {
    print(index)
}

var range = 0 ..< 10
for index in range {
    print(index)
}

for index in 0 ... 10 {
    if index % 2 == 0 {
        print("Index divided by 2 is 0 \(index)")
    }
}

var item = 0
while item < 10 {
    print(item)
    item += 1
}

item = 0
var suma = 0
repeat {
    print("Iteration number \(item)")
    item += 1
    suma += item
} while item < 10

print("The value of sum is \(suma)")

for index in 0 ... 10 where index % 2 == 0 {
    print("Super chachi for with index divided by 2 is zero \(index)")
}

var array: [Int] = []
for i in 0 ..< 20 {
    array.append(i)
}

print(array)

//: [Next](@next)
