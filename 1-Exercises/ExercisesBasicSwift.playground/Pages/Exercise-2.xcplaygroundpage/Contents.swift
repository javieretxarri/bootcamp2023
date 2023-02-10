import Foundation

/*
 Ejercicio 2:
 Realice un programa que sea capaz de contar el total de números primos
 que haya en un array de números enteros.
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

func countPrimeNumbersIn(numbers: Int...) -> [Int] {
    var primeNumbers: [Int] = []
    for number in numbers {
        if isPrime(number: number) {
            primeNumbers.append(number)
        }
    }
    return primeNumbers
}

var primeNumbers = countPrimeNumbersIn(numbers: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 79)
print("The total amount of prime numbes in the array is \(primeNumbers.count) and their values are \(primeNumbers)")
