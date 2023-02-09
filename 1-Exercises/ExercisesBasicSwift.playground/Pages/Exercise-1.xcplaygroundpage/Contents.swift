import UIKit

// Ejercicio 1:
// Realice un programa que sea capaz de determinar si un número entero
// positivo cualquiera es un número primo o no.

func buclePrim(i: Int, number: Int) -> Bool {
    print(i, number)

    if i * i <= number {
        if number % i == 0 || number % (i + 2) == 0 {
            return false
        } else {
            return buclePrim(i: i + 6, number: number)
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
                return buclePrim(i: 5, number: number)
            }
        }

    } else {
        return isPrimeProgram(number: 67)
    }
}

isPrimeProgram(number: 79)
