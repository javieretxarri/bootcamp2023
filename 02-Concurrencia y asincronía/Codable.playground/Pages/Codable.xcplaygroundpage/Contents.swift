import UIKit

let JSON = """
{
  "departamento":8,
  "nombredepto":"Ventas",
  "director": "Juan Rodríguez",
  "pruebaopcional": "PedroOp cional",
  "empleados":[
    {
      "nombre":"Pedro",
      "apellido":"Fernández",
      "segundoapellido": "algo"
    },{
      "nombre":"Jacinto",
      "apellido":"Benavente",
      "segundoapellido": "algo"
    }
  ]
}
"""

let jsonDATA = JSON.data(using: .utf8)!

// Protocolos Decodable, encodable

struct Departamento: Codable {
    let departamento: Int
    let nombredepto: String
    var director: String
    var pruebaopcional: String?

    struct Empleado: Codable {
        let nombre: String
        let apellido: String
    }

    let empleados: [Empleado]
}

var departamento = try! JSONDecoder().decode(Departamento.self, from: jsonDATA)

print(departamento.pruebaopcional!)
let empleados = departamento.empleados

for empleado in empleados {
    print(empleado.nombre)
}

departamento.director = "Steve Jobs"

let enconder = JSONEncoder()
enconder.outputFormatting = .prettyPrinted

var dataJSON = try! JSONEncoder().encode(departamento)
var dataJSON2 = try! enconder.encode(departamento)

print(String(data: dataJSON, encoding: .utf8)!)
print(String(data: dataJSON2, encoding: .utf8)!)
