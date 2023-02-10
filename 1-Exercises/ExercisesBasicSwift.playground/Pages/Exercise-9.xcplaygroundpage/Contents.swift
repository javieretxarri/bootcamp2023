import Foundation

/*
 Ejercicio 9:
 Cree un programa capaz de obtener la media aritmética de una sucesión de
 números dentro de un array.
 */

func getAvgValueFromAListOfNumber(_ numbers: [Int]) -> Int {
    return numbers.reduce(0) { x, y in x + y } / numbers.count
}

var oneHundredNumbers = (0 ..< 100).map { _ in Int.random(in: 1 ... 10000) }

print("The average value ot the array is \(getAvgValueFromAListOfNumber(oneHundredNumbers))")
