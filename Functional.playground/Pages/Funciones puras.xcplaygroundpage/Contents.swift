import Foundation

var a = 1

func sumo(b: Int) -> Int {
    a + b
}

let c = sumo(b: 8)
a = 2
let d = sumo(b: 8)

let array = [1, 2, 3, 4, 5, 6, 7, 8, 5, 4, 3, 2]

let sortedArray = array.sorted()
// Tratar de evitar. Buen tip definir como let para evitar mutabilidad
// array.sort()

func sumar(a: Int, b: Int) -> Int {
    a + b
}

let s1 = sumar(a: 4, b: 5)
let s2 = sumar(a: 4, b: sumar(a: 8, b: 9))
let s3 = sumar(a: 3 + 5, b: 3 * 5)

extension String {
//    mutating func addSuffix(_ suffix: String) {
//        guard !hasSuffix(suffix) else { return }
//        append(suffix)
//    }

    func addingSuffix(_ suffix: String) -> String {
        guard !hasSuffix(suffix) else { return self }
        return appending(suffix)
    }
}
