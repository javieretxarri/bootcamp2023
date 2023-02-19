import Foundation

// Encapsular funciones dentro de funciones
func masMenosConIncrement(_ masMenos: Bool, incremento: Int) -> (Int) -> Int {
    func incrementar(num: Int) -> Int {
        num + incremento
    }

    func decrementar(num: Int) -> Int {
        num - incremento
    }

    return masMenos ? incrementar : decrementar
}

// let incrementar = masMenos(num: 5, incremento: 3, masMenos: true)
// let decrementar = masMenos(num: 5, incremento: 3, masMenos: false)

let incrementar = masMenosConIncrement(true, incremento: 5)
incrementar(8)

let decrementar = masMenosConIncrement(false, incremento: 5)
decrementar(8)

// Currying
// Devolver una función como resultado de una llamada a otra función

// Esto se eliminó
// func llamad(a: Int)(b: Int)(c: Int) -> Int {}
