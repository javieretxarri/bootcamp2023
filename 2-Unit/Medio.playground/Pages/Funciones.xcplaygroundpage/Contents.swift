//: [Previous](@previous)

import Foundation

func isPrime(number: Int) -> Bool {
    guard number > 0 else { return false }
    return number > 1 && !(2 ..< number).contains { number % $0 == 0 }
}

print(isPrime(number: 8))
isPrime(number: -8)

//////////////////////////////////////////////////////////////////// Especification or signature
func isPrime(prueba: Int) -> Bool {
    return prueba > 1 && !(2 ..< prueba).contains { prueba % $0 == 0 } // Implementation
}

print(isPrime(prueba: 8))

// En swift los nombres de los parámetro tienen que ir siempre

func sumarDos(numero n1: Int, n2: Int) -> Int {
    return n1 + n2
}

sumarDos(numero: 3, n2: 4)

func sumar(numbers: [Int]) -> Int? { // funciones falibles
//    if numbers.count == 0 {
//        return nil
//     }
    guard !numbers.isEmpty else { return nil }
    return numbers.reduce(0) { $0 + $1 }
}

let res2 = sumar(numbers: [1, 2, 3, 4, 5])
let res3 = sumar(numbers: [])

let numbers = [1, 2, 3, 4]
let numberSum = numbers.reduce(0) { x, y in
    x + y
}

// Default value
func sumar2(numbers: [Int] = [1]) -> Int? { // funciones falibles que pueden fallar
    guard !numbers.isEmpty else { return nil }
    return numbers.reduce(0) { $0 + $1 }
}

sumar2()

func sumar3(numbers: [Int]) -> (sum: Int, mul: Int) { // funciones falibles que pueden fallar
    return (numbers.reduce(0) { x, y in
        x + y
    }, numbers.reduce(1) { x, y in
        x * y
    })
}

let result = sumar3(numbers: [1, 2, 3, 4, 5, 6, 7, 8])

func sumOrMul(ns: [Int], o: Bool) -> Int {
    return ns.reduce(o ? 0 : 1) { x, y in
        if o {
            return x + y
        } else {
            return x * y
        }
    }
}

let result2 = sumOrMul(ns: [1, 2, 3, 4, 5, 6, 76, 7, 3], o: true)
let result3 = sumOrMul(ns: [1, 2, 3, 4, 5, 6, 76, 7, 3], o: false)

func sumOrMul2(numeros ns: [Int], operacion o: Bool = true) -> Int {
    guard var f = ns.first else { return 0 }
    if o {
        for n in ns.dropFirst() {
            f += n
        }
    } else {
        for n in ns.dropFirst() {
            f *= n
        }
    }
    return f
}

sumOrMul2(numeros: [1, 2, 3, 4, 5, 6, 76, 7, 3], operacion: true)
sumOrMul2(numeros: [1, 2, 3, 4, 5, 6, 76, 7, 3])
sumOrMul2(numeros: [1, 2, 3, 4, 5, 6, 76, 7, 3], operacion: false)

func sumOrMulNumeros(_ ns: [Int], operacion o: Bool = true) -> Int {
    guard var f = ns.first else { return 0 }
    if o {
        for n in ns.dropFirst() {
            f += n
        }
    } else {
        for n in ns.dropFirst() {
            f *= n
        }
    }
    return f
}

sumOrMulNumeros([1, 2, 3, 4, 5, 6, 76, 7, 3], operacion: true)

[1, 2, 3, 4, 5, 6, 76, 7, 3].filter { x in
    x > 70
}

func sumOMultiplicaNumeros(_ ns: Int..., operacion o: Bool = true) -> Int {
    guard var f = ns.first else { return 0 }
    if o {
        for n in ns.dropFirst() {
            f += n
        }
    } else {
        for n in ns.dropFirst() {
            f *= n
        }
    }
    return f
}

sumOMultiplicaNumeros(1, 2, 3, 4, 5, 6, 76, 7, 3, operacion: false)

func sumar22(numbers: inout [Int]) -> Int? {
    guard !numbers.isEmpty else { return nil }
    let result = numbers.reduce(0) { $0 + $1 }
    numbers.append(result)

    return result
}

var array = [1, 2, 3]
sumar22(numbers: &array)
print(array)

sumar22(numbers: &array)
print(array)

func llamada() -> String {
    print("Abrir conexión")

    defer {
        print("Cerrar conexión")
    }

    let resultado = Int.random(in: 1 ... 4)
    switch resultado {
    case 1:
        return "Error del servidor"
    case 2:
        return "Dato procesado"
    case 3:
        return "Resultado parcial"
    case 4:
        return "Error desconocido"
    default: ()
    }

    return "Se acabo"
}

llamada()

let arrayFUnctional = [1, 2, 3, 4, 5, 6, 7, 8, 9]
