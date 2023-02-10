import Foundation

class Class {
    var valor = 1
    var valor2: Int! // te prometo que yo me encargo de ello

    func dimeValor() -> Int {
        return valor
    }
}

let objeto1 = Class()
let objeto2 = Class()

objeto2.valor = 99
print(objeto1.valor)
print(objeto2.valor)
print(objeto1.dimeValor())
print(objeto2.dimeValor())

class Animal {
    var sound: String
    let feetNumber: Int
    let foodType: String

    init(sound: String, feetNumber: Int, foodType: String) {
        self.sound = sound
        self.feetNumber = feetNumber
        self.foodType = foodType
    }

    init(feet4AndSound sound: String, foodType: String) {
        self.sound = sound
        self.feetNumber = 4
        self.foodType = foodType
    }

    convenience init(feet4OmnivoreAndSound sound: String) {
        self.init(feet4AndSound: sound, foodType: "Omnivoro")
    }

    func talk() {
        print(sound)
    }
}

var leon = Animal(sound: "Rugido", feetNumber: 4, foodType: "Omnívoro")
var mono = Animal(sound: "Chillido", feetNumber: 4, foodType: "Omnívoro")
var jirafa = Animal(feet4OmnivoreAndSound: "Hum")

leon.talk()
mono.talk()
jirafa.talk()

leon.sound = "Rugidito"

class Perro: Animal {
    let breed: String

    init(sound: String, feetNumber: Int, foodType: String, breed: String) {
        self.breed = breed
        super.init(sound: sound, feetNumber: feetNumber, foodType: foodType)
    }

    convenience init(breed: String) {
        self.init(sound: "Ladra", feetNumber: 4, foodType: "Omnivoro", breed: "Chiguaga")
//        self.breed = breed
//        super.init(feet4AndSound: "Ladra", foodType: "Omnivoro")
    }

    override func talk() {
        print("Soy un perrazo y hago \(sound)")
        super.talk()
    }

    func corre() {
        print("Corriendo con \(feetNumber) patas")
    }
}

class Perro2: Animal {
    var breed: String = "Khan"
}

// var chiguagua = Perro(feet4OmnivoreAndSound: "Ladra")
// chiguagua.talk()

let chiguagua = Perro(breed: "Chiguagua")
let chiguagua2 = Perro2(feet4OmnivoreAndSound: "Ladra")

chiguagua.breed
chiguagua.talk()

let cloneChiguagua = chiguagua

cloneChiguagua === chiguagua

cloneChiguagua.sound = "ChiGUAU"

chiguagua.sound
cloneChiguagua.sound

chiguagua.talk()
chiguagua.corre()

final class UnModifiable {
    var observador: String? = "Estoy mirando a la luna"

    deinit {
        observador = nil
    }
}

// Esto es durante la teoría de enum
final class Positiva {
    var valor: Int

    init?(valor: Int) {
        guard valor > 0 else { return nil }
        self.valor = valor
    }
}

let pos1 = Positiva(valor: 45)
let pos2 = Positiva(valor: -45)
