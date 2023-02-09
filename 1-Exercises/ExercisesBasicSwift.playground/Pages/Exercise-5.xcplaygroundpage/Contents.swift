import Foundation

/*
 Ejercicio 5:
 Realice un programa capaz de sumar las distintas cifras del factorial de
 un número indicado:
 EJEMPLO: 5! = 5 * 4 * 3 * 2 * 1 = 120 -> 1 + 2 + 0 = 3
 */

func calculateFactorial(number: Int) -> Int {
    var factorial = 1
    for value in 1 ... number {
        factorial *= value
    }
    return factorial
}

func calculateSumDigits(number: Int) -> Int {
    let numberConvertedToString = String(number)
    var result = 0
    for digit in numberConvertedToString {
        if let digitValue = digit.wholeNumberValue {
            result += digitValue
        }
    }
    return result
}

let requestNumbers = [5, 6, 7, 8, 9, 10]

for requestNumber in requestNumbers {
    let factorial = calculateFactorial(number: requestNumber)
    print("The factorial is \(factorial)")
    print("The total sum of digits is \(calculateSumDigits(number: factorial))")
    print("------------------------------------")
}
