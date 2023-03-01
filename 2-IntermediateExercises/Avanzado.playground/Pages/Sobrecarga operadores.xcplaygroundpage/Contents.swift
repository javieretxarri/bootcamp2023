import UIKit

struct Empleado: Hashable {
    let id: Int
    let name: String
}

let emp1 = Empleado(id: 123, name: "Paco")
let emp2 = Empleado(id: 123, name: "Pepe")

let emp3 = Empleado(id: 1234, name: "Pepe")

// func == (l: Empleado, r: Empleado) -> Bool {
//    l.id == r.id
// }

// emp1 == emp2

extension Empleado {
    static func == (l: Empleado, r: Empleado) -> Bool {
        l.id == r.id
    }

    static func != (l: Empleado, r: Empleado) -> Bool {
        l.id != r.id
    }
}

emp1 == emp2
emp1 != emp2
emp1 != emp3

protocol Coloreable {
    var color: UIColor { get set }
}

struct Equipo: Coloreable {
    let name: String
    var color: UIColor
}

struct Panuelo: Coloreable {
    let estilo: String
    var color: UIColor
}

let equipo1 = Equipo(name: "Madrid", color: .white)
let panuelo1 = Panuelo(estilo: "Seda", color: .white)

func == (l: Coloreable, r: Coloreable) -> Bool {
    l.color == r.color
}

equipo1 == panuelo1

var point1 = CGPoint(x: 100, y: 200)
var point2 = CGPoint(x: 150, y: 250)
var point3 = CGPoint(x: 100, y: 200)

point1 == point3

extension CGPoint {
    static func + (l: CGPoint, r: CGPoint) -> CGPoint {
        CGPoint(x: l.x + r.x, y: l.y + r.y)
    }

    static func += (l: inout CGPoint, r: CGPoint) {
        l = CGPoint(x: l.x + r.x, y: l.y + r.y)
    }
}

point1 + point2
point2 += point3
