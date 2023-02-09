//: [Previous](@previous)

import Foundation

var array: [Int] = []
for i in 0 ..< 20 {
    array.append(i)
}

print(array)

array = array.filter { value -> Bool in
    value % 2 == 0
}

print(array)

var array2: [Int] = []
for i in 0 ..< 20 {
    array2.append(i)
}

print(array2)

array = array.filter { value -> Bool in
    value % 2 == 0
}

for v in stride(from: 0, to: 25, by: 5) {
    print(v)
}

for _ in 1 ... 3 {
    print("Knock Knock")
}

let busca3 = Int.random(in: 1 ... 50)
for v in 1 ... 50 {
    if busca3 == v {
        print("Busca3 es \(v)")
        break
    }
    print("pepe")
}

var sumar = 0
for v in 1 ... 50 {
    if v < busca3 {
        continue
    }
    sumar += v
}

print("Sumatorio es \(sumar)")
