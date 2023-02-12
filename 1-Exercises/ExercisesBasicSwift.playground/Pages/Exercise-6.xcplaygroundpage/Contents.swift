import Foundation

/*
 Ejercicio 6:
 Cree un programa con un conjunto con el número de elementos que diga el
 usuario, lleno de números primos. Cree un algoritmo capaz de calcular
 otro conjunto de números aleatorios que tenga al menos 3 elementos en
 común con el conjunto inicial.
 */

func fillSetWithPrimeQuantityEgualTo(number: Int) -> Set<Int> {
    var conjuntoPrimos: Set<Int> = []
    var value = 2
    while conjuntoPrimos.count < number {
        // isPrime is defined in resources folder
        if isPrime(number: value) {
            conjuntoPrimos.insert(value)
        }
        value += 1
    }
    return conjuntoPrimos
}

let userAskingNumber = 20

var setPrimos = fillSetWithPrimeQuantityEgualTo(number: userAskingNumber)

var setRandom: Set<Int> = []

while setPrimos.intersection(setRandom).count < 3 {
    setRandom.insert(Int.random(in: 2 ... setPrimos.max()!))
}

print("The set with random number is \(setRandom) and has in common the following values \(setPrimos.intersection(setRandom))")
