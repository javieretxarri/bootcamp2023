import Foundation

/*
 Ejercicio 7:
 Realice un programa que sea capaz de sumar todos los números que hay en
 un array de números enteros.
 */

func sum(numbers: [Int]) -> Int {
    var sum = 0
    for value in numbers {
        sum += value
    }
    return sum
}

let arrayWithNumbers = [1, 2, 3, 4, 5, 5, 6, 6, 7, 7, 8, 8, 6, 3, 3, 3, 3, 31, 1, 1]

print("The total sum of the array is \(sum(numbers: arrayWithNumbers))")
