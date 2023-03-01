import Foundation

func sumaDoble(a: Int, b: Int) -> Int {
    a*2 + b*2
}

sumaDoble(a: 5, b: 7)

func sumaDoble(a: Double, b: Double) -> Double {
    a*2 + b*2
}

sumaDoble(a: 5.4, b: 8.4)

final class ColaFIFO {
    var stack: [Int] = []

    func put(_ valor: Int) {
        stack.insert(valor, at: 0)
    }

    func get() -> Int {
        stack.removeLast()
    }
}

let colaFIFO = ColaFIFO()
colaFIFO.put(3)
colaFIFO.put(6)
colaFIFO.get()

final class FIFO<Tipo>: FIFOType {
    var stack: [Tipo] = []

    func put(_ valor: Tipo) {
        stack.insert(valor, at: 0)
    }

    func get() -> Tipo {
        stack.removeLast()
    }
}

let fifo = FIFO<Double>()
fifo.put(3.0)
fifo.put(6.6)
fifo.get()

let fifo2 = FIFO<Int>()
fifo2.put(-2)
fifo2.put(6)
fifo2.get()

let fifo3 = FIFO<String>()
fifo3.put("pamplona")
fifo3.put("madrid")
fifo3.get()

func indiceEn<Element: Equatable>(valor: Element, array: [Element]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valor {
            return index
        }
    }
    return nil
}

let array = [1, 2, 3, 4, 5, 6, 7, 8]
let array2 = ["uno", "dos"]

indiceEn(valor: 4, array: array)
indiceEn(valor: "dos", array: array2)

func sumaGeneric<Tipo: Numeric>(a: Tipo, b: Tipo) -> Tipo {
    a*2 + b*2
}

sumaGeneric(a: 2.5, b: 2.9)

protocol FIFOType {
    associatedtype Tipo

    var stack: [Tipo] { get set }
    mutating func put(_ value: Tipo)
    mutating func get() -> Tipo
}

struct MiFIFO: FIFOType {
    typealias Tipo = String
    var stack: [String] = []

    mutating func put(_ value: String) {
        stack.insert(value, at: 0)
    }

    mutating func get() -> String {
        stack.removeLast()
    }
}

final class FIFO2<Tipo>: FIFOType {
    var stack: [Tipo] = []

    func put(_ valor: Tipo) {
        stack.insert(valor, at: 0)
    }

    func get() -> Tipo {
        stack.removeLast()
    }
}

let fifo5 = FIFO2<Double>()
fifo5.put(3.0)
fifo5.put(6.6)
fifo5.get()

// Cola
var fifoS = MiFIFO()
fifoS.put("Hola")
fifoS.put("kaixo")
fifoS.put("Adios")
fifoS.put("Agur")
fifoS.put("Buenos días")
fifoS.put("Egun on")

// some tipo opaco de retorno
func countStack(stack: some FIFOType) -> Int {
    stack.stack.count
}

countStack(stack: fifoS)
countStack(stack: fifo2)

func createStack<T>(elements: [T]) -> some FIFOType {
    let fifo = FIFO<T>()
    fifo.stack.append(contentsOf: elements)
    return fifo
}

let stackInt = createStack(elements: [1, 2, 4, 4, 5, 5, 6, 6])
let stackString = createStack(elements: ["Hola", "cómo", "estas"])
