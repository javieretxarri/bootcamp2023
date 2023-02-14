import Foundation

final class Personaje {
    static var nivel = 1
    static var vidaRef = 20

    // class es igual que static, solo para clases
    // no obstante, class permite sobrecarga en herencia haciendo un override class en hijos

    static func crearPersonaje() -> Personaje {
        let vida = Int.random(in: vidaRef * nivel ... vidaRef * (nivel + 1))
        let fuerza = Int.random(in: 5 * nivel ... 7 * nivel)
        return Personaje(vida: vida, fuerza: fuerza)
    }

    var vida: Int
    var fuerza: Int

    init(vida: Int, fuerza: Int) {
        self.vida = vida
        self.fuerza = fuerza
    }

//    convenience init() {
//        if Personaje.nivel == 2 {
//            self.init(vida: Int.random(in: 40 ... 60), fuerza: Int.random(in: 10 ... 20))
//        } else if Personaje.nivel == 1 {
//        self.init(vida: Int.random(in: 20 ... 40), fuerza: Int.random(in: 5 ... 10))
//        } else {
//            self.init(vida: Int.random(in: 60 ... 80), fuerza: Int.random(in: 20 ... 30))
//        }
//    }

    func ataque() -> Int {
        Int.random(in: 2 ... fuerza)
    }
}

let personaje1 = Personaje(vida: 20, fuerza: 5)
let personaje2 = Personaje(vida: 30, fuerza: 10)
let personaje3 = Personaje.crearPersonaje()
personaje3.vida
personaje3.fuerza

Personaje.nivel = 5

let personaje4 = Personaje.crearPersonaje()
personaje4.vida
personaje4.fuerza
