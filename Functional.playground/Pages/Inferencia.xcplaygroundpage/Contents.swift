import UIKit

let array = [1, 2, 3, 4, 5, 6, 7, 8, 5, 54, 4, 4, 5, 65, 4, 4]

func calculadora(nums: [Int], operacion: (Int, Int) -> Int) -> Int {
    guard var contador = nums.first else { return 0 }
    for num in nums.dropFirst() {
        contador = operacion(contador, num)
    }
    return contador
}

let r2 = calculadora(nums: array, operacion: { (a: Int, b: Int) -> Int in
    a * b
})
r2

let r3 = calculadora(nums: array) { (a: Int, b: Int) -> Int in a * b }
r3

// How it works in the compiler
let s = calculadora(nums: array, operacion: { (a: Int, b: Int) -> Int in
    a * b
})
s
// Me sobra el return (no necsito ponerlo) porque es una expresión simple que devuelve un resultado a * b

let s2 = calculadora(nums: array, operacion: { a, b -> Int in a * b })
s2
// La especificacion está fijando los tipos de entrada a (Int, Int) por lo que nunca aceptará un closure que no tenga estos

let s3 = calculadora(nums: array, operacion: { a, b in a * b })
s3
// tampoco importa el tipo de salida porque ya está definido -> Int

let s4 = calculadora(nums: array, operacion: { $0 * $1 })
s4

let s5 = calculadora(nums: array) { $0 * $1 }
s5

let s6 = calculadora(nums: array, operacion: *)
s6


