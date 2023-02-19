import Foundation

func sumar2(num: Int) -> Int {
    num + 2
}

func coso() {
    print("holi")
}

func suma(a: Int, b: Int) -> Int {
    a + b
}

let result = sumar2(num: 8)
let fun = sumar2
let fun2 = coso
let fun3 = suma

fun(3)
fun3(5, 4)

let closureSuma = { (a: Int, b: Int) -> Int in
    a + b
}

let closureMultiplicacion = { (a: Int, b: Int) -> Int in
    a * b
}

let closureSumar2 = { (num: Int) -> Int in num + 2 }

closureSuma(5, 6)

func algo(n: Int, operacion: (Int, Int) -> Int) -> Int {
    operacion(n, n)
}

algo(n: 5, operacion: fun3)
algo(n: 5, operacion: closureSuma)

let r = algo(n: 5) { (a: Int, b: Int) -> Int in a + b }
r

func calculadora(nums: [Int], operacion: (Int, Int) -> Int) -> Int {
    guard var contador = nums.first else { return 0 }
    for num in nums.dropFirst() {
        contador = operacion(contador, num)
    }
    return contador
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 5, 54, 4, 4, 5, 65, 4, 4]

calculadora(nums: array, operacion: closureMultiplicacion)
calculadora(nums: array, operacion: closureSuma)

let r2 = calculadora(nums: array, operacion: { (a: Int, b: Int) -> Int in
    a * b
})
r2

let r3 = calculadora(nums: array) { (a: Int, b: Int) -> Int in
    a * b
}

r3
