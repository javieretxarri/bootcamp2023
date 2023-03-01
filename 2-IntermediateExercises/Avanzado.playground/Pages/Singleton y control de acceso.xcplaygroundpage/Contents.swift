import Foundation

// Control de acceso en SWIFT
/*
 private: ni dios puede acceder fuera de self. SOLO es visible a los elementos del mismo ámbito
 fileprivate: SOLO es visible a los elementos que están en el mismo fichero de código
 internal: valor por defecto. SOLO es visible a los elmentos en el mismo PROYECTO o PROGRAMA (TARGET)
 public: accesible por todo cristo. Pero NO permite override en class
 open. igual que el PUBLIC pero si permite override
 */

enum Roles {
    case admin, user, piltrafilla
}

final class Almacen {
    static let shared = Almacen(name: "Paco", rol: .piltrafilla)

    var name: String
    var rol: Roles

    private init(name: String, rol: Roles) {
        self.name = name
        self.rol = rol
    }

//    var cosa = 0
//    var nombre = "pepe"

    func comoMeLamo() {
        print("hello world \(name) y \(rol)!!")
    }
}

// esto no se hace y para eso se pone el init a private
// let almacen = Almacen()

Almacen.shared.name
Almacen.shared.comoMeLamo()

final class Clase1 {
    let almacen = Almacen.shared

    func fijarNombre(nombre: String) {
        almacen.name = nombre
    }
}

final class Clase2 {
    let almacen = Almacen.shared

    func verNombre() {
        print("Mi nombre es \(almacen.name)")
    }
}

let clase1 = Clase1()
clase1.fijarNombre(nombre: "Pepe")
let clase2 = Clase2()
clase2.verNombre()
