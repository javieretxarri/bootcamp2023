import Foundation

/*
 Ejercicio 9:
 Cree un programa capaz de obtener la media aritmética de una sucesión de
 números dentro de un array.
 */

func getAvgValueFromAListOfNumber(_ numbers: [Int]) -> Int {
    // sum is defined in resources folder
    return (sum(numbers: numbers) ?? 0) / numbers.count
}

var oneHundredNumbers: [Int] = []
for _ in 0 ..< 100 {
    oneHundredNumbers.append(Int.random(in: 1 ... 10000))
}

print("The average value ot the array is \(getAvgValueFromAListOfNumber(oneHundredNumbers))")
