import UIKit

// Ejercicio 1:
// Realice un programa que sea capaz de determinar si un número entero
// positivo cualquiera es un número primo o no.

func buclePrime(i: Int, number: Int) -> Bool {
    if i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false
        } else {
            return buclePrime(i: i + 6, number: number)
        }
    }

    return true
}

func isPrimeProgram(number: Int) -> Bool {
    guard number > 0 else { return false }

    if number <= 3 {
        return true
    }

    if number % 2 == 0 || number % 3 == 0 {
        return false
    }
    return buclePrime(i: 5, number: number)
}

let numberToCheckIfItIsPrime = 153548601
print("number \(numberToCheckIfItIsPrime) is prime: \(isPrimeProgram(number: numberToCheckIfItIsPrime))")
