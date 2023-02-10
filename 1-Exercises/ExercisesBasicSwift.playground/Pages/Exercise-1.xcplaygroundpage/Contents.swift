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
    } else {
        return true
    }
}

func isPrimeProgram(number: Int) -> Bool {
    if number > 0 {
        if number <= 3 {
            return true
        } else {
            if number % 2 == 0 || number % 3 == 0 {
                return false
            } else {
                return buclePrime(i: 5, number: number)
            }
        }

    } else {
        // It should ask for a new number but it seems that it does not work in playground the option readLine()
        return isPrimeProgram(number: 67)
    }
}

let numberToCheckIfItIsPrime = 79
print("number \(numberToCheckIfItIsPrime) is prime: \(isPrimeProgram(number: numberToCheckIfItIsPrime))")
