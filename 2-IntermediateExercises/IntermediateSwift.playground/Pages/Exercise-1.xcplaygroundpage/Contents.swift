import Foundation

/*
 Ejercicio 1:
 Crea un array con 50 números enteros aleatorios. A partir del mismo,
 crea una cadena de respuesta que cuando encuentre que alguno de ellos es
 un número primo lo incluya. El resultado ha de ser una cadena similar a:
 “Los números primos aleatorios de esta lista son x, x, x, x, x”.
 */

func createAnArrayWithN(number: Int) -> [Int] {
    return (0 ..< number).map { _ in Int.random(in: 1 ... 10000) }
}

let arrayWith50Numbers = createAnArrayWithN(number: 50)
let primeArray = arrayWith50Numbers.filter { isPrime(number: $0) }
print("Los números primos aleatorios de esta lista son \(primeArray.reduce("") { "\($0), \($1)" }.dropFirst())")

// Concatenating functional function
let resultado = (0 ..< 50).map { _ in Int.random(in: 1 ... 10000) }
    .filter { isPrime(number: $0) }
    .reduce("") { "\($0), \($1)" }
    .dropFirst()

print("Los números primos aleatorios de esta lista son \(resultado) ")
