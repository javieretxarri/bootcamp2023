import Foundation

// Encapsular funciones dentro de funciones
func masMenos(num: Int, incremento: Int, masMenos: Bool) -> Int {
    func incrementar(num: Int, incremento: Int) -> Int {
        num + incremento
    }

    func decrementar(num: Int, incremento: Int) -> Int {
        num - incremento
    }

    return masMenos ? incrementar(num: num, incremento: incremento) : decrementar(num: num, incremento: incremento)
}

masMenos(num: 5, incremento: 3, masMenos: true)
masMenos(num: 5, incremento: 3, masMenos: false)
