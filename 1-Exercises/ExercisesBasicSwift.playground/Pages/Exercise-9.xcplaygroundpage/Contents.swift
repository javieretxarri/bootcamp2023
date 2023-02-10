import Foundation

/*
 Ejercicio 9:
 Cree un programa capaz de obtener la media aritmética de una sucesión de
 números dentro de un array.
 */

func suma(numbers: [Int]) -> Int {
    var suma = 0
    for i in numbers {
        suma += i
    }
    return suma
}

func getAvgValueFromAListOfNumber(_ numbers: [Int]) -> Int {
    return suma(numbers: numbers) / numbers.count
}

var oneHundredNumbers: [Int] = []
for _ in 0 ..< 100 {
    oneHundredNumbers.append(Int.random(in: 1 ... 10000))
}

print("The average value ot the array is \(getAvgValueFromAListOfNumber(oneHundredNumbers))")
