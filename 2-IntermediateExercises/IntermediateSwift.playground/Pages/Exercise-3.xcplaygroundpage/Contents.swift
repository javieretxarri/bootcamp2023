import Foundation

/*
 Ejercicio 3:
 Crea una fábrica de chocolate con clases. La clase principal hará
 chocolatinas de n onzas por tableta (n es aleatorio). Las tabletas
 pueden ser de chocolate negro, con leche o blanco. En cada tableta
 además podría venir un billete dorado para visitar la fábrica, pero en
 una probabilidad muy baja.
 */

final class Chocolate {
    enum TypeChocolate: Int {
        case black, withMilk, white
    }

    static var ouncesQuantity = Int.random(in: 1 ... 50)

    var ounces: Int
    var type: TypeChocolate
    var hasGoldenTicket: Bool

    static func createChocolate() -> Chocolate {
        let ounces = ouncesQuantity
        var type = TypeChocolate.black
        if let typeChocolate = TypeChocolate(rawValue: Int.random(in: 0 ... 2)) {
            type = typeChocolate
        }
        let hasGolderTicket = isPrime(number: Int.random(in: 0 ... 1000)) ? true : false
        return Chocolate(ounces: ounces, type: type, hasGoldenTicket: hasGolderTicket)
    }

    init(ounces: Int, type: TypeChocolate, hasGoldenTicket: Bool) {
        self.ounces = ounces
        self.type = type
        self.hasGoldenTicket = hasGoldenTicket
    }

    var description: String {
        "Chocolate of \(ounces), type \(type) and \(hasGoldenTicket ? "has a Golden Ticket inside" : "has not a Golden Ticket inside")"
    }
}

let chocolates = (0 ... 10).map { _ in
    Chocolate.ouncesQuantity = Int.random(in: 1 ... 50)
    return Chocolate.createChocolate()
}

chocolates.forEach { print($0.description) }
