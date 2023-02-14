import Foundation

class Jugador {
    let nombre: String
    var vida: Int {
        didSet {
            if vida < 0 {
                vida = 0
            }
            // Disponemos del valor anterior al set: oldValue
        }
        willSet {
            if newValue <= 0 {
                muerto = true
            }
        }
    }

    var muerto = false

    init(nombre: String, vida: Int) {
        self.nombre = nombre
        self.vida = vida
    }
}

final class Heroe: Jugador {
    enum Arma {
        case sable, espada, hacha, magia
    }

    var ataque: Int
    var arma: Arma

    init(nombre: String, vida: Int, ataque: Int, arma: Arma) {
        self.arma = arma
        self.ataque = ataque
        super.init(nombre: nombre, vida: vida)
    }

//    func atacar(enemigo: Enemigo) {
//        let atque = Int.random(in: ataque / 2 ... ataque)
//        enemigo.vida -= ataque
//        if enemigo.vida <= 0 {
//            enemigo.muerto = true
//        }
//    }

    func atacar() -> Int {
        Int.random(in: ataque / 2 ... ataque)
    }
}

final class Enemigo: Jugador {
    enum TipoEnemigo: String {
        case trasgo, goblin, orco, urukhai
    }

    let tipoEnemigo: TipoEnemigo
    init(vida: Int, tipoEnemigo: TipoEnemigo) {
        self.tipoEnemigo = tipoEnemigo
        super.init(nombre: tipoEnemigo.rawValue, vida: vida)
    }

    func atacar() -> Int {
        switch tipoEnemigo {
        case .trasgo:
            return 5
        case .goblin:
            return 3
        case .orco:
            return 6
        case .urukhai:
            return 11
        }
    }
}

let guerrero = Heroe(nombre: "Conan", vida: 100, ataque: 50, arma: .espada)
let enemigo = Enemigo(vida: 30, tipoEnemigo: .urukhai)

enemigo.vida
enemigo.vida -= guerrero.atacar()
enemigo.vida
enemigo.muerto
guerrero.vida -= enemigo.atacar()
guerrero.vida
enemigo.vida -= guerrero.atacar()
enemigo.vida
enemigo.muerto

// NOTA puedo sobreescribir propiedades. Cmabiando de una almacenada a una calculada o añadirle observadores didSet o willSet
