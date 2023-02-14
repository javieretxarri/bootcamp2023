import Foundation

struct Area {
    var ancho: Int
    var alto: Int

    // Computed column. NO almacenan, solo calculan
    var centro: (x: Int, y: Int) {
        get {
            (ancho / 2, alto / 2)
        }
        set {
            ancho = newValue.x * 2
            alto = newValue.y * 2
        }
    }
}

var area1 = Area(ancho: 75, alto: 100)
area1.centro

area1.centro = (125, 80)
area1.ancho
area1.alto

class Saludo {
    var nombre: String
    var despedida: String {
        "Adios \(nombre)"
    }

    // Self todavía no está disponible
    // let saludo = "Hola \(nombre)"
    // Así se debería de hacer
    lazy var saludo = "Hola \(nombre)"

    init(nombre: String) {
        self.nombre = nombre
    }
}

var saludo1 = Saludo(nombre: "Javier")
saludo1.saludo
