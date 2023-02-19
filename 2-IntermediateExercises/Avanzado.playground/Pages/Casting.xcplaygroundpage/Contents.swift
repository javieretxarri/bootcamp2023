import UIKit

class Humano {
    let nombre: String

    init(nombre: String) {
        self.nombre = nombre
    }
}

class Animal {
    let nombre: String

    init(nombre: String) {
        self.nombre = nombre
    }
}

class Perro: Animal {
    let raza: String

    init(nombre: String, raza: String) {
        self.raza = raza
        super.init(nombre: nombre)
    }
}

final class Gato: Animal {
    let tipo: String

    init(nombre: String, tipo: String) {
        self.tipo = tipo
        super.init(nombre: nombre)
    }
}

final class Perrico: Perro {
    let size: Int

    init(nombre: String, raza: String, size: Int) {
        self.size = size
        super.init(nombre: nombre, raza: raza)
    }
}

let perrico1 = Perrico(nombre: "Perrico1", raza: "Alemán", size: 10)
let perrico2 = Perrico(nombre: "Perrico2", raza: "Alemán", size: 10)
let perrico3 = Perrico(nombre: "Perrico3", raza: "Alemán", size: 10)

let gato1 = Gato(nombre: "Gato1", tipo: "Siamé")
let gato2 = Gato(nombre: "Gato2", tipo: "Siamé")

let perro = Perro(nombre: "Milú", raza: "Husky")

let humano = Humano(nombre: "humano1")

// Esto cascará obviamente xk no hay una clase de la que parten los animales y los humanos
// let animales: [Animal] = [perrico1, perrico2, perrico3, perro, gato1, gato2, humano]

let animales: [Animal] = [perrico1, perrico2, perrico3, perro, gato1, gato2]

for animal in animales {
    print(type(of: animal))
    print(animal.nombre)
//    let animalCasteado = animal as type(of: animal)
}

func nombreAnimal(animal: Perro) {
    print(animal.nombre)
}

nombreAnimal(animal: perro)
nombreAnimal(animal: perrico1)

let perrico22 = animales[1]
type(of: perrico2)

// Up Casting es automático
let pp2 = perrico3 as Perro

// Down casting devuelve un opcional
let perricoDown = animales[1] as? Perrico

if let perricoDown {
    print(perricoDown.size)
}

if let perricoDown2 = animales[1] as? Perrico {
    print(perricoDown2.size)
}

let perricoDown3 = animales[1] as! Perrico
print(perricoDown3.size)
