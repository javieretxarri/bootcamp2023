//: [Previous](@previous)

import Foundation

// The key must be hashable
var dic1: [String: String] = [:]
let dic2: [String: Int] = ["Uno": 1, "Dos": 2, "Tres": 3, "Cuatro": 4, "Cinco": 5]
let dic3 = ["Uno": 1, "Dos": 2, "Tres": 3, "Cuatro": 4, "Cinco": 5]

dic1["Uno"] = "Uno"
dic1

dic1.count
dic1.capacity

let nombre = dic1["Uno"]
let ventas = dic1["ventas"] ?? "Desconocido"
let director = dic1["Director", default: "Ninguno"]

dic1.removeValue(forKey: "Uno")
dic1["Uno"] = nil
dic1.updateValue("nine", forKey: "Uno")

dic1.keys
dic1.values

for valor in dic1 {
    print("\(valor.key) : \(valor.value)")
}

for key in dic1.keys {
    print("los valores son: \(dic1[key, default: ""])")
}
