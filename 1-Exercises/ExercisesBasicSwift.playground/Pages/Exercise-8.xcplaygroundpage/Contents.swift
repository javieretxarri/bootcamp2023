//: [Previous](@previous)

import Foundation

/*
 Ejercicio 8:
 Construye un array con al menos 100 números aleatorios de entre 1 y 100
 y luego filtra este para obtener como resultado solo aquellos números
 que son primos entre los 100 que había al principio.
 */
func isPrime(number: Int) -> Bool {
    if number > 1 {
        for divider in 2 ..< number {
            if number % divider == 0 {
                return false
            }
        }
        return true
    }

    return false
}

func getOnlyPrimeNumberFromArray(_ numbers: [Int]) -> [Int] {
    let primeNumbers = numbers.filter { isPrime(number: $0) }
    return Array(Set(primeNumbers))
}

var oneHundredNumbers = (0 ..< 100).map { _ in Int.random(in: 1 ... 100) }

print("Between 100 random numbers the prime numbers are (without duplicate values): \(getOnlyPrimeNumberFromArray(oneHundredNumbers).sorted())")
