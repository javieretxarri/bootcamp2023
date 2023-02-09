//: [Previous](@previous)

import Foundation

var conjunto1: Set = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4]
var conjunto2: Set = [5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 13, 12, 11]
var conjunto7: Set = [2, 7]

conjunto1.contains(1)
conjunto1.insert(10)

let conjunto3 = conjunto1.union(conjunto2)
let conjunto4 = conjunto1.intersection(conjunto2)
let conjunto5 = conjunto1.subtracting(conjunto2)
let conjunto6 = conjunto1.symmetricDifference(conjunto2)

// modifica el conjunto
conjunto1.formUnion(conjunto2)

conjunto7.isSubset(of: conjunto1)
conjunto1.isSuperset(of: conjunto7)

let col1 = [1, 1, 1, 1, 1, 1, 1, 1]
Array(Set(col1))
