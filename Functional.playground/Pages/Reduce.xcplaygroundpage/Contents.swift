import UIKit

let array = [1, 2, 3, 4, 5, 6, 7, 78, 8, 9, 5, 4]

let resultadoSum = array.reduce(0) { $0 + $1 }
resultadoSum

let resultadoMul = array.reduce(1) { $0 * $1 }
resultadoMul

let resultadoMul2 = array.reduce(1) { accumulator, value in
    accumulator * value
}

resultadoMul2

let resultadoMul3 = array.reduce("") { accumulator, value in
    accumulator.appending(String(value))
}

resultadoMul3

let resultadoMul4 = array.reduce(into: 0) { counts, value in
    counts *= value
}

resultadoMul4

let resultadoMul5 = array.reduce(into: 0) { $0 *= $1 }

resultadoMul5

let letters = "abracadabra"
let letterCount = letters.reduce(into: [:]) { counts, letter in
    counts[letter, default: 0] += 1
}

letterCount

let resultadoMul6 = array.reduce(0,+)

resultadoMul6
