//: [Previous](@previous)

import Foundation

var name: String?

// name = "Pamplona"

// 1 -Enlace opcional
if let nameNonOptional = name {
    print(nameNonOptional)
//    print(name!)
} else {
    print("uta")
}

// This is only after swift 5.7
if let name {
    print(name)
} else {
    print("uta")
}

func guardTest(name: String?) -> String {
    guard let name = name else {
        print("Mierda esto está vacio")
        return "uta"
    }
    return name
}

print(guardTest(name: name))

// Coalescencia nil
let prueba = name ?? "default value"
print(prueba)

// force unwrapping
var b: Int?

b = 7

if b != nil {
    print(b!)
} else {
    print("b didn't have a value")
}

var url = URL(string: "https://www.biciciclismo.com/cas/site/inicio.asp")

print(url!)

var a: Int?

a = 20

// Casca
// a += 10

// print(a)

if let a {
    print(a)
} else {
    print("no valor a")
}

guard let num1 = a else {
    fatalError()
}

print(num1)
