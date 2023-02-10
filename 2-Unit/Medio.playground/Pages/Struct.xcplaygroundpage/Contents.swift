import Foundation

struct Empleado {
    let nombre: String
    var sueldo: Double
    let departamento: String
}

// El contructor es auto generado con todos los params
let empleado1 = Empleado(nombre: "Javier", sueldo: 100000, departamento: "Desarrollo")
var empleado2 = Empleado(nombre: "Javier 2", sueldo: 100000, departamento: "Desarrollo")

empleado1.nombre

// empleado1.sueldo = 200000 <- casca xk empleado1 es let
empleado2.sueldo = 200000
empleado2.sueldo

struct Empleado2 {
    let nombre: String
    var sueldo: Double = 200000 // MUTATING MEMBER
    let departamento: String

    func getTaxes() -> Double {
        return sueldo * 0.25
    }

    mutating func riseSalary(percentage: Double) -> Double {
        sueldo = sueldo * (1 + percentage)
        return sueldo
    }
}

// Puedo pasarle o no
let empleado3 = Empleado2(nombre: "Pedro", departamento: "I+D")
var empleado4 = Empleado2(nombre: "Pedro", sueldo: 80000, departamento: "I+D")

// NO USAR INIT EN LOS STRUCT <- SWIFT way
// NO TIENEN HERENCIA!!!!!!!!!!!!!
empleado4.getTaxes()
empleado4.riseSalary(percentage: 1.0)

empleado4.sueldo

// Cuando trabajo con dato SIEMPRE CON UN STRUCT
// La LÓGICA que trabaja con esos datos CLASES

var empleado5 = empleado4
empleado5.sueldo = 20000000
empleado5.sueldo
empleado4.sueldo

// NOTA: al final los struct no tendrán métodos de modificación sino más bien de consulta. Por ejemplo getTaxes del ejemplo
