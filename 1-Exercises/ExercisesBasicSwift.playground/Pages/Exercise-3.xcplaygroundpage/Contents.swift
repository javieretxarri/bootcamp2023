import Foundation

/*
 Ejercicio 3:
 Realice un programa capaz de devolver el total de números de la
 secuencia de Fibonacci, en orden desde el primero, que el usuario pida.

 ALGORITMO: La secuencia de Fibonacci se obtiene de, a partir de los dos
 primeros números 1 y 2, sumar las dos posiciones anteriores de forma
 consecutiva para obtener el nuevo valor: 1, 2, 3, 5, 8, 13, 21...
 */

func printNFirstFibonacciNumbers(number: Int) {
    print("Fibonacci's sequence number 1 is 1")
    print("Fibonacci's sequence number 2 is 2")
    var lastTwo = [1, 2]
    var counter = 3
    while counter <= number {
        let nextFib = lastTwo[0] + lastTwo[1]
        lastTwo[0] = lastTwo[1]
        lastTwo[1] = nextFib
        print("Fibonacci's sequence number \(counter) is \(nextFib)")
        counter += 1
    }
}

printNFirstFibonacciNumbers(number: 80)
