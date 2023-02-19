import Foundation

enum Armas {
    case espada, hacha, arco, magia
}

protocol Personaje {
    var nombre: String { get set }
}

protocol Mortal {
    var vida: Int { get set }
    var muerte: Bool { get set }
}

protocol Ataque {
    var ataque: Int { get set }
    func atacar() -> Int
}

extension Ataque {
    func atacar() -> Int {
        Int.random(in: ataque / 2 ... ataque)
    }
}

protocol Hablar {
    var dialogo: String { get set }
    func hablar()
}

protocol Armado {
    var arma: Armas { get set }
}

struct Tendero: Personaje {
    var nombre: String
}

struct Heroe: Personaje, Mortal, Ataque, Armado {
    var nombre: String
    var vida: Int
    var muerte = false
    var ataque: Int
    var arma: Armas
}

struct Gallina: Ataque {
    var ataque = 5
}

struct OgroAtontado: Personaje, Mortal {
    var nombre: String
    var vida = 10
    var muerte = false
}

struct Soldado: Mortal, Ataque, Armado {
    var vida: Int
    var muerte = false
    var ataque: Int
    var arma: Armas

    func atacar() -> Int {
        Int.random(in: ataque / 4 ... ataque / 2)
    }
}

struct OrcoMontañas: Mortal, Ataque {
    var vida: Int
    var muerte = false
    var ataque: Int

    func atacar() -> Int {
        ataque
    }
}
