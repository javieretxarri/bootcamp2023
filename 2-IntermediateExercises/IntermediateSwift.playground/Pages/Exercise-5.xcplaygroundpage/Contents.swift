import Foundation

/*
 Ejercicio 5:
 Vamos a crear la estructura de un videojuego.
 - Personaje tiene un valor de vida y un nombre. Es capaz de morir cuando
 se queda sin vida y de saludar diciendo su nombre.
 - Héroe hereda de Personaje. Tiene valor de fuerza de ataque y es capaz
 de atacar a un Enemigo que recibe como parámetro, reduciendo su vida
 en un ataque igual a un número entre 0 y la mitad de su fuerza.
 - Mago hereda de Héroe. Tiene un valor de magia que suma la mitad de su
 valor al daño ocasionado en un ataque y reduce en 1/4 el daño
 infligido cuando es atacado por un Enemigo.
 - Guerrera hereda de Héroe. Tiene una espada que en su inicialización
 tendrá un valor de ataque que será un número aleatorio de 0 a la mitad
 de su fuerza. Dicha espada inflige un daño extra a los enemigos igual
 al total de dicha fuerza.
 - Enemigo hereda de Personaje. Tiene valor de fuerza de ataque y puede
 tener tres tipos de armas, la cual se elegirá en su inicialización.
 Puede atacar a un héroe, recibido como parámetro. El arma Hacha hará
 un daño de 10 sobre el daño del ataque, el arma Sable lo hará de 5 y
 el arma Cadena lo hará de 2. También puede ser que el Enemigo se cree
 sin arma y entonces no aumente su fuerza en el ataque.
 Crear todos los inicializadores, métodos y propiedades necesarios, así
 como la capacidad de atacar y morir de cada personaje susceptible de
 ello, además del resto de comportamientos indicados. Usa enumeraciones
 donde sea más práctico para representar datos.
 */

class Personaje {
    let nombre: String
    var vida: Int {
        didSet {
            if oldValue == 0 {
                print("Soy \(nombre) de tipo \(type(of: self)) y ya estoy muerto, no hace falta que te ensañes por favor")
            }
            if vida < 0 {
                vida = 0
            }
        }
        willSet {
            if vida > 0 && newValue <= 0 {
                muerto = true
                print("Soy \(nombre) de tipo \(type(of: self)) y acabo de morir")
            }
        }
    }

    var muerto = false

    func saludar() {
        print("Hola soy \(nombre)!!")
    }

    init(nombre: String, vida: Int) {
        self.nombre = nombre
        self.vida = vida
    }
}

class Heroe: Personaje {
    var ataque: Int

    init(nombre: String, vida: Int, ataque: Int) {
        self.ataque = ataque
        super.init(nombre: nombre, vida: vida)
    }

    func atacar(enemigo: Enemigo) {
        guard !muerto else {
            print("Estoy muerto, por lo que no puedo atacar")
            return
        }
        let ataque = Int.random(in: 0 ... ataque / 2)
        enemigo.vida -= ataque
    }
}

final class Mago: Heroe {
    var valorDeMagia: Int

    init(nombre: String, vida: Int, ataque: Int, valorDeMagia: Int) {
        self.valorDeMagia = valorDeMagia
        super.init(nombre: nombre, vida: vida, ataque: ataque)
    }

    override func atacar(enemigo: Enemigo) {
        guard !muerto else {
            print("Estoy muerto, por lo que no puedo atacar")
            return
        }
        let ataque = Int.random(in: 1 ... ataque / 2) + (valorDeMagia / 2)
        enemigo.vida -= ataque
    }
}

final class Guerrero: Heroe {
    var ataqueEspada: Int

    override init(nombre: String, vida: Int, ataque: Int) {
        self.ataqueEspada = Int.random(in: 0 ... ataque / 2)
        super.init(nombre: nombre, vida: vida, ataque: ataque)
    }

    override func atacar(enemigo: Enemigo) {
        guard !muerto else {
            print("Estoy muerto, por lo que no puedo atacar")
            return
        }
        let ataque = Int.random(in: 1 ... ataque / 2) + ataqueEspada
        enemigo.vida -= ataque
    }
}

final class Enemigo: Personaje {
    var ataque: Int
    enum Arma: Int {
        case cadena = 10, sable = 5, hacha = 2
    }

    var arma: Arma?

    init(nombre: String, vida: Int, ataque: Int, arma: Arma) {
        self.arma = arma
        self.ataque = ataque
        super.init(nombre: nombre, vida: vida)
    }

    init(nombre: String, vida: Int, ataque: Int) {
        self.ataque = ataque
        super.init(nombre: nombre, vida: vida)
    }

    func atacar(heroe: Heroe) {
        guard !muerto else {
            print("Estoy muerto, por lo que no puedo atacar")
            return
        }

        var ataqueExtra = 0

        if let arma = arma {
            ataqueExtra = arma.rawValue
        }

        if type(of: heroe) == Mago.self {
            heroe.vida -= (ataque + ataqueExtra) * 3 / 4
        } else {
            heroe.vida -= (ataque + ataqueExtra)
        }
    }
}

let heroe = Heroe(nombre: "Heroe", vida: 60, ataque: 50)
let mago = Mago(nombre: "Mago", vida: 130, ataque: 50, valorDeMagia: 25)
let guerrero = Guerrero(nombre: "Guerrero", vida: 120, ataque: 60)

let enemigoConArma = Enemigo(nombre: "EnemigoConArma", vida: 150, ataque: 200, arma: .hacha)
let enemigoSinArma = Enemigo(nombre: "EnemigoSinArma", vida: 50, ataque: 30)

enemigoSinArma.saludar()
enemigoSinArma.vida
heroe.saludar()
heroe.atacar(enemigo: enemigoSinArma)
enemigoSinArma.vida
enemigoSinArma.muerto
mago.saludar()
mago.atacar(enemigo: enemigoSinArma)
enemigoSinArma.vida
enemigoSinArma.muerto
guerrero.saludar()
guerrero.atacar(enemigo: enemigoSinArma)
enemigoSinArma.vida
enemigoSinArma.muerto
guerrero.atacar(enemigo: enemigoSinArma)
guerrero.atacar(enemigo: enemigoSinArma)

enemigoConArma.saludar()
enemigoConArma.vida
heroe.atacar(enemigo: enemigoConArma)
enemigoConArma.vida
enemigoConArma.muerto
mago.atacar(enemigo: enemigoConArma)
enemigoConArma.vida
enemigoConArma.muerto
guerrero.atacar(enemigo: enemigoConArma)
enemigoConArma.vida
enemigoConArma.muerto

heroe.vida
heroe.muerto
enemigoConArma.atacar(heroe: heroe)
heroe.vida
heroe.muerto
heroe.atacar(enemigo: enemigoConArma)
