import Foundation

protocol MiProtocolo {
    func coso(parametro: Int)
    // Solo puede ser una propiedad calculada. Ojo que son var
    var miPropidad: String { get }
}

final class Test: MiProtocolo {
    func coso(parametro: Int) {
        print("Soy coso y el parámetro es \(parametro)")
    }

    var miPropidad: String {
        "Soy una mega propiedad \(x)"
    }

    let x = 10
}

let test = Test()
test.coso(parametro: 88)
test.miPropidad

final class Test2: MiProtocolo {
    func coso(parametro: Int) {
        print("Soy coso y el parámetro es \(parametro)")
    }

    // Aquí podemos cambiar a propiedad almacenada
    var miPropidad: String = "hola"
}

let test2 = Test2()
test2.coso(parametro: 88)
test2.miPropidad

protocol Protocolo2: MiProtocolo {
    var coso2: Int { get set }
}

final class Test3: Protocolo2 {
    var coso2: Int {
        get {
            2
        }
        set {}
    }

    func coso(parametro: Int) {
        print(parametro)
    }

    var miPropidad: String {
        "uta"
    }
}

final class Equalable: Equatable {
    static func == (lhs: Equalable, rhs: Equalable) -> Bool {
        return true
    }
}

// El protcolo base que cumplen todos los tipos de swift
// Any --> solo implica tener el self

let cositas: [Any] = [1, 2, "hola", true]

for cosita in cositas {
    print(type(of: cosita))
}

// Equatable
// Comparable
// Hashable
// CustomStringConvertible
//                                      Equatable
//                                          |
struct Bicho: CustomStringConvertible, Hashable {
    let name: String
    let color: String

    var description: String {
        "Es un \(name) de color \(color)"
    }
}

let bicho1 = Bicho(name: "Gamusino1", color: "verde")
let bicho2 = Bicho(name: "Gamusino2", color: "amarillo")
let bicho3 = Bicho(name: "Gamusino1", color: "verde")

print(bicho1)
bicho1 == bicho2
bicho1 == bicho3
bicho1.hashValue
